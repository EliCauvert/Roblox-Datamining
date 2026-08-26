local parent = script:FindFirstAncestor("GameTile").Parent
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay

return function(p1, p2, p3)
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
	return function(p4)
		-- upvalues: setCentralOverlay (copy), centralOverlayType (copy), p1 (ref), p2 (ref), p3 (ref)
		p4:dispatch(setCentralOverlay(centralOverlayType.PlacesList, {
			game = p1,
			anchorSpaceSize = p2,
			anchorSpacePosition = p3
		}))
	end
end