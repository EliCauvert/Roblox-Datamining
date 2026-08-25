local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local cryoModule = require(profilePlatform.Parent.Cryo)
local _ = require(profilePlatform.Common.Types)

return function(p0)
	-- upvalues: cryoModule (ref)
	return if p0 then cryoModule.Dictionary.map(p0, function(p1)
		return {
			id = p1.experienceId,
			universeId = tonumber(p1.experienceId),
			placeId = tonumber(p1.rootPlaceId)
		}
	end) else {}
end