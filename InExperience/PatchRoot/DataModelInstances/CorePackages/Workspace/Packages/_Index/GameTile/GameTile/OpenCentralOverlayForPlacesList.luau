local parent = script:FindFirstAncestor("GameTile").Parent
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay

return function(p0, p1, p2) --[[ line: 6 ]]
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
	return function(p3) --[[ line: 7 ]]
		-- upvalues: setCentralOverlay (copy), centralOverlayType (copy), p0 (ref), p1 (ref), p2 (ref)
		p3:dispatch(setCentralOverlay(centralOverlayType.PlacesList, {
			game = p0,
			anchorSpaceSize = p1,
			anchorSpacePosition = p2
		}))
	end
end