include config

lib: ./luafileno.so

luafileno.so:
	$(CC) $(LIB_OPTION) -o luafileno.so $(OBJS)

install:
	mkdir -p $(DESTDIR)$(LUA_LIBDIR)
	cp luafileno.so $(DESTDIR)$(LUA_LIBDIR)

clean:
	rm -f luafileno.so $(OBJS)
