local getTemporaryPlusBackgroundIdsModule = require(script.Parent.getTemporaryPlusBackgroundIds)

return function(value, p1)
	-- upvalues: getTemporaryPlusBackgroundIdsModule (ref)
	if p1 ~= nil then
		return p1
	end
	local var1, var2 = getTemporaryPlusBackgroundIdsModule()
	
	return if var2 then value ~= nil else value ~= nil and var1[tostring(value)] == true
end