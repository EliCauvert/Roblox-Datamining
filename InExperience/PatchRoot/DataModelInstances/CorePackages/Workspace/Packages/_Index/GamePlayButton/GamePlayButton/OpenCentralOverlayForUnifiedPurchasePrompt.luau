local parent = script:FindFirstAncestor("GamePlayButton").Parent
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay

return function(p0) --[[ line: 6 ]]
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
	return function(p1) --[[ line: 7 ]]
		-- upvalues: setCentralOverlay (copy), centralOverlayType (copy), p0 (ref)
		p1:dispatch(setCentralOverlay(centralOverlayType.UnifiedProductPurchaseModal, p0))
	end
end