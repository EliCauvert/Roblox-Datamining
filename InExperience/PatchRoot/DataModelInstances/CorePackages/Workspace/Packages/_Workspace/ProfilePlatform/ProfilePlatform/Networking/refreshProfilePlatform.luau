local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local cryoModule = require(profilePlatform.Parent.Cryo)
local enumsModule = require(profilePlatform.Common.Enums)
local getProfilePlatformModule = require(profilePlatform.Networking.getProfilePlatform)
local fFlagProfilePlatformCTAsRefactorModule = require(profilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)

function refreshProfilePlatform(p0) --[[ line: 17 ]]
	-- upvalues: cryoModule (ref), enumsModule (ref), fFlagProfilePlatformCTAsRefactorModule (ref), getProfilePlatformModule (ref)
	return getProfilePlatformModule.API({
		includeComponentOrdering = false,
		profileType = p0.profileType,
		profileId = p0.profileId,
		components = cryoModule.List.map(p0.components, function(p1) --[[ line: 18 ]]
			-- upvalues: enumsModule (copy), fFlagProfilePlatformCTAsRefactorModule (copy)
			local t = { component = p1 }
			
			if p1 == enumsModule.Components.Actions and fFlagProfilePlatformCTAsRefactorModule then
				t.isActionsV2Supported = true
			end
			return t
		end)
	})
end

return refreshProfilePlatform