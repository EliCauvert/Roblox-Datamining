local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local constantsModule = require(profilePlatform.Common.Constants)
local enumsModule = require(profilePlatform.Common.Enums)

return function(p1)
	-- upvalues: enumsModule (ref), constantsModule (ref)
	return if p1 == enumsModule.ProfileTypes.Community then constantsModule.COMMUNITY_PEEK_VIEW_OPEN_HEIGHT else constantsModule.USER_PEEK_VIEW_OPEN_HEIGHT
end