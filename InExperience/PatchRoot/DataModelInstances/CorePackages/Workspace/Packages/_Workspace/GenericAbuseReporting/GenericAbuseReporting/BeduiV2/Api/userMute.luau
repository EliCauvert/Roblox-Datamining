local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local ChatMuteModule = require(Parent.ChatMute)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatUseChatMuteStore = SharedFlagsModule.FFlagExpChatUseChatMuteStore
local FFlagAbuseReportVoiceMute = SharedFlagsModule.FFlagAbuseReportVoiceMute

local function _(p1, p2) --[[ Line: 14 | Named "voiceMutePlayer" ]]
	-- upvalues: FFlagAbuseReportVoiceMute (copy)
	if not FFlagAbuseReportVoiceMute or not p2 then return end
	local Participants = p2.participants
	
	if not Participants then return end
	local Participant = Participants[tostring(p1)]
	
	if Participant and not Participant.isMutedLocally then
		p2:ToggleMutePlayer(p1, "igm-report-v2")
	end
end

function muteUser(UserId, Player, p1): boolean --[[ Line: 29 ]]
	-- upvalues: FFlagExpChatUseChatMuteStore (copy), ChatMuteModule (copy), FFlagAbuseReportVoiceMute (copy), ExpChatSharedModule (copy)
	if not UserId or not Player then
		return false
	end
	if UserId == Player.UserId then
		return false
	end
	if FFlagExpChatUseChatMuteStore then
		ChatMuteModule.mutePlayer({ userId = tostring(UserId) })
		
		if FFlagAbuseReportVoiceMute and FFlagAbuseReportVoiceMute and p1 then
			local Participants = p1.participants
			
			if Participants then
				local Participant = Participants[tostring(UserId)]
				
				if Participant and not Participant.isMutedLocally then
					p1:ToggleMutePlayer(UserId, "igm-report-v2")
				end
			end
		end
		return true
	else
		local Context = ExpChatSharedModule.context
		
		if not Context.store then
			return false
		end
		if not Context.messagesStore then
			return false
		end
		Context.messagesStore.muteUser(UserId)
		
		if FFlagAbuseReportVoiceMute and FFlagAbuseReportVoiceMute and p1 then
			local Participants = p1.participants
			
			if Participants then
				local Participant = Participants[tostring(UserId)]
				
				if Participant and not Participant.isMutedLocally then
					p1:ToggleMutePlayer(UserId, "igm-report-v2")
				end
			end
		end
		return true
	end
end

function isUserMuted(p1) --[[ Line: 60 ]]
	-- upvalues: FFlagExpChatUseChatMuteStore (copy), ChatMuteModule (copy), ExpChatSharedModule (copy)
	if not p1 then
		return false
	elseif FFlagExpChatUseChatMuteStore then
		return ChatMuteModule.isUserIdMuted((tostring(p1)))
	else
		local Context = ExpChatSharedModule.context
		
		return if Context.store and Context.messagesStore then Context.messagesStore.getMutedUserIds(false)[tostring(p1)] == true else false
	end
end

return { isUserMuted = isUserMuted, muteUser = muteUser }