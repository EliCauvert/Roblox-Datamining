local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local parseSectionsFromDataModule = require(profilePlatform.Components.About.parseSectionsFromData)
local fFlagProfileAboutDetailsUseSheet = require(parent.SharedFlags).FFlagProfileAboutDetailsUseSheet

return function() --[[ line: 11 ]]
	-- upvalues: useProfileWrapperContextModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), reactModule (ref), parseSectionsFromDataModule (ref), fFlagProfileAboutDetailsUseSheet (ref)
	local profileType = useProfileWrapperContextModule().profileType
	local about = useProfileJsonComponentModule(enumsModule.Components.About) or {}
	
	return {
		aboutDetails = about,
		aboutSections = reactModule.useMemo(function() --[[ line: 16 ]]
			-- upvalues: parseSectionsFromDataModule (copy), about (ref), profileType (ref), enumsModule (copy)
			return parseSectionsFromDataModule(about, profileType, if profileType == enumsModule.ProfileTypes.User and about.name then `@{about.name}` else about.name or "")
		end, { about, profileType, about.name }),
		profileName = if not fFlagProfileAboutDetailsUseSheet then if profileType == enumsModule.ProfileTypes.User and about.name then `@{about.name}` else about.name else nil
	}
end