local Parent = script:FindFirstAncestor("GameTile").Parent
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay

return function(p1, AnchorSpaceSize, AnchorSpacePosition) --[[ Line: 6 ]]
	-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	return function(p2) --[[ Line: 7 ]]
		-- upvalues: SetCentralOverlayFunction (upval), CentralOverlayType (upval), p1 (copy), AnchorSpaceSize (copy), AnchorSpacePosition (copy)
		p2:dispatch(SetCentralOverlayFunction(CentralOverlayType.PlacesList, {
			game = p1,
			anchorSpaceSize = AnchorSpaceSize,
			anchorSpacePosition = AnchorSpacePosition
		}))
	end
end