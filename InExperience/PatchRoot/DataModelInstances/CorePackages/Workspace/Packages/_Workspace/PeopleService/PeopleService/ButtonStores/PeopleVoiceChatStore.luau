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
	local var1, var2 = signalsModule.createSignal(false)
	local var3, var4 = signalsModule.createSignal(false)
	local var5, var6 = signalsModule.createSignal(nil)
	local var7, var8 = signalsModule.createSignal(false)
	local var9 = nil
	local var10 = nil
	
	if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then
		local var11, var12 = signalsModule.createSignal(false)
		var9 = var11
		var10 = var12
	end
	local var13 = if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then {} else nil
	local var14 = nil
	local var15, var16 = signalsModule.createSignal(0)
	local var17, var18 = signalsModule.createSignal(0)
	local var19 = 0
	local var20 = nil
	
	local function _()
		-- upvalues: var20 (write), runService (copy), var7 (ref), var19 (write), FRAME_BUFFER (copy), var16 (ref), var18 (ref)
		if var20 then
			return
		end
		var20 = runService.RenderStepped:Connect(function()
			-- upvalues: var7 (copy), var19 (copy), FRAME_BUFFER (copy), var16 (copy), var18 (copy)
			if var7(false) then
				var19 += 1
				
				if FRAME_BUFFER < var19 then
					var16(math.random())
					var19 = 0
					
					return
				end
			else
				var19 += 1
				
				if FRAME_BUFFER < var19 then
					var18(math.random())
					var19 = 0
				end
			end
		end)
	end
	
	local _ = function()
		-- upvalues: var20 (write)
		if var20 then
			var20:Disconnect()
			var20 = nil
		end
	end
	
	local function getMuteSelfIcon()
		-- upvalues: signalsModule (copy), var5 (ref), var7 (ref), playerMuteStatusIcons (copy), var15 (ref), default (copy)
		return signalsModule.createComputed(function(p1)
			-- upvalues: var5 (copy), var7 (copy), playerMuteStatusIcons (copy), var15 (copy), default (copy)
			local var21 = var5(p1)
			local _ = nil
			
			return if var21 == nil then playerMuteStatusIcons.Loading elseif var21 then playerMuteStatusIcons.MicOff elseif var7(p1) then default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * var15(p1)) * 20), "MicLight") else playerMuteStatusIcons.MicOn
		end)
	end
	
	local var21 = signalsModule.createComputed(function(p1)
		-- upvalues: var1 (ref), default (copy), voiceStore (copy), playersService (copy), VOICE_STATE (copy)
		if not var1(p1) or not default.voiceUIVisible then
			return false
		end
		local voiceParticipants = voiceStore.getVoiceParticipants(p1)
		
		if not voiceParticipants then
			return false
		end
		local var22 = true
		
		for i, v in pairs(voiceParticipants) do
			local var23 = tonumber(i)
			
			if var23 and playersService.LocalPlayer and (var23 ~= playersService.LocalPlayer.UserId and v ~= VOICE_STATE.LOCAL_MUTED) then
				var22 = false
				
				return var22
			end
		end
		return var22
	end)
	local var24 = if fFlagVoiceChatVolumePerUserMuteVolumeSync then function(p2, p3)
		-- upvalues: default (copy), playersService (copy), constantsModule (copy), VOICE_VOLUME (copy)
		local var25 = tonumber(p2)
		
		if not var25 then return end
		local coreVoiceManager = default.coreVoiceManager
		
		if not p3 and coreVoiceManager and coreVoiceManager.muteAll then
			coreVoiceManager.muteAll = false
			
			if coreVoiceManager.muteAllChanged then
				coreVoiceManager.muteAllChanged:Fire(false)
			end
			local t = {}
			local localPlayer = playersService.LocalPlayer
			
			for i, v in playersService:GetPlayers() do
				if localPlayer and v.UserId ~= localPlayer.UserId and v.UserId ~= var25 then
					table.insert(t, v.UserId)
				end
			end
			if #t > 0 then
				default:ToggleMuteSome(t, true, constantsModule.VOICE_GROUP_TYPE.ALL, constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
			end
		end
		default:ToggleMuteSome({ var25 }, p3, constantsModule.VOICE_GROUP_TYPE.ALL, constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
		
		if not p3 then
			local var26 = playersService:GetPlayerByUserId(var25)
			
			if var26 and var26.VoiceChatVolume == VOICE_VOLUME.MIN then
				var26.VoiceChatVolume = VOICE_VOLUME.DEFAULT
			end
		end
	end else nil
	
	local function toggleMuteAll()
		-- upvalues: var1 (ref), var21 (ref), default (copy), constantsModule (copy), fFlagVoiceChatVolumePerUserMuteVolumeSync (copy), playersService (copy), VOICE_VOLUME (copy)
		if not var1(false) then return end
		local var27 = not var21(false)
		default:MuteAll(var27, constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
		
		if fFlagVoiceChatVolumePerUserMuteVolumeSync and not var27 then
			local localPlayer = playersService.LocalPlayer
			
			for i, v in playersService:GetPlayers() do
				if localPlayer and v.UserId ~= localPlayer.UserId and v.VoiceChatVolume == VOICE_VOLUME.MIN then
					v.VoiceChatVolume = VOICE_VOLUME.DEFAULT
				end
			end
		end
	end
	
	local function toggleMuteSelf()
		-- upvalues: var1 (ref), default (copy)
		if var1(false) then
			default:ToggleMic("InGameMenuPlayers")
			
			return
		end
	end
	
	local function SubscribeRetry(p4)
		-- upvalues: var1 (ref), default (copy)
		if var1(false) then
			default:SubscribeRetry(p4)
			
			return
		end
	end
	
	local function getPlayerMuteState(p4)
		-- upvalues: signalsModule (copy), voiceStore (copy), VOICE_STATE (copy)
		return signalsModule.createComputed(function(p5)
			-- upvalues: voiceStore (copy), p4 (ref), VOICE_STATE (copy)
			local var28 = voiceStore.getOrCreateVoiceState(p4)(p5)
			
			return if var28 then if var28 ~= VOICE_STATE.LOCAL_MUTED then var28 == VOICE_STATE.MUTED else true else false
		end)
	end
	
	local function togglePlayerMute(p4)
		-- upvalues: var1 (ref), var3 (ref), default (copy), fFlagVoiceChatVolumePerUserMuteVolumeSync (copy), var24 (write), voiceStore (copy), VOICE_STATE (copy), constantsModule (copy), luaFlagVoiceChatDisableSubscribeRetryForMultistream (copy), voiceChatMultistreamSubscriptionsEnabledEngineFeature (copy)
		if not var1(false) then return end
		if not var3(false) then return end
		local var28 = default.participants[tostring(p4)]
		
		if var28 and var28.subscriptionCompleted then
			if fFlagVoiceChatVolumePerUserMuteVolumeSync and var24 then
				var24(p4, not (voiceStore.getOrCreateVoiceState(p4)(false) == VOICE_STATE.LOCAL_MUTED))
				
				return
			end
			default:ToggleMutePlayer(tonumber(p4), constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
			
			return
		elseif var28 and var28.subscriptionFailed then
			if luaFlagVoiceChatDisableSubscribeRetryForMultistream then
				if voiceChatMultistreamSubscriptionsEnabledEngineFeature then
					return
				else
					default:SubscribeRetry(p4)
					
					return
				end
			else
				default:SubscribeRetry(p4)
				
				return
			end
		elseif fFlagVoiceChatVolumePerUserMuteVolumeSync and var24 then
			var24(p4, not (voiceStore.getOrCreateVoiceState(p4)(false) == VOICE_STATE.LOCAL_MUTED))
			
			return
		end
		default:ToggleMutePlayer(tonumber(p4), constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
	end
	
	local function getPlayerShouldShowMuteButton(p4)
		-- upvalues: signalsModule (copy), var3 (ref), playersService (copy), voiceStore (copy)
		return signalsModule.createComputed(function(p5)
			-- upvalues: var3 (copy), playersService (copy), p4 (ref), voiceStore (copy)
			return if var3(p5) and (not playersService.LocalPlayer or p4 ~= playersService.LocalPlayer.UserId) then voiceStore.getOrCreateVoiceState(p4)(p5) ~= nil else false
		end)
	end
	
	local function getPlayerAnimatedIcon(p4)
		-- upvalues: signalsModule (copy), voiceStore (copy), ICONS (copy), VOICE_STATE (copy), getFFlagNewPeoplePageIcons (copy), var17 (ref)
		return signalsModule.createComputed(function(p5)
			-- upvalues: voiceStore (copy), p4 (ref), ICONS (copy), VOICE_STATE (copy), getFFlagNewPeoplePageIcons (copy), var17 (copy)
			local var28 = voiceStore.getOrCreateVoiceState(p4)(p5)
			
			return if var28 then if var28 == VOICE_STATE.LOCAL_MUTED or var28 == VOICE_STATE.MUTED then if getFFlagNewPeoplePageIcons() then ICONS.MUTED_SPEAKER else ICONS.SPEAKER_OFF elseif var28 == VOICE_STATE.TALKING then string.format(ICONS.ANIMATED_SPEAKER_FORMAT, math.floor(0.5 + 5 * var17(p5)) * 20) else ICONS.DEFAULT_SPEAKER else ICONS.DEFAULT_SPEAKER
		end)
	end
	
	local function getPlayerIsLocalMuted(p4)
		-- upvalues: signalsModule (copy), voiceStore (copy), VOICE_STATE (copy)
		return signalsModule.createComputed(function(p5)
			-- upvalues: p4 (ref), voiceStore (copy), VOICE_STATE (copy)
			return if p4 then voiceStore.getOrCreateVoiceState(p4)(p5) == VOICE_STATE.LOCAL_MUTED else false
		end)
	end
	
	local var28 = if getFFlagAddPeoplePageCardLayout() then function(p4)
		-- upvalues: signalsModule (copy), voiceStore (copy), VOICE_STATE (copy)
		return signalsModule.createComputed(function(p5)
			-- upvalues: voiceStore (copy), p4 (ref), VOICE_STATE (copy)
			return voiceStore.getOrCreateVoiceState(p4)(p5) == VOICE_STATE.TALKING
		end)
	end else nil
	
	local function updateVolumeControlEligibility(p4)
		-- upvalues: var10 (write), default (copy), voiceVolumeControlsEligibility (copy), voiceChatService (copy)
		if game:IsLoaded() then
			local service = default:getService()
			var10(voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible((p4 or service and service.VoiceChatState) == Enum.VoiceChatState.Joined, voiceChatService.UseNewAudioApi))
			
			return
		end
		var10(false)
	end
	
	local function initializeVoiceChat()
		-- upvalues: default (copy), var2 (ref), playersService (copy), voiceStore (copy), var6 (ref), var8 (ref), var4 (ref), var20 (write), runService (copy), var7 (ref), var19 (write), FRAME_BUFFER (copy), var16 (ref), var18 (ref), fFlagVoiceVolumeControlsPerUserPlayerListButton (copy), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (copy), var13 (ref), var14 (write), updateVolumeControlEligibility (ref), voiceChatService (copy), getFFlagVoiceChatUILoggingModule (copy), name (copy)
		if game:GetEngineFeature("VoiceChatSupported") then
			default:asyncInit():andThen(function()
				-- upvalues: var2 (copy), default (copy), playersService (copy), voiceStore (copy), var6 (copy), var8 (copy), var4 (copy), var20 (copy), runService (copy), var7 (copy), var19 (copy), FRAME_BUFFER (copy), var16 (copy), var18 (copy), fFlagVoiceVolumeControlsPerUserPlayerListButton (copy), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (copy), var13 (copy), var14 (copy), updateVolumeControlEligibility (copy), voiceChatService (copy)
				var2(true)
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
				default.muteChanged.Event:Connect(function(p4)
					-- upvalues: var6 (copy)
					var6(p4)
				end)
				default.talkingChanged.Event:Connect(function(p4)
					-- upvalues: var8 (copy)
					var8(p4)
				end)
				var6(default.localMuted)
				var8(default.isTalking)
				default.participantsUpdate.Event:Connect(function(p4)
					-- upvalues: voiceStore (copy)
					voiceStore.handleVoiceParticipantsChanged(p4)
				end)
				default.participantJoined.Event:Connect(function(_, p4)
					-- upvalues: voiceStore (copy)
					voiceStore.handleVoiceParticipantAdded(tostring(p4))
				end)
				default.participantLeft.Event:Connect(function(_, p4)
					-- upvalues: voiceStore (copy)
					voiceStore.handleVoiceParticipantRemoved(tostring(p4))
				end)
				default.showVoiceUI.Event:Connect(function()
					-- upvalues: var4 (copy), var20 (copy), runService (copy), var7 (copy), var19 (copy), FRAME_BUFFER (copy), var16 (copy), var18 (copy)
					var4(true)
					
					if var20 then
						return
					end
					var20 = runService.RenderStepped:Connect(function()
						-- upvalues: var7 (copy), var19 (copy), FRAME_BUFFER (copy), var16 (copy), var18 (copy)
						if var7(false) then
							var19 += 1
							
							if FRAME_BUFFER < var19 then
								var16(math.random())
								var19 = 0
								
								return
							end
						else
							var19 += 1
							
							if FRAME_BUFFER < var19 then
								var18(math.random())
								var19 = 0
							end
						end
					end)
				end)
				default.hideVoiceUI.Event:Connect(function()
					-- upvalues: var4 (copy), var20 (copy)
					var4(false)
					
					if var20 then
						var20:Disconnect()
						var20 = nil
					end
				end)
				
				if default.voiceUIVisible then
					var4(true)
				end
				if not var20 then
					var20 = runService.RenderStepped:Connect(function()
						-- upvalues: var7 (copy), var19 (copy), FRAME_BUFFER (copy), var16 (copy), var18 (copy)
						if var7(false) then
							var19 += 1
							
							if FRAME_BUFFER < var19 then
								var16(math.random())
								var19 = 0
								
								return
							end
						else
							var19 += 1
							
							if FRAME_BUFFER < var19 then
								var18(math.random())
								var19 = 0
							end
						end
					end)
				end
				if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then
					local var29 = var13
					
					var14 = function(_, p4)
						-- upvalues: updateVolumeControlEligibility (copy)
						updateVolumeControlEligibility(p4)
					end
					
					default:subscribe("OnStateChanged", var14)
					
					local function _(p4)
						-- upvalues: voiceChatService (copy), updateVolumeControlEligibility (copy), var29 (ref)
						local ok, status = pcall(function()
							-- upvalues: voiceChatService (copy), p4 (ref), updateVolumeControlEligibility (copy)
							return voiceChatService:GetPropertyChangedSignal(p4):Connect(function()
								-- upvalues: updateVolumeControlEligibility (copy)
								updateVolumeControlEligibility()
							end)
						end)
						
						if ok then
							table.insert(var29, status)
						end
					end
					
					local var30 = "UseNewAudioApi"
					local ok, status = pcall(function()
						-- upvalues: voiceChatService (copy), var30 (ref), updateVolumeControlEligibility (copy)
						return voiceChatService:GetPropertyChangedSignal(var30):Connect(function()
							-- upvalues: updateVolumeControlEligibility (copy)
							updateVolumeControlEligibility()
						end)
					end)
					
					if ok then
						table.insert(var29, status)
					end
					local var31 = "EnableVoiceVolumeControls"
					local ok_1, status_1 = pcall(function()
						-- upvalues: voiceChatService (copy), var31 (ref), updateVolumeControlEligibility (copy)
						return voiceChatService:GetPropertyChangedSignal(var31):Connect(function()
							-- upvalues: updateVolumeControlEligibility (copy)
							updateVolumeControlEligibility()
						end)
					end)
					
					if ok_1 then
						table.insert(var29, status_1)
					end
					if game:IsLoaded() then
						updateVolumeControlEligibility()
						
						return
					end
					table.insert(var29, game.Loaded:Connect(updateVolumeControlEligibility))
				end
			end):catch(function(_)
				-- upvalues: getFFlagVoiceChatUILoggingModule (copy), name (copy), var20 (copy)
				if getFFlagVoiceChatUILoggingModule() then
					name:warning("Failed to init VoiceChatServiceManager")
				end
				if var20 then
					var20:Disconnect()
					var20 = nil
				end
			end)
			
			return
		end
	end
	
	local function getPlayerVoiceVolume(p4)
		-- upvalues: fFlagVoiceVolumeControlsPerUserPlayerListButton (copy), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (copy), playersService (copy), fFlagVoiceChatVolumePerUserMuteVolumeSync (copy), voiceStore (copy), VOICE_STATE (copy), VOICE_VOLUME (copy)
		if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then
			local var29 = playersService:GetPlayerByUserId(p4)
			
			return if var29 then if fFlagVoiceChatVolumePerUserMuteVolumeSync and voiceStore.getOrCreateVoiceState(p4)(false) == VOICE_STATE.LOCAL_MUTED then VOICE_VOLUME.MIN else var29.VoiceChatVolume else VOICE_VOLUME.DEFAULT
		end
	end
	
	local function subscribePlayerVoiceVolume(p4, p5)
		-- upvalues: fFlagVoiceVolumeControlsPerUserPlayerListButton (copy), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (copy), playersService (copy), fFlagVoiceChatVolumePerUserMuteVolumeSync (copy), voiceStore (copy), VOICE_STATE (copy), VOICE_VOLUME (copy), signalsModule (copy)
		if not fFlagVoiceVolumeControlsPerUserPlayerListButton and not fFlagVoiceVolumeControlsPerUserPlayerGridMenu then
			return function() end
		end
		local var29 = playersService:GetPlayerByUserId(p4)
		
		if not var29 then
			return function() end
		end
		local var30 = var29:GetPropertyChangedSignal("VoiceChatVolume"):Connect(function()
			-- upvalues: p5 (ref), p4 (ref), fFlagVoiceVolumeControlsPerUserPlayerListButton (copy), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (copy), playersService (copy), fFlagVoiceChatVolumePerUserMuteVolumeSync (copy), voiceStore (copy), VOICE_STATE (copy), VOICE_VOLUME (copy)
			local var31
			if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then
				local var32 = playersService:GetPlayerByUserId(p4)
				var31 = if not var32 then if fFlagVoiceChatVolumePerUserMuteVolumeSync and voiceStore.getOrCreateVoiceState(p4)(false) == VOICE_STATE.LOCAL_MUTED then VOICE_VOLUME.MIN else var32.VoiceChatVolume else VOICE_VOLUME.DEFAULT
			end
			p5(var31)
		end)
		local var31 = nil
		
		if fFlagVoiceChatVolumePerUserMuteVolumeSync then
			local var32 = signalsModule.createComputed(function(p6)
				-- upvalues: p4 (ref), voiceStore (copy), VOICE_STATE (copy)
				return if p4 then voiceStore.getOrCreateVoiceState(p4)(p6) == VOICE_STATE.LOCAL_MUTED else false
			end)
			var31 = signalsModule.createEffect(function(p6)
				-- upvalues: var32 (ref), p5 (ref), p4 (ref), fFlagVoiceVolumeControlsPerUserPlayerListButton (copy), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (copy), playersService (copy), fFlagVoiceChatVolumePerUserMuteVolumeSync (copy), voiceStore (copy), VOICE_STATE (copy), VOICE_VOLUME (copy)
				local var33
				var32(p6)
				
				if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then
					local var34 = playersService:GetPlayerByUserId(p4)
					var33 = if not var34 then if fFlagVoiceChatVolumePerUserMuteVolumeSync and voiceStore.getOrCreateVoiceState(p4)(false) == VOICE_STATE.LOCAL_MUTED then VOICE_VOLUME.MIN else var34.VoiceChatVolume else VOICE_VOLUME.DEFAULT
				end
				p5(var33)
			end)
		end
		return function()
			-- upvalues: var30 (ref), var31 (write)
			var30:Disconnect()
			
			if var31 then
				var31()
			end
		end
	end
	
	local function setPlayerVoiceVolume(value, p4)
		-- upvalues: fFlagVoiceVolumeControlsPerUserPlayerListButton (copy), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (copy), playersService (copy), fFlagVoiceChatVolumePerUserMuteVolumeSync (copy), var24 (write), voiceStore (copy), VOICE_STATE (copy), VOICE_VOLUME (copy)
		if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then
			local var29 = playersService:GetPlayerByUserId(value)
			
			if not var29 then return end
			if fFlagVoiceChatVolumePerUserMuteVolumeSync and var24 then
				local var30 = voiceStore.getOrCreateVoiceState(value)(false) == VOICE_STATE.LOCAL_MUTED
				local clampedValue = math.clamp(p4, VOICE_VOLUME.MIN, VOICE_VOLUME.MAX)
				
				if clampedValue == VOICE_VOLUME.MIN then
					var29.VoiceChatVolume = VOICE_VOLUME.MIN
					
					if var30 then
						return
					else
						var24(value, true)
						
						return
					end
				else
					var29.VoiceChatVolume = clampedValue
					
					if var30 then
						var24(value, false)
						
						return
					end
				end
			else
				var29.VoiceChatVolume = math.clamp(p4, VOICE_VOLUME.MIN, VOICE_VOLUME.MAX)
			end
		end
	end
	
	local function getVoiceSessionId()
		-- upvalues: default (copy)
		local var29 = nil
		
		return if pcall(function()
			-- upvalues: var29 (write), default (copy)
			var29 = default:GetSessionId()
		end) and var29 ~= nil and var29 ~= "" then var29 else nil
	end
	
	local function cleanup()
		-- upvalues: var20 (write), fFlagVoiceVolumeControlsPerUserPlayerListButton (copy), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (copy), var14 (write), default (copy), var13 (ref)
		if var20 then
			var20:Disconnect()
			var20 = nil
		end
		if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then
			if var14 then
				default:unsubscribe("OnStateChanged", var14)
				var14 = nil
			end
			local var29 = var13
			
			for i, v in var29 do
				v:Disconnect()
			end
			table.clear(var29)
		end
	end
	
	initializeVoiceChat()
	
	return {
		voiceChatServiceConnected = var1,
		voiceUIVisible = var3,
		allPlayersMuted = var21,
		voiceParticipants = voiceStore.getVoiceParticipants,
		localMuted = var5,
		localTalking = var7,
		toggleMuteAll = toggleMuteAll,
		toggleMuteSelf = toggleMuteSelf,
		SubscribeRetry = SubscribeRetry,
		getPlayerMuteState = getPlayerMuteState,
		togglePlayerMute = togglePlayerMute,
		getPlayerShouldShowMuteButton = getPlayerShouldShowMuteButton,
		getPlayerAnimatedIcon = getPlayerAnimatedIcon,
		getPlayerIsLocalMuted = getPlayerIsLocalMuted,
		getPlayerIsTalking = if getFFlagAddPeoplePageCardLayout() then var28 else nil,
		getMuteSelfIcon = getMuteSelfIcon,
		getShowVolumeControl = if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then var9 else nil,
		getPlayerVoiceVolume = if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then getPlayerVoiceVolume else nil,
		subscribePlayerVoiceVolume = if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then subscribePlayerVoiceVolume else nil,
		setPlayerVoiceVolume = if fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu then setPlayerVoiceVolume else nil,
		getVoiceSessionId = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry and (fFlagVoiceVolumeControlsPerUserPlayerListButton or fFlagVoiceVolumeControlsPerUserPlayerGridMenu) then getVoiceSessionId else nil,
		cleanup = cleanup
	}
end)()