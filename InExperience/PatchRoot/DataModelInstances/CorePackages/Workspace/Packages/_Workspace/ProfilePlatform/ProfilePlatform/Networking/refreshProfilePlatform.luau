local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local cryoModule = require(profilePlatform.Parent.Cryo)
local enumsModule = require(profilePlatform.Common.Enums)
local getProfilePlatformModule = require(profilePlatform.Networking.getProfilePlatform)

function refreshProfilePlatform(p1)
	-- upvalues: cryoModule (ref), enumsModule (ref), getProfilePlatformModule (ref)
	return getProfilePlatformModule.API({
		includeComponentOrdering = false,
		profileType = p1.profileType,
		profileId = p1.profileId,
		components = cryoModule.List.map(p1.components, function(p2)
			-- upvalues: enumsModule (copy)
			local t = { component = p2 }
			
			if p2 == enumsModule.Components.Actions then
				t.isActionsV2Supported = true
			end
			return t
		end)
	})
end

return refreshProfilePlatform