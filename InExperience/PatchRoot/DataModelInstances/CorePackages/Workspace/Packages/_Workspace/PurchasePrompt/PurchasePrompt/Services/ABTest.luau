local IXPServiceWrapper = require(script:FindFirstAncestor("PurchasePrompt").Parent.IxpServiceWrapper).IXPServiceWrapper

return {
	new = function()
		-- upvalues: IXPServiceWrapper (ref)
		local t = {}
		setmetatable(t, {
			__tostring = function()
				return "Service(ABTest)"
			end
		})
		
		function t.getLayerData(p0)
			-- upvalues: IXPServiceWrapper (copy)
			return IXPServiceWrapper:GetLayerData(p0)
		end
		
		function t.logUserLayerExposure(p1)
			-- upvalues: IXPServiceWrapper (copy)
			IXPServiceWrapper:LogUserLayerExposure(p1)
		end
		
		return t
	end
}