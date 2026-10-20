local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local Players = game:GetService("Players")
local BlockedStatusChangedEvent = require(CorePackages.Workspace.Packages.BlockingUtility):GetBlockedStatusChangedEvent()
local Default = require(script.Parent.Parent.VoiceChatServiceManager).default
local VoiceStateContextModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.VoiceStateContext)
local VOICESTATE = require(CorePackages.Workspace.Packages.VoiceChat).Constants.VOICE_STATE
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	LocalPlayer = Players.LocalPlayer
end
local UserId = LocalPlayer and LocalPlayer.UserId or 0
local VoiceChatState = nil
VoiceChatState = if game:GetEngineFeature("VoiceChatSupported") then Enum.VoiceChatState else {
	Idle = 1,
	Joining = 2,
	JoiningRetry = 3,
	Joined = 4,
	Leaving = 5,
	Ended = 6,
	Failed = 7
}
local config = {
	[VoiceChatState.Idle] = VOICESTATE.HIDDEN,
	[VoiceChatState.Joining] = VOICESTATE.CONNECTING,
	[VoiceChatState.JoiningRetry] = VOICESTATE.CONNECTING,
	[VoiceChatState.Joined] = VOICESTATE.MUTED,
	[VoiceChatState.Leaving] = VOICESTATE.MUTED,
	[VoiceChatState.Ended] = VOICESTATE.HIDDEN,
	[VoiceChatState.Failed] = VOICESTATE.ERROR
}

local function _(p1)
	-- upvalues: config (copy), VOICESTATE (copy)
	return if config[p1] then config[p1] else VOICESTATE.MUTED
end

local _ = function(p1)
	-- upvalues: VOICESTATE (copy)
	local INACTIVE = VOICESTATE.INACTIVE
	
	if p1.subscriptionFailed then
		INACTIVE = VOICESTATE.ERROR
		
		return INACTIVE
	end
	if not p1.subscriptionCompleted then
		INACTIVE = VOICESTATE.CONNECTING
		
		return INACTIVE
	end
	if p1.isMutedLocally then
		INACTIVE = VOICESTATE.LOCAL_MUTED
		
		return INACTIVE
	end
	if p1.isMuted then
		INACTIVE = VOICESTATE.MUTED
		
		return INACTIVE
	end
	if p1.isSignalActive then
		INACTIVE = VOICESTATE.TALKING
	end
	return INACTIVE
end

