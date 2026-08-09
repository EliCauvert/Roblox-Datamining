local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local playersService = game:GetService("Players")
local appLinking = require(parent.RoactServiceTags).AppLinking
local reactModule = require(parent.React)
local promiseModule = require(parent.Promise)
local IDVApiProvider = require(parent.IdentityVerification).IDVApiProvider
local usePollIDVStatus = require(parent.IdentityVerification).usePollIDVStatus
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local useNavigation = require(parent.Navigation).useNavigation
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local appPage = require(parent.RobloxAppEnums).AppPage
local urlUtilsModule = require(ampUpsell.Common.UrlUtils)
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var6 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local facialAgeEstimationServiceWrapperModule = require(script.Parent.FacialAgeEstimationServiceWrapper)
local FAEDirectLinkUpsellModule = require(script.Parent.FAEDirectLinkUpsell)
local FAEWithQRCodeUpsellModule = require(script.Parent.FAEWithQRCodeUpsell)
local FAEFailedModalModule = require(script.Parent.FAEFailedModal)
local FAELoadingModalModule = require(script.Parent.FAELoadingModal)
local authAnalyticsModule = require(parent.AuthAnalytics)
local authMsgShown = authAnalyticsModule.Events.authMsgShown
local authModalShown = authAnalyticsModule.Events.authModalShown
local authFormInteraction = authAnalyticsModule.Events.authFormInteraction
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local getFFlagEnableRoactNetworkingForChallengeInteceptionModule = require(ampUpsell.Flags.GetFFlagEnableRoactNetworkingForChallengeInteception)
local getFFlagShowFAELoadingModalModule = require(ampUpsell.Flags.GetFFlagShowFAELoadingModal)
local enableFAECancellationAnalytics = game:DefineFastFlag("EnableFAECancellationAnalytics", false)
local enableValidateFAEVerificationLink = game:DefineFastFlag("EnableValidateFAEVerificationLink", false)
local getFFlagMoveAmpUpsellOffNavigateDown = require(parent.SharedFlags).GetFFlagMoveAmpUpsellOffNavigateDown
local getFFlagEnableWebAmpWizardForFAEHandoffModule = require(ampUpsell.Flags.GetFFlagEnableWebAmpWizardForFAEHandoff)
local getFFlagEnableFAEQRCodeHandoffModule = require(ampUpsell.Flags.GetFFlagEnableFAEQRCodeHandoff)
local logEventOnceIfEnabled = require(ampUpsell.Common.LoggingUtils).logEventOnceIfEnabled
local FAEWithCallbackPollDelay = game:DefineFastInt("FAEWithCallbackPollDelay", 2)
local FAEWithCallbackPollMaxRetries = game:DefineFastInt("FAEWithCallbackPollMaxRetries", 5)
local FAEBackgroundOnlyPollDelay = game:DefineFastInt("FAEBackgroundOnlyPollDelay", 15)
local FAEBackgroundOnlyPollMaxRetries = game:DefineFastInt("FAEBackgroundOnlyPollMaxRetries", 40)
local FAEWithWebViewCallbackPollDelay = game:DefineFastInt("FAEWithWebViewCallbackPollDelay", 2)
local FAEWithWebViewCallbackPollMaxRetries = game:DefineFastInt("FAEWithWebViewCallbackPollMaxRetries", 15)

