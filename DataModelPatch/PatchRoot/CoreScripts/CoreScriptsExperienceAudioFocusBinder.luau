local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local NewResult = require(CorePackages.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local ConstantsModule = require(RobloxGui.Modules.VoiceChat.Constants)
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local Constants = require(CorePackages.Workspace.Packages.CrossExperience).Constants
local FIntPartyVoiceUndeafenDelayMS = require(CorePackages.Workspace.Packages.SharedFlags).FIntPartyVoiceUndeafenDelayMS
local FixJoinVoiceDelayedAFMInit = game:DefineFastFlag("FixJoinVoiceDelayedAFMInit", false)
local Flag = false
local VoiceChatState = nil
local Flag1 = false
local Flag2 = false
local Flag3 = false
local Flag4 = false
local DelayedThread = nil

if require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
	Default:subscribe("OnStateChanged", function(_, VoiceChatState1)
		-- upvalues: VoiceChatState (ref), Flag2 (ref)
		VoiceChatState = VoiceChatState1
		
		if VoiceChatState1 == Enum.VoiceChatState.Ended then
			Flag2 = false
		end
	end)
	Default.VoiceJoinProgressChanged.Event:Connect(function(Suspended)
		-- upvalues: ConstantsModule (copy), Flag (ref)
		if Suspended == ConstantsModule.VOICE_JOIN_PROGRESS.Suspended then
			Flag = true
		end
	end)
	
	function performVoiceOperationWhenReady(Callback)
		-- upvalues: Default (copy), NewResult (copy)
		Default:asyncInit():andThen(function()
			-- upvalues: Callback (copy)
			Callback()
		end):catch(function()
			-- upvalues: NewResult (upval)
			NewResult:info("VCSM was not initialized to perform operation [CEV ExperienceAudioFocusBinder]")
		end)
	end
	
	function isConnectedToPublicVoice(): boolean
		-- upvalues: Default (copy), VoiceChatState (ref)
		return not Default:ShouldShowJoinVoice() or VoiceChatState == Enum.VoiceChatState.Joined
	end
	
	function initializeAFM()
		-- upvalues: FixJoinVoiceDelayedAFMInit (copy), Flag1 (ref), NewResult (copy), Constants (copy), FIntPartyVoiceUndeafenDelayMS (copy), DelayedThread (ref), Default (copy), PromiseModule (copy), Flag2 (ref), Flag (ref), Flag4 (ref)
		if FixJoinVoiceDelayedAFMInit and Flag1 then
			NewResult:info("VCSM was already initialized [CEV ExperienceAudioFocusBinder]")
			
			return
		end
		if FixJoinVoiceDelayedAFMInit then
			Flag1 = true
		end
		local Success, Result = pcall(function()
			return game:GetService("AudioFocusService")
		end)
		
		if Success and Result then
			local CONTEXTID = Constants.AUDIO_FOCUS_MANAGEMENT.UGC.CONTEXT_ID
			local FOCUSPRIORITY = Constants.AUDIO_FOCUS_MANAGEMENT.UGC.FOCUS_PRIORITY
			Result:RegisterContextIdFromLua(CONTEXTID)
			
			local function v21()
				-- upvalues: FIntPartyVoiceUndeafenDelayMS (upval), DelayedThread (upval), Default (upval)
				if isConnectedToPublicVoice() then
					if FIntPartyVoiceUndeafenDelayMS > 0 and DelayedThread then
						task.cancel(DelayedThread)
						DelayedThread = nil
					end
					Default:MuteAll(true, "AudioFocusManagement UGC")
					
					if not Default.localMuted then
						Default:ToggleMic("AudioFocusManagement - UGC deafenAll")
					end
					Default:HideVoiceUI()
				end
			end
			
			local function v22()
				-- upvalues: FIntPartyVoiceUndeafenDelayMS (upval), DelayedThread (upval), Default (upval)
				if isConnectedToPublicVoice() then
					if FIntPartyVoiceUndeafenDelayMS > 0 and DelayedThread then
						task.cancel(DelayedThread)
						DelayedThread = nil
					end
					Default:MuteAll(false, "AudioFocusManagement UGC")
					
					if not Default.localMuted then
						Default:ToggleMic("AudioFocusManagement - UGC undeafenAll")
					end
					Default:ShowVoiceUI()
				end
			end
			
			Result.OnDeafenVoiceAudio:Connect(function(ContextId)
				-- upvalues: CONTEXTID (copy), FIntPartyVoiceUndeafenDelayMS (upval), DelayedThread (upval), NewResult (upval), v21 (copy)
				if ContextId == CONTEXTID then
					if FIntPartyVoiceUndeafenDelayMS > 0 and DelayedThread then
						task.cancel(DelayedThread)
						DelayedThread = nil
					end
					NewResult:info("UGC OnDeafenVoiceAudio fired" .. ContextId)
					performVoiceOperationWhenReady(v21)
				end
			end)
			Result.OnUndeafenVoiceAudio:Connect(function(ContextId)
				-- upvalues: CONTEXTID (copy), FIntPartyVoiceUndeafenDelayMS (upval), DelayedThread (upval), NewResult (upval), v22 (copy)
				if ContextId == CONTEXTID then
					if FIntPartyVoiceUndeafenDelayMS > 0 then
						if DelayedThread then
							task.cancel(DelayedThread)
						end
						DelayedThread = task.delay(FIntPartyVoiceUndeafenDelayMS / 1000, function()
							-- upvalues: DelayedThread (upval), NewResult (upval), ContextId (copy), v22 (upval)
							DelayedThread = nil
							NewResult:info("UGC OnUndeafenVoiceAudio fired delayed" .. ContextId)
							performVoiceOperationWhenReady(v22)
						end)
						
						return
					else
						NewResult:info("UGC OnUndeafenVoiceAudio fired" .. ContextId)
						performVoiceOperationWhenReady(v22)
					end
				end
			end)
			
			local function _(p1, p2)
				-- upvalues: NewResult (upval), PromiseModule (upval), Result (copy)
				NewResult:info("UGC requestAudioFocusWithPromise - id: {} - priority: {}", p1, p2)
				
				return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
					-- upvalues: Result (upval), p1 (copy), p2 (copy), NewResult (upval)
					local Success, Result1 = pcall(Result.RequestFocus, Result, p1, p2)
					
					if Success then
						NewResult:info("UGC requestAudioFocusWithPromise - focusGranted: {}", Result1)
						Callback(Result1)
						
						return
					else
						NewResult:info("UGC requestAudioFocusWithPromise - rejected")
						Callback1("Failed to call RequestFocus due to an error")
					end
				end)
			end
			
			local function v24(p1, IsConnectedToPublicVoice1)
				-- upvalues: NewResult (upval), Default (upval)
				if p1 ~= nil then
					if IsConnectedToPublicVoice1 then
						NewResult:info("UGC audio focus request granted, preparing to undeafen.")
						Default:MuteAll(false, "AudioFocusManagement UGC")
						Default:ShowVoiceUI()
						
						return
					end
					NewResult:info("UGC audio focus requested denied, preparing to deafen.")
					Default:MuteAll(true, "AudioFocusManagement UGC")
					Default:HideVoiceUI()
				end
			end
			
			local _ = function(p1, p2)
				-- upvalues: Flag2 (upval), Flag (upval), v24 (copy)
				if not Flag2 then
					performVoiceOperationWhenReady(function()
						-- upvalues: Flag (upval), v24 (upval), p1 (copy), p2 (copy)
						if not Flag then
							v24(p1, p2)
						end
					end)
					Flag2 = true
				end
			end
			
			NewResult:info("UGC requestAudioFocusWithPromise - id: {} - priority: {}", CONTEXTID, FOCUSPRIORITY)
			PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
				-- upvalues: Result (copy), CONTEXTID (copy), FOCUSPRIORITY (copy), NewResult (upval)
				local Success, Result1 = pcall(Result.RequestFocus, Result, CONTEXTID, FOCUSPRIORITY)
				
				if Success then
					NewResult:info("UGC requestAudioFocusWithPromise - focusGranted: {}", Result1)
					Callback(Result1)
					
					return
				else
					NewResult:info("UGC requestAudioFocusWithPromise - rejected")
					Callback1("Failed to call RequestFocus due to an error")
				end
			end):andThen(function(Result)
				-- upvalues: Default (upval), Flag4 (upval), Flag2 (upval), Flag (upval), v24 (copy)
				Default.muteChanged.Event:Connect(function(p1)
					-- upvalues: Flag4 (upval), Result (copy), Flag2 (upval), Flag (upval), v24 (upval)
					if Flag4 then
						local IsConnectedToPublicVoice1 = isConnectedToPublicVoice()
						
						if not Flag2 then
							performVoiceOperationWhenReady(function()
								-- upvalues: Flag (upval), v24 (upval), p1 (copy), IsConnectedToPublicVoice1 (copy)
								if not Flag then
									v24(p1, IsConnectedToPublicVoice1)
								end
							end)
							Flag2 = true
						end
						return
					else
						if not Flag2 then
							performVoiceOperationWhenReady(function()
								-- upvalues: Flag (upval), v24 (upval), p1 (copy), Result (copy)
								if not Flag then
									v24(p1, Result)
								end
							end)
							Flag2 = true
						end
						Flag4 = true
					end
				end)
			end):catch(function()
				-- upvalues: NewResult (upval)
				NewResult:info("[UGC] Error requesting focus inside UGCdatamodel")
			end)
		end
	end
	
	local CanUseServiceResult = Default.canUseServiceResult
	
	if CanUseServiceResult then
		initializeAFM()
	elseif CanUseServiceResult == nil then
		if FixJoinVoiceDelayedAFMInit then
			Default:subscribe("OnVoiceChatServiceInitialized", function()
				-- upvalues: Flag3 (ref)
				if Flag3 then
					initializeAFM()
					Flag3 = false
				end
			end)
		end
		Default:subscribe("OnCanUseServiceResult", function(p1)
			-- upvalues: FixJoinVoiceDelayedAFMInit (copy), Flag3 (ref), NewResult (copy)
			if p1 then
				initializeAFM()
				
				return
			end
			if FixJoinVoiceDelayedAFMInit then
				Flag3 = true
			end
			NewResult:info("VCSM cannot be used [CEV ExperienceAudioFocusBinder]")
		end)
	else
		NewResult:info("VCSM cannot be used [CEV ExperienceAudioFocusBinder]")
	end
