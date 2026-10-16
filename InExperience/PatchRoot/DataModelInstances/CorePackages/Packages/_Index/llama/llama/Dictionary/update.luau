local CopyModule = require(script.Parent.copy)

local function noUpdate(p1, p2) --[[ Line: 4 ]]
	return p1, p2
end

local function call(Callback, ...) --[[ Line: 8 ]]
	if type(Callback) ~= "function" then return end
	return Callback(...)
end

return function(p1, p2, p3, p4) --[[ Line: 14 | Named "update" ]]
	-- upvalues: CopyModule (copy), noUpdate (copy), call (copy)
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	assert(p2 ~= nil, "expected second argument to be anything but nil, got nil")
	local CopyModuleResult = CopyModule(p1)
	local Callback = p3 or noUpdate
	local CallbackResult2 = nil
	local CallbackResult = nil
	
	if CopyModuleResult[p2] == nil then
		CallbackResult, CallbackResult2 = call(p4, false, p2)
	else
		CallbackResult, CallbackResult2 = Callback(CopyModuleResult[p2], p2)
		call(p4, true, CallbackResult, CallbackResult2 or p2)
	end
	CopyModuleResult[CallbackResult2 or p2] = CallbackResult
	
	return CopyModuleResult
end