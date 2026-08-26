local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local cryoModule = require(profilePlatform.Parent.Cryo)
local _ = require(profilePlatform.Common.Types)

return function(p1)
	-- upvalues: cryoModule (ref)
	return if p1 then cryoModule.Dictionary.map(p1, function(p2)
		return {
			id = p2.experienceId,
			universeId = tonumber(p2.experienceId),
			placeId = tonumber(p2.rootPlaceId)
		}
	end) else {}
end