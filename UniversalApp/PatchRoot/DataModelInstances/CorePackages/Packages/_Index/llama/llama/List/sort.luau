local CopyModule = require(script.Parent.copy)

return function(p1, p2) --[[ Line: 4 | Named "sort" ]]
	-- upvalues: CopyModule (copy)
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local CopyModuleResult = CopyModule(p1)
	table.sort(CopyModuleResult, p2)
	
	return CopyModuleResult
end