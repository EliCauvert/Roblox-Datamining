local mockIdModule = require(script.Parent.Parent.MockId)
local playabilityStatusEnum = require(game:GetService("CorePackages").Workspace.Packages.DiscoveryTypes).PlayabilityStatusEnum

return {
	mock = function() --[[ line: 26 ]]
		-- upvalues: mockIdModule (ref), playabilityStatusEnum (ref)
		return {
			universeId = mockIdModule(),
			name = "",
			rootPlaceId = mockIdModule(),
			isPlayable = true,
			playabilityStatus = playabilityStatusEnum.Playable
		}
	end,
	fromGetPlayabilityStatus = function(p0) --[[ line: 38 ]]
		return {
			universeId = tostring(p0.universeId),
			isPlayable = p0.isPlayable,
			playabilityStatus = p0.playabilityStatus
		}
	end,
	fromGetExperienceInfo = function(p1) --[[ line: 48 ]]
		return {
			universeId = tostring(p1.id),
			rootPlaceId = tostring(p1.rootPlaceId),
			name = p1.name
		}
	end
}