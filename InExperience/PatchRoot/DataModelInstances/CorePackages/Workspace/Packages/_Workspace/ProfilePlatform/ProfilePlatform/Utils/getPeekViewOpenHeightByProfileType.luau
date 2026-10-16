local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local EnumsModule = require(ProfilePlatform.Common.Enums)

return function(Community) --[[ Line: 5 ]]
	-- upvalues: EnumsModule (copy), ConstantsModule (copy)
	return if Community == EnumsModule.ProfileTypes.Community then ConstantsModule.COMMUNITY_PEEK_VIEW_OPEN_HEIGHT else ConstantsModule.USER_PEEK_VIEW_OPEN_HEIGHT
end