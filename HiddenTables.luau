-- Creates "hidden tables" from existing tables using userdata
return function(t: {[any]: any}): any
	local t2 = table.clone(t)
	table.clear(t)

	local proxy = newproxy(true)
	local mt = getmetatable(proxy)

	rawset(mt, "__index", t2)
	rawset(mt, "__namecall", function(_, key, value)
		rawset(t2, key, value)
	end)
	rawset(mt, "__metatable", "Hidden table")

	table.freeze(mt)
	return proxy
end
