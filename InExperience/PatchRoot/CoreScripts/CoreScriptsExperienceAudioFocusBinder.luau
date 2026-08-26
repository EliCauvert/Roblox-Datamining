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
local var1 = false
local var2 = nil
local var3 = false
local var4 = false
local var5 = false
local var6 = false
local var7 = nil

if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
	default:subscribe("OnStateChanged", function(_, p1)
		-- upvalues: var2 (write), var4 (write)
		var2 = p1
		
		if p1 == Enum.VoiceChatState.Ended then
			var4 = false
		end
	end)
	default.VoiceJoinProgressChanged.Event:Connect(function(p1)
		-- upvalues: constantsModule (ref), var1 (write)
		if p1 == constantsModule.VOICE_JOIN_PROGRESS.Suspended then
			var1 = true
		end
	end)
	
	function performVoiceOperationWhenReady(p1)
		-- upvalues: default (ref), name (ref)
		default:asyncInit():andThen(function()
			-- upvalues: p1 (ref)
			p1()
		end):catch(function()
			-- upvalues: name (copy)
			name:info("VCSM was not initialized to perform operation [CEV ExperienceAudioFocusBinder]")
		end)
	end
	
	function isConnectedToPublicVoice()
		-- upvalues: default (ref), var2 (write)
		return not default:ShouldShowJoinVoice() or var2 == Enum.VoiceChatState.Joined
	end
	
	function initializeAFM()
		-- upvalues: fixJoinVoiceDelayedAFMInit (ref), var3 (write), name (ref), constants (ref), fIntPartyVoiceUndeafenDelayMS (ref), var7 (write), default (ref), promiseModule (ref), var4 (write), var1 (write), var6 (write)
		if fixJoinVoiceDelayedAFMInit and var3 then
			name:info("VCSM was already initialized [CEV ExperienceAudioFocusBinder]")
			
			return
		elseif fixJoinVoiceDelayedAFMInit then
			var3 = true
		end
		local ok, status = pcall(function()
			return game:GetService("AudioFocusService")
		end)
		
		if ok and status then
			local CONTEXT_ID = constants.AUDIO_FOCUS_MANAGEMENT.UGC.CONTEXT_ID
			local FOCUS_PRIORITY = constants.AUDIO_FOCUS_MANAGEMENT.UGC.FOCUS_PRIORITY
			status:RegisterContextIdFromLua(CONTEXT_ID)
			
			local var8 = function()
				-- upvalues: fIntPartyVoiceUndeafenDelayMS (copy), var7 (copy), default (copy)
				if isConnectedToPublicVoice() then
					if fIntPartyVoiceUndeafenDelayMS > 0 and var7 then
						task.cancel(var7)
						var7 = nil
					end
					default:MuteAll(true, "AudioFocusManagement UGC")
					
					if not default.localMuted then
						default:ToggleMic("AudioFocusManagement - UGC deafenAll")
					end
					default:HideVoiceUI()
				end
			end
			
			local var9 = function()
				-- upvalues: fIntPartyVoiceUndeafenDelayMS (copy), var7 (copy), default (copy)
				if isConnectedToPublicVoice() then
					if fIntPartyVoiceUndeafenDelayMS > 0 and var7 then
						task.cancel(var7)
						var7 = nil
					end
					default:MuteAll(false, "AudioFocusManagement UGC")
					
					if not default.localMuted then
						default:ToggleMic("AudioFocusManagement - UGC undeafenAll")
					end
					default:ShowVoiceUI()
				end
			end
			
			status.OnDeafenVoiceAudio:Connect(function(p1)
				-- upvalues: CONTEXT_ID (ref), fIntPartyVoiceUndeafenDelayMS (copy), var7 (copy), name (copy), var8 (ref)
				if p1 == CONTEXT_ID then
					if fIntPartyVoiceUndeafenDelayMS > 0 and var7 then
						task.cancel(var7)
						var7 = nil
					end
					name:info("UGC OnDeafenVoiceAudio fired" .. p3)
					performVoiceOperationWhenReady(var8)
				end
			end)
			status.OnUndeafenVoiceAudio:Connect(function(p1)
				-- upvalues: CONTEXT_ID (ref), fIntPartyVoiceUndeafenDelayMS (copy), var7 (copy), name (copy), var9 (ref)
				if p1 == CONTEXT_ID then
					if fIntPartyVoiceUndeafenDelayMS > 0 then
						if var7 then
							task.cancel(var7)
						end
						var7 = task.delay(fIntPartyVoiceUndeafenDelayMS / 1000, function()
							-- upvalues: var7 (copy), name (copy), p1 (ref), var9 (copy)
							var7 = nil
							name:info("UGC OnUndeafenVoiceAudio fired delayed" .. p4)
							performVoiceOperationWhenReady(var9)
						end)
						
						return
					else
						name:info("UGC OnUndeafenVoiceAudio fired" .. p4)
						performVoiceOperationWhenReady(var9)
					end
				end
			end)
			
			local _ = function(p1, p2)
				-- upvalues: name (copy), promiseModule (copy), status (ref)
				name:info("UGC requestAudioFocusWithPromise - id: {} - priority: {}", p1, p2)
				
				return promiseModule.new(function(p3, p4)
					-- upvalues: status (copy), p1 (ref), p2 (ref), name (copy)
					local ok, status_1 = pcall(status.RequestFocus, status, p1, p2)
					
					if ok then
						name:info("UGC requestAudioFocusWithPromise - focusGranted: {}", status_1)
						p3(status_1)
						
						return
					end
					name:info("UGC requestAudioFocusWithPromise - rejected")
					p4("Failed to call RequestFocus due to an error")
				end)
			end
			
			local var10 = function(p1, p2)
				-- upvalues: name (copy), default (copy)
				if p1 ~= nil then
					if p2 then
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
			
			local _ = function(p1, p2)
				-- upvalues: var4 (copy), var1 (copy), var10 (ref)
				if not var4 then
					performVoiceOperationWhenReady(function()
						-- upvalues: var1 (copy), var10 (copy), p1 (ref), p2 (ref)
						if not var1 then
							var10(p1, p2)
						end
					end)
					var4 = true
				end
			end
			
			name:info("UGC requestAudioFocusWithPromise - id: {} - priority: {}", CONTEXT_ID, FOCUS_PRIORITY)
			promiseModule.new(function(p1, p2)
				-- upvalues: status (ref), CONTEXT_ID (ref), FOCUS_PRIORITY (ref), name (copy)
				local ok, status_1 = pcall(status.RequestFocus, status, CONTEXT_ID, FOCUS_PRIORITY)
				
				if ok then
					name:info("UGC requestAudioFocusWithPromise - focusGranted: {}", status_1)
					p1(status_1)
					
					return
				end
				name:info("UGC requestAudioFocusWithPromise - rejected")
				p2("Failed to call RequestFocus due to an error")
			end):andThen(function(p1)
				-- upvalues: default (copy), var6 (copy), var4 (copy), var1 (copy), var10 (ref)
				default.muteChanged.Event:Connect(function(p2)
					-- upvalues: var6 (copy), p1 (ref), var4 (copy), var1 (copy), var10 (copy)
					if var6 then
						local var11 = isConnectedToPublicVoice()
						
						if not var4 then
							performVoiceOperationWhenReady(function()
								-- upvalues: var1 (copy), var10 (copy), p2 (ref), var11 (ref)
								if not var1 then
									var10(p2, var11)
								end
							end)
							var4 = true
						end
						return
					elseif not var4 then
						performVoiceOperationWhenReady(function()
							-- upvalues: var1 (copy), var10 (copy), p2 (ref), p1 (ref)
							if not var1 then
								var10(p2, p1)
							end
						end)
						var4 = true
					end
					var6 = true
				end)
			end):catch(function()
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
			default:subscribe("OnVoiceChatServiceInitialized", function()
				-- upvalues: var5 (write)
				if var5 then
					initializeAFM()
					var5 = false
				end
			end)
		end
		default:subscribe("OnCanUseServiceResult", function(p1)
			-- upvalues: fixJoinVoiceDelayedAFMInit (ref), var5 (write), name (ref)
			if p1 then
				initializeAFM()
				
				return
			elseif fixJoinVoiceDelayedAFMInit then
				var5 = true
			end
			name:info("VCSM cannot be used [CEV ExperienceAudioFocusBinder]")
		end)
	else
		name:info("VCSM cannot be used [CEV ExperienceAudioFocusBinder]")
	end
else
	default:asyncInit():andThen(function()
		-- upvalues: constants (ref), default (ref), name (ref), promiseModule (ref)
		local ok, status = pcall(function()
			return game:GetService("AudioFocusService")
		end)
		
		if ok and status then
			local CONTEXT_ID = constants.AUDIO_FOCUS_MANAGEMENT.UGC.CONTEXT_ID
			local FOCUS_PRIORITY = constants.AUDIO_FOCUS_MANAGEMENT.UGC.FOCUS_PRIORITY
			status:RegisterContextIdFromLua(CONTEXT_ID)
			
			local _ = function()
				-- upvalues: default (copy)
				default:MuteAll(true, "AudioFocusManagement UGC")
				
				if not default.localMuted then
					default:ToggleMic("AudioFocusManagement - UGC deafenAll")
				end
				default:HideVoiceUI()
			end
			
			local _ = function()
				-- upvalues: default (copy)
				default:MuteAll(false, "AudioFocusManagement UGC")
				
				if not default.localMuted then
					default:ToggleMic("AudioFocusManagement - UGC undeafenAll")
				end
				default:ShowVoiceUI()
			end
			
			status.OnDeafenVoiceAudio:Connect(function(p1)
				-- upvalues: CONTEXT_ID (ref), name (copy), default (copy)
				if p1 == CONTEXT_ID then
					name:info("UGC OnDeafenVoiceAudio fired" .. p18)
					default:MuteAll(true, "AudioFocusManagement UGC")
					
					if not default.localMuted then
						default:ToggleMic("AudioFocusManagement - UGC deafenAll")
					end
					default:HideVoiceUI()
				end
			end)
			status.OnUndeafenVoiceAudio:Connect(function(p1)
				-- upvalues: CONTEXT_ID (ref), name (copy), default (copy)
				if p1 == CONTEXT_ID then
					name:info("UGC OnUndeafenVoiceAudio fired" .. p19)
					default:MuteAll(false, "AudioFocusManagement UGC")
					
					if not default.localMuted then
						default:ToggleMic("AudioFocusManagement - UGC undeafenAll")
					end
					default:ShowVoiceUI()
				end
			end)
			
			local _ = function(p1, p2)
				-- upvalues: promiseModule (copy), status (ref)
				return promiseModule.new(function(p3, p4)
					-- upvalues: status (copy), p1 (ref), p2 (ref)
					local ok, status_1 = pcall(status.RequestFocus, status, p1, p2)
					
					if ok then
						p3(status_1)
						
						return
					end
					p4("Failed to call RequestFocus due to an error")
				end)
			end
			
			promiseModule.new(function(p1, p2)
				-- upvalues: status (ref), CONTEXT_ID (ref), FOCUS_PRIORITY (ref)
				local ok, status_1 = pcall(status.RequestFocus, status, CONTEXT_ID, FOCUS_PRIORITY)
				
				if ok then
					p1(status_1)
					
					return
				end
				p2("Failed to call RequestFocus due to an error")
			end):andThen(function(p1)
				-- upvalues: name (copy), default (copy)
				if p1 then
					name:info("UGC audio focus request granted, preparing to undeafen.")
					default.muteChanged.Event:Once(function(p2)
						-- upvalues: default (copy)
						if p2 ~= nil then
							default:MuteAll(false, "AudioFocusManagement UGC")
						end
					end)
					default:ShowVoiceUI()
					
					return
				end
				name:info("UGC audio focus requested denied, preparing to deafen.")
				default.muteChanged.Event:Once(function(p2)
					-- upvalues: default (copy)
					if p2 ~= nil then
						default:MuteAll(true, "AudioFocusManagement UGC")
					end
				end)
				default:HideVoiceUI()
			end):catch(function()
				-- upvalues: name (copy)
				name:info("[UGC] Error requesting focus inside UGCdatamodel")
			end)
		end
	end):catch(function()
		-- upvalues: name (ref)
		name:info("VCSM was not initialized [CEV ExperienceAudioFocusBinder]")
	end)
end