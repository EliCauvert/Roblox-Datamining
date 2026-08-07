local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local corePackagesService = game:GetService("CorePackages")
local promiseModule = require(corePackagesService.Packages.Promise)
local name = require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local constantsModule = require(robloxGui.Modules.VoiceChat.Constants)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local constants = require(corePackagesService.Workspace.Packages.CrossExperience).Constants
local fIntPartyVoiceUndeafenDelayMS = require(corePackagesService.Workspace.Packages.SharedFlags).FIntPartyVoiceUndeafenDelayMS
local fixJoinVoiceDelayedAFMInit = game:DefineFastFlag("FixJoinVoiceDelayedAFMInit", false)
local var6 = false
local var7 = nil
local var8 = false
local var9 = false
local var10 = false
local var11 = false
local var12 = nil

if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
	default:subscribe("OnStateChanged", function(_, p0) --[[ line: 28 ]]
		-- upvalues: var7 (write), var9 (write)
		var7 = p0
		
		if p0 == Enum.VoiceChatState.Ended then
			var9 = false
		end
	end)
	default.VoiceJoinProgressChanged.Event:Connect(function(p1) --[[ line: 34 ]]
		-- upvalues: constantsModule (ref), var6 (write)
		if p1 == constantsModule.VOICE_JOIN_PROGRESS.Suspended then
			var6 = true
		end
	end)
	
	function performVoiceOperationWhenReady(p2) --[[ line: 40 ]]
		-- upvalues: default (ref), name (ref)
		default:asyncInit():andThen(function() --[[ line: 42 ]]
			-- upvalues: p2 (ref)
			p2()
		end):catch(function() --[[ line: 45 ]]
			-- upvalues: name (copy)
			name:info("VCSM was not initialized to perform operation [CEV ExperienceAudioFocusBinder]")
		end)
	end
	
	function isConnectedToPublicVoice() --[[ line: 50 ]]
		-- upvalues: default (ref), var7 (write)
		return not default:ShouldShowJoinVoice() or var7 == Enum.VoiceChatState.Joined
	end
	
	function initializeAFM() --[[ line: 55 ]]
		-- upvalues: fixJoinVoiceDelayedAFMInit (ref), var8 (write), name (ref), constants (ref), fIntPartyVoiceUndeafenDelayMS (ref), var12 (write), default (ref), promiseModule (ref), var9 (write), var6 (write), var11 (write)
		if fixJoinVoiceDelayedAFMInit and var8 then
			name:info("VCSM was already initialized [CEV ExperienceAudioFocusBinder]")
			
			return
		elseif fixJoinVoiceDelayedAFMInit then
			var8 = true
		end
		local ok, status = pcall(function() --[[ line: 63 ]]
			return game:GetService("AudioFocusService")
		end)
		
		if ok and status then
			local CONTEXT_ID = constants.AUDIO_FOCUS_MANAGEMENT.UGC.CONTEXT_ID
			local FOCUS_PRIORITY = constants.AUDIO_FOCUS_MANAGEMENT.UGC.FOCUS_PRIORITY
			status:RegisterContextIdFromLua(CONTEXT_ID)
			
			local var13 = function() --[[ line: 72 ]]
				-- upvalues: fIntPartyVoiceUndeafenDelayMS (copy), var12 (copy), default (copy)
				if isConnectedToPublicVoice() then
					if fIntPartyVoiceUndeafenDelayMS > 0 and var12 then
						task.cancel(var12)
						var12 = nil
					end
					default:MuteAll(true, "AudioFocusManagement UGC")
					
					if not default.localMuted then
						default:ToggleMic("AudioFocusManagement - UGC deafenAll")
					end
					default:HideVoiceUI()
				end
			end
			
			local var14 = function() --[[ line: 89 ]]
				-- upvalues: fIntPartyVoiceUndeafenDelayMS (copy), var12 (copy), default (copy)
				if isConnectedToPublicVoice() then
					if fIntPartyVoiceUndeafenDelayMS > 0 and var12 then
						task.cancel(var12)
						var12 = nil
					end
					default:MuteAll(false, "AudioFocusManagement UGC")
					
					if not default.localMuted then
						default:ToggleMic("AudioFocusManagement - UGC undeafenAll")
					end
					default:ShowVoiceUI()
				end
			end
			
			status.OnDeafenVoiceAudio:Connect(function(p3) --[[ line: 105 ]]
				-- upvalues: CONTEXT_ID (ref), fIntPartyVoiceUndeafenDelayMS (copy), var12 (copy), name (copy), var13 (ref)
				if p3 == CONTEXT_ID then
					if fIntPartyVoiceUndeafenDelayMS > 0 and var12 then
						task.cancel(var12)
						var12 = nil
					end
					name:info("UGC OnDeafenVoiceAudio fired" .. p3)
					performVoiceOperationWhenReady(var13)
				end
			end)
			status.OnUndeafenVoiceAudio:Connect(function(p4) --[[ line: 116 ]]
				-- upvalues: CONTEXT_ID (ref), fIntPartyVoiceUndeafenDelayMS (copy), var12 (copy), name (copy), var14 (ref)
				if p4 == CONTEXT_ID then
					if fIntPartyVoiceUndeafenDelayMS > 0 then
						if var12 then
							task.cancel(var12)
						end
						var12 = task.delay(fIntPartyVoiceUndeafenDelayMS / 1000, function() --[[ line: 122 ]]
							-- upvalues: var12 (copy), name (copy), p4 (ref), var14 (copy)
							var12 = nil
							name:info("UGC OnUndeafenVoiceAudio fired delayed" .. p4)
							performVoiceOperationWhenReady(var14)
						end)
						
						return
					else
						name:info("UGC OnUndeafenVoiceAudio fired" .. p4)
						performVoiceOperationWhenReady(var14)
					end
				end
			end)
			
			local _ = function(p5, p6) --[[ line: 134 ]]
				-- upvalues: name (copy), promiseModule (copy), status (ref)
				name:info("UGC requestAudioFocusWithPromise - id: {} - priority: {}", p5, p6)
				
				return promiseModule.new(function(p7, p8) --[[ line: 136 ]]
					-- upvalues: status (copy), p5 (ref), p6 (ref), name (copy)
					local ok, status_1 = pcall(status.RequestFocus, status, p5, p6)
					
					if ok then
						name:info("UGC requestAudioFocusWithPromise - focusGranted: {}", status_1)
						p7(status_1)
						
						return
					end
					name:info("UGC requestAudioFocusWithPromise - rejected")
					p8("Failed to call RequestFocus due to an error")
				end)
			end
			
			local var15 = function(p9, p10) --[[ line: 149 ]]
				-- upvalues: name (copy), default (copy)
				if p9 ~= nil then
					if p10 then
						name:info("UGC audio focus request granted, preparing to undeafen.")
						default:MuteAll(false, "AudioFocusManagement UGC")
						default:ShowVoiceUI()
						
						return
					end
					name:info("UGC audio focus requested denied, preparing to deafen.")
					default:MuteAll(true, "AudioFocusManagement UGC")
					default:HideVoiceUI()
				end
			end
			
			local _ = function(p11, p12) --[[ line: 163 ]]
				-- upvalues: var9 (copy), var6 (copy), var15 (ref)
				if not var9 then
					performVoiceOperationWhenReady(function() --[[ line: 165 ]]
						-- upvalues: var6 (copy), var15 (copy), p11 (ref), p12 (ref)
						if not var6 then
							var15(p11, p12)
						end
					end)
					var9 = true
				end
			end
			
			name:info("UGC requestAudioFocusWithPromise - id: {} - priority: {}", CONTEXT_ID, FOCUS_PRIORITY)
			promiseModule.new(function(p15, p16) --[[ line: 136 ]]
				-- upvalues: status (ref), CONTEXT_ID (ref), FOCUS_PRIORITY (ref), name (copy)
				local ok, status_1 = pcall(status.RequestFocus, status, CONTEXT_ID, FOCUS_PRIORITY)
				
				if ok then
					name:info("UGC requestAudioFocusWithPromise - focusGranted: {}", status_1)
					p15(status_1)
					
					return
				end
				name:info("UGC requestAudioFocusWithPromise - rejected")
				p16("Failed to call RequestFocus due to an error")
			end):andThen(function(p13) --[[ line: 175 ]]
				-- upvalues: default (copy), var11 (copy), var9 (copy), var6 (copy), var15 (ref)
				default.muteChanged.Event:Connect(function(p14) --[[ line: 176 ]]
					-- upvalues: var11 (copy), p13 (ref), var9 (copy), var6 (copy), var15 (copy)
					if var11 then
						local var16 = isConnectedToPublicVoice()
						
						if not var9 then
							performVoiceOperationWhenReady(function() --[[ line: 165 ]]
								-- upvalues: var6 (copy), var15 (copy), p14 (ref), var16 (ref)
								if not var6 then
									var15(p14, var16)
								end
							end)
							var9 = true
						end
						return
					elseif not var9 then
						performVoiceOperationWhenReady(function() --[[ line: 165 ]]
							-- upvalues: var6 (copy), var15 (copy), p14 (ref), p13 (ref)
							if not var6 then
								var15(p14, p13)
							end
						end)
						var9 = true
					end
					var11 = true
				end)
			end):catch(function() --[[ line: 185 ]]
				-- upvalues: name (copy)
				name:info("[UGC] Error requesting focus inside UGCdatamodel")
			end)
		end
	end
	
	local canUseServiceResult = default.canUseServiceResult
	
	if canUseServiceResult then
		initializeAFM()
	elseif canUseServiceResult == nil then
		if fixJoinVoiceDelayedAFMInit then
			default:subscribe("OnVoiceChatServiceInitialized", function() --[[ line: 196 ]]
				-- upvalues: var10 (write)
				if var10 then
					initializeAFM()
					var10 = false
				end
			end)
		end
		default:subscribe("OnCanUseServiceResult", function(p17) --[[ line: 204 ]]
			-- upvalues: fixJoinVoiceDelayedAFMInit (ref), var10 (write), name (ref)
			if p17 then
				initializeAFM()
				
				return
			elseif fixJoinVoiceDelayedAFMInit then
				var10 = true
			end
			name:info("VCSM cannot be used [CEV ExperienceAudioFocusBinder]")
		end)
	else
		name:info("VCSM cannot be used [CEV ExperienceAudioFocusBinder]")
	end
