local getTemporaryPlusBackgroundIdsModule = require(script.Parent.getTemporaryPlusBackgroundIds)

return function(value, p0) --[[ line: 3 | named "isPlusExclusiveBackground" ]]
	-- upvalues: getTemporaryPlusBackgroundIdsModule (ref)
	if p0 ~= nil then
		return p0
	end
	local var1, var2 = getTemporaryPlusBackgroundIdsModule()
	
	return if var2 then value ~= nil else value ~= nil and var1[tostring(value)] == true
end