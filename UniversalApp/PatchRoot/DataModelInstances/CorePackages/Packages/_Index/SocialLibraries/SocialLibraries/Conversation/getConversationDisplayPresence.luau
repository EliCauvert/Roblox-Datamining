local User = script:FindFirstAncestor("SocialLibraries").User
local PresenceImageByPresenceModule = require(User.presenceImageByPresence)
local GetPresenceTextFromUserModule = require(User.getPresenceTextFromUser)
local GetOtherParticipantModule = require(script.Parent.getOtherParticipant)

return function(p1, p2) --[[ Line: 8 ]]
	-- upvalues: GetOtherParticipantModule (copy), PresenceImageByPresenceModule (copy), GetPresenceTextFromUserModule (copy)
	if p2.conversationType == "OneToOneConversation" then
		local OtherParticipantModule = GetOtherParticipantModule(p1, p2.participants)
		
		if OtherParticipantModule then
			local User = p1.Users[OtherParticipantModule]
			
			if User then
				return {
					image = PresenceImageByPresenceModule[User.presence],
					text = GetPresenceTextFromUserModule(User)
				}
			end
		end
	end
	return nil
end