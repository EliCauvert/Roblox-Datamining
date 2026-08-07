local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local constantsModule = require(profilePlatform.Common.Constants)
local enumsModule = require(profilePlatform.Common.Enums)

return function(p0) --[[ line: 5 ]]
	-- upvalues: enumsModule (ref), constantsModule (ref)
	return if p0 == enumsModule.ProfileTypes.Community then constantsModule.COMMUNITY_PEEK_VIEW_OPEN_HEIGHT else constantsModule.USER_PEEK_VIEW_OPEN_HEIGHT
end