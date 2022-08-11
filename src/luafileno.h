
#ifndef luafileno_h
#define luafileno_h

#include <lauxlib.h>
#include <lualib.h>
#include <stdlib.h>

static inline int lua_fileno(lua_State *L);

static inline int lua_fileno(lua_State *L)
{
    FILE *f;
#if LUA_VERSION_NUM >= 502
    luaL_Stream *stream = luaL_checkudata(L, 1, LUA_FILEHANDLE);
    f = stream->f;
#else
    f = *(FILE **)luaL_checkudata(L, 1, LUA_FILEHANDLE);
#endif
    int no = fileno(f);
    if (no >= 0)
    {
        lua_pushinteger(L, no);
        return 1;
    }
    return -1;
}

#endif
