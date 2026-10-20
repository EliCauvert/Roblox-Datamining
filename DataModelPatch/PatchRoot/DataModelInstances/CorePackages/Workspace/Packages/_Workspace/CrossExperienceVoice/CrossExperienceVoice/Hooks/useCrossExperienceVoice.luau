local CrossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local DependenciesModule = require(CrossExperienceVoice.dependencies)
local Players = game:GetService("Players")
local ExperienceService = DependenciesModule.ExperienceService.ExperienceService
local CrossExperience = DependenciesModule.CrossExperience
local React = DependenciesModule.React
local RoactUtils = DependenciesModule.RoactUtils
local UseStoreFunction = RoactUtils.Hooks.RoactRodux.useStore
local UseDispatchFunction = RoactUtils.Hooks.RoactRodux.useDispatch
local SharedFlags = DependenciesModule.SharedFlags
local GetFFlagEnableCrossExpVoiceMemoryCheckFunction = SharedFlags.getFFlagEnableCrossExpVoiceMemoryCheck
local FIntPartyVoiceJoinRequestPulseCheckTimeout = SharedFlags.FIntPartyVoiceJoinRequestPulseCheckTimeout
local CevReadinessSyncEngineFeature = game:GetEngineFeature("CevReadinessSync")
local VoiceStatusChangedFunction = CrossExperience.Actions.VoiceStatusChanged
local UseEffectFunction = React.useEffect
local LoggerModule = require(CrossExperienceVoice.Logger)
local Default = require(CrossExperienceVoice.CrossExperienceVoiceManager).default
local Default1 = require(CrossExperienceVoice.CrossExperienceVoiceAnalytics).default
local FlagsModule = require(CrossExperienceVoice.Flags)
local FFlagFireErrorRCCTimeoutSignal = FlagsModule.FFlagFireErrorRCCTimeoutSignal
local FFlagEnableCEVForceInitialize = FlagsModule.FFlagEnableCEVForceInitialize

local function _()
	-- upvalues: CrossExperience (copy)
	return if game.PlaceId == 0 then CrossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else CrossExperience.Constants.EXPERIENCE_TYPE_UGC
end

