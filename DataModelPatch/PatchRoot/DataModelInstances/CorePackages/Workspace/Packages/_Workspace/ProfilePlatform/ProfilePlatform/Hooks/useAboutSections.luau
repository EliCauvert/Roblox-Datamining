local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local ParseSectionsFromDataModule = require(ProfilePlatform.Components.About.parseSectionsFromData)
local FFlagProfileAboutDetailsUseSheet = require(Parent.SharedFlags).FFlagProfileAboutDetailsUseSheet

return function()
	-- upvalues: UseProfileWrapperContextModule (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), ReactModule (copy), ParseSectionsFromDataModule (copy), FFlagProfileAboutDetailsUseSheet (copy)
	local ProfileType = UseProfileWrapperContextModule().profileType
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.About) or {}
	
	return {
		aboutDetails = UseProfileJsonComponentModuleResult,
		aboutSections = ReactModule.useMemo(function()
			-- upvalues: ParseSectionsFromDataModule (upval), UseProfileJsonComponentModuleResult (copy), ProfileType (copy), EnumsModule (upval)
			return ParseSectionsFromDataModule(UseProfileJsonComponentModuleResult, ProfileType, if ProfileType == EnumsModule.ProfileTypes.User and UseProfileJsonComponentModuleResult.name then `@{UseProfileJsonComponentModuleResult.name}` else UseProfileJsonComponentModuleResult.name or "")
		end, {
			UseProfileJsonComponentModuleResult,
			ProfileType,
			UseProfileJsonComponentModuleResult.name
		}),
		profileName = if FFlagProfileAboutDetailsUseSheet then if ProfileType == EnumsModule.ProfileTypes.User and UseProfileJsonComponentModuleResult.name then `@{UseProfileJsonComponentModuleResult.name}` else UseProfileJsonComponentModuleResult.name else nil
	}
end