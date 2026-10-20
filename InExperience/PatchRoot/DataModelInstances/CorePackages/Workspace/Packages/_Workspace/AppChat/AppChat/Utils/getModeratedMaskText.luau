local SharedFlagsModule = require(script:FindFirstAncestor("AppChat").Parent.SharedFlags)
local FIntFriendsChatModeratedMaskMinLength = SharedFlagsModule.FIntFriendsChatModeratedMaskMinLength
local FIntFriendsChatModeratedMaskMaxLength = SharedFlagsModule.FIntFriendsChatModeratedMaskMaxLength

return function(Text: string): string
	-- upvalues: FIntFriendsChatModeratedMaskMaxLength (copy), FIntFriendsChatModeratedMaskMinLength (copy)
	return string.rep("#", FIntFriendsChatModeratedMaskMinLength + string.byte(Text, #Text) % (FIntFriendsChatModeratedMaskMaxLength - FIntFriendsChatModeratedMaskMinLength + 1))
end