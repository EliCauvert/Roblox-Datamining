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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
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

return function(p1)
	-- upvalues: useDispatch (ref), useAppPolicy (ref), useRoactService (ref), appLogging (ref), reactModule (ref), getFFlagEnhancedPersonaLivenessEvents (ref), biometricChallengeEventModule (ref), challengeEventConstantsModule (ref), biometricTypeEnum (ref), telemetryReasonsModule (ref), httpService (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), personaLivenessServiceWrapperModule (ref), livenessWithCallbackPollDelay (ref), livenessWithCallbackPollMaxRetries (ref), livenessBackgroundOnlyPollDelay (ref), livenessBackgroundOnlyPollMaxRetries (ref), usePollIDVStatus (ref), promiseModule (ref), IDVApiProvider (ref), personaLivenessHostedModule (ref), loading (ref), iconSize (ref)
	local var2 = useDispatch()
	local var3 = useAppPolicy(function(p2)
		return p2.getHasWebViewSupportForFAE()
	end)
	local var4 = useRoactService(appLogging)
	local var5, var6 = reactModule.useState(nil)
	local persona = reactModule.useRef("Persona")
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useCallback(function(p2, p3)
		-- upvalues: p1 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), var4 (ref), biometricChallengeEventModule (copy), challengeEventConstantsModule (copy), biometricTypeEnum (copy), var7 (ref)
		p1.onChallengeFailed(p2)
		
		if getFFlagEnhancedPersonaLivenessEvents() then
			var4:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
				context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
				challengeId = p1.challengeId,
				biometricType = biometricTypeEnum.PersonaLiveness,
				reason = p3,
				inquiryId = var7.current
			})
			
			return
		end
		var4:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
			context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
			challengeId = p1.challengeId,
			biometricType = biometricTypeEnum.PersonaLiveness
		})
	end, { var4, p1.challengeId, p1.onChallengeFailed })
	local var9 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), persona (ref), telemetryReasonsModule (copy), var4 (ref), biometricChallengeEventModule (copy), challengeEventConstantsModule (copy), biometricTypeEnum (copy), var7 (ref)
		p1.onChallengeAbandoned("")
		
		if getFFlagEnhancedPersonaLivenessEvents() then
			var4:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
				context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeAbandoned,
				challengeId = p1.challengeId,
				biometricType = biometricTypeEnum.PersonaLiveness,
				reason = if persona.current == "Hosted" then telemetryReasonsModule.HostedUserAbandon else telemetryReasonsModule.PersonaUserAbandon,
				inquiryId = var7.current
			})
			
			return
		end
		var4:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
			context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeAbandoned,
			challengeId = p1.challengeId,
			biometricType = biometricTypeEnum.PersonaLiveness
		})
	end, { var4, p1.challengeId, p1.onChallengeAbandoned })
	local var10 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), httpService (copy), biometricTypeEnum (copy), getFFlagEnhancedPersonaLivenessEvents (copy), persona (ref), telemetryReasonsModule (copy), var4 (ref), biometricChallengeEventModule (copy), challengeEventConstantsModule (copy), var7 (ref)
		p1.onChallengeCompleted(httpService:JSONEncode({ biometricType = biometricTypeEnum.PersonaLiveness }))
		
		if getFFlagEnhancedPersonaLivenessEvents() then
			var4:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
				context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeCompleted,
				challengeId = p1.challengeId,
				biometricType = biometricTypeEnum.PersonaLiveness,
				reason = if persona.current == "Hosted" then telemetryReasonsModule.HostedCompleted else telemetryReasonsModule.PersonaCompleted,
				inquiryId = var7.current
			})
			
			return
		end
		var4:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
			context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeCompleted,
			challengeId = p1.challengeId,
			biometricType = biometricTypeEnum.PersonaLiveness
		})
	end, { var4, p1.challengeId, p1.onChallengeCompleted })
	local var11 = reactModule.useCallback(function(p2, p3)
		-- upvalues: appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateDown (copy)
		local t = {
			name = appPage.GenericWebPage,
			detail = p2,
			extraProps = {
				title = "",
				onClose = function()
					-- upvalues: p3 (ref)
					p3()
				end
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var2(navigateDown(t))
	end, { var2 })
	local var12 = reactModule.useMemo(function()
		-- upvalues: personaLivenessServiceWrapperModule (copy), var3 (ref), livenessWithCallbackPollDelay (copy), livenessWithCallbackPollMaxRetries (copy), livenessBackgroundOnlyPollDelay (copy), livenessBackgroundOnlyPollMaxRetries (copy)
		return if personaLivenessServiceWrapperModule.isAvailable() or var3 then {
			delay = livenessWithCallbackPollDelay,
			retries = livenessWithCallbackPollMaxRetries
		} else {
			delay = livenessBackgroundOnlyPollDelay,
			retries = livenessBackgroundOnlyPollMaxRetries
		}
	end)
	local var13, var14 = usePollIDVStatus({ delay = var12.delay, retries = var12.retries })
	local var15 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref), personaLivenessServiceWrapperModule (copy), persona (ref), getFFlagEnhancedPersonaLivenessEvents (copy), var4 (ref), biometricChallengeEventModule (copy), challengeEventConstantsModule (copy), p1 (ref), biometricTypeEnum (copy), telemetryReasonsModule (copy), var3 (ref), promiseModule (copy), var11 (ref), var6 (ref)
		local sessionIdentifier = p2.sessionIdentifier
		local sessionToken = p2.sessionToken
		var7.current = sessionIdentifier
		
		if personaLivenessServiceWrapperModule.isAvailable() then
			persona.current = "Persona"
			
			if getFFlagEnhancedPersonaLivenessEvents() then
				var4:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
					context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeDisplayed,
					challengeId = p1.challengeId,
					biometricType = biometricTypeEnum.PersonaLiveness,
					reason = telemetryReasonsModule.PersonaDisplayed,
					inquiryId = sessionIdentifier
				})
			end
			return personaLivenessServiceWrapperModule.startFlow(sessionIdentifier, sessionToken)
		elseif var3 then
			persona.current = "Hosted"
			
			if getFFlagEnhancedPersonaLivenessEvents() then
				var4:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
					context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeDisplayed,
					challengeId = p1.challengeId,
					biometricType = biometricTypeEnum.PersonaLiveness,
					reason = telemetryReasonsModule.HostedDisplayed,
					inquiryId = sessionIdentifier
				})
			end
			return promiseModule.new(function(p3)
				-- upvalues: sessionIdentifier (ref), var11 (copy), p2 (ref)
				var11(p2.verificationLink, function()
					-- upvalues: p3 (ref), sessionIdentifier (copy)
					p3(sessionIdentifier)
				end)
			end)
		else
			persona.current = "Hosted"
			
			if getFFlagEnhancedPersonaLivenessEvents() then
				var4:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
					context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeDisplayed,
					challengeId = p1.challengeId,
					biometricType = biometricTypeEnum.PersonaLiveness,
					reason = telemetryReasonsModule.HostedDisplayed,
					inquiryId = sessionIdentifier
				})
			end
			var6(p2.verificationLink)
			
			return promiseModule.resolve(sessionIdentifier)
		end
	end, { var3, var11, var4, p1.challengeId })
	reactModule.useEffect(function()
		-- upvalues: IDVApiProvider (copy), var15 (ref), var13 (ref), var10 (ref), var9 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), persona (ref), telemetryReasonsModule (copy), var8 (ref), var14 (ref)
		IDVApiProvider.startLivenessVerification():andThen(function(p2)
			return p2
		end):andThen(function(p2)
			-- upvalues: var15 (copy)
			return var15(p2)
		end):andThen(function(p2)
			-- upvalues: var13 (copy)
			return var13(p2)
		end):andThen(function()
			-- upvalues: var10 (copy)
			return var10()
		end):catch(function(p2)
			-- upvalues: var9 (copy), getFFlagEnhancedPersonaLivenessEvents (copy), persona (copy), telemetryReasonsModule (copy), var8 (copy)
			if p2 and p2.resultType == Enum.FacialAgeEstimationResultType.Cancel then
				var9()
				
				return
			elseif not getFFlagEnhancedPersonaLivenessEvents() then
				var8("Persona error")
				
				return
			end
			local _ = nil
			var8("Persona error", if p2 and p2.sessionStatus ~= nil then if persona.current == "Hosted" then telemetryReasonsModule.HostedPollingTimeout else telemetryReasonsModule.PersonaPollingTimeout else telemetryReasonsModule.StartLivenessFailed)
		end)
		
		return function()
			-- upvalues: var14 (copy)
			var14()
		end
	end, {})
	
	return if var5 then reactModule.createElement(personaLivenessHostedModule, {
		sessionId = "",
		webLink = var5,
		onCancel = function()
			-- upvalues: var9 (ref)
			var9()
		end
	}) else reactModule.createElement(loading, {
		size = iconSize.Medium,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end