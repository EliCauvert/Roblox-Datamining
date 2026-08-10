local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local getStandardSizeAvatarHeadShotRbxthumb = require(parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local fFlagAppChatUseProfileFrameThumbnailModule = require(appChat.Flags.FFlagAppChatUseProfileFrameThumbnail)

return function(p0) --[[ line: 8 ]]
	-- upvalues: cryoModule (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), fFlagAppChatUseProfileFrameThumbnailModule (ref)
	return cryoModule.List.map(p0, function(p1) --[[ line: 9 ]]
		-- upvalues: getStandardSizeAvatarHeadShotRbxthumb (copy), fFlagAppChatUseProfileFrameThumbnailModule (copy)
		return getStandardSizeAvatarHeadShotRbxthumb(tostring(p1), fFlagAppChatUseProfileFrameThumbnailModule)
	end)
end