local CopyModule = require(script.Parent.copy)

return function(p1, ...)
	-- upvalues: CopyModule (copy)
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local CopyModuleResult = CopyModule(p1)
	
	for i = 1, select("#", ...) do
		CopyModuleResult[select(i, ...)] = nil
	end
	return CopyModuleResult
end