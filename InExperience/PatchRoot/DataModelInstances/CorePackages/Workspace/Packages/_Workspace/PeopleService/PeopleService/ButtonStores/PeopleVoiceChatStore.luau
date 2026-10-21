local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VoiceChatService = game:GetService("VoiceChatService")
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
local FFlagVoiceVolumeControlsPerUserPlayerListButton = require(Parent.Flags).FFlagVoiceVolumeControlsPerUserPlayerListButton
local FFlagVoiceVolumeControlsPerUserPlayerGridMenu = require(Parent.Flags).FFlagVoiceVolumeControlsPerUserPlayerGridMenu
local FFlagVoiceChatVolumePerUserMuteVolumeSync = require(Parent.Flags).FFlagVoiceChatVolumePerUserMuteVolumeSync
local FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry = require(Parent.Flags).FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry
local VoiceVolumeControlsEligibility = require(Parent1.VoiceChatCore).VoiceVolumeControlsEligibility
local LuaFlagVoiceChatDisableSubscribeRetryForMultistream = game:DefineFastFlag("LuaFlagVoiceChatDisableSubscribeRetryForMultistream", true)
local VoiceChatMultistreamSubscriptionsEnabledEngineFeature = game:GetEngineFeature("VoiceChatMultistreamSubscriptionsEnabled")
local ConstantsModule1 = require(Parent.Constants)
local FRAMEBUFFER = ConstantsModule1.VOICE_CHAT.MIC_ANIMATION.FRAME_BUFFER
local ICONS = ConstantsModule1.VOICE_CHAT.ICONS
local VOICEVOLUME = ConstantsModule1.VOICE_CHAT.VOICE_VOLUME
local PlayerMuteStatusIcons = Default.PlayerMuteStatusIcons

