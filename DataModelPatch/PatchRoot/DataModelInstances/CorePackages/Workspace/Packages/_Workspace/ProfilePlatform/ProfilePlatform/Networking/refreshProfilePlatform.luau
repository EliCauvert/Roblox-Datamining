local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local CryoModule = require(ProfilePlatform.Parent.Cryo)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local GetProfilePlatformModule = require(ProfilePlatform.Networking.getProfilePlatform)
local FFlagProfilePlatformCTAsRefactorModule = require(ProfilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)

function refreshProfilePlatform(p1)
	-- upvalues: CryoModule (copy), EnumsModule (copy), FFlagProfilePlatformCTAsRefactorModule (copy), GetProfilePlatformModule (copy)
	return GetProfilePlatformModule.API({
		includeComponentOrdering = false,
		profileType = p1.profileType,
		profileId = p1.profileId,
		components = CryoModule.List.map(p1.components, function(Component)
			-- upvalues: EnumsModule (upval), FFlagProfilePlatformCTAsRefactorModule (upval)
			local config = { component = Component }
			
			if Component == EnumsModule.Components.Actions and FFlagProfilePlatformCTAsRefactorModule then
				config.isActionsV2Supported = true
			end
			return config
		end)
	})
end

return refreshProfilePlatform