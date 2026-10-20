local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local FFlagAppChatUseProfileFrameThumbnailModule = require(AppChat.Flags.FFlagAppChatUseProfileFrameThumbnail)

return function(p1)
	-- upvalues: CryoModule (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), FFlagAppChatUseProfileFrameThumbnailModule (copy)
	return CryoModule.List.map(p1, function(p2)
		-- upvalues: GetStandardSizeAvatarHeadShotRbxthumbFunction (upval), FFlagAppChatUseProfileFrameThumbnailModule (upval)
		return GetStandardSizeAvatarHeadShotRbxthumbFunction(tostring(p2), FFlagAppChatUseProfileFrameThumbnailModule)
	end)
end