local Parent = script:FindFirstAncestor("PurchasePromptLite").Parent
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay

return function(p1)
	-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	return function(p2)
		-- upvalues: SetCentralOverlayFunction (upval), CentralOverlayType (upval), p1 (copy)
		p2:dispatch(SetCentralOverlayFunction(CentralOverlayType.UnifiedProductPurchaseModal, p1))
	end
end