return ((function()
	-- upvalues: SignalsModule (copy), FFlagVoiceVolumeControlsPerUserPlayerListButton (copy), FFlagVoiceVolumeControlsPerUserPlayerGridMenu (copy), RunService (copy), FRAMEBUFFER (copy), PlayerMuteStatusIcons (copy), Default (copy), VoiceStore (copy), Players (copy), VOICESTATE (copy), FFlagVoiceChatVolumePerUserMuteVolumeSync (copy), ConstantsModule (copy), VOICEVOLUME (copy), LuaFlagVoiceChatDisableSubscribeRetryForMultistream (copy), VoiceChatMultistreamSubscriptionsEnabledEngineFeature (copy), ICONS (copy), GetFFlagNewPeoplePageIconsFunction (copy), GetFFlagAddPeoplePageCardLayoutFunction (copy), VoiceVolumeControlsEligibility (copy), VoiceChatService (copy), GetFFlagVoiceChatUILoggingModule (copy), NewResult (copy), FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), Parent (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	local Signal3, Signal2_2 = SignalsModule.createSignal(nil)
	local Signal4, Signal2_3 = SignalsModule.createSignal(false)
	local v1 = nil
	local Callback1 = nil
	
	if FFlagVoiceVolumeControlsPerUserPlayerListButton or FFlagVoiceVolumeControlsPerUserPlayerGridMenu then
		v1, Callback1 = SignalsModule.createSignal(false)
	end
	local T = if FFlagVoiceVolumeControlsPerUserPlayerListButton or FFlagVoiceVolumeControlsPerUserPlayerGridMenu then {} else nil
	local v2 = nil
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
	local Callback = if FFlagVoiceChatVolumePerUserMuteVolumeSync then function(p2, p3)
		-- upvalues: Default (upval), Players (upval), ConstantsModule (upval), VOICEVOLUME (upval)
		local Number: number? = tonumber(p2)
		
		if not Number then return end
		local CoreVoiceManager = Default.coreVoiceManager
		
		if not p3 and CoreVoiceManager and CoreVoiceManager.muteAll then
			CoreVoiceManager.muteAll = false
			
			if CoreVoiceManager.muteAllChanged then
				CoreVoiceManager.muteAllChanged:Fire(false)
			end
			local List = {}
			local LocalPlayer = Players.LocalPlayer
			
			for _, player in Players:GetPlayers() do
				if LocalPlayer and player.UserId ~= LocalPlayer.UserId and player.UserId ~= Number then
					table.insert(List, player.UserId)
				end
			end
			if #List > 0 then
				Default:ToggleMuteSome(List, true, ConstantsModule.VOICE_GROUP_TYPE.ALL, ConstantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
			end
		end
		Default:ToggleMuteSome({ Number }, p3, ConstantsModule.VOICE_GROUP_TYPE.ALL, ConstantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
		
		if not p3 then
			local Player = Players:GetPlayerByUserId(Number)
			
			if Player and Player.VoiceChatVolume == VOICEVOLUME.MIN then
				Player.VoiceChatVolume = VOICEVOLUME.DEFAULT
			end
		end
	end else nil
	
	local function toggleMuteAll()
		-- upvalues: Signal (copy), Computed (copy), Default (upval), ConstantsModule (upval), FFlagVoiceChatVolumePerUserMuteVolumeSync (upval), Players (upval), VOICEVOLUME (upval)
		if not Signal(false) then return end
		local Inverted = not Computed(false)
		Default:MuteAll(Inverted, ConstantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
		
		if FFlagVoiceChatVolumePerUserMuteVolumeSync and not Inverted then
			local LocalPlayer = Players.LocalPlayer
			
			for _, player in Players:GetPlayers() do
				if LocalPlayer and player.UserId ~= LocalPlayer.UserId and player.VoiceChatVolume == VOICEVOLUME.MIN then
					player.VoiceChatVolume = VOICEVOLUME.DEFAULT
				end
			end
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
	
	local function getPlayerMuteState(p4)
		-- upvalues: SignalsModule (upval), VoiceStore (upval), VOICESTATE (upval)
		return SignalsModule.createComputed(function(p5): boolean
			-- upvalues: VoiceStore (upval), p4 (copy), VOICESTATE (upval)
			local LOCALMUTED = VoiceStore.getOrCreateVoiceState(p4)(p5)
			
			return if LOCALMUTED then LOCALMUTED == VOICESTATE.LOCAL_MUTED or LOCALMUTED == VOICESTATE.MUTED else false
		end)
	end
	
	local function togglePlayerMute(UserId)
		-- upvalues: Signal (copy), Signal1 (copy), Default (upval), FFlagVoiceChatVolumePerUserMuteVolumeSync (upval), Callback (ref), VoiceStore (upval), VOICESTATE (upval), ConstantsModule (upval), LuaFlagVoiceChatDisableSubscribeRetryForMultistream (upval), VoiceChatMultistreamSubscriptionsEnabledEngineFeature (upval)
		if not Signal(false) then return end
		if not Signal1(false) then return end
		local Participant = Default.participants[tostring(UserId)]
		
		if Participant and Participant.subscriptionCompleted then
			if FFlagVoiceChatVolumePerUserMuteVolumeSync and Callback then
				Callback(UserId, not (VoiceStore.getOrCreateVoiceState(UserId)(false) == VOICESTATE.LOCAL_MUTED))
				
				return
			else
				Default:ToggleMutePlayer(tonumber(UserId), ConstantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
				
				return
			end
		elseif Participant and Participant.subscriptionFailed then
			if not LuaFlagVoiceChatDisableSubscribeRetryForMultistream then
				Default:SubscribeRetry(UserId)
				
				return
			end
			if not VoiceChatMultistreamSubscriptionsEnabledEngineFeature then
				Default:SubscribeRetry(UserId)
				
				return
			end
		elseif FFlagVoiceChatVolumePerUserMuteVolumeSync and Callback then
			Callback(UserId, not (VoiceStore.getOrCreateVoiceState(UserId)(false) == VOICESTATE.LOCAL_MUTED))
			
			return
		else
			Default:ToggleMutePlayer(tonumber(UserId), ConstantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
		end
	end
	
	local function getPlayerShouldShowMuteButton(UserId)
		-- upvalues: SignalsModule (upval), Signal1 (copy), Players (upval), VoiceStore (upval)
		return SignalsModule.createComputed(function(p4): boolean
			-- upvalues: Signal1 (upval), Players (upval), UserId (copy), VoiceStore (upval)
			return if Signal1(p4) and (not Players.LocalPlayer or UserId ~= Players.LocalPlayer.UserId) then VoiceStore.getOrCreateVoiceState(UserId)(p4) ~= nil else false
		end)
	end
	
	local function getPlayerAnimatedIcon(p4)
		-- upvalues: SignalsModule (upval), VoiceStore (upval), ICONS (upval), VOICESTATE (upval), GetFFlagNewPeoplePageIconsFunction (upval), Signal6 (copy)
		return SignalsModule.createComputed(function(p5)
			-- upvalues: VoiceStore (upval), p4 (copy), ICONS (upval), VOICESTATE (upval), GetFFlagNewPeoplePageIconsFunction (upval), Signal6 (upval)
			local LOCALMUTED = VoiceStore.getOrCreateVoiceState(p4)(p5)
			
			return if LOCALMUTED then if LOCALMUTED == VOICESTATE.LOCAL_MUTED or LOCALMUTED == VOICESTATE.MUTED then if GetFFlagNewPeoplePageIconsFunction() then ICONS.MUTED_SPEAKER else ICONS.SPEAKER_OFF elseif LOCALMUTED == VOICESTATE.TALKING then string.format(ICONS.ANIMATED_SPEAKER_FORMAT, math.floor(0.5 + 5 * Signal6(p5)) * 20) else ICONS.DEFAULT_SPEAKER else ICONS.DEFAULT_SPEAKER
		end)
	end
	
	local function getPlayerIsLocalMuted(UserId)
		-- upvalues: SignalsModule (upval), VoiceStore (upval), VOICESTATE (upval)
		return SignalsModule.createComputed(function(p4): boolean
			-- upvalues: UserId (copy), VoiceStore (upval), VOICESTATE (upval)
			return if UserId then VoiceStore.getOrCreateVoiceState(UserId)(p4) == VOICESTATE.LOCAL_MUTED else false
		end)
	end
	
	local v3 = if GetFFlagAddPeoplePageCardLayoutFunction() then function(p4)
		-- upvalues: SignalsModule (upval), VoiceStore (upval), VOICESTATE (upval)
		return SignalsModule.createComputed(function(p5): boolean
			-- upvalues: VoiceStore (upval), p4 (copy), VOICESTATE (upval)
			return VoiceStore.getOrCreateVoiceState(p4)(p5) == VOICESTATE.TALKING
		end)
	end else nil
	
	local function updateVolumeControlEligibility(p4)
		-- upvalues: Callback1 (ref), Default (upval), VoiceVolumeControlsEligibility (upval), VoiceChatService (upval)
		if game:IsLoaded() then
			local Service = Default:getService()
			Callback1(VoiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible((p4 or Service and Service.VoiceChatState) == Enum.VoiceChatState.Joined, VoiceChatService.UseNewAudioApi))
			
			return
		else
			Callback1(false)
		end
	end
	
	local function getPlayerVoiceVolume(UserId)
		-- upvalues: FFlagVoiceVolumeControlsPerUserPlayerListButton (upval), FFlagVoiceVolumeControlsPerUserPlayerGridMenu (upval), Players (upval), FFlagVoiceChatVolumePerUserMuteVolumeSync (upval), VoiceStore (upval), VOICESTATE (upval), VOICEVOLUME (upval)
		if FFlagVoiceVolumeControlsPerUserPlayerListButton or FFlagVoiceVolumeControlsPerUserPlayerGridMenu then
			local Player = Players:GetPlayerByUserId(UserId)
			
			if Player then
				return if FFlagVoiceChatVolumePerUserMuteVolumeSync and VoiceStore.getOrCreateVoiceState(UserId)(false) == VOICESTATE.LOCAL_MUTED then VOICEVOLUME.MIN else Player.VoiceChatVolume
			end
		end
		return VOICEVOLUME.DEFAULT
	end
	
	local function subscribePlayerVoiceVolume(UserId, Callback1)
		-- upvalues: FFlagVoiceVolumeControlsPerUserPlayerListButton (upval), FFlagVoiceVolumeControlsPerUserPlayerGridMenu (upval), Players (upval), FFlagVoiceChatVolumePerUserMuteVolumeSync (upval), VoiceStore (upval), VOICESTATE (upval), VOICEVOLUME (upval), SignalsModule (upval)
		if not FFlagVoiceVolumeControlsPerUserPlayerListButton and not FFlagVoiceVolumeControlsPerUserPlayerGridMenu then
			return function() end
		end
		local Player = Players:GetPlayerByUserId(UserId)
		
		if not Player then
			return function() end
		end
		local Connection = Player:GetPropertyChangedSignal("VoiceChatVolume"):Connect(function()
			-- upvalues: Callback1 (copy), UserId (copy), FFlagVoiceVolumeControlsPerUserPlayerListButton (upval), FFlagVoiceVolumeControlsPerUserPlayerGridMenu (upval), Players (upval), FFlagVoiceChatVolumePerUserMuteVolumeSync (upval), VoiceStore (upval), VOICESTATE (upval), VOICEVOLUME (upval)
			local DEFAULT = nil
			repeat
				if FFlagVoiceVolumeControlsPerUserPlayerListButton or FFlagVoiceVolumeControlsPerUserPlayerGridMenu then
					local Player = Players:GetPlayerByUserId(UserId)
					
					if Player then
						DEFAULT = if FFlagVoiceChatVolumePerUserMuteVolumeSync and VoiceStore.getOrCreateVoiceState(UserId)(false) == VOICESTATE.LOCAL_MUTED then VOICEVOLUME.MIN else Player.VoiceChatVolume
						break
					end
				end
				DEFAULT = VOICEVOLUME.DEFAULT
			until true
			Callback1(DEFAULT)
		end)
		local Callback = nil
		
		if FFlagVoiceChatVolumePerUserMuteVolumeSync then
			local Computed = SignalsModule.createComputed(function(p4): boolean
				-- upvalues: UserId (copy), VoiceStore (upval), VOICESTATE (upval)
				return if UserId then VoiceStore.getOrCreateVoiceState(UserId)(p4) == VOICESTATE.LOCAL_MUTED else false
			end)
			Callback = SignalsModule.createEffect(function(p4)
				-- upvalues: Computed (copy), Callback1 (copy), UserId (copy), FFlagVoiceVolumeControlsPerUserPlayerListButton (upval), FFlagVoiceVolumeControlsPerUserPlayerGridMenu (upval), Players (upval), FFlagVoiceChatVolumePerUserMuteVolumeSync (upval), VoiceStore (upval), VOICESTATE (upval), VOICEVOLUME (upval)
				Computed(p4)
				local DEFAULT = nil
				repeat
					if FFlagVoiceVolumeControlsPerUserPlayerListButton or FFlagVoiceVolumeControlsPerUserPlayerGridMenu then
						local Player = Players:GetPlayerByUserId(UserId)
						
						if Player then
							DEFAULT = if FFlagVoiceChatVolumePerUserMuteVolumeSync and VoiceStore.getOrCreateVoiceState(UserId)(false) == VOICESTATE.LOCAL_MUTED then VOICEVOLUME.MIN else Player.VoiceChatVolume
							break
						end
					end
					DEFAULT = VOICEVOLUME.DEFAULT
				until true
				Callback1(DEFAULT)
			end)
		end
		return function()
			-- upvalues: Connection (copy), Callback (ref)
			Connection:Disconnect()
			
			if Callback then
				Callback()
			end
		end
	end
	
	local function setPlayerVoiceVolume(UserId, Value: number)
		-- upvalues: FFlagVoiceVolumeControlsPerUserPlayerListButton (upval), FFlagVoiceVolumeControlsPerUserPlayerGridMenu (upval), Players (upval), FFlagVoiceChatVolumePerUserMuteVolumeSync (upval), Callback (ref), VoiceStore (upval), VOICESTATE (upval), VOICEVOLUME (upval)
		if FFlagVoiceVolumeControlsPerUserPlayerListButton or FFlagVoiceVolumeControlsPerUserPlayerGridMenu then
			local Player = Players:GetPlayerByUserId(UserId)
			
			if not Player then return end
			if FFlagVoiceChatVolumePerUserMuteVolumeSync and Callback then
				local IsLOCALMUTEDMatch = VoiceStore.getOrCreateVoiceState(UserId)(false) == VOICESTATE.LOCAL_MUTED
				local ClampedValue = math.clamp(Value, VOICEVOLUME.MIN, VOICEVOLUME.MAX)
				
				if ClampedValue == VOICEVOLUME.MIN then
					Player.VoiceChatVolume = VOICEVOLUME.MIN
					
					if not IsLOCALMUTEDMatch then
						Callback(UserId, true)
						
						return
					end
				else
					Player.VoiceChatVolume = ClampedValue
					
					if IsLOCALMUTEDMatch then
						Callback(UserId, false)
						
						return
					end
				end
			else
				Player.VoiceChatVolume = math.clamp(Value, VOICEVOLUME.MIN, VOICEVOLUME.MAX)
			end
		end
	end
	
	local function getVoiceSessionId()
		-- upvalues: Default (upval)
		local SessionId = nil
		
		return if pcall(function()
			-- upvalues: SessionId (ref), Default (upval)
			SessionId = Default:GetSessionId()
		end) and SessionId ~= nil and SessionId ~= "" then SessionId else nil
	end
	
	local function cleanup()
		-- upvalues: RenderSteppedConnection (ref), FFlagVoiceVolumeControlsPerUserPlayerListButton (upval), FFlagVoiceVolumeControlsPerUserPlayerGridMenu (upval), v2 (ref), Default (upval), T (copy)
		if RenderSteppedConnection then
			RenderSteppedConnection:Disconnect()
			RenderSteppedConnection = nil
		end
		if FFlagVoiceVolumeControlsPerUserPlayerListButton or FFlagVoiceVolumeControlsPerUserPlayerGridMenu then
			if v2 then
				Default:unsubscribe("OnStateChanged", v2)
				v2 = nil
			end
			for _, Connection in T do
				Connection:Disconnect()
			end
			table.clear(T)
		end
	end
	
	;(function()
		-- upvalues: Default (upval), Signal2 (copy), Players (upval), VoiceStore (upval), Signal2_2 (copy), Signal2_3 (copy), Signal2_1 (copy), RenderSteppedConnection (ref), RunService (upval), Signal4 (copy), Count (ref), FRAMEBUFFER (upval), Signal2_4 (copy), Signal2_5 (copy), FFlagVoiceVolumeControlsPerUserPlayerListButton (upval), FFlagVoiceVolumeControlsPerUserPlayerGridMenu (upval), T (copy), v2 (ref), updateVolumeControlEligibility (copy), VoiceChatService (upval), GetFFlagVoiceChatUILoggingModule (upval), NewResult (upval)
		if game:GetEngineFeature("VoiceChatSupported") then
			Default:asyncInit():andThen(function()
				-- upvalues: Signal2 (upval), Default (upval), Players (upval), VoiceStore (upval), Signal2_2 (upval), Signal2_3 (upval), Signal2_1 (upval), RenderSteppedConnection (upval), RunService (upval), Signal4 (upval), Count (upval), FRAMEBUFFER (upval), Signal2_4 (upval), Signal2_5 (upval), FFlagVoiceVolumeControlsPerUserPlayerListButton (upval), FFlagVoiceVolumeControlsPerUserPlayerGridMenu (upval), T (upval), v2 (upval), updateVolumeControlEligibility (upval), VoiceChatService (upval)
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
				Default.muteChanged.Event:Connect(function(p4)
					-- upvalues: Signal2_2 (upval)
					Signal2_2(p4)
				end)
				Default.talkingChanged.Event:Connect(function(p4)
					-- upvalues: Signal2_3 (upval)
					Signal2_3(p4)
				end)
				Signal2_2(Default.localMuted)
				Signal2_3(Default.isTalking)
				Default.participantsUpdate.Event:Connect(function(p4)
					-- upvalues: VoiceStore (upval)
					VoiceStore.handleVoiceParticipantsChanged(p4)
				end)
				Default.participantJoined.Event:Connect(function(_, p4)
					-- upvalues: VoiceStore (upval)
					VoiceStore.handleVoiceParticipantAdded((tostring(p4)))
				end)
				Default.participantLeft.Event:Connect(function(_, p4)
					-- upvalues: VoiceStore (upval)
					VoiceStore.handleVoiceParticipantRemoved((tostring(p4)))
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
				end
				if FFlagVoiceVolumeControlsPerUserPlayerListButton or FFlagVoiceVolumeControlsPerUserPlayerGridMenu then
					v2 = function(_, p4)
						-- upvalues: updateVolumeControlEligibility (upval)
						updateVolumeControlEligibility(p4)
					end
					
					Default:subscribe("OnStateChanged", v2)
					
					local function _(PropertyName)
						-- upvalues: VoiceChatService (upval), updateVolumeControlEligibility (upval), T (copy)
						local Success, Result = pcall(function()
							-- upvalues: VoiceChatService (upval), PropertyName (copy), updateVolumeControlEligibility (upval)
							return VoiceChatService:GetPropertyChangedSignal(PropertyName):Connect(function()
								-- upvalues: updateVolumeControlEligibility (upval)
								updateVolumeControlEligibility()
							end)
						end)
						
						if Success then
							table.insert(T, Result)
						end
					end
					
					local PropertyName = "UseNewAudioApi"
					local Success, Result = pcall(function()
						-- upvalues: VoiceChatService (upval), PropertyName (copy), updateVolumeControlEligibility (upval)
						return VoiceChatService:GetPropertyChangedSignal(PropertyName):Connect(function()
							-- upvalues: updateVolumeControlEligibility (upval)
							updateVolumeControlEligibility()
						end)
					end)
					
					if Success then
						table.insert(T, Result)
					end
					local PropertyName1 = "EnableVoiceVolumeControls"
					local Success1, Result1 = pcall(function()
						-- upvalues: VoiceChatService (upval), PropertyName1 (copy), updateVolumeControlEligibility (upval)
						return VoiceChatService:GetPropertyChangedSignal(PropertyName1):Connect(function()
							-- upvalues: updateVolumeControlEligibility (upval)
							updateVolumeControlEligibility()
						end)
					end)
					
					if Success1 then
						table.insert(T, Result1)
					end
					if game:IsLoaded() then
						updateVolumeControlEligibility()
						
						return
					end
					table.insert(T, game.Loaded:Connect(updateVolumeControlEligibility))
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
	
	if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then
		require(Parent.Analytics.PerUserVoiceVolumeSessionLifecycle).ensureStarted()
	end
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
		getPlayerIsTalking = if GetFFlagAddPeoplePageCardLayoutFunction() then v3 else nil,
		getMuteSelfIcon = getMuteSelfIcon,
		getShowVolumeControl = if FFlagVoiceVolumeControlsPerUserPlayerListButton or FFlagVoiceVolumeControlsPerUserPlayerGridMenu then v1 else nil,
		getPlayerVoiceVolume = if FFlagVoiceVolumeControlsPerUserPlayerListButton or FFlagVoiceVolumeControlsPerUserPlayerGridMenu then getPlayerVoiceVolume else nil,
		subscribePlayerVoiceVolume = if FFlagVoiceVolumeControlsPerUserPlayerListButton or FFlagVoiceVolumeControlsPerUserPlayerGridMenu then subscribePlayerVoiceVolume else nil,
		setPlayerVoiceVolume = if FFlagVoiceVolumeControlsPerUserPlayerListButton or FFlagVoiceVolumeControlsPerUserPlayerGridMenu then setPlayerVoiceVolume else nil,
		getVoiceSessionId = if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry and (FFlagVoiceVolumeControlsPerUserPlayerListButton or FFlagVoiceVolumeControlsPerUserPlayerGridMenu) then getVoiceSessionId else nil,
		cleanup = cleanup
	}
end)())