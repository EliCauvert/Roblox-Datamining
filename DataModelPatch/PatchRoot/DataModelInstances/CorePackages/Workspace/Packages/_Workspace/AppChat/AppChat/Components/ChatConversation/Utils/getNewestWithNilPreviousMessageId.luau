local GetDeepValueModule = require(script:FindFirstAncestor("AppChat").Utils.getDeepValue)

return function(p1)
	-- upvalues: GetDeepValueModule (copy)
	local Keys = GetDeepValueModule(p1, "keys")
	local Values = GetDeepValueModule(p1, "values")
	local v1 = nil
	
	for _, key in pairs(Keys) do
		if Values[key] and Values[key].previousMessageId == nil then
			v1 = key
			
			return v1
		end
	end
	return v1
end