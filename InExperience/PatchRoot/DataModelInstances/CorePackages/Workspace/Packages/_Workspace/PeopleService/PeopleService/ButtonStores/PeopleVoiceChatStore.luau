local playersService = game:GetService("Players")
local coreGuiService = game:GetService("CoreGui")
local runService = game:GetService("RunService")
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
local luaFlagVoiceChatDisableSubscribeRetryForMultistream = game:DefineFastFlag("LuaFlagVoiceChatDisableSubscribeRetryForMultistream", true)
local voiceChatMultistreamSubscriptionsEnabledEngineFeature = game:GetEngineFeature("VoiceChatMultistreamSubscriptionsEnabled")
local constantsModule_1 = require(parent.Constants)
local FRAME_BUFFER = constantsModule_1.VOICE_CHAT.MIC_ANIMATION.FRAME_BUFFER
local ICONS = constantsModule_1.VOICE_CHAT.ICONS
local playerMuteStatusIcons = default.PlayerMuteStatusIcons

return (function() --[[ line: 69 | named "createPeopleVoiceChatStore" ]]
	-- upvalues: signalsModule (ref), runService (ref), FRAME_BUFFER (ref), playerMuteStatusIcons (ref), default (ref), voiceStore (ref), playersService (ref), VOICE_STATE (ref), constantsModule (ref), luaFlagVoiceChatDisableSubscribeRetryForMultistream (ref), voiceChatMultistreamSubscriptionsEnabledEngineFeature (ref), ICONS (ref), getFFlagNewPeoplePageIcons (ref), getFFlagAddPeoplePageCardLayout (ref), getFFlagVoiceChatUILoggingModule (ref), name (ref)
	local var14, var15 = signalsModule.createSignal(false)
	local var16, var17 = signalsModule.createSignal(false)
	local var18, var19 = signalsModule.createSignal(nil)
	local var20, var21 = signalsModule.createSignal(false)
	local var22, var23 = signalsModule.createSignal(0)
	local var24, var25 = signalsModule.createSignal(0)
	local var26 = 0
	local var27 = nil
	
	local function _() --[[ line: 84 | named "startMicAnimation" ]]
		-- upvalues: var27 (write), runService (copy), var20 (ref), var26 (write), FRAME_BUFFER (copy), var23 (ref), var25 (ref)
		if var27 then
			return
		end
		var27 = runService.RenderStepped:Connect(function() --[[ line: 89 ]]
			-- upvalues: var20 (copy), var26 (copy), FRAME_BUFFER (copy), var23 (copy), var25 (copy)
			if var20(false) then
				var26 += 1
				
				if FRAME_BUFFER < var26 then
					var23(math.random())
					var26 = 0
					
					return
				end
			else
				var26 += 1
				
				if FRAME_BUFFER < var26 then
					var25(math.random())
					var26 = 0
				end
			end
		end)
	end
	
	local _ = function() --[[ line: 110 | named "stopMicAnimation" ]]
		-- upvalues: var27 (write)
		if var27 then
			var27:Disconnect()
			var27 = nil
		end
	end
	
	local function getMuteSelfIcon() --[[ line: 117 ]]
		-- upvalues: signalsModule (copy), var18 (ref), var20 (ref), playerMuteStatusIcons (copy), var22 (ref), default (copy)
		return signalsModule.createComputed(function(p0) --[[ line: 118 ]]
			-- upvalues: var18 (copy), var20 (copy), playerMuteStatusIcons (copy), var22 (copy), default (copy)
			local var40 = var18(p0)
			local _ = nil
			
			return if var40 == nil then playerMuteStatusIcons.Loading elseif var40 then playerMuteStatusIcons.MicOff elseif var20(p0) then default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * var22(p0)) * 20), "MicLight") else playerMuteStatusIcons.MicOn
		end)
	end
	
	local var29 = signalsModule.createComputed(function(p1) --[[ line: 140 ]]
		-- upvalues: var14 (ref), default (copy), voiceStore (copy), playersService (copy), VOICE_STATE (copy)
		if not var14(p1) or not default.voiceUIVisible then
			return false
		end
		local voiceParticipants = voiceStore.getVoiceParticipants(p1)
		
		if not voiceParticipants then
			return false
		end
		local var42 = true
		
		for i, v in pairs(voiceParticipants) do
			local var43 = tonumber(i)
			
			if var43 and playersService.LocalPlayer and (var43 ~= playersService.LocalPlayer.UserId and v ~= VOICE_STATE.LOCAL_MUTED) then
				var42 = false
				
				return var42
			end
		end
		return var42
	end)
	
	local function toggleMuteAll() --[[ line: 167 ]]
		-- upvalues: var14 (ref), var29 (ref), default (copy), constantsModule (copy)
		if var14(false) then
			default:MuteAll(not var29(false), constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
			
			return
		end
	end
	
	local function toggleMuteSelf() --[[ line: 177 ]]
		-- upvalues: var14 (ref), default (copy)
		if var14(false) then
			default:ToggleMic("InGameMenuPlayers")
			
			return
		end
	end
	
	local function SubscribeRetry(p2) --[[ line: 186 ]]
		-- upvalues: var14 (ref), default (copy)
		if var14(false) then
			default:SubscribeRetry(p2)
			
			return
		end
	end
	
	local function getPlayerMuteState(p3) --[[ line: 195 ]]
		-- upvalues: signalsModule (copy), voiceStore (copy), VOICE_STATE (copy)
		return signalsModule.createComputed(function(p4) --[[ line: 196 ]]
			-- upvalues: voiceStore (copy), p3 (ref), VOICE_STATE (copy)
			local var44 = voiceStore.getOrCreateVoiceState(p3)(p4)
			
			return if var44 then if var44 ~= VOICE_STATE.LOCAL_MUTED then var44 == VOICE_STATE.MUTED else true else false
		end)
	end
	
	local function togglePlayerMute(p5) --[[ line: 208 ]]
		-- upvalues: var14 (ref), var16 (ref), default (copy), constantsModule (copy), luaFlagVoiceChatDisableSubscribeRetryForMultistream (copy), voiceChatMultistreamSubscriptionsEnabledEngineFeature (copy)
		if not var14(false) then return end
		if not var16(false) then return end
		local var45 = default.participants[tostring(p5)]
		
		if var45 and var45.subscriptionCompleted then
			default:ToggleMutePlayer(tonumber(p5), constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
			
			return
		elseif var45 and var45.subscriptionFailed then
			if not luaFlagVoiceChatDisableSubscribeRetryForMultistream then
				default:SubscribeRetry(p5)
				
				return
			elseif voiceChatMultistreamSubscriptionsEnabledEngineFeature then
				return
			else
				default:SubscribeRetry(p5)
				
				return
			end
		else
			default:ToggleMutePlayer(tonumber(p5), constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
		end
	end
	
	local function getPlayerShouldShowMuteButton(p6) --[[ line: 241 ]]
		-- upvalues: signalsModule (copy), var16 (ref), playersService (copy), voiceStore (copy)
		return signalsModule.createComputed(function(p7) --[[ line: 242 ]]
			-- upvalues: var16 (copy), playersService (copy), p6 (ref), voiceStore (copy)
			return if var16(p7) and (not playersService.LocalPlayer or p6 ~= playersService.LocalPlayer.UserId) then voiceStore.getOrCreateVoiceState(p6)(p7) ~= nil else false
		end)
	end
	
	local function getPlayerAnimatedIcon(p8) --[[ line: 253 ]]
		-- upvalues: signalsModule (copy), voiceStore (copy), ICONS (copy), VOICE_STATE (copy), getFFlagNewPeoplePageIcons (copy), var24 (ref)
		return signalsModule.createComputed(function(p9) --[[ line: 254 ]]
			-- upvalues: voiceStore (copy), p8 (ref), ICONS (copy), VOICE_STATE (copy), getFFlagNewPeoplePageIcons (copy), var24 (copy)
			local var46 = voiceStore.getOrCreateVoiceState(p8)(p9)
			
			return if var46 then if var46 == VOICE_STATE.LOCAL_MUTED or var46 == VOICE_STATE.MUTED then if getFFlagNewPeoplePageIcons() then ICONS.MUTED_SPEAKER else ICONS.SPEAKER_OFF elseif var46 == VOICE_STATE.TALKING then string.format(ICONS.ANIMATED_SPEAKER_FORMAT, math.floor(0.5 + 5 * var24(p9)) * 20) else ICONS.DEFAULT_SPEAKER else ICONS.DEFAULT_SPEAKER
		end)
	end
	
	local function getPlayerIsLocalMuted(p10) --[[ line: 278 ]]
		-- upvalues: signalsModule (copy), voiceStore (copy), VOICE_STATE (copy)
		return signalsModule.createComputed(function(p11) --[[ line: 279 ]]
			-- upvalues: p10 (ref), voiceStore (copy), VOICE_STATE (copy)
			return if p10 then voiceStore.getOrCreateVoiceState(p10)(p11) == VOICE_STATE.LOCAL_MUTED else false
		end)
	end
	
	local var38 = if getFFlagAddPeoplePageCardLayout() then function(p12) --[[ line: 291 ]]
		-- upvalues: signalsModule (copy), voiceStore (copy), VOICE_STATE (copy)
		return signalsModule.createComputed(function(p13) --[[ line: 292 ]]
			-- upvalues: voiceStore (copy), p12 (ref), VOICE_STATE (copy)
			return voiceStore.getOrCreateVoiceState(p12)(p13) == VOICE_STATE.TALKING
		end)
	end else nil
	
	local function cleanup() --[[ line: 378 ]]
		-- upvalues: var27 (write)
		if var27 then
			var27:Disconnect()
			var27 = nil
		end
	end
	
	;(function() --[[ line: 300 | named "initializeVoiceChat" ]]
		-- upvalues: default (copy), var15 (ref), playersService (copy), voiceStore (copy), var19 (ref), var21 (ref), var17 (ref), var27 (write), runService (copy), var20 (ref), var26 (write), FRAME_BUFFER (copy), var23 (ref), var25 (ref), getFFlagVoiceChatUILoggingModule (copy), name (copy)
		if game:GetEngineFeature("VoiceChatSupported") then
			default:asyncInit():andThen(function() --[[ line: 307 ]]
				-- upvalues: var15 (copy), default (copy), playersService (copy), voiceStore (copy), var19 (copy), var21 (copy), var17 (copy), var27 (copy), runService (copy), var20 (copy), var26 (copy), FRAME_BUFFER (copy), var23 (copy), var25 (copy)
				var15(true)
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
				default.muteChanged.Event:Connect(function(p14) --[[ line: 324 ]]
					-- upvalues: var19 (copy)
					var19(p14)
				end)
				default.talkingChanged.Event:Connect(function(p15) --[[ line: 329 ]]
					-- upvalues: var21 (copy)
					var21(p15)
				end)
				var19(default.localMuted)
				var21(default.isTalking)
				default.participantsUpdate.Event:Connect(function(p16) --[[ line: 338 ]]
					-- upvalues: voiceStore (copy)
					voiceStore.handleVoiceParticipantsChanged(p16)
				end)
				default.participantJoined.Event:Connect(function(_, p17) --[[ line: 342 ]]
					-- upvalues: voiceStore (copy)
					voiceStore.handleVoiceParticipantAdded(tostring(p17))
				end)
				default.participantLeft.Event:Connect(function(_, p18) --[[ line: 346 ]]
					-- upvalues: voiceStore (copy)
					voiceStore.handleVoiceParticipantRemoved(tostring(p18))
				end)
				default.showVoiceUI.Event:Connect(function() --[[ line: 351 ]]
					-- upvalues: var17 (copy), var27 (copy), runService (copy), var20 (copy), var26 (copy), FRAME_BUFFER (copy), var23 (copy), var25 (copy)
					var17(true)
					
					if var27 then
						return
					end
					var27 = runService.RenderStepped:Connect(function() --[[ line: 89 ]]
						-- upvalues: var20 (copy), var26 (copy), FRAME_BUFFER (copy), var23 (copy), var25 (copy)
						if var20(false) then
							var26 += 1
							
							if FRAME_BUFFER < var26 then
								var23(math.random())
								var26 = 0
								
								return
							end
						else
							var26 += 1
							
							if FRAME_BUFFER < var26 then
								var25(math.random())
								var26 = 0
							end
						end
					end)
				end)
				default.hideVoiceUI.Event:Connect(function() --[[ line: 356 ]]
					-- upvalues: var17 (copy), var27 (copy)
					var17(false)
					
					if var27 then
						var27:Disconnect()
						var27 = nil
					end
				end)
				
				if default.voiceUIVisible then
					var17(true)
				end
				if var27 then
					return
				end
				var27 = runService.RenderStepped:Connect(function() --[[ line: 89 ]]
					-- upvalues: var20 (copy), var26 (copy), FRAME_BUFFER (copy), var23 (copy), var25 (copy)
					if var20(false) then
						var26 += 1
						
						if FRAME_BUFFER < var26 then
							var23(math.random())
							var26 = 0
							
							return
						end
					else
						var26 += 1
						
						if FRAME_BUFFER < var26 then
							var25(math.random())
							var26 = 0
						end
					end
				end)
			end):catch(function(_) --[[ line: 368 ]]
				-- upvalues: getFFlagVoiceChatUILoggingModule (copy), name (copy), var27 (copy)
				if getFFlagVoiceChatUILoggingModule() then
					name:warning("Failed to init VoiceChatServiceManager")
				end
				if var27 then
					var27:Disconnect()
					var27 = nil
				end
			end)
			
			return
		end
	end)()
	
	return {
		voiceChatServiceConnected = var14,
		voiceUIVisible = var16,
		allPlayersMuted = var29,
		voiceParticipants = voiceStore.getVoiceParticipants,
		localMuted = var18,
		localTalking = var20,
		toggleMuteAll = toggleMuteAll,
		toggleMuteSelf = toggleMuteSelf,
		SubscribeRetry = SubscribeRetry,
		getPlayerMuteState = getPlayerMuteState,
		togglePlayerMute = togglePlayerMute,
		getPlayerShouldShowMuteButton = getPlayerShouldShowMuteButton,
		getPlayerAnimatedIcon = getPlayerAnimatedIcon,
		getPlayerIsLocalMuted = getPlayerIsLocalMuted,
		getPlayerIsTalking = if getFFlagAddPeoplePageCardLayout() then var38 else nil,
		getMuteSelfIcon = getMuteSelfIcon,
		cleanup = cleanup
	}
end)()