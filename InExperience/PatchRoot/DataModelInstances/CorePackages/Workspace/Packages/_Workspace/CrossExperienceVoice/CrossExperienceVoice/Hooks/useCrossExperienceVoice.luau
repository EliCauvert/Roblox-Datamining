local crossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local dependenciesModule = require(crossExperienceVoice.dependencies)
local playersService = game:GetService("Players")
local experienceService = dependenciesModule.ExperienceService.ExperienceService
local crossExperience = dependenciesModule.CrossExperience
local react = dependenciesModule.React
local roactUtils = dependenciesModule.RoactUtils
local useStore = roactUtils.Hooks.RoactRodux.useStore
local useDispatch = roactUtils.Hooks.RoactRodux.useDispatch
local sharedFlags = dependenciesModule.SharedFlags
local getFFlagEnableCrossExpVoiceMemoryCheck = sharedFlags.getFFlagEnableCrossExpVoiceMemoryCheck
local fIntPartyVoiceJoinRequestPulseCheckTimeout = sharedFlags.FIntPartyVoiceJoinRequestPulseCheckTimeout
local cevReadinessSyncEngineFeature = game:GetEngineFeature("CevReadinessSync")
local voiceStatusChanged = crossExperience.Actions.VoiceStatusChanged
local useEffect = react.useEffect
local loggerModule = require(crossExperienceVoice.Logger)
local default = require(crossExperienceVoice.CrossExperienceVoiceManager).default
local default_1 = require(crossExperienceVoice.CrossExperienceVoiceAnalytics).default
local flagsModule = require(crossExperienceVoice.Flags)
local fFlagFireErrorRCCTimeoutSignal = flagsModule.FFlagFireErrorRCCTimeoutSignal
local fFlagEnableCEVForceInitialize = flagsModule.FFlagEnableCEVForceInitialize

local _ = function()
	-- upvalues: crossExperience (ref)
	return if game.PlaceId == 0 then crossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else crossExperience.Constants.EXPERIENCE_TYPE_UGC
end