else
	default:asyncInit():andThen(function() --[[ line: 219 ]]
		-- upvalues: constants (ref), default (ref), name (ref), promiseModule (ref)
		local ok, status = pcall(function() --[[ line: 220 ]]
			return game:GetService("AudioFocusService")
		end)
		
		if ok and status then
			local CONTEXT_ID = constants.AUDIO_FOCUS_MANAGEMENT.UGC.CONTEXT_ID
			local FOCUS_PRIORITY = constants.AUDIO_FOCUS_MANAGEMENT.UGC.FOCUS_PRIORITY
			status:RegisterContextIdFromLua(CONTEXT_ID)
			
			local _ = function() --[[ line: 229 ]]
				-- upvalues: default (copy)
				default:MuteAll(true, "AudioFocusManagement UGC")
				
				if not default.localMuted then
					default:ToggleMic("AudioFocusManagement - UGC deafenAll")
				end
				default:HideVoiceUI()
			end
			
			local _ = function() --[[ line: 239 ]]
				-- upvalues: default (copy)
				default:MuteAll(false, "AudioFocusManagement UGC")
				
				if not default.localMuted then
					default:ToggleMic("AudioFocusManagement - UGC undeafenAll")
				end
				default:ShowVoiceUI()
			end
			
			status.OnDeafenVoiceAudio:Connect(function(p18) --[[ line: 249 ]]
				-- upvalues: CONTEXT_ID (ref), name (copy), default (copy)
				if p18 == CONTEXT_ID then
					name:info("UGC OnDeafenVoiceAudio fired" .. p18)
					default:MuteAll(true, "AudioFocusManagement UGC")
					
					if not default.localMuted then
						default:ToggleMic("AudioFocusManagement - UGC deafenAll")
					end
					default:HideVoiceUI()
				end
			end)
			status.OnUndeafenVoiceAudio:Connect(function(p19) --[[ line: 256 ]]
				-- upvalues: CONTEXT_ID (ref), name (copy), default (copy)
				if p19 == CONTEXT_ID then
					name:info("UGC OnUndeafenVoiceAudio fired" .. p19)
					default:MuteAll(false, "AudioFocusManagement UGC")
					
					if not default.localMuted then
						default:ToggleMic("AudioFocusManagement - UGC undeafenAll")
					end
					default:ShowVoiceUI()
				end
			end)
			
			local _ = function(p20, p21) --[[ line: 263 ]]
				-- upvalues: promiseModule (copy), status (ref)
				return promiseModule.new(function(p22, p23) --[[ line: 264 ]]
					-- upvalues: status (copy), p20 (ref), p21 (ref)
					local ok, status_1 = pcall(status.RequestFocus, status, p20, p21)
					
					if ok then
						p22(status_1)
						
						return
					end
					p23("Failed to call RequestFocus due to an error")
				end)
			end
			
			promiseModule.new(function(p27, p28) --[[ line: 264 ]]
				-- upvalues: status (ref), CONTEXT_ID (ref), FOCUS_PRIORITY (ref)
				local ok, status_1 = pcall(status.RequestFocus, status, CONTEXT_ID, FOCUS_PRIORITY)
				
				if ok then
					p27(status_1)
					
					return
				end
				p28("Failed to call RequestFocus due to an error")
			end):andThen(function(p24) --[[ line: 276 ]]
				-- upvalues: name (copy), default (copy)
				if p24 then
					name:info("UGC audio focus request granted, preparing to undeafen.")
					default.muteChanged.Event:Once(function(p25) --[[ line: 279 ]]
						-- upvalues: default (copy)
						if p25 ~= nil then
							default:MuteAll(false, "AudioFocusManagement UGC")
						end
					end)
					default:ShowVoiceUI()
					
					return
				end
				name:info("UGC audio focus requested denied, preparing to deafen.")
				default.muteChanged.Event:Once(function(p26) --[[ line: 287 ]]
					-- upvalues: default (copy)
					if p26 ~= nil then
						default:MuteAll(true, "AudioFocusManagement UGC")
					end
				end)
				default:HideVoiceUI()
			end):catch(function() --[[ line: 295 ]]
				-- upvalues: name (copy)
				name:info("[UGC] Error requesting focus inside UGCdatamodel")
			end)
		end
	end):catch(function() --[[ line: 300 ]]
		-- upvalues: name (ref)
		name:info("VCSM was not initialized [CEV ExperienceAudioFocusBinder]")
	end)
end