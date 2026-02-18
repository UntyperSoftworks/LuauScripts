-- Creates "hidden tables" from existing tables using userdata
return function(t: {[any]: any}): any
	local proxy = newproxy(true)
	local mt = getmetatable(proxy)

	rawset(mt, "__index", t)
	rawset(mt, "__namecall", function(_, key, value)
		rawset(t, key, value)
	end)
	rawset(mt, "__metatable", "Hidden table")

	table.freeze(mt)
	return proxy
end
