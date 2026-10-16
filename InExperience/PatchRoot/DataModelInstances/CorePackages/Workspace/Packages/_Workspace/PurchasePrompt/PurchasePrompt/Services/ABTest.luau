local IXPServiceWrapper = require(script:FindFirstAncestor("PurchasePrompt").Parent.IxpServiceWrapper).IXPServiceWrapper

return {
	new = function() --[[ Line: 15 ]]
		-- upvalues: IXPServiceWrapper (copy)
		local t = {}
		setmetatable(t, {
			__tostring = function(): string --[[ Line: 19 ]]
				return "Service(ABTest)"
			end
		})
		
		function t.getLayerData(p1) --[[ Line: 24 ]]
			-- upvalues: IXPServiceWrapper (upval)
			return IXPServiceWrapper:GetLayerData(p1)
		end
		
		function t.logUserLayerExposure(LayerName) --[[ Line: 28 ]]
			-- upvalues: IXPServiceWrapper (upval)
			IXPServiceWrapper:LogUserLayerExposure(LayerName)
		end
		
		return t
	end
}