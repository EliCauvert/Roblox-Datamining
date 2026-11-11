local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local SignalsModule = require(Parent1.Signals)
local Modules = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules")
local VoiceChat = Modules:WaitForChild("VoiceChat")
local Default = require(VoiceChat:WaitForChild("VoiceChatServiceManager")).default
local ConstantsModule = require(VoiceChat:WaitForChild("Constants"))
local VOICESTATE = ConstantsModule.VOICE_STATE
local VoiceStore = require(Parent1.ExpChat).Stores.GetVoiceStore(false)
local NewResult = require(Parent1.CoreScriptsInitializer).CoreLogger:new(script.Name)
local GetFFlagVoiceChatUILoggingModule = require(Modules:WaitForChild("Flags"):WaitForChild("GetFFlagVoiceChatUILogging"))
local GetFFlagNewPeoplePageIconsFunction = require(Parent.Flags).GetFFlagNewPeoplePageIcons
local GetFFlagAddPeoplePageCardLayoutFunction = require(Parent.Flags).GetFFlagAddPeoplePageCardLayout
local LuaFlagVoiceChatDisableSubscribeRetryForMultistream = game:DefineFastFlag("LuaFlagVoiceChatDisableSubscribeRetryForMultistream", true)
local VoiceChatMultistreamSubscriptionsEnabledEngineFeature = game:GetEngineFeature("VoiceChatMultistreamSubscriptionsEnabled")
local ConstantsModule1 = require(Parent.Constants)
local FRAMEBUFFER = ConstantsModule1.VOICE_CHAT.MIC_ANIMATION.FRAME_BUFFER
local ICONS = ConstantsModule1.VOICE_CHAT.ICONS
local PlayerMuteStatusIcons = Default.PlayerMuteStatusIcons

