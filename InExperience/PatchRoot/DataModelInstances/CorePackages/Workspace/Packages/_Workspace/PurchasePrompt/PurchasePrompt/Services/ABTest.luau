local IXPServiceWrapper = require(script:FindFirstAncestor("PurchasePrompt").Parent.IxpServiceWrapper).IXPServiceWrapper

return {
	new = function() --[[ line: 15 ]]
		-- upvalues: IXPServiceWrapper (ref)
		local t = {}
		setmetatable(t, {
			__tostring = function() --[[ line: 19 ]]
				return "Service(ABTest)"
			end
		})
		
		function t.getLayerData(p0) --[[ line: 24 ]]
			-- upvalues: IXPServiceWrapper (copy)
			return IXPServiceWrapper:GetLayerData(p0)
		end
		
		function t.logUserLayerExposure(p1) --[[ line: 28 ]]
			-- upvalues: IXPServiceWrapper (copy)
			IXPServiceWrapper:LogUserLayerExposure(p1)
		end
		
		return t
	end
}