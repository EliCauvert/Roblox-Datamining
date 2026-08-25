local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local parent = genericChallenges.Parent
local httpService = game:GetService("HttpService")
local reactModule = require(parent.React)
local promiseModule = require(parent.Promise)
local appPage = require(parent.RobloxAppEnums).AppPage
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var4 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local identityVerificationModule = require(parent.IdentityVerification)
local IDVApiProvider = identityVerificationModule.IDVApiProvider
local usePollIDVStatus = identityVerificationModule.usePollIDVStatus
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local personaLivenessServiceWrapperModule = require(script.Parent.PersonaLivenessServiceWrapper)
local personaLivenessHostedModule = require(script.Parent.PersonaLivenessHosted)
local biometricTypeEnum = require(script.Parent.Parent.Common.Enums).BiometricTypeEnum
local telemetryReasonsModule = require(script.Parent.Parent.Common.TelemetryReasons)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appLogging = require(parent.RoactServiceTags).AppLogging
local biometricChallengeEventModule = require(script.Parent.Parent.Common.BiometricChallengeEvent)
local challengeEventConstantsModule = require(genericChallenges.Utils.ChallengeEventConstants)
local getFFlagEnhancedPersonaLivenessEvents = require(parent.SharedFlags).GetFFlagEnhancedPersonaLivenessEvents
local livenessWithCallbackPollDelay = game:DefineFastInt("LivenessWithCallbackPollDelay", 2)
local livenessWithCallbackPollMaxRetries = game:DefineFastInt("LivenessWithCallbackPollMaxRetries", 5)
local livenessBackgroundOnlyPollDelay = game:DefineFastInt("LivenessBackgroundOnlyPollDelay", 6)
local livenessBackgroundOnlyPollMaxRetries = game:DefineFastInt("LivenessBackgroundOnlyPollMaxRetries", 30)

