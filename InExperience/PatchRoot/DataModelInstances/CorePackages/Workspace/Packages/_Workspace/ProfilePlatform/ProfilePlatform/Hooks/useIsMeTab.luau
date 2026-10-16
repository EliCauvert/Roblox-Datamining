local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local EnumsModule = require(ProfilePlatform.Common.Enums)

return function(): boolean --[[ Line: 10 | Named "useIsMeTab" ]]
	-- upvalues: UseProfileWrapperContextModule (copy), EnumsModule (copy)
	return UseProfileWrapperContextModule().headerVariant == EnumsModule.ProfileTabVariants.MeTab
end