return function(p1, Enabled, p2)
	-- upvalues: Default (copy), ReactModule (copy), VoiceStateContextModule (copy), VOICESTATE (copy), UserId (copy), config (copy), VoiceChatState (ref), BlockedStatusChangedEvent (copy)
	local VoiceChatServiceManager = p2 and p2.voiceChatServiceManager or Default
	local UseContextResult = ReactModule.useContext(VoiceStateContextModule.Context)
	local UseStateResult, UseStateResult2 = ReactModule.useState(VOICESTATE.HIDDEN)
	ReactModule.useEffect(function()
		-- upvalues: UseContextResult (copy), p1 (copy), Enabled (copy), UseStateResult2 (copy), VOICESTATE (upval), UserId (upval), UseStateResult (copy), config (upval), VoiceChatServiceManager (copy), VoiceChatState (upval), BlockedStatusChangedEvent (upval)
		if UseContextResult.voiceEnabled and p1 and not Enabled then
			local Number: number? = tonumber(p1)
			local Text = tostring(p1)
			local IsUserIdMatch = UserId == Number
			local Flag = nil
			local List = {}
			local Flag1 = false
			
			local function _(p3)
				-- upvalues: Flag1 (ref), UseStateResult2 (upval)
				if not Flag1 then
					UseStateResult2(p3)
				end
			end
			
			local function setVoiceEnabled(VoiceState)
				-- upvalues: UseStateResult (upval), IsUserIdMatch (copy), config (upval), VOICESTATE (upval), VoiceChatServiceManager (upval), Text (copy), Flag (ref), VoiceChatState (upval), Flag1 (ref), UseStateResult2 (upval)
				local ERROR = UseStateResult
				
				if IsUserIdMatch then
					ERROR = if config[VoiceState] then config[VoiceState] else VOICESTATE.MUTED
				else
					local Participant = VoiceChatServiceManager.participants[Text]
					
					if Participant and not Flag then
						ERROR = if Participant.subscriptionFailed then VOICESTATE.ERROR elseif Participant.subscriptionCompleted then if Participant.isMutedLocally then VOICESTATE.LOCAL_MUTED elseif Participant.isMuted then VOICESTATE.MUTED elseif Participant.isSignalActive then VOICESTATE.TALKING else VOICESTATE.INACTIVE else VOICESTATE.CONNECTING
					end
				end
				if VoiceState == VoiceChatState.Failed then
					if not IsUserIdMatch then
						ERROR = VOICESTATE.HIDDEN
					end
				elseif VoiceState == VoiceChatState.Joined and not VoiceChatServiceManager.localMuted and IsUserIdMatch then
					ERROR = if VoiceChatServiceManager.isTalking then VOICESTATE.TALKING elseif VoiceChatServiceManager.localMuted then VOICESTATE.MUTED else VOICESTATE.INACTIVE
				end
				local ERROR1 = ERROR
				
				if not Flag1 then
					UseStateResult2(ERROR1)
				end
			end
			
			setVoiceEnabled(UseContextResult.voiceState)
			delay(0, function()
				-- upvalues: Flag1 (ref), setVoiceEnabled (copy), UseContextResult (upval), IsUserIdMatch (copy), List (copy), VoiceChatServiceManager (upval), VOICESTATE (upval), UseStateResult2 (upval), Text (copy), Flag (ref), Number (copy), BlockedStatusChangedEvent (upval)
				if Flag1 then return end
				setVoiceEnabled(UseContextResult.voiceState)
				
				if IsUserIdMatch then
					table.insert(List, VoiceChatServiceManager.talkingChanged.Event:Connect(function(p3)
						-- upvalues: VOICESTATE (upval), Flag1 (upval), UseStateResult2 (upval)
						local TALKING = if p3 then VOICESTATE.TALKING else VOICESTATE.INACTIVE
						
						if not Flag1 then
							UseStateResult2(TALKING)
						end
					end))
					table.insert(List, VoiceChatServiceManager.muteChanged.Event:Connect(function(p3)
						-- upvalues: VOICESTATE (upval), Flag1 (upval), UseStateResult2 (upval)
						local MUTED = if p3 then VOICESTATE.MUTED else VOICESTATE.INACTIVE
						
						if not Flag1 then
							UseStateResult2(MUTED)
						end
					end))
					
					return
				else
					table.insert(List, VoiceChatServiceManager.participantsUpdate.Event:Connect(function(p3)
						-- upvalues: Text (upval), Flag (upval), VOICESTATE (upval), Flag1 (upval), UseStateResult2 (upval)
						local v1 = p3[Text]
						
						if v1 and not Flag then
							local ERROR = if v1.subscriptionFailed then VOICESTATE.ERROR elseif v1.subscriptionCompleted then if v1.isMutedLocally then VOICESTATE.LOCAL_MUTED elseif v1.isMuted then VOICESTATE.MUTED elseif v1.isSignalActive then VOICESTATE.TALKING else VOICESTATE.INACTIVE else VOICESTATE.CONNECTING
							
							if not Flag1 then
								UseStateResult2(ERROR)
								
								return
							end
						else
							local HIDDEN = VOICESTATE.HIDDEN
							
							if not Flag1 then
								UseStateResult2(HIDDEN)
							end
						end
					end))
					table.insert(List, VoiceChatServiceManager.participantLeft.Event:Connect(function(_, Number1)
						-- upvalues: Number (upval), VOICESTATE (upval), Flag1 (upval), UseStateResult2 (upval)
						if Number1 == Number then
							local HIDDEN = VOICESTATE.HIDDEN
							
							if not Flag1 then
								UseStateResult2(HIDDEN)
							end
						end
					end))
					table.insert(List, VoiceChatServiceManager.participantJoined.Event:Connect(function(_, Number1)
						-- upvalues: Number (upval), VOICESTATE (upval), Flag1 (upval), UseStateResult2 (upval)
						if Number1 == Number then
							local HIDDEN = VOICESTATE.HIDDEN
							
							if not Flag1 then
								UseStateResult2(HIDDEN)
							end
						end
					end))
					table.insert(List, BlockedStatusChangedEvent:Connect(function(Number1, p3)
						-- upvalues: Number (upval), Flag (upval), VOICESTATE (upval), Flag1 (upval), UseStateResult2 (upval), VoiceChatServiceManager (upval), Text (upval)
						if Number == Number1 then
							if p3 then
								Flag = true
								local HIDDEN = VOICESTATE.HIDDEN
								
								if not Flag1 then
									UseStateResult2(HIDDEN)
									
									return
								end
							else
								Flag = nil
								local Participant = VoiceChatServiceManager.participants[Text]
								
								if Participant then
									local ERROR = if Participant.subscriptionFailed then VOICESTATE.ERROR elseif Participant.subscriptionCompleted then if Participant.isMutedLocally then VOICESTATE.LOCAL_MUTED elseif Participant.isMuted then VOICESTATE.MUTED elseif Participant.isSignalActive then VOICESTATE.TALKING else VOICESTATE.INACTIVE else VOICESTATE.CONNECTING
									
									if not Flag1 then
										UseStateResult2(ERROR)
										
										return
									end
								else
									local HIDDEN = VOICESTATE.HIDDEN
									
									if not Flag1 then
										UseStateResult2(HIDDEN)
									end
								end
							end
						end
					end))
				end
			end)
			
			return function()
				-- upvalues: Flag1 (ref), List (copy)
				Flag1 = true
				delay(0, function()
					-- upvalues: List (upval)
					for _, value in List do
						value:disconnect()
					end
				end)
			end
		else
			UseStateResult2(VOICESTATE.HIDDEN)
			
			return function() end
		end
	end, { p1, UseContextResult.voiceState, Enabled == true })
	
	return UseStateResult
end