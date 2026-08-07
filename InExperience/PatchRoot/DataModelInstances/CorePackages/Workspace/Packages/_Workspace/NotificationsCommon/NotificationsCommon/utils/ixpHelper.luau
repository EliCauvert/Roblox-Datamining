local IXPService = game:GetService("IXPService")

return {
	getIxpLayerData = function(p0) --[[ line: 3 ]]
		-- upvalues: IXPService (ref)
		local ok, status = pcall(function() --[[ line: 4 ]]
			-- upvalues: IXPService (copy), p0 (ref)
			return IXPService:GetUserLayerVariables(p0)
		end)
		
		return if ok then status else nil
	end,
	logUserLayerExposure = function(p1) --[[ line: 11 ]]
		-- upvalues: IXPService (ref)
		pcall(function() --[[ line: 12 ]]
			-- upvalues: IXPService (copy), p1 (ref)
			IXPService:LogUserLayerExposure(p1)
		end)
	end
}