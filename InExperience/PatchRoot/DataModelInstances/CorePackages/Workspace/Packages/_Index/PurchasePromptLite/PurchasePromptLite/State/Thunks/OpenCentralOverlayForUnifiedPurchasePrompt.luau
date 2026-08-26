local parent = script:FindFirstAncestor("PurchasePromptLite").Parent
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay

return function(p1)
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
	return function(p2)
		-- upvalues: setCentralOverlay (copy), centralOverlayType (copy), p1 (ref)
		p2:dispatch(setCentralOverlay(centralOverlayType.UnifiedProductPurchaseModal, p1))
	end
end