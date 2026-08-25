local parent = script:FindFirstAncestor("GamePlayButton").Parent
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay

return function(p0, p1, p2, p3, p4)
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
	return function(p5)
		-- upvalues: setCentralOverlay (copy), centralOverlayType (copy), p0 (ref), p1 (ref), p2 (ref), p3 (ref), p4 (ref)
		p5:dispatch(setCentralOverlay(centralOverlayType.GameDetailsSquad, {
			landscapeMenuDirection = p0,
			menuAnchorPosition = p1,
			menuAnchorSize = p2,
			referralSource = p3,
			universeId = p4
		}))
	end
end