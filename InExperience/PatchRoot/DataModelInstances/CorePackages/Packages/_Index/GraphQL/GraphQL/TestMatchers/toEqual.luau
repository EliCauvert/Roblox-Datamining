local deepEqualModule = require(script.Parent.Parent.luaUtils.deepEqual)

return function(p1, p2)
	-- upvalues: deepEqualModule (ref)
	local var1, var2 = deepEqualModule(p1, p2)
	
	return {
		pass = var1,
		message = if not var1 then var2:gsub("{1}", "received"):gsub("{2}", "expected") else ("expected: not %s\nreceived:     %s"):format(tostring(p2), tostring(p1))
	}
end