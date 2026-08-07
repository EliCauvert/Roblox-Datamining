local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local enumsModule = require(profilePlatform.Common.Enums)

return function() --[[ line: 10 | named "useIsMeTab" ]]
	-- upvalues: useProfileWrapperContextModule (ref), enumsModule (ref)
	return useProfileWrapperContextModule().headerVariant == enumsModule.ProfileTabVariants.MeTab
end