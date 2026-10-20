local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local EnumsModule = require(ProfilePlatform.Common.Enums)

return function(): boolean
	-- upvalues: UseProfileWrapperContextModule (copy), EnumsModule (copy)
	return UseProfileWrapperContextModule().headerVariant == EnumsModule.ProfileTabVariants.MeTab
end