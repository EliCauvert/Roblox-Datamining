local sharedFlagsModule = require(script:FindFirstAncestor("AppChat").Parent.SharedFlags)
local fIntFriendsChatModeratedMaskMinLength = sharedFlagsModule.FIntFriendsChatModeratedMaskMinLength
local fIntFriendsChatModeratedMaskMaxLength = sharedFlagsModule.FIntFriendsChatModeratedMaskMaxLength

return function(p0) --[[ line: 17 | named "getModeratedMaskText" ]]
	-- upvalues: fIntFriendsChatModeratedMaskMaxLength (ref), fIntFriendsChatModeratedMaskMinLength (ref)
	return string.rep("#", fIntFriendsChatModeratedMaskMinLength + string.byte(p0, #p0) % (fIntFriendsChatModeratedMaskMaxLength - fIntFriendsChatModeratedMaskMinLength + 1))
end