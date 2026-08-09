local parent = script:FindFirstAncestor("DiscoveryRouting").Parent
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay

return function(p0, p1, p2, p3, p4, p5, p6) --[[ line: 7 ]]
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
	return function(p7) --[[ line: 16 ]]
		-- upvalues: setCentralOverlay (copy), centralOverlayType (copy), p0 (ref), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref), p6 (ref)
		p7:dispatch(setCentralOverlay(centralOverlayType.UpsellModal, {
			titleText = p0,
			bodyText = p1,
			actionButtonText = p2,
			cancelButtonText = p3,
			onActionButtonClick = p4,
			onCancelButtonClick = p5,
			onCloseModal = p6
		}))
	end
end