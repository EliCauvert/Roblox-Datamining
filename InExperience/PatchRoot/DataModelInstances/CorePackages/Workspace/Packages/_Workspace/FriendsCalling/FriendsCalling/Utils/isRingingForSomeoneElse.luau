local GetLocalUserIdModule = require(script:FindFirstAncestor("FriendsCalling").Utils.getLocalUserId)
local FriendsCallingPhase = Enum.FriendsCallingPhase

return function(p1): boolean
	-- upvalues: FriendsCallingPhase (copy), GetLocalUserIdModule (copy)
	local InitiatorUserId = p1.initiatorUserId
	
	return p1.phase == FriendsCallingPhase.Ringing and (InitiatorUserId ~= 0 and InitiatorUserId ~= GetLocalUserIdModule())
end