local parent = script:FindFirstAncestor("AuthCommon").Parent
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay

return function(p1, p2, p3)
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
	return function(p4)
		-- upvalues: p3 (ref), setCentralOverlay (copy), centralOverlayType (copy), p1 (ref), p2 (ref)
		local p5 = p3 or {}
		p4:dispatch(setCentralOverlay(centralOverlayType.AccountIneligibleLoginModal, {
			onDismiss = p1,
			portalToFoundationOverlay = p2,
			titleKey = p5.titleKey,
			descriptionKey = p5.descriptionKey,
			actionKey = p5.actionKey
		}))
	end
end