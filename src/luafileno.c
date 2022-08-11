#include "luafileno.h"
#include <lualib.h>
#include <stdlib.h>

#define LUAFILENO_METATABLE "luafileno metatable"

LUALIB_API int luaopen_luafileno(lua_State *L);

LUALIB_API int luaopen_luafileno(lua_State *L)
{
    lua_pushcfunction(L, lua_fileno);
    lua_pushvalue(L, -1);
    return 1;
}
