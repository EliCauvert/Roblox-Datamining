local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local CryoModule = require(ProfilePlatform.Parent.Cryo)
local _ = require(ProfilePlatform.Common.Types)

return function(p1) --[[ Line: 9 ]]
	-- upvalues: CryoModule (copy)
	return if p1 then CryoModule.Dictionary.map(p1, function(p2) --[[ Line: 14 ]]
		return {
			id = p2.experienceId,
			universeId = tonumber(p2.experienceId),
			placeId = tonumber(p2.rootPlaceId)
		}
	end) else {}
end