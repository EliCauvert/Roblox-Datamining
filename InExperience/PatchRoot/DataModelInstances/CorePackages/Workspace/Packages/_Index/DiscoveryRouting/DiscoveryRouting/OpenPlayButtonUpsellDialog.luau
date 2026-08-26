local parent = script:FindFirstAncestor("DiscoveryRouting").Parent
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
	return function(p8)
		-- upvalues: setCentralOverlay (copy), centralOverlayType (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref), p6 (ref), p7 (ref)
		p8:dispatch(setCentralOverlay(centralOverlayType.PlayButtonUpsellDialog, {
			titleText = p1,
			bodyText = p2,
			actionButtonText = p3,
			cancelButtonText = p4,
			onActionButtonClick = p5,
			onCancelButtonClick = p6,
			onCloseModal = p7
		}))
	end
end