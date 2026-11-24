local GetLocalUserIdModule = require(script:FindFirstAncestor("FriendsCalling").Utils.getLocalUserId)
local FriendsCallingPhase = Enum.FriendsCallingPhase

local function _(p1): boolean
	-- upvalues: FriendsCallingPhase (copy), GetLocalUserIdModule (copy)
	local InitiatorUserId = p1.initiatorUserId
	
	return p1.phase == FriendsCallingPhase.Ringing and (InitiatorUserId ~= 0 and InitiatorUserId ~= GetLocalUserIdModule())
end

return function(p1): boolean
	-- upvalues: FriendsCallingPhase (copy), GetLocalUserIdModule (copy)
	local v1 = false
	
	if p1 ~= nil then
		local InitiatorUserId = p1.initiatorUserId
		v1 = not (p1.phase == FriendsCallingPhase.Ringing and (InitiatorUserId ~= 0 and InitiatorUserId ~= GetLocalUserIdModule()))
	end
	return v1
end