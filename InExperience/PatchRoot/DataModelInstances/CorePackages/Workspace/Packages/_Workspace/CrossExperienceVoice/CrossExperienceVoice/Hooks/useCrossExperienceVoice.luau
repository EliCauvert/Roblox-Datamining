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
	local var1 = useStore()
	local var2 = useDispatch()
	local var3 = react.useRef(nil)
	local var4 = react.useRef(nil)
	local var5 = react.useRef(nil)
	local var6 = react.useRef(nil)
	local var7 = react.useRef(nil)
	local var8 = react.useRef(nil)
	local var9 = react.useRef(nil)
	local var10 = react.useRef(nil)
	local var11 = react.useRef(nil)
	local var12 = react.useMemo(function()
		-- upvalues: crossExperience (copy)
		return crossExperience.EventManager.new(if game.PlaceId == 0 then crossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else crossExperience.Constants.EXPERIENCE_TYPE_UGC, true)
	end, {})
	local var13 = react.useRef(false)
	
	local _ = function()
		-- upvalues: var13 (ref), var12 (ref), var1 (ref), loggerModule (copy)
		if var13.current then
			return
		end
		var13.current = true
		var12:subscribe(var1, loggerModule)
	end
	
	local _ = function()
		-- upvalues: var13 (ref), var12 (ref), var1 (ref), loggerModule (copy)
		if var13.current then
			var13.current = false
			var12:unsubscribe(var1, loggerModule)
			
			return
		end
	end
	
	local var14 = function()
		-- upvalues: var13 (ref), var12 (ref), var1 (ref), loggerModule (copy), var4 (ref), var5 (ref), var6 (ref), var9 (ref), var10 (ref), var11 (ref), var3 (ref)
		if var13.current then
			var13.current = false
			var12:unsubscribe(var1, loggerModule)
		end
		if var4.current then
			var4.current:Disconnect()
			var4.current = nil
		end
		if var5.current then
			var5.current:Disconnect()
			var5.current = nil
		end
		if var6.current then
			var6.current:Disconnect()
			var6.current = nil
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
		if var3.current then
			var3.current:Disconnect()
			var3.current = nil
		end
	end
	
	local var15 = function()
		-- upvalues: var9 (ref), default (copy), var2 (ref), voiceStatusChanged (copy), crossExperience (copy), default_1 (copy), playersService (copy), fIntPartyVoiceJoinRequestPulseCheckTimeout (copy), var3 (ref), var1 (ref), fFlagFireErrorRCCTimeoutSignal (copy), var12 (ref), vectorA (ref), var10 (ref), getFFlagEnableCrossExpVoiceMemoryCheck (copy), var11 (ref), var4 (ref), var13 (ref), loggerModule (copy), cevReadinessSyncEngineFeature (copy), var5 (ref), var6 (ref), experienceService (copy), var7 (ref), var8 (ref), fFlagEnableCEVForceInitialize (copy)
		var9.current = default.JoinRequested.Event:Connect(function()
			-- upvalues: var2 (copy), voiceStatusChanged (copy), crossExperience (copy), default_1 (copy), playersService (copy)
			var2(voiceStatusChanged({
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
			var3.current = default.JoinRequestPulseCheck.Event:Connect(function()
				-- upvalues: var1 (copy), crossExperience (copy), fFlagFireErrorRCCTimeoutSignal (copy), var12 (copy), playersService (copy), var2 (copy), voiceStatusChanged (copy), vectorA (copy), default (copy)
				local state = var1:getState()
				
				if state and state.Squad and (state.Squad.CrossExperienceVoice and state.Squad.CrossExperienceVoice.Experience.voiceStatus == crossExperience.Constants.VOICE_STATUS.RCC_CONNECTING) then
					if fFlagFireErrorRCCTimeoutSignal then
						var12:notify(crossExperience.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
							status = crossExperience.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT,
							userId = if playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else ""
						})
						
						return
					end
					var2(voiceStatusChanged({
						status = crossExperience.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT
					}))
					
					if vectorA and vectorA.handleRCCConnectionTimeout then
						default:logPartyVoiceTimeout()
						default:leave()
					end
				end
			end)
		end
		var10.current = default.JoinRequestSubmitted.Event:Connect(function(p1)
			-- upvalues: var2 (copy), voiceStatusChanged (copy), crossExperience (copy), default_1 (copy), playersService (copy)
			if not p1 then
				var2(voiceStatusChanged({
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
			var11.current = default.JoinFeasibilityCheckPerformed.Event:Connect(function(p1)
				-- upvalues: var2 (copy), voiceStatusChanged (copy), crossExperience (copy), default_1 (copy), playersService (copy)
				if not p1 then
					var2(voiceStatusChanged({
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
		var4.current = default.ExperienceJoined.Event:Connect(function()
			-- upvalues: var13 (copy), var12 (copy), var1 (copy), loggerModule (copy), cevReadinessSyncEngineFeature (copy), default (copy)
			if not var13.current then
				var13.current = true
				var12:subscribe(var1, loggerModule)
			end
			if cevReadinessSyncEngineFeature then
				default:signalCevReadinessSync()
			end
		end)
		var5.current = default.ExperienceJoinFailed.Event:Connect(function()
			-- upvalues: var13 (copy), var12 (copy), var1 (copy), loggerModule (copy)
			if var13.current then
				var13.current = false
				var12:unsubscribe(var1, loggerModule)
				
				return
			end
		end)
		var6.current = default.ExperienceLeft.Event:Connect(function()
			-- upvalues: var13 (copy), var12 (copy), var1 (copy), loggerModule (copy)
			if var13.current then
				var13.current = false
				var12:unsubscribe(var1, loggerModule)
				
				return
			end
		end)
		
		if experienceService then
			var7.current = experienceService:RegisterForExperienceJoin(function()
				-- upvalues: var13 (copy), var12 (copy), var1 (copy), loggerModule (copy)
				if game.PlaceId == 0 then
					if not var13.current then return end
					var13.current = false
					var12:unsubscribe(var1, loggerModule)
				end
			end)
			var8.current = experienceService:RegisterForExperienceLeave(function()
				-- upvalues: var12 (copy), var1 (copy), loggerModule (copy)
				if game.PlaceId == 0 then
					var12:restoreStateFromBackground(var1, loggerModule)
				end
			end)
		end
		if fFlagEnableCEVForceInitialize and vectorA and vectorA.forceInitializeStoreOnMount then
			if var13.current then return end
			var13.current = true
			var12:subscribe(var1, loggerModule)
		end
	end
	
	useEffect(function()
		-- upvalues: var15 (ref), var14 (ref)
		var15()
		
		return function()
			-- upvalues: var14 (copy)
			var14()
		end
	end, {})
	
	return nil
end