return ((function()
	-- upvalues: SignalsModule (copy), RunService (copy), FRAMEBUFFER (copy), PlayerMuteStatusIcons (copy), Default (copy), VoiceStore (copy), Players (copy), VOICESTATE (copy), ConstantsModule (copy), LuaFlagVoiceChatDisableSubscribeRetryForMultistream (copy), VoiceChatMultistreamSubscriptionsEnabledEngineFeature (copy), ICONS (copy), GetFFlagNewPeoplePageIconsFunction (copy), GetFFlagAddPeoplePageCardLayoutFunction (copy), GetFFlagVoiceChatUILoggingModule (copy), NewResult (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	local Signal3, Signal2_2 = SignalsModule.createSignal(nil)
	local Signal4, Signal2_3 = SignalsModule.createSignal(false)
	local Signal5, Signal2_4 = SignalsModule.createSignal(0)
	local Signal6, Signal2_5 = SignalsModule.createSignal(0)
	local Count = 0
	local RenderSteppedConnection = nil
	
	local function _()
		-- upvalues: RenderSteppedConnection (ref), RunService (upval), Signal4 (copy), Count (ref), FRAMEBUFFER (upval), Signal2_4 (copy), Signal2_5 (copy)
		if not RenderSteppedConnection then
			RenderSteppedConnection = RunService.RenderStepped:Connect(function()
				-- upvalues: Signal4 (upval), Count (upval), FRAMEBUFFER (upval), Signal2_4 (upval), Signal2_5 (upval)
				if Signal4(false) then
					Count += 1
					
					if FRAMEBUFFER < Count then
						Signal2_4((math.random()))
						Count = 0
						
						return
					end
				else
					Count += 1
					
					if FRAMEBUFFER < Count then
						Signal2_5((math.random()))
						Count = 0
					end
				end
			end)
			
			return
		end
	end
	
	local _ = function()
		-- upvalues: RenderSteppedConnection (ref)
		if RenderSteppedConnection then
			RenderSteppedConnection:Disconnect()
			RenderSteppedConnection = nil
		end
	end
	
	local function getMuteSelfIcon()
		-- upvalues: SignalsModule (upval), Signal3 (copy), Signal4 (copy), PlayerMuteStatusIcons (upval), Signal5 (copy), Default (upval)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: Signal3 (upval), Signal4 (upval), PlayerMuteStatusIcons (upval), Signal5 (upval), Default (upval)
			local SignalResult = Signal3(p1)
			local SignalResult1 = Signal4(p1)
			
			return if SignalResult == nil then PlayerMuteStatusIcons.Loading elseif SignalResult then PlayerMuteStatusIcons.MicOff elseif SignalResult1 then Default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * Signal5(p1)) * 20), "MicLight") else PlayerMuteStatusIcons.MicOn
		end)
	end
	
	local Computed = SignalsModule.createComputed(function(p1): boolean
		-- upvalues: Signal (copy), Default (upval), VoiceStore (upval), Players (upval), VOICESTATE (upval)
		if not Signal(p1) or not Default.voiceUIVisible then
			return false
		end
		local VoiceParticipants = VoiceStore.getVoiceParticipants(p1)
		
		if not VoiceParticipants then
			return false
		end
		local Flag = true
		
		for i, voiceParticipant in pairs(VoiceParticipants) do
			local Number: number? = tonumber(i)
			
			if Number and Players.LocalPlayer and Number ~= Players.LocalPlayer.UserId and voiceParticipant ~= VOICESTATE.LOCAL_MUTED then
				Flag = false
				
				return Flag
			end
		end
		return Flag
	end)
	
	local function toggleMuteAll()
		-- upvalues: Signal (copy), Computed (copy), Default (upval), ConstantsModule (upval)
		if Signal(false) then
			Default:MuteAll(not Computed(false), ConstantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
			
			return
		end
	end
	
	local function toggleMuteSelf()
		-- upvalues: Signal (copy), Default (upval)
		if Signal(false) then
			Default:ToggleMic("InGameMenuPlayers")
			
			return
		end
	end
	
	local function SubscribeRetry(UserId)
		-- upvalues: Signal (copy), Default (upval)
		if Signal(false) then
			Default:SubscribeRetry(UserId)
			
			return
		end
	end
	
	local function getPlayerMuteState(p2)
		-- upvalues: SignalsModule (upval), VoiceStore (upval), VOICESTATE (upval)
		return SignalsModule.createComputed(function(p3): boolean
			-- upvalues: VoiceStore (upval), p2 (copy), VOICESTATE (upval)
			local LOCALMUTED = VoiceStore.getOrCreateVoiceState(p2)(p3)
			
			return if LOCALMUTED then LOCALMUTED == VOICESTATE.LOCAL_MUTED or LOCALMUTED == VOICESTATE.MUTED else false
		end)
	end
	
	local function togglePlayerMute(UserId)
		-- upvalues: Signal (copy), Signal1 (copy), Default (upval), ConstantsModule (upval), LuaFlagVoiceChatDisableSubscribeRetryForMultistream (upval), VoiceChatMultistreamSubscriptionsEnabledEngineFeature (upval)
		if not Signal(false) then return end
		if not Signal1(false) then return end
		local Participant = Default.participants[tostring(UserId)]
		
		if Participant and Participant.subscriptionCompleted then
			Default:ToggleMutePlayer(tonumber(UserId), ConstantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
			
			return
		end
		if not Participant or not Participant.subscriptionFailed then
			Default:ToggleMutePlayer(tonumber(UserId), ConstantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
		elseif not LuaFlagVoiceChatDisableSubscribeRetryForMultistream then
			Default:SubscribeRetry(UserId)
			
			return
		else
			if not VoiceChatMultistreamSubscriptionsEnabledEngineFeature then
				Default:SubscribeRetry(UserId)
				
				return
			end
		end
	end
	
	local function getPlayerShouldShowMuteButton(UserId)
		-- upvalues: SignalsModule (upval), Signal1 (copy), Players (upval), VoiceStore (upval)
		return SignalsModule.createComputed(function(p2): boolean
			-- upvalues: Signal1 (upval), Players (upval), UserId (copy), VoiceStore (upval)
			return if Signal1(p2) and (not Players.LocalPlayer or UserId ~= Players.LocalPlayer.UserId) then VoiceStore.getOrCreateVoiceState(UserId)(p2) ~= nil else false
		end)
	end
	
	local function getPlayerAnimatedIcon(p2)
		-- upvalues: SignalsModule (upval), VoiceStore (upval), ICONS (upval), VOICESTATE (upval), GetFFlagNewPeoplePageIconsFunction (upval), Signal6 (copy)
		return SignalsModule.createComputed(function(p3)
			-- upvalues: VoiceStore (upval), p2 (copy), ICONS (upval), VOICESTATE (upval), GetFFlagNewPeoplePageIconsFunction (upval), Signal6 (upval)
			local LOCALMUTED = VoiceStore.getOrCreateVoiceState(p2)(p3)
			
			return if LOCALMUTED then if LOCALMUTED == VOICESTATE.LOCAL_MUTED or LOCALMUTED == VOICESTATE.MUTED then if GetFFlagNewPeoplePageIconsFunction() then ICONS.MUTED_SPEAKER else ICONS.SPEAKER_OFF elseif LOCALMUTED == VOICESTATE.TALKING then string.format(ICONS.ANIMATED_SPEAKER_FORMAT, math.floor(0.5 + 5 * Signal6(p3)) * 20) else ICONS.DEFAULT_SPEAKER else ICONS.DEFAULT_SPEAKER
		end)
	end
	
	local function getPlayerIsLocalMuted(p2)
		-- upvalues: SignalsModule (upval), VoiceStore (upval), VOICESTATE (upval)
		return SignalsModule.createComputed(function(p3): boolean
			-- upvalues: p2 (copy), VoiceStore (upval), VOICESTATE (upval)
			return if p2 then VoiceStore.getOrCreateVoiceState(p2)(p3) == VOICESTATE.LOCAL_MUTED else false
		end)
	end
	
	local v1 = if GetFFlagAddPeoplePageCardLayoutFunction() then function(p2)
		-- upvalues: SignalsModule (upval), VoiceStore (upval), VOICESTATE (upval)
		return SignalsModule.createComputed(function(p3): boolean
			-- upvalues: VoiceStore (upval), p2 (copy), VOICESTATE (upval)
			return VoiceStore.getOrCreateVoiceState(p2)(p3) == VOICESTATE.TALKING
		end)
	end else nil
	
	local function cleanup()
		-- upvalues: RenderSteppedConnection (ref)
		if RenderSteppedConnection then
			RenderSteppedConnection:Disconnect()
			RenderSteppedConnection = nil
		end
	end
	
	;(function()
		-- upvalues: Default (upval), Signal2 (copy), Players (upval), VoiceStore (upval), Signal2_2 (copy), Signal2_3 (copy), Signal2_1 (copy), RenderSteppedConnection (ref), RunService (upval), Signal4 (copy), Count (ref), FRAMEBUFFER (upval), Signal2_4 (copy), Signal2_5 (copy), GetFFlagVoiceChatUILoggingModule (upval), NewResult (upval)
		if game:GetEngineFeature("VoiceChatSupported") then
			Default:asyncInit():andThen(function()
				-- upvalues: Signal2 (upval), Default (upval), Players (upval), VoiceStore (upval), Signal2_2 (upval), Signal2_3 (upval), Signal2_1 (upval), RenderSteppedConnection (upval), RunService (upval), Signal4 (upval), Count (upval), FRAMEBUFFER (upval), Signal2_4 (upval), Signal2_5 (upval)
				Signal2(true)
				Default:SetupParticipantListeners()
				
				for i, _ in pairs(Default.participants) do
					local LocalPlayer = Players.LocalPlayer
					
					if LocalPlayer and i ~= tostring(LocalPlayer.UserId) then
						VoiceStore.handleVoiceParticipantAdded(i)
					end
				end
				if Default.participants and next(Default.participants) then
					VoiceStore.handleVoiceParticipantsChanged(Default.participants)
				end
				Default.muteChanged.Event:Connect(function(p2)
					-- upvalues: Signal2_2 (upval)
					Signal2_2(p2)
				end)
				Default.talkingChanged.Event:Connect(function(p2)
					-- upvalues: Signal2_3 (upval)
					Signal2_3(p2)
				end)
				Signal2_2(Default.localMuted)
				Signal2_3(Default.isTalking)
				Default.participantsUpdate.Event:Connect(function(p2)
					-- upvalues: VoiceStore (upval)
					VoiceStore.handleVoiceParticipantsChanged(p2)
				end)
				Default.participantJoined.Event:Connect(function(_, p2)
					-- upvalues: VoiceStore (upval)
					VoiceStore.handleVoiceParticipantAdded((tostring(p2)))
				end)
				Default.participantLeft.Event:Connect(function(_, p2)
					-- upvalues: VoiceStore (upval)
					VoiceStore.handleVoiceParticipantRemoved((tostring(p2)))
				end)
				Default.showVoiceUI.Event:Connect(function()
					-- upvalues: Signal2_1 (upval), RenderSteppedConnection (upval), RunService (upval), Signal4 (upval), Count (upval), FRAMEBUFFER (upval), Signal2_4 (upval), Signal2_5 (upval)
					Signal2_1(true)
					
					if not RenderSteppedConnection then
						RenderSteppedConnection = RunService.RenderStepped:Connect(function()
							-- upvalues: Signal4 (upval), Count (upval), FRAMEBUFFER (upval), Signal2_4 (upval), Signal2_5 (upval)
							if Signal4(false) then
								Count += 1
								
								if FRAMEBUFFER < Count then
									Signal2_4((math.random()))
									Count = 0
									
									return
								end
							else
								Count += 1
								
								if FRAMEBUFFER < Count then
									Signal2_5((math.random()))
									Count = 0
								end
							end
						end)
						
						return
					end
				end)
				Default.hideVoiceUI.Event:Connect(function()
					-- upvalues: Signal2_1 (upval), RenderSteppedConnection (upval)
					Signal2_1(false)
					
					if RenderSteppedConnection then
						RenderSteppedConnection:Disconnect()
						RenderSteppedConnection = nil
					end
				end)
				
				if Default.voiceUIVisible then
					Signal2_1(true)
				end
				if not RenderSteppedConnection then
					RenderSteppedConnection = RunService.RenderStepped:Connect(function()
						-- upvalues: Signal4 (upval), Count (upval), FRAMEBUFFER (upval), Signal2_4 (upval), Signal2_5 (upval)
						if Signal4(false) then
							Count += 1
							
							if FRAMEBUFFER < Count then
								Signal2_4((math.random()))
								Count = 0
								
								return
							end
						else
							Count += 1
							
							if FRAMEBUFFER < Count then
								Signal2_5((math.random()))
								Count = 0
							end
						end
					end)
					
					return
				end
			end):catch(function(_)
				-- upvalues: GetFFlagVoiceChatUILoggingModule (upval), NewResult (upval), RenderSteppedConnection (upval)
				if GetFFlagVoiceChatUILoggingModule() then
					NewResult:warning("Failed to init VoiceChatServiceManager")
				end
				if RenderSteppedConnection then
					RenderSteppedConnection:Disconnect()
					RenderSteppedConnection = nil
				end
			end)
			
			return
		end
	end)()
	
	return {
		voiceChatServiceConnected = Signal,
		voiceUIVisible = Signal1,
		allPlayersMuted = Computed,
		voiceParticipants = VoiceStore.getVoiceParticipants,
		localMuted = Signal3,
		localTalking = Signal4,
		toggleMuteAll = toggleMuteAll,
		toggleMuteSelf = toggleMuteSelf,
		SubscribeRetry = SubscribeRetry,
		getPlayerMuteState = getPlayerMuteState,
		togglePlayerMute = togglePlayerMute,
		getPlayerShouldShowMuteButton = getPlayerShouldShowMuteButton,
		getPlayerAnimatedIcon = getPlayerAnimatedIcon,
		getPlayerIsLocalMuted = getPlayerIsLocalMuted,
		getPlayerIsTalking = if GetFFlagAddPeoplePageCardLayoutFunction() then v1 else nil,
		getMuteSelfIcon = getMuteSelfIcon,
		cleanup = cleanup
	}
end)())