local getDeepValueModule = require(script:FindFirstAncestor("AppChat").Utils.getDeepValue)

return function(p0)
	-- upvalues: getDeepValueModule (ref)
	local var1 = getDeepValueModule(p0, "keys")
	local var2 = getDeepValueModule(p0, "values")
	local var3 = nil
	
	for i, v in pairs(var1) do
		if var2[v] and var2[v].previousMessageId == nil then
			var3 = v
			
			return var3
		end
	end
	return var3
end