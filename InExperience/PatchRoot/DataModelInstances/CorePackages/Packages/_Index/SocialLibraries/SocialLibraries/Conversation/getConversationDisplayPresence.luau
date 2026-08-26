local user = script:FindFirstAncestor("SocialLibraries").User
local presenceImageByPresenceModule = require(user.presenceImageByPresence)
local getPresenceTextFromUserModule = require(user.getPresenceTextFromUser)
local getOtherParticipantModule = require(script.Parent.getOtherParticipant)

return function(p1, p2)
	-- upvalues: getOtherParticipantModule (ref), presenceImageByPresenceModule (ref), getPresenceTextFromUserModule (ref)
	if p2.conversationType == "OneToOneConversation" then
		local var1 = getOtherParticipantModule(p1, p2.participants)
		
		if var1 then
			local var2 = p1.Users[var1]
			
			return if var2 then {
				image = presenceImageByPresenceModule[var2.presence],
				text = getPresenceTextFromUserModule(var2)
			} else nil
		end
	end
end