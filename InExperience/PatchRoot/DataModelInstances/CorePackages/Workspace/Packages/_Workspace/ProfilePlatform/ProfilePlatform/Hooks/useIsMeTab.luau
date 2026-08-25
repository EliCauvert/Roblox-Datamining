local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local enumsModule = require(profilePlatform.Common.Enums)

return function()
	-- upvalues: useProfileWrapperContextModule (ref), enumsModule (ref)
	return useProfileWrapperContextModule().headerVariant == enumsModule.ProfileTabVariants.MeTab
end