return function(vectorA)
	-- upvalues: useStore (ref), useDispatch (ref), react (ref), crossExperience (ref), loggerModule (ref), default (ref), voiceStatusChanged (ref), default_1 (ref), playersService (ref), fIntPartyVoiceJoinRequestPulseCheckTimeout (ref), fFlagFireErrorRCCTimeoutSignal (ref), getFFlagEnableCrossExpVoiceMemoryCheck (ref), cevReadinessSyncEngineFeature (ref), experienceService (ref), fFlagEnableCEVForceInitialize (ref), useEffect (ref)
	local var6 = useStore()
	local var7 = useDispatch()
	local var8 = react.useRef(nil)
	local var9 = react.useRef(nil)
	local var10 = react.useRef(nil)
	local var11 = react.useRef(nil)
	local var12 = react.useRef(nil)
	local var13 = react.useRef(nil)
	local var14 = react.useRef(nil)
	local var15 = react.useRef(nil)
	local var16 = react.useRef(nil)
	local var17 = react.useMemo(function()
		-- upvalues: crossExperience (copy)
		return crossExperience.EventManager.new(if game.PlaceId == 0 then crossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else crossExperience.Constants.EXPERIENCE_TYPE_UGC, true)
	end, {})
	local var18 = react.useRef(false)
	
	local _ = function()
		-- upvalues: var18 (ref), var17 (ref), var6 (ref), loggerModule (copy)
		if var18.current then
			return
		end
		var18.current = true
		var17:subscribe(var6, loggerModule)
	end
	
	local _ = function()
		-- upvalues: var18 (ref), var17 (ref), var6 (ref), loggerModule (copy)
		if var18.current then
			var18.current = false
			var17:unsubscribe(var6, loggerModule)
			
			return
		end
	end
	
	local var19 = function()
		-- upvalues: var18 (ref), var17 (ref), var6 (ref), loggerModule (copy), var9 (ref), var10 (ref), var11 (ref), var14 (ref), var15 (ref), var16 (ref), var8 (ref)
		if var18.current then
			var18.current = false
			var17:unsubscribe(var6, loggerModule)
		end
		if var9.current then
			var9.current:Disconnect()
			var9.current = nil
		end
		if var10.current then
			var10.current:Disconnect()
			var10.current = nil
		end
		if var11.current then
			var11.current:Disconnect()
			var11.current = nil
		end
		if var14.current then
			var14.current:Disconnect()
			var14.current = nil
		end
		if var15.current then
			var15.current:Disconnect()
			var15.current = nil
		end
		if var16.current then
			var16.current:Disconnect()
			var16.current = nil
		end
		if var8.current then
			var8.current:Disconnect()
			var8.current = nil
		end
	end
	
	local var20 = function()
		-- upvalues: var14 (ref), default (copy), var7 (ref), voiceStatusChanged (copy), crossExperience (copy), default_1 (copy), playersService (copy), fIntPartyVoiceJoinRequestPulseCheckTimeout (copy), var8 (ref), var6 (ref), fFlagFireErrorRCCTimeoutSignal (copy), var17 (ref), vectorA (ref), var15 (ref), getFFlagEnableCrossExpVoiceMemoryCheck (copy), var16 (ref), var9 (ref), var18 (ref), loggerModule (copy), cevReadinessSyncEngineFeature (copy), var10 (ref), var11 (ref), experienceService (copy), var12 (ref), var13 (ref), fFlagEnableCEVForceInitialize (copy)
		var14.current = default.JoinRequested.Event:Connect(function()
			-- upvalues: var7 (copy), voiceStatusChanged (copy), crossExperience (copy), default_1 (copy), playersService (copy)
			var7(voiceStatusChanged({
				status = crossExperience.Constants.VOICE_STATUS.RCC_CONNECTING
			}))
			default_1:logPartyVoiceStatusChanged({
				voiceChannelId = nil,
				voiceSessionId = nil,
				status = crossExperience.Constants.VOICE_STATUS.RCC_CONNECTING,
				userId = if playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else ""
			})
		end)
		
		if fIntPartyVoiceJoinRequestPulseCheckTimeout > 0 then
			var8.current = default.JoinRequestPulseCheck.Event:Connect(function()
				-- upvalues: var6 (copy), crossExperience (copy), fFlagFireErrorRCCTimeoutSignal (copy), var17 (copy), playersService (copy), var7 (copy), voiceStatusChanged (copy), vectorA (copy), default (copy)
				local state = var6:getState()
				
				if state and state.Squad and (state.Squad.CrossExperienceVoice and state.Squad.CrossExperienceVoice.Experience.voiceStatus == crossExperience.Constants.VOICE_STATUS.RCC_CONNECTING) then
					if fFlagFireErrorRCCTimeoutSignal then
						var17:notify(crossExperience.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
							status = crossExperience.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT,
							userId = if playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else ""
						})
						
						return
					end
					var7(voiceStatusChanged({
						status = crossExperience.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT
					}))
					
					if vectorA and vectorA.handleRCCConnectionTimeout then
						default:logPartyVoiceTimeout()
						default:leave()
					end
				end
			end)
		end
		var15.current = default.JoinRequestSubmitted.Event:Connect(function(p0)
			-- upvalues: var7 (copy), voiceStatusChanged (copy), crossExperience (copy), default_1 (copy), playersService (copy)
			if not p0 then
				var7(voiceStatusChanged({
					status = crossExperience.Constants.VOICE_STATUS.ERROR_START_BACKGROUND_DM
				}))
				default_1:logPartyVoiceStatusChanged({
					voiceChannelId = nil,
					voiceSessionId = nil,
					status = crossExperience.Constants.VOICE_STATUS.ERROR_START_BACKGROUND_DM,
					userId = if playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else ""
				})
			end
		end)
		
		if getFFlagEnableCrossExpVoiceMemoryCheck() then
			var16.current = default.JoinFeasibilityCheckPerformed.Event:Connect(function(p1)
				-- upvalues: var7 (copy), voiceStatusChanged (copy), crossExperience (copy), default_1 (copy), playersService (copy)
				if not p1 then
					var7(voiceStatusChanged({
						status = crossExperience.Constants.VOICE_STATUS.ERROR_JOIN_FEASIBILITY_CHECK_FAILED
					}))
					default_1:logPartyVoiceStatusChanged({
						voiceChannelId = nil,
						voiceSessionId = nil,
						status = crossExperience.Constants.VOICE_STATUS.ERROR_JOIN_FEASIBILITY_CHECK_FAILED,
						userId = if playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else ""
					})
				end
			end)
		end
		var9.current = default.ExperienceJoined.Event:Connect(function()
			-- upvalues: var18 (copy), var17 (copy), var6 (copy), loggerModule (copy), cevReadinessSyncEngineFeature (copy), default (copy)
			if not var18.current then
				var18.current = true
				var17:subscribe(var6, loggerModule)
			end
			if cevReadinessSyncEngineFeature then
				default:signalCevReadinessSync()
			end
		end)
		var10.current = default.ExperienceJoinFailed.Event:Connect(function()
			-- upvalues: var18 (copy), var17 (copy), var6 (copy), loggerModule (copy)
			if var18.current then
				var18.current = false
				var17:unsubscribe(var6, loggerModule)
				
				return
			end
		end)
		var11.current = default.ExperienceLeft.Event:Connect(function()
			-- upvalues: var18 (copy), var17 (copy), var6 (copy), loggerModule (copy)
			if var18.current then
				var18.current = false
				var17:unsubscribe(var6, loggerModule)
				
				return
			end
		end)
		
		if experienceService then
			var12.current = experienceService:RegisterForExperienceJoin(function()
				-- upvalues: var18 (copy), var17 (copy), var6 (copy), loggerModule (copy)
				if game.PlaceId == 0 then
					if not var18.current then return end
					var18.current = false
					var17:unsubscribe(var6, loggerModule)
				end
			end)
			var13.current = experienceService:RegisterForExperienceLeave(function()
				-- upvalues: var17 (copy), var6 (copy), loggerModule (copy)
				if game.PlaceId == 0 then
					var17:restoreStateFromBackground(var6, loggerModule)
				end
			end)
		end
		if fFlagEnableCEVForceInitialize and vectorA and vectorA.forceInitializeStoreOnMount then
			if var18.current then return end
			var18.current = true
			var17:subscribe(var6, loggerModule)
		end
	end
	
	useEffect(function()
		-- upvalues: var20 (ref), var19 (ref)
		var20()
		
		return function()
			-- upvalues: var19 (copy)
			var19()
		end
	end, {})
	
	return nil
end