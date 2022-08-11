#include "luafileno.h"
#include <lualib.h>
#include <stdlib.h>

#define LUAFILENO_METATABLE "luafileno metatable"

LUALIB_API int luaopen_luafileno_core(lua_State *L);

static const struct luaL_Reg luafileno_lib[] = {
    {"get_file_descriptor", lua_fileno},
    {NULL, NULL}};

LUALIB_API int luaopen_luafileno_core(lua_State *L)
{
    lua_newtable(L);
    luaL_setfuncs(L, luafileno_lib, 0);
    return 1;
}