return function(p0)
	-- upvalues: useDispatch (ref), useAppPolicy (ref), useRoactService (ref), appLogging (ref), reactModule (ref), getFFlagEnhancedPersonaLivenessEvents (ref), biometricChallengeEventModule (ref), challengeEventConstantsModule (ref), biometricTypeEnum (ref), telemetryReasonsModule (ref), httpService (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var4 (ref), navigateDown (ref), personaLivenessServiceWrapperModule (ref), livenessWithCallbackPollDelay (ref), livenessWithCallbackPollMaxRetries (ref), livenessBackgroundOnlyPollDelay (ref), livenessBackgroundOnlyPollMaxRetries (ref), usePollIDVStatus (ref), promiseModule (ref), IDVApiProvider (ref), personaLivenessHostedModule (ref), loading (ref), iconSize (ref)
	local var16 = useDispatch()
	local var17 = useAppPolicy(function(p1)
		return p1.getHasWebViewSupportForFAE()
	end)
	local var18 = useRoactService(appLogging)
	local var19, var20 = reactModule.useState(nil)
	local persona = reactModule.useRef("Persona")
	local var22 = reactModule.useRef(nil)
	local var23 = reactModule.useCallback(function(p2, p3)
		-- upvalues: p0 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), var18 (ref), biometricChallengeEventModule (copy), challengeEventConstantsModule (copy), biometricTypeEnum (copy), var22 (ref)
		p0.onChallengeFailed(p2)
		
		if getFFlagEnhancedPersonaLivenessEvents() then
			var18:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
				context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
				challengeId = p0.challengeId,
				biometricType = biometricTypeEnum.PersonaLiveness,
				reason = p3,
				inquiryId = var22.current
			})
			
			return
		end
		var18:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
			context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
			challengeId = p0.challengeId,
			biometricType = biometricTypeEnum.PersonaLiveness
		})
	end, { var18, p0.challengeId, p0.onChallengeFailed })
	local var24 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), persona (ref), telemetryReasonsModule (copy), var18 (ref), biometricChallengeEventModule (copy), challengeEventConstantsModule (copy), biometricTypeEnum (copy), var22 (ref)
		p0.onChallengeAbandoned("")
		
		if getFFlagEnhancedPersonaLivenessEvents() then
			var18:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
				context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeAbandoned,
				challengeId = p0.challengeId,
				biometricType = biometricTypeEnum.PersonaLiveness,
				reason = if persona.current == "Hosted" then telemetryReasonsModule.HostedUserAbandon else telemetryReasonsModule.PersonaUserAbandon,
				inquiryId = var22.current
			})
			
			return
		end
		var18:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
			context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeAbandoned,
			challengeId = p0.challengeId,
			biometricType = biometricTypeEnum.PersonaLiveness
		})
	end, { var18, p0.challengeId, p0.onChallengeAbandoned })
	local var25 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), httpService (copy), biometricTypeEnum (copy), getFFlagEnhancedPersonaLivenessEvents (copy), persona (ref), telemetryReasonsModule (copy), var18 (ref), biometricChallengeEventModule (copy), challengeEventConstantsModule (copy), var22 (ref)
		p0.onChallengeCompleted(httpService:JSONEncode({ biometricType = biometricTypeEnum.PersonaLiveness }))
		
		if getFFlagEnhancedPersonaLivenessEvents() then
			var18:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
				context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeCompleted,
				challengeId = p0.challengeId,
				biometricType = biometricTypeEnum.PersonaLiveness,
				reason = if persona.current == "Hosted" then telemetryReasonsModule.HostedCompleted else telemetryReasonsModule.PersonaCompleted,
				inquiryId = var22.current
			})
			
			return
		end
		var18:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
			context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeCompleted,
			challengeId = p0.challengeId,
			biometricType = biometricTypeEnum.PersonaLiveness
		})
	end, { var18, p0.challengeId, p0.onChallengeCompleted })
	local var26 = reactModule.useCallback(function(p4, p5)
		-- upvalues: appPage (copy), fFlagSignalsNavP3Dispatch (copy), var4 (copy), var16 (ref), navigateDown (copy)
		local t = {
			name = appPage.GenericWebPage,
			detail = p4,
			extraProps = {
				title = "",
				onClose = function()
					-- upvalues: p5 (ref)
					p5()
				end
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var4.down(var4.fromLegacyPage(t))
			
			return
		end
		var16(navigateDown(t))
	end, { var16 })
	local var27 = reactModule.useMemo(function()
		-- upvalues: personaLivenessServiceWrapperModule (copy), var17 (ref), livenessWithCallbackPollDelay (copy), livenessWithCallbackPollMaxRetries (copy), livenessBackgroundOnlyPollDelay (copy), livenessBackgroundOnlyPollMaxRetries (copy)
		return if personaLivenessServiceWrapperModule.isAvailable() or var17 then {
			delay = livenessWithCallbackPollDelay,
			retries = livenessWithCallbackPollMaxRetries
		} else {
			delay = livenessBackgroundOnlyPollDelay,
			retries = livenessBackgroundOnlyPollMaxRetries
		}
	end)
	local var28, var29 = usePollIDVStatus({ delay = var27.delay, retries = var27.retries })
	local var30 = reactModule.useCallback(function(p6)
		-- upvalues: var22 (ref), personaLivenessServiceWrapperModule (copy), persona (ref), getFFlagEnhancedPersonaLivenessEvents (copy), var18 (ref), biometricChallengeEventModule (copy), challengeEventConstantsModule (copy), p0 (ref), biometricTypeEnum (copy), telemetryReasonsModule (copy), var17 (ref), promiseModule (copy), var26 (ref), var20 (ref)
		local sessionIdentifier = p6.sessionIdentifier
		local sessionToken = p6.sessionToken
		var22.current = sessionIdentifier
		
		if personaLivenessServiceWrapperModule.isAvailable() then
			persona.current = "Persona"
			
			if getFFlagEnhancedPersonaLivenessEvents() then
				var18:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
					context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeDisplayed,
					challengeId = p0.challengeId,
					biometricType = biometricTypeEnum.PersonaLiveness,
					reason = telemetryReasonsModule.PersonaDisplayed,
					inquiryId = sessionIdentifier
				})
			end
			return personaLivenessServiceWrapperModule.startFlow(sessionIdentifier, sessionToken)
		elseif var17 then
			persona.current = "Hosted"
			
			if getFFlagEnhancedPersonaLivenessEvents() then
				var18:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
					context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeDisplayed,
					challengeId = p0.challengeId,
					biometricType = biometricTypeEnum.PersonaLiveness,
					reason = telemetryReasonsModule.HostedDisplayed,
					inquiryId = sessionIdentifier
				})
			end
			return promiseModule.new(function(p7)
				-- upvalues: sessionIdentifier (ref), var26 (copy), p6 (ref)
				var26(p6.verificationLink, function()
					-- upvalues: p7 (ref), sessionIdentifier (copy)
					p7(sessionIdentifier)
				end)
			end)
		else
			persona.current = "Hosted"
			
			if getFFlagEnhancedPersonaLivenessEvents() then
				var18:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
					context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeDisplayed,
					challengeId = p0.challengeId,
					biometricType = biometricTypeEnum.PersonaLiveness,
					reason = telemetryReasonsModule.HostedDisplayed,
					inquiryId = sessionIdentifier
				})
			end
			var20(p6.verificationLink)
			
			return promiseModule.resolve(sessionIdentifier)
		end
	end, { var17, var26, var18, p0.challengeId })
	reactModule.useEffect(function()
		-- upvalues: IDVApiProvider (copy), var30 (ref), var28 (ref), var25 (ref), var24 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), persona (ref), telemetryReasonsModule (copy), var23 (ref), var29 (ref)
		IDVApiProvider.startLivenessVerification():andThen(function(p11)
			return p11
		end):andThen(function(p10)
			-- upvalues: var30 (copy)
			return var30(p10)
		end):andThen(function(p9)
			-- upvalues: var28 (copy)
			return var28(p9)
		end):andThen(function()
			-- upvalues: var25 (copy)
			return var25()
		end):catch(function(p8)
			-- upvalues: var24 (copy), getFFlagEnhancedPersonaLivenessEvents (copy), persona (copy), telemetryReasonsModule (copy), var23 (copy)
			if p8 and p8.resultType == Enum.FacialAgeEstimationResultType.Cancel then
				var24()
				
				return
			elseif not getFFlagEnhancedPersonaLivenessEvents() then
				var23("Persona error")
				
				return
			end
			local _ = nil
			var23("Persona error", if p8 and p8.sessionStatus ~= nil then if persona.current == "Hosted" then telemetryReasonsModule.HostedPollingTimeout else telemetryReasonsModule.PersonaPollingTimeout else telemetryReasonsModule.StartLivenessFailed)
		end)
		
		return function()
			-- upvalues: var29 (copy)
			var29()
		end
	end, {})
	
	return if var19 then reactModule.createElement(personaLivenessHostedModule, {
		sessionId = "",
		webLink = var19,
		onCancel = function()
			-- upvalues: var24 (ref)
			var24()
		end
	}) else reactModule.createElement(loading, {
		size = iconSize.Medium,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end