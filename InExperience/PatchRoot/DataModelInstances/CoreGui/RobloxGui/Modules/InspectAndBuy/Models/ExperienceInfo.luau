local mockIdModule = require(script.Parent.Parent.MockId)
local playabilityStatusEnum = require(game:GetService("CorePackages").Workspace.Packages.DiscoveryTypes).PlayabilityStatusEnum

return {
	mock = function()
		-- upvalues: mockIdModule (ref), playabilityStatusEnum (ref)
		return {
			universeId = mockIdModule(),
			name = "",
			rootPlaceId = mockIdModule(),
			isPlayable = true,
			playabilityStatus = playabilityStatusEnum.Playable
		}
	end,
	fromGetPlayabilityStatus = function(p1)
		return {
			universeId = tostring(p1.universeId),
			isPlayable = p1.isPlayable,
			playabilityStatus = p1.playabilityStatus
		}
	end,
	fromGetExperienceInfo = function(p1)
		return {
			universeId = tostring(p1.id),
			rootPlaceId = tostring(p1.rootPlaceId),
			name = p1.name
		}
	end
}