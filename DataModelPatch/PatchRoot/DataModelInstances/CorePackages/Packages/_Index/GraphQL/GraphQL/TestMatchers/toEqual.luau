local DeepEqualModule = require(script.Parent.Parent.luaUtils.deepEqual)

return function(p1, p2)
	-- upvalues: DeepEqualModule (copy)
	local DeepEqualModuleResult, DeepEqualModuleResult2 = DeepEqualModule(p1, p2)
	
	return {
		pass = DeepEqualModuleResult,
		message = if DeepEqualModuleResult then ("expected: not %s\nreceived:     %s"):format(tostring(p2), (tostring(p1))) else DeepEqualModuleResult2:gsub("{1}", "received"):gsub("{2}", "expected")
	}
end