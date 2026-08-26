local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local getStandardSizeAvatarHeadShotRbxthumb = require(parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local fFlagAppChatUseProfileFrameThumbnailModule = require(appChat.Flags.FFlagAppChatUseProfileFrameThumbnail)

return function(p1)
	-- upvalues: cryoModule (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), fFlagAppChatUseProfileFrameThumbnailModule (ref)
	return cryoModule.List.map(p1, function(p2)
		-- upvalues: getStandardSizeAvatarHeadShotRbxthumb (copy), fFlagAppChatUseProfileFrameThumbnailModule (copy)
		return getStandardSizeAvatarHeadShotRbxthumb(tostring(p2), fFlagAppChatUseProfileFrameThumbnailModule)
	end)
end