local fileno = require "luafileno"

local file_openers = {
    io.input,
    io.output,
    io.tmpfile,
    function()
        return io.open("tests/it_works.lua")
    end
}
local function greater_than_two(name)
    return function(fd)
        assert(fd > 2, string.format("%s not > 2: %s", name, fd))
        print(string.format("%s was valid!", name))
    end
end

local file_validators = {
    function(fd)
        assert(fd == 0, string.format("stdin not 0: %s", fd))
        print("stdin was valid!")
    end,
    function(fd)
        assert(fd == 1, string.format("stdout not 1: %s", fd))
        print("stdout was valid!")
    end,
    greater_than_two("tmp"),
    greater_than_two("tests/it_works.lua"),
}

for i, opener in ipairs(file_openers) do
    local f = assert(opener())
    local no = fileno(f)
    file_validators[i](no)
end
