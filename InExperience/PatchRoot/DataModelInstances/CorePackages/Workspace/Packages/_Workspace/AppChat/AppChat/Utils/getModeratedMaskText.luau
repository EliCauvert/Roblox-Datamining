local sharedFlagsModule = require(script:FindFirstAncestor("AppChat").Parent.SharedFlags)
local fIntFriendsChatModeratedMaskMinLength = sharedFlagsModule.FIntFriendsChatModeratedMaskMinLength
local fIntFriendsChatModeratedMaskMaxLength = sharedFlagsModule.FIntFriendsChatModeratedMaskMaxLength

return function(p1)
	-- upvalues: fIntFriendsChatModeratedMaskMaxLength (ref), fIntFriendsChatModeratedMaskMinLength (ref)
	return string.rep("#", fIntFriendsChatModeratedMaskMinLength + string.byte(p1, #p1) % (fIntFriendsChatModeratedMaskMaxLength - fIntFriendsChatModeratedMaskMinLength + 1))
end