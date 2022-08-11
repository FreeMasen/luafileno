---@diagnostic disable: lowercase-global
package = "luafileno"
version = "dev-1"
source = {
   url = "https://github.com/FreeMasen/luafileno"
}
description = {
   summary = "This project exposes the stdio C function `luafileno` to convert a `*FILE` into a file descriptor.",
   detailed = [[
This project exposes the stdio C function `luafileno` to convert a `*FILE` into a file descriptor.
]]  ,
   homepage = "https://github.com/FreeMasen/luafileno",
   license = "https://github.com/FreeMasen/luafileno/blob/main/license.txt"
}
build = {
   type = "builtin",
   modules = {
      ["luafileno.core"] = "src/luafileno.c",
      luafileno = "luafileno.lua",
   }
}
