local playersService = game:GetService("Players")
local coreGuiService = game:GetService("CoreGui")
local runService = game:GetService("RunService")
local voiceChatService = game:GetService("VoiceChatService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local signalsModule = require(parent_1.Signals)
local modules = coreGuiService:WaitForChild("RobloxGui"):WaitForChild("Modules")
local voiceChat = modules:WaitForChild("VoiceChat")
local flags = modules:WaitForChild("Flags")
local default = require(voiceChat:WaitForChild("VoiceChatServiceManager")).default
local constantsModule = require(voiceChat:WaitForChild("Constants"))
local VOICE_STATE = constantsModule.VOICE_STATE
local voiceStore = require(parent_1.ExpChat).Stores.GetVoiceStore(false)
local name = require(parent_1.CoreScriptsInitializer).CoreLogger:new(script.Name)
local getFFlagVoiceChatUILoggingModule = require(flags:WaitForChild("GetFFlagVoiceChatUILogging"))
local getFFlagNewPeoplePageIcons = require(parent.Flags).GetFFlagNewPeoplePageIcons
local getFFlagAddPeoplePageCardLayout = require(parent.Flags).GetFFlagAddPeoplePageCardLayout
local fFlagVoiceVolumeControlsPerUserPlayerListButton = require(parent.Flags).FFlagVoiceVolumeControlsPerUserPlayerListButton
local fFlagVoiceVolumeControlsPerUserPlayerGridMenu = require(parent.Flags).FFlagVoiceVolumeControlsPerUserPlayerGridMenu
local fFlagVoiceChatVolumePerUserMuteVolumeSync = require(parent.Flags).FFlagVoiceChatVolumePerUserMuteVolumeSync
local fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry = require(parent.Flags).FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry
local voiceVolumeControlsEligibility = require(parent_1.VoiceChatCore).VoiceVolumeControlsEligibility
local luaFlagVoiceChatDisableSubscribeRetryForMultistream = game:DefineFastFlag("LuaFlagVoiceChatDisableSubscribeRetryForMultistream", true)
local voiceChatMultistreamSubscriptionsEnabledEngineFeature = game:GetEngineFeature("VoiceChatMultistreamSubscriptionsEnabled")
local constantsModule_1 = require(parent.Constants)
local FRAME_BUFFER = constantsModule_1.VOICE_CHAT.MIC_ANIMATION.FRAME_BUFFER
local ICONS = constantsModule_1.VOICE_CHAT.ICONS
local VOICE_VOLUME = constantsModule_1.VOICE_CHAT.VOICE_VOLUME
local playerMuteStatusIcons = default.PlayerMuteStatusIcons

return (function()
	-- upvalues: signalsModule (ref), fFlagVoiceVolumeControlsPerUserPlayerListButton (ref), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (ref), runService (ref), FRAME_BUFFER (ref), playerMuteStatusIcons (ref), default (ref), voiceStore (ref), playersService (ref), VOICE_STATE (ref), fFlagVoiceChatVolumePerUserMuteVolumeSync (ref), constantsModule (ref), VOICE_VOLUME (ref), luaFlagVoiceChatDisableSubscribeRetryForMultistream (ref), voiceChatMultistreamSubscriptionsEnabledEngineFeature (ref), ICONS (ref), getFFlagNewPeoplePageIcons (ref), getFFlagAddPeoplePageCardLayout (ref), voiceVolumeControlsEligibility (ref), voiceChatService (ref), getFFlagVoiceChatUILoggingModule (ref), name (ref), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref)
	local var15, var16 = signalsModule.createSignal(false)
	local var17, var18 = signalsModule.createSignal(false)
	local var19, var20 = signalsModule.createSignal(nil)
	local var21, var22 = signalsModule.createSignal(false)
	local var23 = nil
	local var24 = nil
	
	if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then
		local var25, var26 = signalsModule.createSignal(false)
		var23 = var25
		var24 = var26
	end
	local var27 = if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then {} else nil
	local var28 = nil
	local var29, var30 = signalsModule.createSignal(0)
	local var31, var32 = signalsModule.createSignal(0)
	local var33 = 0
	local var34 = nil
	
	local function _()
		-- upvalues: var34 (write), runService (copy), var21 (ref), var33 (write), FRAME_BUFFER (copy), var30 (ref), var32 (ref)
		if var34 then
			return
		end
		var34 = runService.RenderStepped:Connect(function()
			-- upvalues: var21 (copy), var33 (copy), FRAME_BUFFER (copy), var30 (copy), var32 (copy)
			if var21(false) then
				var33 += 1
				
				if FRAME_BUFFER < var33 then
					var30(math.random())
					var33 = 0
					
					return
				end
			else
				var33 += 1
				
				if FRAME_BUFFER < var33 then
					var32(math.random())
					var33 = 0
				end
			end
		end)
	end
	
	local _ = function()
		-- upvalues: var34 (write)
		if var34 then
			var34:Disconnect()
			var34 = nil
		end
	end
	
	local function getMuteSelfIcon()
		-- upvalues: signalsModule (copy), var19 (ref), var21 (ref), playerMuteStatusIcons (copy), var29 (ref), default (copy)
		return signalsModule.createComputed(function(p0)
			-- upvalues: var19 (copy), var21 (copy), playerMuteStatusIcons (copy), var29 (copy), default (copy)
			local var54 = var19(p0)
			local _ = nil
			
			return if var54 == nil then playerMuteStatusIcons.Loading elseif var54 then playerMuteStatusIcons.MicOff elseif var21(p0) then default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * var29(p0)) * 20), "MicLight") else playerMuteStatusIcons.MicOn
		end)
	end
	
	local var36 = signalsModule.createComputed(function(p1)
		-- upvalues: var15 (ref), default (copy), voiceStore (copy), playersService (copy), VOICE_STATE (copy)
		if not var15(p1) or not default.voiceUIVisible then
			return false
		end
		local voiceParticipants = voiceStore.getVoiceParticipants(p1)
		
		if not voiceParticipants then
			return false
		end
		local var56 = true
		
		for i, v in pairs(voiceParticipants) do
			local var57 = tonumber(i)
			
			if var57 and playersService.LocalPlayer and (var57 ~= playersService.LocalPlayer.UserId and v ~= VOICE_STATE.LOCAL_MUTED) then
				var56 = false
				
				return var56
			end
		end
		return var56
	end)
	local var37 = if fFlagVoiceChatVolumePerUserMuteVolumeSync then function(p2, p3)
		-- upvalues: default (copy), playersService (copy), constantsModule (copy), VOICE_VOLUME (copy)
		local var58 = tonumber(p2)
		
		if not var58 then return end
		local coreVoiceManager = default.coreVoiceManager
		
		if not p3 and coreVoiceManager and coreVoiceManager.muteAll then
			coreVoiceManager.muteAll = false
			
			if coreVoiceManager.muteAllChanged then
				coreVoiceManager.muteAllChanged:Fire(false)
			end
			local t = {}
			local localPlayer = playersService.LocalPlayer
			
			for i, v in playersService:GetPlayers() do
				if localPlayer and v.UserId ~= localPlayer.UserId and v.UserId ~= var58 then
					table.insert(t, v.UserId)
				end
			end
			if #t > 0 then
				default:ToggleMuteSome(t, true, constantsModule.VOICE_GROUP_TYPE.ALL, constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
			end
		end
		default:ToggleMuteSome({ var58 }, p3, constantsModule.VOICE_GROUP_TYPE.ALL, constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
		
		if not p3 then
			local var60 = playersService:GetPlayerByUserId(var58)
			
			if var60 and var60.VoiceChatVolume == VOICE_VOLUME.MIN then
				var60.VoiceChatVolume = VOICE_VOLUME.DEFAULT
			end
		end
	end else nil
	
	local function toggleMuteAll()
		-- upvalues: var15 (ref), var36 (ref), default (copy), constantsModule (copy), fFlagVoiceChatVolumePerUserMuteVolumeSync (copy), playersService (copy), VOICE_VOLUME (copy)
		if not var15(false) then return end
		local var61 = not var36(false)
		default:MuteAll(var61, constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
		
		if fFlagVoiceChatVolumePerUserMuteVolumeSync and not var61 then
			local localPlayer = playersService.LocalPlayer
			
			for i, v in playersService:GetPlayers() do
				if localPlayer and v.UserId ~= localPlayer.UserId and v.VoiceChatVolume == VOICE_VOLUME.MIN then
					v.VoiceChatVolume = VOICE_VOLUME.DEFAULT
				end
			end
		end
	end
	
	local function toggleMuteSelf()
		-- upvalues: var15 (ref), default (copy)
		if var15(false) then
			default:ToggleMic("InGameMenuPlayers")
			
			return
		end
	end
	
	local function SubscribeRetry(p4)
		-- upvalues: var15 (ref), default (copy)
		if var15(false) then
			default:SubscribeRetry(p4)
			
			return
		end
	end
	
	local function getPlayerMuteState(p5)
		-- upvalues: signalsModule (copy), voiceStore (copy), VOICE_STATE (copy)
		return signalsModule.createComputed(function(p6)
			-- upvalues: voiceStore (copy), p5 (ref), VOICE_STATE (copy)
			local var62 = voiceStore.getOrCreateVoiceState(p5)(p6)
			
			return if var62 then if var62 ~= VOICE_STATE.LOCAL_MUTED then var62 == VOICE_STATE.MUTED else true else false
		end)
	end
	
	local function togglePlayerMute(p7)
		-- upvalues: var15 (ref), var17 (ref), default (copy), fFlagVoiceChatVolumePerUserMuteVolumeSync (copy), var37 (write), voiceStore (copy), VOICE_STATE (copy), constantsModule (copy), luaFlagVoiceChatDisableSubscribeRetryForMultistream (copy), voiceChatMultistreamSubscriptionsEnabledEngineFeature (copy)
		if not var15(false) then return end
		if not var17(false) then return end
		local var63 = default.participants[tostring(p7)]
		
		if var63 and var63.subscriptionCompleted then
			if fFlagVoiceChatVolumePerUserMuteVolumeSync and var37 then
				var37(p7, not (voiceStore.getOrCreateVoiceState(p7)(false) == VOICE_STATE.LOCAL_MUTED))
				
				return
			end
			default:ToggleMutePlayer(tonumber(p7), constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
			
			return
		elseif var63 and var63.subscriptionFailed then
			if luaFlagVoiceChatDisableSubscribeRetryForMultistream then
				if voiceChatMultistreamSubscriptionsEnabledEngineFeature then
					return
				else
					default:SubscribeRetry(p7)
					
					return
				end
			else
				default:SubscribeRetry(p7)
				
				return
			end
		elseif fFlagVoiceChatVolumePerUserMuteVolumeSync and var37 then
			var37(p7, not (voiceStore.getOrCreateVoiceState(p7)(false) == VOICE_STATE.LOCAL_MUTED))
			
			return
		end
		default:ToggleMutePlayer(tonumber(p7), constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
	end
	
	local function getPlayerShouldShowMuteButton(p8)
		-- upvalues: signalsModule (copy), var17 (ref), playersService (copy), voiceStore (copy)
		return signalsModule.createComputed(function(p9)
			-- upvalues: var17 (copy), playersService (copy), p8 (ref), voiceStore (copy)
			return if var17(p9) and (not playersService.LocalPlayer or p8 ~= playersService.LocalPlayer.UserId) then voiceStore.getOrCreateVoiceState(p8)(p9) ~= nil else false
		end)
	end
	
	local function getPlayerAnimatedIcon(p10)
		-- upvalues: signalsModule (copy), voiceStore (copy), ICONS (copy), VOICE_STATE (copy), getFFlagNewPeoplePageIcons (copy), var31 (ref)
		return signalsModule.createComputed(function(p11)
			-- upvalues: voiceStore (copy), p10 (ref), ICONS (copy), VOICE_STATE (copy), getFFlagNewPeoplePageIcons (copy), var31 (copy)
			local var64 = voiceStore.getOrCreateVoiceState(p10)(p11)
			
			return if var64 then if var64 == VOICE_STATE.LOCAL_MUTED or var64 == VOICE_STATE.MUTED then if getFFlagNewPeoplePageIcons() then ICONS.MUTED_SPEAKER else ICONS.SPEAKER_OFF elseif var64 == VOICE_STATE.TALKING then string.format(ICONS.ANIMATED_SPEAKER_FORMAT, math.floor(0.5 + 5 * var31(p11)) * 20) else ICONS.DEFAULT_SPEAKER else ICONS.DEFAULT_SPEAKER
		end)
	end
	
	local function getPlayerIsLocalMuted(p12)
		-- upvalues: signalsModule (copy), voiceStore (copy), VOICE_STATE (copy)
		return signalsModule.createComputed(function(p13)
			-- upvalues: p12 (ref), voiceStore (copy), VOICE_STATE (copy)
			return if p12 then voiceStore.getOrCreateVoiceState(p12)(p13) == VOICE_STATE.LOCAL_MUTED else false
		end)
	end
	
	local var46 = if getFFlagAddPeoplePageCardLayout() then function(p14)
		-- upvalues: signalsModule (copy), voiceStore (copy), VOICE_STATE (copy)
		return signalsModule.createComputed(function(p15)
			-- upvalues: voiceStore (copy), p14 (ref), VOICE_STATE (copy)
			return voiceStore.getOrCreateVoiceState(p14)(p15) == VOICE_STATE.TALKING
		end)
	end else nil
	
	local function updateVolumeControlEligibility(p16)
		-- upvalues: var24 (write), default (copy), voiceVolumeControlsEligibility (copy), voiceChatService (copy)
		if game:IsLoaded() then
			local service = default:getService()
			var24(voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible((p16 or service and service.VoiceChatState) == Enum.VoiceChatState.Joined, voiceChatService.UseNewAudioApi))
			
			return
		end
		var24(false)
	end
	
	local function initializeVoiceChat()
		-- upvalues: default (copy), var16 (ref), playersService (copy), voiceStore (copy), var20 (ref), var22 (ref), var18 (ref), var34 (write), runService (copy), var21 (ref), var33 (write), FRAME_BUFFER (copy), var30 (ref), var32 (ref), fFlagVoiceVolumeControlsPerUserPlayerListButton (copy), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (copy), var27 (ref), var28 (write), updateVolumeControlEligibility (ref), voiceChatService (copy), getFFlagVoiceChatUILoggingModule (copy), name (copy)
		if game:GetEngineFeature("VoiceChatSupported") then
			default:asyncInit():andThen(function()
				-- upvalues: var16 (copy), default (copy), playersService (copy), voiceStore (copy), var20 (copy), var22 (copy), var18 (copy), var34 (copy), runService (copy), var21 (copy), var33 (copy), FRAME_BUFFER (copy), var30 (copy), var32 (copy), fFlagVoiceVolumeControlsPerUserPlayerListButton (copy), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (copy), var27 (copy), var28 (copy), updateVolumeControlEligibility (copy), voiceChatService (copy)
				var16(true)
				default:SetupParticipantListeners()
				
				for i, v in pairs(default.participants) do
					local localPlayer = playersService.LocalPlayer
					
					if localPlayer and i ~= tostring(localPlayer.UserId) then
						voiceStore.handleVoiceParticipantAdded(i)
					end
				end
				if default.participants and next(default.participants) then
					voiceStore.handleVoiceParticipantsChanged(default.participants)
				end
				default.muteChanged.Event:Connect(function(p17)
					-- upvalues: var20 (copy)
					var20(p17)
				end)
				default.talkingChanged.Event:Connect(function(p18)
					-- upvalues: var22 (copy)
					var22(p18)
				end)
				var20(default.localMuted)
				var22(default.isTalking)
				default.participantsUpdate.Event:Connect(function(p19)
					-- upvalues: voiceStore (copy)
					voiceStore.handleVoiceParticipantsChanged(p19)
				end)
				default.participantJoined.Event:Connect(function(_, p20)
					-- upvalues: voiceStore (copy)
					voiceStore.handleVoiceParticipantAdded(tostring(p20))
				end)
				default.participantLeft.Event:Connect(function(_, p21)
					-- upvalues: voiceStore (copy)
					voiceStore.handleVoiceParticipantRemoved(tostring(p21))
				end)
				default.showVoiceUI.Event:Connect(function()
					-- upvalues: var18 (copy), var34 (copy), runService (copy), var21 (copy), var33 (copy), FRAME_BUFFER (copy), var30 (copy), var32 (copy)
					var18(true)
					
					if var34 then
						return
					end
					var34 = runService.RenderStepped:Connect(function()
						-- upvalues: var21 (copy), var33 (copy), FRAME_BUFFER (copy), var30 (copy), var32 (copy)
						if var21(false) then
							var33 += 1
							
							if FRAME_BUFFER < var33 then
								var30(math.random())
								var33 = 0
								
								return
							end
						else
							var33 += 1
							
							if FRAME_BUFFER < var33 then
								var32(math.random())
								var33 = 0
							end
						end
					end)
				end)
				default.hideVoiceUI.Event:Connect(function()
					-- upvalues: var18 (copy), var34 (copy)
					var18(false)
					
					if var34 then
						var34:Disconnect()
						var34 = nil
					end
				end)
				
				if default.voiceUIVisible then
					var18(true)
				end
				if not var34 then
					var34 = runService.RenderStepped:Connect(function()
						-- upvalues: var21 (copy), var33 (copy), FRAME_BUFFER (copy), var30 (copy), var32 (copy)
						if var21(false) then
							var33 += 1
							
							if FRAME_BUFFER < var33 then
								var30(math.random())
								var33 = 0
								
								return
							end
						else
							var33 += 1
							
							if FRAME_BUFFER < var33 then
								var32(math.random())
								var33 = 0
							end
						end
					end)
				end
				if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then
					local var66 = var27
					
					var28 = function(_, p22)
						-- upvalues: updateVolumeControlEligibility (copy)
						updateVolumeControlEligibility(p22)
					end
					
					default:subscribe("OnStateChanged", var28)
					
					local function _(p23)
						-- upvalues: voiceChatService (copy), updateVolumeControlEligibility (copy), var66 (ref)
						local ok, status = pcall(function()
							-- upvalues: voiceChatService (copy), p23 (ref), updateVolumeControlEligibility (copy)
							return voiceChatService:GetPropertyChangedSignal(p23):Connect(function()
								-- upvalues: updateVolumeControlEligibility (copy)
								updateVolumeControlEligibility()
							end)
						end)
						
						if ok then
							table.insert(var66, status)
						end
					end
					
					local var67 = "UseNewAudioApi"
					local ok, status = pcall(function()
						-- upvalues: voiceChatService (copy), var67 (ref), updateVolumeControlEligibility (copy)
						return voiceChatService:GetPropertyChangedSignal(var67):Connect(function()
							-- upvalues: updateVolumeControlEligibility (copy)
							updateVolumeControlEligibility()
						end)
					end)
					
					if ok then
						table.insert(var66, status)
					end
					local var68 = "EnableVoiceVolumeControls"
					local ok_1, status_1 = pcall(function()
						-- upvalues: voiceChatService (copy), var68 (ref), updateVolumeControlEligibility (copy)
						return voiceChatService:GetPropertyChangedSignal(var68):Connect(function()
							-- upvalues: updateVolumeControlEligibility (copy)
							updateVolumeControlEligibility()
						end)
					end)
					
					if ok_1 then
						table.insert(var66, status_1)
					end
					if game:IsLoaded() then
						updateVolumeControlEligibility()
						
						return
					end
					table.insert(var66, game.Loaded:Connect(updateVolumeControlEligibility))
				end
			end):catch(function(_)
				-- upvalues: getFFlagVoiceChatUILoggingModule (copy), name (copy), var34 (copy)
				if getFFlagVoiceChatUILoggingModule() then
					name:warning("Failed to init VoiceChatServiceManager")
				end
				if var34 then
					var34:Disconnect()
					var34 = nil
				end
			end)
			
			return
		end
	end
	
	local function getPlayerVoiceVolume(p24)
		-- upvalues: fFlagVoiceVolumeControlsPerUserPlayerListButton (copy), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (copy), playersService (copy), fFlagVoiceChatVolumePerUserMuteVolumeSync (copy), voiceStore (copy), VOICE_STATE (copy), VOICE_VOLUME (copy)
		if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then
			local var69 = playersService:GetPlayerByUserId(p24)
			
			return if var69 then if fFlagVoiceChatVolumePerUserMuteVolumeSync and voiceStore.getOrCreateVoiceState(p24)(false) == VOICE_STATE.LOCAL_MUTED then VOICE_VOLUME.MIN else var69.VoiceChatVolume else VOICE_VOLUME.DEFAULT
		end
	end
	
	local function subscribePlayerVoiceVolume(p25, p26)
		-- upvalues: fFlagVoiceVolumeControlsPerUserPlayerListButton (copy), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (copy), playersService (copy), fFlagVoiceChatVolumePerUserMuteVolumeSync (copy), voiceStore (copy), VOICE_STATE (copy), VOICE_VOLUME (copy), signalsModule (copy)
		if not fFlagVoiceVolumeControlsPerUserPlayerListButton and not fFlagVoiceVolumeControlsPerUserPlayerGridMenu then
			return function() end
		end
		local var70 = playersService:GetPlayerByUserId(p25)
		
		if not var70 then
			return function() end
		end
		local var71 = var70:GetPropertyChangedSignal("VoiceChatVolume"):Connect(function()
			-- upvalues: p26 (ref), p25 (ref), fFlagVoiceVolumeControlsPerUserPlayerListButton (copy), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (copy), playersService (copy), fFlagVoiceChatVolumePerUserMuteVolumeSync (copy), voiceStore (copy), VOICE_STATE (copy), VOICE_VOLUME (copy)
			local var75
			if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then
				local var74 = playersService:GetPlayerByUserId(p25)
				var75 = if not var74 then if fFlagVoiceChatVolumePerUserMuteVolumeSync and voiceStore.getOrCreateVoiceState(p25)(false) == VOICE_STATE.LOCAL_MUTED then VOICE_VOLUME.MIN else var74.VoiceChatVolume else VOICE_VOLUME.DEFAULT
			end
			p26(var75)
		end)
		local var72 = nil
		
		if fFlagVoiceChatVolumePerUserMuteVolumeSync then
			local var73 = signalsModule.createComputed(function(p27)
				-- upvalues: p25 (ref), voiceStore (copy), VOICE_STATE (copy)
				return if p25 then voiceStore.getOrCreateVoiceState(p25)(p27) == VOICE_STATE.LOCAL_MUTED else false
			end)
			var72 = signalsModule.createEffect(function(p28)
				-- upvalues: var73 (ref), p26 (ref), p25 (ref), fFlagVoiceVolumeControlsPerUserPlayerListButton (copy), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (copy), playersService (copy), fFlagVoiceChatVolumePerUserMuteVolumeSync (copy), voiceStore (copy), VOICE_STATE (copy), VOICE_VOLUME (copy)
				local var77
				var73(p28)
				
				if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then
					local var76 = playersService:GetPlayerByUserId(p25)
					var77 = if not var76 then if fFlagVoiceChatVolumePerUserMuteVolumeSync and voiceStore.getOrCreateVoiceState(p25)(false) == VOICE_STATE.LOCAL_MUTED then VOICE_VOLUME.MIN else var76.VoiceChatVolume else VOICE_VOLUME.DEFAULT
				end
				p26(var77)
			end)
		end
		return function()
			-- upvalues: var71 (ref), var72 (write)
			var71:Disconnect()
			
			if var72 then
				var72()
			end
		end
	end
	
	local function setPlayerVoiceVolume(value, p29)
		-- upvalues: fFlagVoiceVolumeControlsPerUserPlayerListButton (copy), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (copy), playersService (copy), fFlagVoiceChatVolumePerUserMuteVolumeSync (copy), var37 (write), voiceStore (copy), VOICE_STATE (copy), VOICE_VOLUME (copy)
		if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then
			local var78 = playersService:GetPlayerByUserId(value)
			
			if not var78 then return end
			if fFlagVoiceChatVolumePerUserMuteVolumeSync and var37 then
				local var79 = voiceStore.getOrCreateVoiceState(value)(false) == VOICE_STATE.LOCAL_MUTED
				local clampedValue = math.clamp(p29, VOICE_VOLUME.MIN, VOICE_VOLUME.MAX)
				
				if clampedValue == VOICE_VOLUME.MIN then
					var78.VoiceChatVolume = VOICE_VOLUME.MIN
					
					if var79 then
						return
					else
						var37(value, true)
						
						return
					end
				else
					var78.VoiceChatVolume = clampedValue
					
					if var79 then
						var37(value, false)
						
						return
					end
				end
			else
				var78.VoiceChatVolume = math.clamp(p29, VOICE_VOLUME.MIN, VOICE_VOLUME.MAX)
			end
		end
	end
	
	local function getVoiceSessionId()
		-- upvalues: default (copy)
		local var81 = nil
		
		return if pcall(function()
			-- upvalues: var81 (write), default (copy)
			var81 = default:GetSessionId()
		end) and var81 ~= nil and var81 ~= "" then var81 else nil
	end
	
	local function cleanup()
		-- upvalues: var34 (write), fFlagVoiceVolumeControlsPerUserPlayerListButton (copy), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (copy), var28 (write), default (copy), var27 (ref)
		if var34 then
			var34:Disconnect()
			var34 = nil
		end
		if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then
			if var28 then
				default:unsubscribe("OnStateChanged", var28)
				var28 = nil
			end
			local var82 = var27
			
			for i, v in var82 do
				v:Disconnect()
			end
			table.clear(var82)
		end
	end
	
	initializeVoiceChat()
	
	return {
		voiceChatServiceConnected = var15,
		voiceUIVisible = var17,
		allPlayersMuted = var36,
		voiceParticipants = voiceStore.getVoiceParticipants,
		localMuted = var19,
		localTalking = var21,
		toggleMuteAll = toggleMuteAll,
		toggleMuteSelf = toggleMuteSelf,
		SubscribeRetry = SubscribeRetry,
		getPlayerMuteState = getPlayerMuteState,
		togglePlayerMute = togglePlayerMute,
		getPlayerShouldShowMuteButton = getPlayerShouldShowMuteButton,
		getPlayerAnimatedIcon = getPlayerAnimatedIcon,
		getPlayerIsLocalMuted = getPlayerIsLocalMuted,
		getPlayerIsTalking = if getFFlagAddPeoplePageCardLayout() then var46 else nil,
		getMuteSelfIcon = getMuteSelfIcon,
		getShowVolumeControl = if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then var23 else nil,
		getPlayerVoiceVolume = if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then getPlayerVoiceVolume else nil,
		subscribePlayerVoiceVolume = if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then subscribePlayerVoiceVolume else nil,
		setPlayerVoiceVolume = if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then setPlayerVoiceVolume else nil,
		getVoiceSessionId = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry and (fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu) then getVoiceSessionId else nil,
		cleanup = cleanup
	}
end)()