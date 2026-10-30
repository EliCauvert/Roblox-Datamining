local GetLocalUserIdModule = require(script.Parent.Parent.Utils.getLocalUserId)

local function getOtherParticipantUserId(Participants): string?
	-- upvalues: GetLocalUserIdModule (copy)
	if Participants == nil then
		return nil
	end
	local LocalUserIdModule = GetLocalUserIdModule()
	local Text = if LocalUserIdModule == nil then nil else tostring(LocalUserIdModule)
	for _, participant in Participants do
		if tostring(participant) ~= Text then
			return (tostring(participant))
		end
	end
	return nil
end

return function(p1)
	-- upvalues: getOtherParticipantUserId (copy)
	local IsFriends: boolean = p1 and (p1.type == "one_to_one" and (p1.source == "friends" or (p1.osaAcknowledgementStatus == "acknowledged" or p1.osaAcknowledgementStatus == "unacknowledged")))
	
	return if IsFriends and p1 then getOtherParticipantUserId(p1.participants) else nil
end