return function(p1)
	-- upvalues: UseStoreFunction (copy), UseDispatchFunction (copy), React (copy), CrossExperience (copy), LoggerModule (copy), Default (copy), VoiceStatusChangedFunction (copy), Default1 (copy), Players (copy), FIntPartyVoiceJoinRequestPulseCheckTimeout (copy), FFlagFireErrorRCCTimeoutSignal (copy), GetFFlagEnableCrossExpVoiceMemoryCheckFunction (copy), CevReadinessSyncEngineFeature (copy), ExperienceService (copy), FFlagEnableCEVForceInitialize (copy), UseEffectFunction (copy)
	local UseStoreResult = UseStoreFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRefResult = React.useRef(nil)
	local UseRefResult1 = React.useRef(nil)
	local UseRefResult2 = React.useRef(nil)
	local UseRefResult3 = React.useRef(nil)
	local UseRefResult4 = React.useRef(nil)
	local UseRefResult5 = React.useRef(nil)
	local UseRefResult6 = React.useRef(nil)
	local UseRefResult7 = React.useRef(nil)
	local UseRefResult8 = React.useRef(nil)
	local UseMemoResult = React.useMemo(function()
		-- upvalues: CrossExperience (upval)
		return CrossExperience.EventManager.new(if game.PlaceId == 0 then CrossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else CrossExperience.Constants.EXPERIENCE_TYPE_UGC, true)
	end, {})
	local UseRefResult9 = React.useRef(false)
	
	local function _()
		-- upvalues: UseRefResult9 (copy), UseMemoResult (copy), UseStoreResult (copy), LoggerModule (upval)
		if not UseRefResult9.current then
			UseRefResult9.current = true
			UseMemoResult:subscribe(UseStoreResult, LoggerModule)
			
			return
		end
	end
	
	local _ = function()
		-- upvalues: UseRefResult9 (copy), UseMemoResult (copy), UseStoreResult (copy), LoggerModule (upval)
		if UseRefResult9.current then
			UseRefResult9.current = false
			UseMemoResult:unsubscribe(UseStoreResult, LoggerModule)
			
			return
		end
	end
	
	local function v32()
		-- upvalues: UseRefResult9 (copy), UseMemoResult (copy), UseStoreResult (copy), LoggerModule (upval), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult6 (copy), UseRefResult7 (copy), UseRefResult8 (copy), UseRefResult (copy)
		if UseRefResult9.current then
			UseRefResult9.current = false
			UseMemoResult:unsubscribe(UseStoreResult, LoggerModule)
		end
		if UseRefResult1.current then
			UseRefResult1.current:Disconnect()
			UseRefResult1.current = nil
		end
		if UseRefResult2.current then
			UseRefResult2.current:Disconnect()
			UseRefResult2.current = nil
		end
		if UseRefResult3.current then
			UseRefResult3.current:Disconnect()
			UseRefResult3.current = nil
		end
		if UseRefResult6.current then
			UseRefResult6.current:Disconnect()
			UseRefResult6.current = nil
		end
		if UseRefResult7.current then
			UseRefResult7.current:Disconnect()
			UseRefResult7.current = nil
		end
		if UseRefResult8.current then
			UseRefResult8.current:Disconnect()
			UseRefResult8.current = nil
		end
		if UseRefResult.current then
			UseRefResult.current:Disconnect()
			UseRefResult.current = nil
		end
	end
	
	local function v33()
		-- upvalues: UseRefResult6 (copy), Default (upval), UseDispatchResult (copy), VoiceStatusChangedFunction (upval), CrossExperience (upval), Default1 (upval), Players (upval), FIntPartyVoiceJoinRequestPulseCheckTimeout (upval), UseRefResult (copy), UseStoreResult (copy), FFlagFireErrorRCCTimeoutSignal (upval), UseMemoResult (copy), p1 (copy), UseRefResult7 (copy), GetFFlagEnableCrossExpVoiceMemoryCheckFunction (upval), UseRefResult8 (copy), UseRefResult1 (copy), UseRefResult9 (copy), LoggerModule (upval), CevReadinessSyncEngineFeature (upval), UseRefResult2 (copy), UseRefResult3 (copy), ExperienceService (upval), UseRefResult4 (copy), UseRefResult5 (copy), FFlagEnableCEVForceInitialize (upval)
		UseRefResult6.current = Default.JoinRequested.Event:Connect(function()
			-- upvalues: UseDispatchResult (upval), VoiceStatusChangedFunction (upval), CrossExperience (upval), Default1 (upval), Players (upval)
			UseDispatchResult(VoiceStatusChangedFunction({
				status = CrossExperience.Constants.VOICE_STATUS.RCC_CONNECTING
			}))
			Default1:logPartyVoiceStatusChanged({
				voiceChannelId = nil,
				voiceSessionId = nil,
				status = CrossExperience.Constants.VOICE_STATUS.RCC_CONNECTING,
				userId = if Players.LocalPlayer then tostring(Players.LocalPlayer.UserId) else ""
			})
		end)
		
		if FIntPartyVoiceJoinRequestPulseCheckTimeout > 0 then
			UseRefResult.current = Default.JoinRequestPulseCheck.Event:Connect(function()
				-- upvalues: UseStoreResult (upval), CrossExperience (upval), FFlagFireErrorRCCTimeoutSignal (upval), UseMemoResult (upval), Players (upval), UseDispatchResult (upval), VoiceStatusChangedFunction (upval), p1 (upval), Default (upval)
				local State = UseStoreResult:getState()
				
				if State and State.Squad and State.Squad.CrossExperienceVoice and State.Squad.CrossExperienceVoice.Experience.voiceStatus == CrossExperience.Constants.VOICE_STATUS.RCC_CONNECTING then
					if FFlagFireErrorRCCTimeoutSignal then
						UseMemoResult:notify(CrossExperience.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
							status = CrossExperience.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT,
							userId = if Players.LocalPlayer then tostring(Players.LocalPlayer.UserId) else ""
						})
						
						return
					end
					UseDispatchResult(VoiceStatusChangedFunction({
						status = CrossExperience.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT
					}))
					
					if p1 and p1.handleRCCConnectionTimeout then
						Default:logPartyVoiceTimeout()
						Default:leave()
					end
				end
			end)
		end
		UseRefResult7.current = Default.JoinRequestSubmitted.Event:Connect(function(p2)
			-- upvalues: UseDispatchResult (upval), VoiceStatusChangedFunction (upval), CrossExperience (upval), Default1 (upval), Players (upval)
			if not p2 then
				UseDispatchResult(VoiceStatusChangedFunction({
					status = CrossExperience.Constants.VOICE_STATUS.ERROR_START_BACKGROUND_DM
				}))
				Default1:logPartyVoiceStatusChanged({
					voiceChannelId = nil,
					voiceSessionId = nil,
					status = CrossExperience.Constants.VOICE_STATUS.ERROR_START_BACKGROUND_DM,
					userId = if Players.LocalPlayer then tostring(Players.LocalPlayer.UserId) else ""
				})
			end
		end)
		
		if GetFFlagEnableCrossExpVoiceMemoryCheckFunction() then
			UseRefResult8.current = Default.JoinFeasibilityCheckPerformed.Event:Connect(function(p2)
				-- upvalues: UseDispatchResult (upval), VoiceStatusChangedFunction (upval), CrossExperience (upval), Default1 (upval), Players (upval)
				if not p2 then
					UseDispatchResult(VoiceStatusChangedFunction({
						status = CrossExperience.Constants.VOICE_STATUS.ERROR_JOIN_FEASIBILITY_CHECK_FAILED
					}))
					Default1:logPartyVoiceStatusChanged({
						voiceChannelId = nil,
						voiceSessionId = nil,
						status = CrossExperience.Constants.VOICE_STATUS.ERROR_JOIN_FEASIBILITY_CHECK_FAILED,
						userId = if Players.LocalPlayer then tostring(Players.LocalPlayer.UserId) else ""
					})
				end
			end)
		end
		UseRefResult1.current = Default.ExperienceJoined.Event:Connect(function()
			-- upvalues: UseRefResult9 (upval), UseMemoResult (upval), UseStoreResult (upval), LoggerModule (upval), CevReadinessSyncEngineFeature (upval), Default (upval)
			if not UseRefResult9.current then
				UseRefResult9.current = true
				UseMemoResult:subscribe(UseStoreResult, LoggerModule)
			end
			if CevReadinessSyncEngineFeature then
				Default:signalCevReadinessSync()
			end
		end)
		UseRefResult2.current = Default.ExperienceJoinFailed.Event:Connect(function()
			-- upvalues: UseRefResult9 (upval), UseMemoResult (upval), UseStoreResult (upval), LoggerModule (upval)
			if UseRefResult9.current then
				UseRefResult9.current = false
				UseMemoResult:unsubscribe(UseStoreResult, LoggerModule)
				
				return
			end
		end)
		UseRefResult3.current = Default.ExperienceLeft.Event:Connect(function()
			-- upvalues: UseRefResult9 (upval), UseMemoResult (upval), UseStoreResult (upval), LoggerModule (upval)
			if UseRefResult9.current then
				UseRefResult9.current = false
				UseMemoResult:unsubscribe(UseStoreResult, LoggerModule)
				
				return
			end
		end)
		
		if ExperienceService then
			UseRefResult4.current = ExperienceService:RegisterForExperienceJoin(function()
				-- upvalues: UseRefResult9 (upval), UseMemoResult (upval), UseStoreResult (upval), LoggerModule (upval)
				if game.PlaceId == 0 then
					if not UseRefResult9.current then return end
					UseRefResult9.current = false
					UseMemoResult:unsubscribe(UseStoreResult, LoggerModule)
				end
			end)
			UseRefResult5.current = ExperienceService:RegisterForExperienceLeave(function()
				-- upvalues: UseMemoResult (upval), UseStoreResult (upval), LoggerModule (upval)
				if game.PlaceId == 0 then
					UseMemoResult:restoreStateFromBackground(UseStoreResult, LoggerModule)
				end
			end)
		end
		if FFlagEnableCEVForceInitialize and p1 and p1.forceInitializeStoreOnMount then
			if UseRefResult9.current then return end
			UseRefResult9.current = true
			UseMemoResult:subscribe(UseStoreResult, LoggerModule)
		end
	end
	
	UseEffectFunction(function()
		-- upvalues: v33 (copy), v32 (copy)
		v33()
		
		return function()
			-- upvalues: v32 (upval)
			v32()
		end
	end, {})
	
	return nil
end