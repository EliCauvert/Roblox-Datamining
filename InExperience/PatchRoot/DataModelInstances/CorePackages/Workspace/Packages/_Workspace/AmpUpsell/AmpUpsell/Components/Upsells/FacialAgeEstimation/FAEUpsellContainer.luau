local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local Players = game:GetService("Players")
local AppLinking = require(Parent.RoactServiceTags).AppLinking
local ReactModule = require(Parent.React)
local PromiseModule = require(Parent.Promise)
local IDVApiProvider = require(Parent.IdentityVerification).IDVApiProvider
local UsePollIDVStatusFunction = require(Parent.IdentityVerification).usePollIDVStatus
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UrlUtilsModule = require(AmpUpsell.Common.UrlUtils)
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local FacialAgeEstimationServiceWrapperModule = require(script.Parent.FacialAgeEstimationServiceWrapper)
local FAEDirectLinkUpsellModule = require(script.Parent.FAEDirectLinkUpsell)
local FAEWithQRCodeUpsellModule = require(script.Parent.FAEWithQRCodeUpsell)
local FAEFailedModalModule = require(script.Parent.FAEFailedModal)
local FAELoadingModalModule = require(script.Parent.FAELoadingModal)
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local AuthMsgShownFunction = AuthAnalyticsModule.Events.authMsgShown
local AuthModalShownFunction = AuthAnalyticsModule.Events.authModalShown
local AuthFormInteractionFunction = AuthAnalyticsModule.Events.authFormInteraction
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local GetFFlagEnableRoactNetworkingForChallengeInteceptionModule = require(AmpUpsell.Flags.GetFFlagEnableRoactNetworkingForChallengeInteception)
local GetFFlagShowFAELoadingModalModule = require(AmpUpsell.Flags.GetFFlagShowFAELoadingModal)
local EnableFAECancellationAnalytics = game:DefineFastFlag("EnableFAECancellationAnalytics", false)
local EnableValidateFAEVerificationLink = game:DefineFastFlag("EnableValidateFAEVerificationLink", false)
local GetFFlagMoveAmpUpsellOffNavigateDownFunction = require(Parent.SharedFlags).GetFFlagMoveAmpUpsellOffNavigateDown
local GetFFlagEnableWebAmpWizardForFAEHandoffModule = require(AmpUpsell.Flags.GetFFlagEnableWebAmpWizardForFAEHandoff)
local GetFFlagEnableFAEQRCodeHandoffModule = require(AmpUpsell.Flags.GetFFlagEnableFAEQRCodeHandoff)
local LogEventOnceIfEnabledFunction = require(AmpUpsell.Common.LoggingUtils).logEventOnceIfEnabled
local FAEWithCallbackPollDelay = game:DefineFastInt("FAEWithCallbackPollDelay", 2)
local FAEWithCallbackPollMaxRetries = game:DefineFastInt("FAEWithCallbackPollMaxRetries", 5)
local FAEBackgroundOnlyPollDelay = game:DefineFastInt("FAEBackgroundOnlyPollDelay", 15)
local FAEBackgroundOnlyPollMaxRetries = game:DefineFastInt("FAEBackgroundOnlyPollMaxRetries", 40)
local FAEWithWebViewCallbackPollDelay = game:DefineFastInt("FAEWithWebViewCallbackPollDelay", 2)
local FAEWithWebViewCallbackPollMaxRetries = game:DefineFastInt("FAEWithWebViewCallbackPollMaxRetries", 15)

