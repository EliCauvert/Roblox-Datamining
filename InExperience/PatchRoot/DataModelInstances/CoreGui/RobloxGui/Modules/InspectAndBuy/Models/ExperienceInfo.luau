local MockIdModule = require(script.Parent.Parent.MockId)
local PlayabilityStatusEnum = require(game:GetService("CorePackages").Workspace.Packages.DiscoveryTypes).PlayabilityStatusEnum

return {
	mock = function() --[[ Line: 26 ]]
		-- upvalues: MockIdModule (copy), PlayabilityStatusEnum (copy)
		return {
			universeId = MockIdModule(),
			name = "",
			rootPlaceId = MockIdModule(),
			isPlayable = true,
			playabilityStatus = PlayabilityStatusEnum.Playable
		}
	end,
	fromGetPlayabilityStatus = function(p1) --[[ Line: 38 ]]
		return {
			universeId = tostring(p1.universeId),
			isPlayable = p1.isPlayable,
			playabilityStatus = p1.playabilityStatus
		}
	end,
	fromGetExperienceInfo = function(p1) --[[ Line: 48 ]]
		return {
			universeId = tostring(p1.id),
			rootPlaceId = tostring(p1.rootPlaceId),
			name = p1.name
		}
	end
}