local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local Parent = GenericChallenges.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local PromiseModule = require(Parent.Promise)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local IdentityVerificationModule = require(Parent.IdentityVerification)
local IDVApiProvider = IdentityVerificationModule.IDVApiProvider
local UsePollIDVStatusFunction = IdentityVerificationModule.usePollIDVStatus
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local PersonaLivenessServiceWrapperModule = require(script.Parent.PersonaLivenessServiceWrapper)
local PersonaLivenessHostedModule = require(script.Parent.PersonaLivenessHosted)
local BiometricTypeEnum = require(script.Parent.Parent.Common.Enums).BiometricTypeEnum
local TelemetryReasonsModule = require(script.Parent.Parent.Common.TelemetryReasons)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppLogging = require(Parent.RoactServiceTags).AppLogging
local BiometricChallengeEventModule = require(script.Parent.Parent.Common.BiometricChallengeEvent)
local ChallengeEventConstantsModule = require(GenericChallenges.Utils.ChallengeEventConstants)
local GetFFlagEnhancedPersonaLivenessEventsFunction = require(Parent.SharedFlags).GetFFlagEnhancedPersonaLivenessEvents
local LivenessWithCallbackPollDelay = game:DefineFastInt("LivenessWithCallbackPollDelay", 2)
local LivenessWithCallbackPollMaxRetries = game:DefineFastInt("LivenessWithCallbackPollMaxRetries", 5)
local LivenessBackgroundOnlyPollDelay = game:DefineFastInt("LivenessBackgroundOnlyPollDelay", 6)
local LivenessBackgroundOnlyPollMaxRetries = game:DefineFastInt("LivenessBackgroundOnlyPollMaxRetries", 30)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseAppPolicyFunction (copy), UseRoactServiceFunction (copy), AppLogging (copy), ReactModule (copy), GetFFlagEnhancedPersonaLivenessEventsFunction (copy), BiometricChallengeEventModule (copy), ChallengeEventConstantsModule (copy), BiometricTypeEnum (copy), TelemetryReasonsModule (copy), HttpService (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), PersonaLivenessServiceWrapperModule (copy), LivenessWithCallbackPollDelay (copy), LivenessWithCallbackPollMaxRetries (copy), LivenessBackgroundOnlyPollDelay (copy), LivenessBackgroundOnlyPollMaxRetries (copy), UsePollIDVStatusFunction (copy), PromiseModule (copy), IDVApiProvider (copy), PersonaLivenessHostedModule (copy), Loading (copy), IconSize (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getHasWebViewSupportForFAE()
	end)
	local UseRoactServiceResult = UseRoactServiceFunction(AppLogging)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local Persona = ReactModule.useRef("Persona")
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(p2, Reason)
		-- upvalues: p1 (copy), GetFFlagEnhancedPersonaLivenessEventsFunction (upval), UseRoactServiceResult (copy), BiometricChallengeEventModule (upval), ChallengeEventConstantsModule (upval), BiometricTypeEnum (upval), UseRefResult (copy)
		p1.onChallengeFailed(p2)
		
		if GetFFlagEnhancedPersonaLivenessEventsFunction() then
			UseRoactServiceResult:logRobloxTelemetryEvent(BiometricChallengeEventModule, {}, {
				context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
				challengeId = p1.challengeId,
				biometricType = BiometricTypeEnum.PersonaLiveness,
				reason = Reason,
				inquiryId = UseRefResult.current
			})
			
			return
		else
			UseRoactServiceResult:logRobloxTelemetryEvent(BiometricChallengeEventModule, {}, {
				context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
				challengeId = p1.challengeId,
				biometricType = BiometricTypeEnum.PersonaLiveness
			})
		end
	end, {
		UseRoactServiceResult,
		p1.challengeId,
		p1.onChallengeFailed
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), GetFFlagEnhancedPersonaLivenessEventsFunction (upval), Persona (copy), TelemetryReasonsModule (upval), UseRoactServiceResult (copy), BiometricChallengeEventModule (upval), ChallengeEventConstantsModule (upval), BiometricTypeEnum (upval), UseRefResult (copy)
		p1.onChallengeAbandoned("")
		
		if GetFFlagEnhancedPersonaLivenessEventsFunction() then
			UseRoactServiceResult:logRobloxTelemetryEvent(BiometricChallengeEventModule, {}, {
				context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeAbandoned,
				challengeId = p1.challengeId,
				biometricType = BiometricTypeEnum.PersonaLiveness,
				reason = if Persona.current == "Hosted" then TelemetryReasonsModule.HostedUserAbandon else TelemetryReasonsModule.PersonaUserAbandon,
				inquiryId = UseRefResult.current
			})
			
			return
		else
			UseRoactServiceResult:logRobloxTelemetryEvent(BiometricChallengeEventModule, {}, {
				context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeAbandoned,
				challengeId = p1.challengeId,
				biometricType = BiometricTypeEnum.PersonaLiveness
			})
		end
	end, {
		UseRoactServiceResult,
		p1.challengeId,
		p1.onChallengeAbandoned
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), HttpService (upval), BiometricTypeEnum (upval), GetFFlagEnhancedPersonaLivenessEventsFunction (upval), Persona (copy), TelemetryReasonsModule (upval), UseRoactServiceResult (copy), BiometricChallengeEventModule (upval), ChallengeEventConstantsModule (upval), UseRefResult (copy)
		p1.onChallengeCompleted(HttpService:JSONEncode({ biometricType = BiometricTypeEnum.PersonaLiveness }))
		
		if GetFFlagEnhancedPersonaLivenessEventsFunction() then
			UseRoactServiceResult:logRobloxTelemetryEvent(BiometricChallengeEventModule, {}, {
				context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeCompleted,
				challengeId = p1.challengeId,
				biometricType = BiometricTypeEnum.PersonaLiveness,
				reason = if Persona.current == "Hosted" then TelemetryReasonsModule.HostedCompleted else TelemetryReasonsModule.PersonaCompleted,
				inquiryId = UseRefResult.current
			})
			
			return
		else
			UseRoactServiceResult:logRobloxTelemetryEvent(BiometricChallengeEventModule, {}, {
				context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeCompleted,
				challengeId = p1.challengeId,
				biometricType = BiometricTypeEnum.PersonaLiveness
			})
		end
	end, {
		UseRoactServiceResult,
		p1.challengeId,
		p1.onChallengeCompleted
	})
	local UseResult3 = ReactModule.useCallback(function(Detail, Callback)
		-- upvalues: AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		local config = {
			name = AppPage.GenericWebPage,
			detail = Detail,
			extraProps = {
				title = "",
				onClose = function()
					-- upvalues: Callback (copy)
					Callback()
				end
			}
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, { UseDispatchResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PersonaLivenessServiceWrapperModule (upval), UseAppPolicyResult (copy), LivenessWithCallbackPollDelay (upval), LivenessWithCallbackPollMaxRetries (upval), LivenessBackgroundOnlyPollDelay (upval), LivenessBackgroundOnlyPollMaxRetries (upval)
		return if PersonaLivenessServiceWrapperModule.isAvailable() or UseAppPolicyResult then {
			delay = LivenessWithCallbackPollDelay,
			retries = LivenessWithCallbackPollMaxRetries
		} else {
			delay = LivenessBackgroundOnlyPollDelay,
			retries = LivenessBackgroundOnlyPollMaxRetries
		}
	end)
	local UsePollIDVStatusResult, UsePollIDVStatusResult2 = UsePollIDVStatusFunction({
		delay = UseMemoResult.delay,
		retries = UseMemoResult.retries
	})
	local UseResult4 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult (copy), PersonaLivenessServiceWrapperModule (upval), Persona (copy), GetFFlagEnhancedPersonaLivenessEventsFunction (upval), UseRoactServiceResult (copy), BiometricChallengeEventModule (upval), ChallengeEventConstantsModule (upval), p1 (copy), BiometricTypeEnum (upval), TelemetryReasonsModule (upval), UseAppPolicyResult (copy), PromiseModule (upval), UseResult3 (copy), UseStateResult2 (copy)
		local SessionIdentifier = p2.sessionIdentifier
		local SessionToken = p2.sessionToken
		UseRefResult.current = SessionIdentifier
		
		if PersonaLivenessServiceWrapperModule.isAvailable() then
			Persona.current = "Persona"
			
			if GetFFlagEnhancedPersonaLivenessEventsFunction() then
				UseRoactServiceResult:logRobloxTelemetryEvent(BiometricChallengeEventModule, {}, {
					context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeDisplayed,
					challengeId = p1.challengeId,
					biometricType = BiometricTypeEnum.PersonaLiveness,
					reason = TelemetryReasonsModule.PersonaDisplayed,
					inquiryId = SessionIdentifier
				})
			end
			return PersonaLivenessServiceWrapperModule.startFlow(SessionIdentifier, SessionToken)
		elseif UseAppPolicyResult then
			Persona.current = "Hosted"
			
			if GetFFlagEnhancedPersonaLivenessEventsFunction() then
				UseRoactServiceResult:logRobloxTelemetryEvent(BiometricChallengeEventModule, {}, {
					context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeDisplayed,
					challengeId = p1.challengeId,
					biometricType = BiometricTypeEnum.PersonaLiveness,
					reason = TelemetryReasonsModule.HostedDisplayed,
					inquiryId = SessionIdentifier
				})
			end
			return PromiseModule.new(function(Callback)
				-- upvalues: SessionIdentifier (copy), UseResult3 (upval), p2 (copy)
				UseResult3(p2.verificationLink, function()
					-- upvalues: Callback (copy), SessionIdentifier (upval)
					Callback(SessionIdentifier)
				end)
			end)
		else
			Persona.current = "Hosted"
			
			if GetFFlagEnhancedPersonaLivenessEventsFunction() then
				UseRoactServiceResult:logRobloxTelemetryEvent(BiometricChallengeEventModule, {}, {
					context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeDisplayed,
					challengeId = p1.challengeId,
					biometricType = BiometricTypeEnum.PersonaLiveness,
					reason = TelemetryReasonsModule.HostedDisplayed,
					inquiryId = SessionIdentifier
				})
			end
			UseStateResult2(p2.verificationLink)
			
			return PromiseModule.resolve(SessionIdentifier)
		end
	end, {
		UseAppPolicyResult,
		UseResult3,
		UseRoactServiceResult,
		p1.challengeId
	})
	ReactModule.useEffect(function()
		-- upvalues: IDVApiProvider (upval), UseResult4 (copy), UsePollIDVStatusResult (copy), UseResult2 (copy), UseResult1 (copy), GetFFlagEnhancedPersonaLivenessEventsFunction (upval), Persona (copy), TelemetryReasonsModule (upval), UseResult (copy), UsePollIDVStatusResult2 (copy)
		IDVApiProvider.startLivenessVerification():andThen(function(Result)
			return Result
		end):andThen(function(Result)
			-- upvalues: UseResult4 (upval)
			return UseResult4(Result)
		end):andThen(function(Result)
			-- upvalues: UsePollIDVStatusResult (upval)
			return UsePollIDVStatusResult(Result)
		end):andThen(function()
			-- upvalues: UseResult2 (upval)
			return UseResult2()
		end):catch(function(Err)
			-- upvalues: UseResult1 (upval), GetFFlagEnhancedPersonaLivenessEventsFunction (upval), Persona (upval), TelemetryReasonsModule (upval), UseResult (upval)
			if Err and Err.resultType == Enum.FacialAgeEstimationResultType.Cancel then
				UseResult1()
				
				return
			end
			if GetFFlagEnhancedPersonaLivenessEventsFunction() then
				UseResult("Persona error", if Err and Err.sessionStatus ~= nil then if Persona.current == "Hosted" then TelemetryReasonsModule.HostedPollingTimeout else TelemetryReasonsModule.PersonaPollingTimeout else TelemetryReasonsModule.StartLivenessFailed)
				
				return
			else
				UseResult("Persona error")
			end
		end)
		
		return function()
			-- upvalues: UsePollIDVStatusResult2 (upval)
			UsePollIDVStatusResult2()
		end
	end, {})
	
	return if UseStateResult then ReactModule.createElement(PersonaLivenessHostedModule, {
		sessionId = "",
		webLink = UseStateResult,
		onCancel = function()
			-- upvalues: UseResult1 (copy)
			UseResult1()
		end
	}) else ReactModule.createElement(Loading, {
		size = IconSize.Medium,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end