return function() --[[ Line: 76 | Named "FAEUpsellContainer" ]]
	-- upvalues: UseNavigationFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseAppPolicyFunction (copy), AppLinking (copy), GetFFlagEnableFAEQRCodeHandoffModule (copy), ReactModule (copy), AuthModalShownFunction (copy), AuthFormInteractionFunction (copy), AuthMsgShownFunction (copy), GetFFlagMoveAmpUpsellOffNavigateDownFunction (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), FacialAgeEstimationServiceWrapperModule (copy), FAEWithCallbackPollDelay (copy), FAEWithCallbackPollMaxRetries (copy), FAEBackgroundOnlyPollDelay (copy), FAEBackgroundOnlyPollMaxRetries (copy), GetFFlagEnableWebAmpWizardForFAEHandoffModule (copy), FAEWithWebViewCallbackPollDelay (copy), FAEWithWebViewCallbackPollMaxRetries (copy), UsePollIDVStatusFunction (copy), Players (copy), PromiseModule (copy), UrlUtilsModule (copy), EnableValidateFAEVerificationLink (copy), GetFFlagEnableRoactNetworkingForChallengeInteceptionModule (copy), LogEventOnceIfEnabledFunction (copy), IDVApiProvider (copy), EnableFAECancellationAnalytics (copy), FAEFailedModalModule (copy), FAEWithQRCodeUpsellModule (copy), FAEDirectLinkUpsellModule (copy), GetFFlagShowFAELoadingModalModule (copy), FAELoadingModalModule (copy), Loading (copy), IconSize (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1) --[[ Line: 81 ]]
		return p1.getHasWebViewSupportForFAE()
	end)
	local ExtraPropsParam = UseNavigationResult.getParam("extraProps")
	local EntryPointEventCtx = ExtraPropsParam.entryPointEventCtx
	local Metadata = ExtraPropsParam.metadata
	local SkipFacialAgeEstimationWebLinkModal = ExtraPropsParam.skipFacialAgeEstimationWebLinkModal
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppLinking)
	local OnSuccessFunction = ExtraPropsParam.onSuccess
	local OnCancelFunction = ExtraPropsParam.onCancel
	local OnFailure = ExtraPropsParam.onFailure
	local OnRetry = ExtraPropsParam.onRetry
	local FFlagEnableFAEQRCodeHandoffModule = UseAppPolicyResult and GetFFlagEnableFAEQRCodeHandoffModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	local SessionId = Metadata and Metadata.sessionId or ""
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(SessionId)
	local UseResult = ReactModule.useCallback(function(p1) --[[ Line: 108 ]]
		-- upvalues: AuthModalShownFunction (upval), EntryPointEventCtx (copy), UseStateResult2 (copy)
		AuthModalShownFunction(EntryPointEventCtx, p1, "faeFailed")
		UseStateResult2(true)
	end, { EntryPointEventCtx })
	local UseResult1 = ReactModule.useCallback(function(p1) --[[ Line: 113 ]]
		-- upvalues: AuthFormInteractionFunction (upval), EntryPointEventCtx (copy), OnCancelFunction (copy)
		AuthFormInteractionFunction(EntryPointEventCtx, p1, "faeCancelled")
		OnCancelFunction()
	end, { OnCancelFunction, EntryPointEventCtx })
	local UseResult2 = ReactModule.useCallback(function(p1) --[[ Line: 118 ]]
		-- upvalues: AuthMsgShownFunction (upval), EntryPointEventCtx (copy), OnSuccessFunction (copy)
		AuthMsgShownFunction(EntryPointEventCtx, p1, "faeSuccess")
		OnSuccessFunction()
	end, { OnSuccessFunction, EntryPointEventCtx })
	local UseResult3 = ReactModule.useCallback(function(Detail, Callback) --[[ Line: 123 ]]
		-- upvalues: GetFFlagMoveAmpUpsellOffNavigateDownFunction (upval), UseNavigationResult (copy), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		if GetFFlagMoveAmpUpsellOffNavigateDownFunction() then
			UseNavigationResult.push(AppPage.GenericWebPage, {
				detail = Detail,
				extraProps = {
					title = "",
					onClose = function() --[[ Line: 129 ]]
						-- upvalues: Callback (copy)
						Callback()
					end
				}
			})
			
			return
		end
		local config = {
			name = AppPage.GenericWebPage,
			detail = Detail,
			extraProps = {
				title = "",
				onClose = function() --[[ Line: 140 ]]
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
	end, {
		GetFFlagMoveAmpUpsellOffNavigateDownFunction() and UseNavigationResult or UseDispatchResult
	})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 153 ]]
		-- upvalues: FacialAgeEstimationServiceWrapperModule (upval), FAEWithCallbackPollDelay (upval), FAEWithCallbackPollMaxRetries (upval), FFlagEnableFAEQRCodeHandoffModule (copy), FAEBackgroundOnlyPollDelay (upval), FAEBackgroundOnlyPollMaxRetries (upval), UseAppPolicyResult (copy), GetFFlagEnableWebAmpWizardForFAEHandoffModule (upval), FAEWithWebViewCallbackPollDelay (upval), FAEWithWebViewCallbackPollMaxRetries (upval)
		return if FacialAgeEstimationServiceWrapperModule.isAvailable() then {
			delay = FAEWithCallbackPollDelay,
			retries = FAEWithCallbackPollMaxRetries
		} elseif FFlagEnableFAEQRCodeHandoffModule then {
			delay = FAEBackgroundOnlyPollDelay,
			retries = FAEBackgroundOnlyPollMaxRetries
		} elseif UseAppPolicyResult and not GetFFlagEnableWebAmpWizardForFAEHandoffModule() then {
			delay = FAEWithWebViewCallbackPollDelay,
			retries = FAEWithWebViewCallbackPollMaxRetries
		} else {
			delay = FAEBackgroundOnlyPollDelay,
			retries = FAEBackgroundOnlyPollMaxRetries
		}
	end, { UseAppPolicyResult, FFlagEnableFAEQRCodeHandoffModule })
	local UsePollIDVStatusResult, UsePollIDVStatusResult2 = UsePollIDVStatusFunction({
		delay = UseMemoResult.delay,
		retries = UseMemoResult.retries
	})
	local UseResult4 = ReactModule.useCallback(function(p1, p2) --[[ Line: 179 ]]
		-- upvalues: FacialAgeEstimationServiceWrapperModule (upval), AuthModalShownFunction (upval), EntryPointEventCtx (copy), UseStateResult2_3 (copy), FFlagEnableFAEQRCodeHandoffModule (copy), Players (upval), UseStateResult2_2 (copy), PromiseModule (upval), GetFFlagEnableWebAmpWizardForFAEHandoffModule (upval), UseStateResult2_1 (copy), UrlUtilsModule (upval), EnableValidateFAEVerificationLink (upval), UseAppPolicyResult (copy), UseResult3 (copy), SkipFacialAgeEstimationWebLinkModal (copy), UseRoactServiceResult1 (copy)
		local SessionIdentifier = p1.sessionIdentifier
		local VerificationLink = p1.verificationLink
		local SessionToken = p1.sessionToken
		
		if FacialAgeEstimationServiceWrapperModule.isAvailable() then
			AuthModalShownFunction(EntryPointEventCtx, p2, "nativeFae")
			UseStateResult2_3(true)
			
			return FacialAgeEstimationServiceWrapperModule.startFlow(SessionIdentifier, SessionToken)
		end
		if FFlagEnableFAEQRCodeHandoffModule then
			UseStateResult2_3(false)
			AuthModalShownFunction(EntryPointEventCtx, p2, "faeQRCodeHandoff")
			local Text = "roblox%3A%2F%2Fnavigation%2Famp_wizard%3Ffeature_name=TriggerFacialAgeEstimationRecourse%26namespace=account_identity%252FAgeCheck%26entry_point=" .. EntryPointEventCtx .. "%26user_id=" .. tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0)
			UseStateResult2_2("https://ro.blox.com/Ebh5" .. "?pid=QR_code&c=fae_onelink" .. "&is_retargeting=false" .. "&af_dp=" .. Text .. "&deep_link_value=" .. Text)
			
			return PromiseModule.resolve(SessionIdentifier)
		end
		if GetFFlagEnableWebAmpWizardForFAEHandoffModule() then
			AuthModalShownFunction(EntryPointEventCtx, p2, "webHandoffFAE")
			UseStateResult2_3(false)
			UseStateResult2_1(UrlUtilsModule.buildAmpWizardUrl("TriggerAgeVerifyRecourse", "social%2FUpsells", EntryPointEventCtx, "my%2Faccount"))
			
			return PromiseModule.resolve(SessionIdentifier)
		end
		if EnableValidateFAEVerificationLink and (not VerificationLink or VerificationLink == "") then
			return PromiseModule.reject("Invalid verification link")
		end
		AuthModalShownFunction(EntryPointEventCtx, p2, "noNativeFae")
		UseStateResult2_3(false)
		
		if UseAppPolicyResult then
			return PromiseModule.new(function(Callback) --[[ Line: 232 ]]
				-- upvalues: SessionIdentifier (copy), UseResult3 (upval), VerificationLink (copy)
				UseResult3(VerificationLink, function() --[[ Line: 233 ]]
					-- upvalues: Callback (copy), SessionIdentifier (upval)
					Callback(SessionIdentifier)
				end)
			end)
		end
		if SkipFacialAgeEstimationWebLinkModal then
			UseRoactServiceResult1:openURL(VerificationLink)
		else
			UseStateResult2_1(VerificationLink)
		end
		return PromiseModule.resolve(SessionIdentifier)
	end, {
		EntryPointEventCtx, UseAppPolicyResult, UseResult3, UseStateResult2_3,
		SkipFacialAgeEstimationWebLinkModal, UseRoactServiceResult1,
		FFlagEnableFAEQRCodeHandoffModule
	})
	ReactModule.useEffect(function() --[[ Line: 260 ]]
		-- upvalues: SessionId (copy), GetFFlagEnableRoactNetworkingForChallengeInteceptionModule (upval), LogEventOnceIfEnabledFunction (upval), IDVApiProvider (upval), UseRoactServiceResult (copy), UseStateResult2_5 (copy), UseResult4 (copy), UseStateResult2_4 (copy), UsePollIDVStatusResult (copy), UseResult2 (copy), EnableFAECancellationAnalytics (upval), UseResult1 (copy), UseResult (copy), UsePollIDVStatusResult2 (copy)
		local Text = SessionId
		
		if GetFFlagEnableRoactNetworkingForChallengeInteceptionModule() then
			LogEventOnceIfEnabledFunction("start_verification_init")
			IDVApiProvider.startVerificationWithWrappedNetworking(UseRoactServiceResult, { ageEstimation = true }):andThen(function(Result) --[[ Line: 265 ]]
				-- upvalues: Text (ref), UseStateResult2_5 (upval), LogEventOnceIfEnabledFunction (upval)
				Text = `{Text}_{Result.sessionIdentifier}`
				UseStateResult2_5(Text)
				LogEventOnceIfEnabledFunction("start_verification_end")
				
				return Result
			end):andThen(function(Result) --[[ Line: 271 ]]
				-- upvalues: LogEventOnceIfEnabledFunction (upval), UseResult4 (upval), Text (ref)
				LogEventOnceIfEnabledFunction("persona_flow_init")
				
				return UseResult4(Result, Text)
			end):andThen(function(Result) --[[ Line: 275 ]]
				-- upvalues: LogEventOnceIfEnabledFunction (upval), UseStateResult2_4 (upval), UsePollIDVStatusResult (upval)
				LogEventOnceIfEnabledFunction("persona_flow_end")
				UseStateResult2_4(true)
				LogEventOnceIfEnabledFunction("status_polling_init")
				
				return UsePollIDVStatusResult(Result)
			end):andThen(function() --[[ Line: 281 ]]
				-- upvalues: LogEventOnceIfEnabledFunction (upval), UseResult2 (upval), Text (ref)
				LogEventOnceIfEnabledFunction("status_polling_end")
				
				return UseResult2(Text)
			end):catch(function(Err) --[[ Line: 285 ]]
				-- upvalues: LogEventOnceIfEnabledFunction (upval), EnableFAECancellationAnalytics (upval), UseResult1 (upval), Text (ref), UseResult (upval)
				LogEventOnceIfEnabledFunction("status_polling_end")
				
				if EnableFAECancellationAnalytics and Err and Err.resultType == Enum.FacialAgeEstimationResultType.Cancel then
					UseResult1(Text)
					
					return
				else
					UseResult(Text)
				end
			end)
			
			return function() --[[ Line: 298 ]]
				-- upvalues: UsePollIDVStatusResult2 (upval)
				UsePollIDVStatusResult2()
			end
		else
			IDVApiProvider.startVerification({ ageEstimation = true }):andThen(function(Result) --[[ Line: 303 ]]
				-- upvalues: Text (ref), UseStateResult2_5 (upval)
				Text = `{Text}_{Result.sessionIdentifier}`
				UseStateResult2_5(Text)
				
				return Result
			end):andThen(function(Result) --[[ Line: 308 ]]
				-- upvalues: UseResult4 (upval), Text (ref)
				return UseResult4(Result, Text)
			end):andThen(function(Result) --[[ Line: 311 ]]
				-- upvalues: UseStateResult2_4 (upval), UsePollIDVStatusResult (upval)
				UseStateResult2_4(true)
				
				return UsePollIDVStatusResult(Result)
			end):andThen(function() --[[ Line: 315 ]]
				-- upvalues: UseResult2 (upval), Text (ref)
				return UseResult2(Text)
			end):catch(function(Err) --[[ Line: 318 ]]
				-- upvalues: EnableFAECancellationAnalytics (upval), UseResult1 (upval), Text (ref), UseResult (upval)
				if EnableFAECancellationAnalytics and Err and Err.resultType == Enum.FacialAgeEstimationResultType.Cancel then
					UseResult1(Text)
					
					return
				else
					UseResult(Text)
				end
			end)
			
			return function() --[[ Line: 330 ]]
				-- upvalues: UsePollIDVStatusResult2 (upval)
				UsePollIDVStatusResult2()
			end
		end
	end, {})
	
	return if UseStateResult then ReactModule.createElement(FAEFailedModalModule, {
		sessionId = UseStateResult6,
		entryPointEventCtx = EntryPointEventCtx,
		onClose = OnFailure,
		onRetry = OnRetry
	}) elseif UseStateResult3 then ReactModule.createElement(FAEWithQRCodeUpsellModule, {
		appsFlyerLink = UseStateResult3,
		sessionId = UseStateResult6,
		entryPointEventCtx = EntryPointEventCtx,
		onCancel = OnCancelFunction
	}) elseif UseStateResult1 then ReactModule.createElement(FAEDirectLinkUpsellModule, {
		sessionId = UseStateResult6,
		entryPointEventCtx = EntryPointEventCtx,
		webLink = UseStateResult1,
		onCancel = OnCancelFunction
	}) elseif GetFFlagShowFAELoadingModalModule() and (UseStateResult5 and not UseStateResult4) then ReactModule.createElement(FAELoadingModalModule, {
		sessionId = UseStateResult6,
		entryPointEventCtx = EntryPointEventCtx,
		onCancel = OnCancelFunction
	}) else ReactModule.createElement(Loading, {
		size = IconSize.Medium,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end