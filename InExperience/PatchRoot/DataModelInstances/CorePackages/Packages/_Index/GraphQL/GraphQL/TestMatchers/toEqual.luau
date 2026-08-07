local deepEqualModule = require(script.Parent.Parent.luaUtils.deepEqual)

return function(p0, p1) --[[ line: 17 | named "toEqual" ]]
	-- upvalues: deepEqualModule (ref)
	local var1, var2 = deepEqualModule(p0, p1)
	
	return {
		pass = var1,
		message = if not var1 then var2:gsub("{1}", "received"):gsub("{2}", "expected") else ("expected: not %s\nreceived:     %s"):format(tostring(p1), tostring(p0))
	}
end