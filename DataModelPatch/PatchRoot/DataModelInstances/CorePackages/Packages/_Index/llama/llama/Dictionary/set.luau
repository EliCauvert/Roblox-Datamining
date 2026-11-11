local CopyModule = require(script.Parent.copy)

return function(p1, Key, p2)
	-- upvalues: CopyModule (copy)
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	assert(Key ~= nil, "expected second argument to be anything but nil, got nil")
	local CopyModuleResult = CopyModule(p1)
	CopyModuleResult[Key] = p2
	
	return CopyModuleResult
end