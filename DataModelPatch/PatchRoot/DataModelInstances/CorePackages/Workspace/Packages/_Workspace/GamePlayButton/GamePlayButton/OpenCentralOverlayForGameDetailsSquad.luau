local Parent = script:FindFirstAncestor("GamePlayButton").Parent
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay

return function(LandscapeMenuDirection, MenuAnchorPosition, MenuAnchorSize, ReferralSource, UniverseId)
	-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	return function(p1)
		-- upvalues: SetCentralOverlayFunction (upval), CentralOverlayType (upval), LandscapeMenuDirection (copy), MenuAnchorPosition (copy), MenuAnchorSize (copy), ReferralSource (copy), UniverseId (copy)
		p1:dispatch(SetCentralOverlayFunction(CentralOverlayType.GameDetailsSquad, {
			landscapeMenuDirection = LandscapeMenuDirection,
			menuAnchorPosition = MenuAnchorPosition,
			menuAnchorSize = MenuAnchorSize,
			referralSource = ReferralSource,
			universeId = UniverseId
		}))
	end
end