local user = script:FindFirstAncestor("SocialLibraries").User
local presenceImageByPresenceModule = require(user.presenceImageByPresence)
local getPresenceTextFromUserModule = require(user.getPresenceTextFromUser)
local getOtherParticipantModule = require(script.Parent.getOtherParticipant)

return function(p0, p1)
	-- upvalues: getOtherParticipantModule (ref), presenceImageByPresenceModule (ref), getPresenceTextFromUserModule (ref)
	if p1.conversationType == "OneToOneConversation" then
		local var3 = getOtherParticipantModule(p0, p1.participants)
		
		if var3 then
			local var4 = p0.Users[var3]
			
			return if var4 then {
				image = presenceImageByPresenceModule[var4.presence],
				text = getPresenceTextFromUserModule(var4)
			} else nil
		end
	end
end