return function() --[[ line: 76 | named "FAEUpsellContainer" ]]
	-- upvalues: useNavigation (ref), useDispatch (ref), useRoactService (ref), roactNetworking (ref), useAppPolicy (ref), appLinking (ref), getFFlagEnableFAEQRCodeHandoffModule (ref), reactModule (ref), authModalShown (ref), authFormInteraction (ref), authMsgShown (ref), getFFlagMoveAmpUpsellOffNavigateDown (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var6 (ref), navigateDown (ref), facialAgeEstimationServiceWrapperModule (ref), FAEWithCallbackPollDelay (ref), FAEWithCallbackPollMaxRetries (ref), getFFlagEnableWebAmpWizardForFAEHandoffModule (ref), FAEWithWebViewCallbackPollDelay (ref), FAEWithWebViewCallbackPollMaxRetries (ref), FAEBackgroundOnlyPollDelay (ref), FAEBackgroundOnlyPollMaxRetries (ref), usePollIDVStatus (ref), playersService (ref), promiseModule (ref), urlUtilsModule (ref), enableValidateFAEVerificationLink (ref), getFFlagEnableRoactNetworkingForChallengeInteceptionModule (ref), logEventOnceIfEnabled (ref), IDVApiProvider (ref), enableFAECancellationAnalytics (ref), FAEFailedModalModule (ref), FAEWithQRCodeUpsellModule (ref), FAEDirectLinkUpsellModule (ref), getFFlagShowFAELoadingModalModule (ref), FAELoadingModalModule (ref), loading (ref), iconSize (ref)
	local var25 = useNavigation()
	local var26 = useDispatch()
	local var27 = useRoactService(roactNetworking)
	local var28 = useAppPolicy(function(p0) --[[ line: 81 ]]
		return p0.getHasWebViewSupportForFAE()
	end)
	local extraProps = var25.getParam("extraProps")
	local entryPointEventCtx = extraProps.entryPointEventCtx
	local metadata = extraProps.metadata
	local skipFacialAgeEstimationWebLinkModal = extraProps.skipFacialAgeEstimationWebLinkModal
	local var30 = useRoactService(appLinking)
	local onSuccess = extraProps.onSuccess
	local onCancel = extraProps.onCancel
	local onFailure = extraProps.onFailure
	local onRetry = extraProps.onRetry
	local var31 = var28 and getFFlagEnableFAEQRCodeHandoffModule()
	local var32, var33 = reactModule.useState(false)
	local var34, var35 = reactModule.useState(nil)
	local var36, var37 = reactModule.useState(nil)
	local var38, var39 = reactModule.useState(false)
	local var40, var41 = reactModule.useState(false)
	local var42 = if metadata then metadata.sessionId else ""
	local var43, var44 = reactModule.useState(var42)
	local var45 = reactModule.useCallback(function(p1) --[[ line: 108 ]]
		-- upvalues: authModalShown (copy), entryPointEventCtx (ref), var33 (ref)
		authModalShown(entryPointEventCtx, p1, "faeFailed")
		var33(true)
	end, { entryPointEventCtx })
	local var46 = reactModule.useCallback(function(p2) --[[ line: 113 ]]
		-- upvalues: authFormInteraction (copy), entryPointEventCtx (ref), onCancel (ref)
		authFormInteraction(entryPointEventCtx, p2, "faeCancelled")
		onCancel()
	end, { onCancel, entryPointEventCtx })
	local var47 = reactModule.useCallback(function(p3) --[[ line: 118 ]]
		-- upvalues: authMsgShown (copy), entryPointEventCtx (ref), onSuccess (ref)
		authMsgShown(entryPointEventCtx, p3, "faeSuccess")
		onSuccess()
	end, { onSuccess, entryPointEventCtx })
	local var48 = reactModule.useCallback(function(p4, p5) --[[ line: 123 ]]
		-- upvalues: getFFlagMoveAmpUpsellOffNavigateDown (copy), var25 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var6 (copy), var26 (ref), navigateDown (copy)
		if getFFlagMoveAmpUpsellOffNavigateDown() then
			var25.push(appPage.GenericWebPage, {
				detail = p4,
				extraProps = {
					title = "",
					onClose = function() --[[ line: 129 ]]
						-- upvalues: p5 (ref)
						p5()
					end
				}
			})
			
			return
		end
		local t = {
			name = appPage.GenericWebPage,
			detail = p4,
			extraProps = {
				title = "",
				onClose = function() --[[ line: 140 ]]
					-- upvalues: p5 (ref)
					p5()
				end
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var6.down(var6.fromLegacyPage(t))
			
			return
		end
		var26(navigateDown(t))
	end, {
		if getFFlagMoveAmpUpsellOffNavigateDown() then var25 else var26
	})
	local var49 = reactModule.useMemo(function() --[[ line: 153 ]]
		-- upvalues: facialAgeEstimationServiceWrapperModule (copy), FAEWithCallbackPollDelay (copy), FAEWithCallbackPollMaxRetries (copy), var28 (ref), getFFlagEnableWebAmpWizardForFAEHandoffModule (copy), FAEWithWebViewCallbackPollDelay (copy), FAEWithWebViewCallbackPollMaxRetries (copy), FAEBackgroundOnlyPollDelay (copy), FAEBackgroundOnlyPollMaxRetries (copy)
		return if facialAgeEstimationServiceWrapperModule.isAvailable() then {
			delay = FAEWithCallbackPollDelay,
			retries = FAEWithCallbackPollMaxRetries
		} elseif var28 and not getFFlagEnableWebAmpWizardForFAEHandoffModule() then {
			delay = FAEWithWebViewCallbackPollDelay,
			retries = FAEWithWebViewCallbackPollMaxRetries
		} else {
			delay = FAEBackgroundOnlyPollDelay,
			retries = FAEBackgroundOnlyPollMaxRetries
		}
	end, { var28 })
	local var50, var51 = usePollIDVStatus({ delay = var49.delay, retries = var49.retries })
	local var52 = reactModule.useCallback(function(p6, p7) --[[ line: 175 ]]
		-- upvalues: facialAgeEstimationServiceWrapperModule (copy), authModalShown (copy), entryPointEventCtx (ref), var39 (ref), var31 (ref), playersService (copy), var37 (ref), promiseModule (copy), getFFlagEnableWebAmpWizardForFAEHandoffModule (copy), var35 (ref), urlUtilsModule (copy), enableValidateFAEVerificationLink (copy), var28 (ref), var48 (ref), skipFacialAgeEstimationWebLinkModal (ref), var30 (ref)
		local sessionIdentifier = p6.sessionIdentifier
		local verificationLink = p6.verificationLink
		local sessionToken = p6.sessionToken
		
		if facialAgeEstimationServiceWrapperModule.isAvailable() then
			authModalShown(entryPointEventCtx, p7, "nativeFae")
			var39(true)
			
			return facialAgeEstimationServiceWrapperModule.startFlow(sessionIdentifier, sessionToken)
		elseif var31 then
			var39(false)
			authModalShown(entryPointEventCtx, p7, "faeQRCodeHandoff")
			local text = "roblox%3A%2F%2Fnavigation%2Famp_wizard%3Ffeature_name=TriggerFacialAgeEstimationRecourse%26namespace=account_identity%252FAgeCheck%26entry_point=" .. entryPointEventCtx .. "%26user_id=" .. tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
			var37("https://ro.blox.com/Ebh5" .. "?pid=QR_code&c=fae_onelink" .. "&is_retargeting=false" .. "&af_dp=" .. text .. "&deep_link_value=" .. text)
			
			return promiseModule.resolve(sessionIdentifier)
		elseif getFFlagEnableWebAmpWizardForFAEHandoffModule() then
			authModalShown(entryPointEventCtx, p7, "webHandoffFAE")
			var39(false)
			var35(urlUtilsModule.buildAmpWizardUrl("TriggerAgeVerifyRecourse", "social%2FUpsells", entryPointEventCtx, "my%2Faccount"))
			
			return promiseModule.resolve(sessionIdentifier)
		elseif enableValidateFAEVerificationLink and (not verificationLink or verificationLink == "") then
			return promiseModule.reject("Invalid verification link")
		end
		authModalShown(entryPointEventCtx, p7, "noNativeFae")
		var39(false)
		
		if var28 then
			return promiseModule.new(function(p8) --[[ line: 228 ]]
				-- upvalues: sessionIdentifier (ref), var48 (copy), verificationLink (ref)
				var48(verificationLink, function() --[[ line: 229 ]]
					-- upvalues: p8 (ref), sessionIdentifier (copy)
					p8(sessionIdentifier)
				end)
			end)
		elseif skipFacialAgeEstimationWebLinkModal then
			var30:openURL(verificationLink)
		else
			var35(verificationLink)
		end
		return promiseModule.resolve(sessionIdentifier)
	end, {
		entryPointEventCtx, var28, var48, var39, skipFacialAgeEstimationWebLinkModal,
		var30, var31
	})
	reactModule.useEffect(function() --[[ line: 256 ]]
		-- upvalues: var42 (ref), getFFlagEnableRoactNetworkingForChallengeInteceptionModule (copy), logEventOnceIfEnabled (copy), IDVApiProvider (copy), var27 (ref), var44 (ref), var52 (ref), var41 (ref), var50 (ref), var47 (ref), enableFAECancellationAnalytics (copy), var46 (ref), var45 (ref), var51 (ref)
		local var55 = var42
		
		if getFFlagEnableRoactNetworkingForChallengeInteceptionModule() then
			logEventOnceIfEnabled("start_verification_init")
			IDVApiProvider.startVerificationWithWrappedNetworking(var27, { ageEstimation = true }):andThen(function(p12) --[[ line: 261 ]]
				-- upvalues: var55 (write), var44 (copy), logEventOnceIfEnabled (copy)
				var55 = `{var55}_{p12.sessionIdentifier}`
				var44(var55)
				logEventOnceIfEnabled("start_verification_end")
				
				return p12
			end):andThen(function(p11) --[[ line: 267 ]]
				-- upvalues: logEventOnceIfEnabled (copy), var52 (copy), var55 (write)
				logEventOnceIfEnabled("persona_flow_init")
				
				return var52(p11, var55)
			end):andThen(function(p10) --[[ line: 271 ]]
				-- upvalues: logEventOnceIfEnabled (copy), var41 (copy), var50 (copy)
				logEventOnceIfEnabled("persona_flow_end")
				var41(true)
				logEventOnceIfEnabled("status_polling_init")
				
				return var50(p10)
			end):andThen(function() --[[ line: 277 ]]
				-- upvalues: logEventOnceIfEnabled (copy), var47 (copy), var55 (write)
				logEventOnceIfEnabled("status_polling_end")
				
				return var47(var55)
			end):catch(function(p9) --[[ line: 281 ]]
				-- upvalues: logEventOnceIfEnabled (copy), enableFAECancellationAnalytics (copy), var46 (copy), var55 (write), var45 (copy)
				logEventOnceIfEnabled("status_polling_end")
				
				if enableFAECancellationAnalytics and p9 and p9.resultType == Enum.FacialAgeEstimationResultType.Cancel then
					var46(var55)
					
					return
				end
				var45(var55)
			end)
			
			return function() --[[ line: 294 ]]
				-- upvalues: var51 (copy)
				var51()
			end
		end
		IDVApiProvider.startVerification({ ageEstimation = true }):andThen(function(p16) --[[ line: 299 ]]
			-- upvalues: var55 (write), var44 (copy)
			var55 = `{var55}_{p16.sessionIdentifier}`
			var44(var55)
			
			return p16
		end):andThen(function(p15) --[[ line: 304 ]]
			-- upvalues: var52 (copy), var55 (write)
			return var52(p15, var55)
		end):andThen(function(p14) --[[ line: 307 ]]
			-- upvalues: var41 (copy), var50 (copy)
			var41(true)
			
			return var50(p14)
		end):andThen(function() --[[ line: 311 ]]
			-- upvalues: var47 (copy), var55 (write)
			return var47(var55)
		end):catch(function(p13) --[[ line: 314 ]]
			-- upvalues: enableFAECancellationAnalytics (copy), var46 (copy), var55 (write), var45 (copy)
			if enableFAECancellationAnalytics and p13 and p13.resultType == Enum.FacialAgeEstimationResultType.Cancel then
				var46(var55)
				
				return
			end
			var45(var55)
		end)
		
		return function() --[[ line: 326 ]]
			-- upvalues: var51 (copy)
			var51()
		end
	end, {})
	
	return if var32 then reactModule.createElement(FAEFailedModalModule, {
		sessionId = var43,
		entryPointEventCtx = entryPointEventCtx,
		onClose = onFailure,
		onRetry = onRetry
	}) elseif var36 then reactModule.createElement(FAEWithQRCodeUpsellModule, {
		appsFlyerLink = var36,
		sessionId = var43,
		entryPointEventCtx = entryPointEventCtx,
		onCancel = onCancel
	}) elseif var34 then reactModule.createElement(FAEDirectLinkUpsellModule, {
		sessionId = var43,
		entryPointEventCtx = entryPointEventCtx,
		webLink = var34,
		onCancel = onCancel
	}) elseif getFFlagShowFAELoadingModalModule() and var40 and not var38 then reactModule.createElement(FAELoadingModalModule, {
		sessionId = var43,
		entryPointEventCtx = entryPointEventCtx,
		onCancel = onCancel
	}) else reactModule.createElement(loading, {
		size = iconSize.Medium,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end