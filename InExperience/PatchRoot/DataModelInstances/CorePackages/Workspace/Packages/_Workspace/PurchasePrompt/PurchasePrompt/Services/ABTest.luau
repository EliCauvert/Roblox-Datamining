local IXPServiceWrapper = require(script:FindFirstAncestor("PurchasePrompt").Parent.IxpServiceWrapper).IXPServiceWrapper

return {
	new = function()
		-- upvalues: IXPServiceWrapper (copy)
		local t = {}
		setmetatable(t, {
			__tostring = function(): string
				return "Service(ABTest)"
			end
		})
		
		function t.getLayerData(p1)
			-- upvalues: IXPServiceWrapper (upval)
			return IXPServiceWrapper:GetLayerData(p1)
		end
		
		function t.logUserLayerExposure(LayerName)
			-- upvalues: IXPServiceWrapper (upval)
			IXPServiceWrapper:LogUserLayerExposure(LayerName)
		end
		
		return t
	end
}