else
	Default:asyncInit():andThen(function()
		-- upvalues: Constants (copy), Default (copy), NewResult (copy), PromiseModule (copy)
		local Success, Result = pcall(function()
			return game:GetService("AudioFocusService")
		end)
		
		if Success and Result then
			local CONTEXTID = Constants.AUDIO_FOCUS_MANAGEMENT.UGC.CONTEXT_ID
			local FOCUSPRIORITY = Constants.AUDIO_FOCUS_MANAGEMENT.UGC.FOCUS_PRIORITY
			Result:RegisterContextIdFromLua(CONTEXTID)
			
			local function _()
				-- upvalues: Default (upval)
				Default:MuteAll(true, "AudioFocusManagement UGC")
				
				if not Default.localMuted then
					Default:ToggleMic("AudioFocusManagement - UGC deafenAll")
				end
				Default:HideVoiceUI()
			end
			
			local _ = function()
				-- upvalues: Default (upval)
				Default:MuteAll(false, "AudioFocusManagement UGC")
				
				if not Default.localMuted then
					Default:ToggleMic("AudioFocusManagement - UGC undeafenAll")
				end
				Default:ShowVoiceUI()
			end
			
			Result.OnDeafenVoiceAudio:Connect(function(ContextId)
				-- upvalues: CONTEXTID (copy), NewResult (upval), Default (upval)
				if ContextId == CONTEXTID then
					NewResult:info("UGC OnDeafenVoiceAudio fired" .. ContextId)
					Default:MuteAll(true, "AudioFocusManagement UGC")
					
					if not Default.localMuted then
						Default:ToggleMic("AudioFocusManagement - UGC deafenAll")
					end
					Default:HideVoiceUI()
				end
			end)
			Result.OnUndeafenVoiceAudio:Connect(function(ContextId)
				-- upvalues: CONTEXTID (copy), NewResult (upval), Default (upval)
				if ContextId == CONTEXTID then
					NewResult:info("UGC OnUndeafenVoiceAudio fired" .. ContextId)
					Default:MuteAll(false, "AudioFocusManagement UGC")
					
					if not Default.localMuted then
						Default:ToggleMic("AudioFocusManagement - UGC undeafenAll")
					end
					Default:ShowVoiceUI()
				end
			end)
			
			local _ = function(p1, p2)
				-- upvalues: PromiseModule (upval), Result (copy)
				return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
					-- upvalues: Result (upval), p1 (copy), p2 (copy)
					local Success, Result1 = pcall(Result.RequestFocus, Result, p1, p2)
					
					if Success then
						Callback(Result1)
						
						return
					else
						Callback1("Failed to call RequestFocus due to an error")
					end
				end)
			end
			
			PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
				-- upvalues: Result (copy), CONTEXTID (copy), FOCUSPRIORITY (copy)
				local Success, Result1 = pcall(Result.RequestFocus, Result, CONTEXTID, FOCUSPRIORITY)
				
				if Success then
					Callback(Result1)
					
					return
				else
					Callback1("Failed to call RequestFocus due to an error")
				end
			end):andThen(function(Result)
				-- upvalues: NewResult (upval), Default (upval)
				if Result then
					NewResult:info("UGC audio focus request granted, preparing to undeafen.")
					Default.muteChanged.Event:Once(function(p1)
						-- upvalues: Default (upval)
						if p1 ~= nil then
							Default:MuteAll(false, "AudioFocusManagement UGC")
						end
					end)
					Default:ShowVoiceUI()
					
					return
				else
					NewResult:info("UGC audio focus requested denied, preparing to deafen.")
					Default.muteChanged.Event:Once(function(p1)
						-- upvalues: Default (upval)
						if p1 ~= nil then
							Default:MuteAll(true, "AudioFocusManagement UGC")
						end
					end)
					Default:HideVoiceUI()
				end
			end):catch(function()
				-- upvalues: NewResult (upval)
				NewResult:info("[UGC] Error requesting focus inside UGCdatamodel")
			end)
		end
	end):catch(function()
		-- upvalues: NewResult (copy)
		NewResult:info("VCSM was not initialized [CEV ExperienceAudioFocusBinder]")
	end)
end