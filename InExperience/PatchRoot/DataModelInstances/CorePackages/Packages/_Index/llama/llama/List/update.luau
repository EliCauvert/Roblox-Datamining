local CopyModule = require(script.Parent.copy)

local function noUpdate(p1) --[[ Line: 4 ]]
	return p1
end

local function call(Callback, ...) --[[ Line: 8 ]]
	if type(Callback) ~= "function" then return end
	return Callback(...)
end

return function(p1, Key: number, p2, p3) --[[ Line: 14 | Named "update" ]]
	-- upvalues: CopyModule (copy), noUpdate (copy), call (copy)
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local ValueType1 = type(Key)
	assert(ValueType1 == "number" and Key % 1 == 0, "expected an integer for second argument, got " .. ValueType1)
	local CopyModuleResult = CopyModule(p1)
	local Callback = p2 or noUpdate
	local CallbackResult = nil
	
	if CopyModuleResult[Key] == nil then
		CallbackResult = call(p3, false, Key)
	else
		CallbackResult = Callback(CopyModuleResult[Key], Key)
		call(p3, true, CallbackResult, Key)
	end
	CopyModuleResult[Key] = CallbackResult
	
	return CopyModuleResult
end