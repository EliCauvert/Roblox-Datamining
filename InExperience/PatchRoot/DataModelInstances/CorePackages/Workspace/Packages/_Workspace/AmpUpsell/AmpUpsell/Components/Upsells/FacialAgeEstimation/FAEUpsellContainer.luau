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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
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

return function()
	-- upvalues: useNavigation (ref), useDispatch (ref), useRoactService (ref), roactNetworking (ref), useAppPolicy (ref), appLinking (ref), getFFlagEnableFAEQRCodeHandoffModule (ref), reactModule (ref), authModalShown (ref), authFormInteraction (ref), authMsgShown (ref), getFFlagMoveAmpUpsellOffNavigateDown (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), facialAgeEstimationServiceWrapperModule (ref), FAEWithCallbackPollDelay (ref), FAEWithCallbackPollMaxRetries (ref), FAEBackgroundOnlyPollDelay (ref), FAEBackgroundOnlyPollMaxRetries (ref), getFFlagEnableWebAmpWizardForFAEHandoffModule (ref), FAEWithWebViewCallbackPollDelay (ref), FAEWithWebViewCallbackPollMaxRetries (ref), usePollIDVStatus (ref), playersService (ref), promiseModule (ref), urlUtilsModule (ref), enableValidateFAEVerificationLink (ref), getFFlagEnableRoactNetworkingForChallengeInteceptionModule (ref), logEventOnceIfEnabled (ref), IDVApiProvider (ref), enableFAECancellationAnalytics (ref), FAEFailedModalModule (ref), FAEWithQRCodeUpsellModule (ref), FAEDirectLinkUpsellModule (ref), getFFlagShowFAELoadingModalModule (ref), FAELoadingModalModule (ref), loading (ref), iconSize (ref)
	local var2 = useNavigation()
	local var3 = useDispatch()
	local var4 = useRoactService(roactNetworking)
	local var5 = useAppPolicy(function(p1)
		return p1.getHasWebViewSupportForFAE()
	end)
	local extraProps = var2.getParam("extraProps")
	local entryPointEventCtx = extraProps.entryPointEventCtx
	local metadata = extraProps.metadata
	local skipFacialAgeEstimationWebLinkModal = extraProps.skipFacialAgeEstimationWebLinkModal
	local var6 = useRoactService(appLinking)
	local onSuccess = extraProps.onSuccess
	local onCancel = extraProps.onCancel
	local onFailure = extraProps.onFailure
	local onRetry = extraProps.onRetry
	local var7 = var5 and getFFlagEnableFAEQRCodeHandoffModule()
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState(nil)
	local var12, var13 = reactModule.useState(nil)
	local var14, var15 = reactModule.useState(false)
	local var16, var17 = reactModule.useState(false)
	local var18 = if metadata then metadata.sessionId else ""
	local var19, var20 = reactModule.useState(var18)
	local var21 = reactModule.useCallback(function(p1)
		-- upvalues: authModalShown (copy), entryPointEventCtx (ref), var9 (ref)
		authModalShown(entryPointEventCtx, p1, "faeFailed")
		var9(true)
	end, { entryPointEventCtx })
	local var22 = reactModule.useCallback(function(p1)
		-- upvalues: authFormInteraction (copy), entryPointEventCtx (ref), onCancel (ref)
		authFormInteraction(entryPointEventCtx, p1, "faeCancelled")
		onCancel()
	end, { onCancel, entryPointEventCtx })
	local var23 = reactModule.useCallback(function(p1)
		-- upvalues: authMsgShown (copy), entryPointEventCtx (ref), onSuccess (ref)
		authMsgShown(entryPointEventCtx, p1, "faeSuccess")
		onSuccess()
	end, { onSuccess, entryPointEventCtx })
	local var24 = reactModule.useCallback(function(p1, p2)
		-- upvalues: getFFlagMoveAmpUpsellOffNavigateDown (copy), var2 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var3 (ref), navigateDown (copy)
		if getFFlagMoveAmpUpsellOffNavigateDown() then
			var2.push(appPage.GenericWebPage, {
				detail = p1,
				extraProps = {
					title = "",
					onClose = function()
						-- upvalues: p2 (ref)
						p2()
					end
				}
			})
			
			return
		end
		local t = {
			name = appPage.GenericWebPage,
			detail = p1,
			extraProps = {
				title = "",
				onClose = function()
					-- upvalues: p2 (ref)
					p2()
				end
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var3(navigateDown(t))
	end, {
		if getFFlagMoveAmpUpsellOffNavigateDown() then var2 else var3
	})
	local var25 = reactModule.useMemo(function()
		-- upvalues: facialAgeEstimationServiceWrapperModule (copy), FAEWithCallbackPollDelay (copy), FAEWithCallbackPollMaxRetries (copy), var7 (ref), FAEBackgroundOnlyPollDelay (copy), FAEBackgroundOnlyPollMaxRetries (copy), var5 (ref), getFFlagEnableWebAmpWizardForFAEHandoffModule (copy), FAEWithWebViewCallbackPollDelay (copy), FAEWithWebViewCallbackPollMaxRetries (copy)
		return if facialAgeEstimationServiceWrapperModule.isAvailable() then {
			delay = FAEWithCallbackPollDelay,
			retries = FAEWithCallbackPollMaxRetries
		} elseif var7 then {
			delay = FAEBackgroundOnlyPollDelay,
			retries = FAEBackgroundOnlyPollMaxRetries
		} elseif var5 and not getFFlagEnableWebAmpWizardForFAEHandoffModule() then {
			delay = FAEWithWebViewCallbackPollDelay,
			retries = FAEWithWebViewCallbackPollMaxRetries
		} else {
			delay = FAEBackgroundOnlyPollDelay,
			retries = FAEBackgroundOnlyPollMaxRetries
		}
	end, { var5, var7 })
	local var26, var27 = usePollIDVStatus({ delay = var25.delay, retries = var25.retries })
	local var28 = reactModule.useCallback(function(p1, p2)
		-- upvalues: facialAgeEstimationServiceWrapperModule (copy), authModalShown (copy), entryPointEventCtx (ref), var15 (ref), var7 (ref), playersService (copy), var13 (ref), promiseModule (copy), getFFlagEnableWebAmpWizardForFAEHandoffModule (copy), var11 (ref), urlUtilsModule (copy), enableValidateFAEVerificationLink (copy), var5 (ref), var24 (ref), skipFacialAgeEstimationWebLinkModal (ref), var6 (ref)
		local sessionIdentifier = p1.sessionIdentifier
		local verificationLink = p1.verificationLink
		local sessionToken = p1.sessionToken
		
		if facialAgeEstimationServiceWrapperModule.isAvailable() then
			authModalShown(entryPointEventCtx, p2, "nativeFae")
			var15(true)
			
			return facialAgeEstimationServiceWrapperModule.startFlow(sessionIdentifier, sessionToken)
		elseif var7 then
			var15(false)
			authModalShown(entryPointEventCtx, p2, "faeQRCodeHandoff")
			local text = "roblox%3A%2F%2Fnavigation%2Famp_wizard%3Ffeature_name=TriggerFacialAgeEstimationRecourse%26namespace=account_identity%252FAgeCheck%26entry_point=" .. entryPointEventCtx .. "%26user_id=" .. tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
			var13("https://ro.blox.com/Ebh5" .. "?pid=QR_code&c=fae_onelink" .. "&is_retargeting=false" .. "&af_dp=" .. text .. "&deep_link_value=" .. text)
			
			return promiseModule.resolve(sessionIdentifier)
		elseif getFFlagEnableWebAmpWizardForFAEHandoffModule() then
			authModalShown(entryPointEventCtx, p2, "webHandoffFAE")
			var15(false)
			var11(urlUtilsModule.buildAmpWizardUrl("TriggerAgeVerifyRecourse", "social%2FUpsells", entryPointEventCtx, "my%2Faccount"))
			
			return promiseModule.resolve(sessionIdentifier)
		elseif enableValidateFAEVerificationLink and (not verificationLink or verificationLink == "") then
			return promiseModule.reject("Invalid verification link")
		end
		authModalShown(entryPointEventCtx, p2, "noNativeFae")
		var15(false)
		
		if var5 then
			return promiseModule.new(function(p3)
				-- upvalues: sessionIdentifier (ref), var24 (copy), verificationLink (ref)
				var24(verificationLink, function()
					-- upvalues: p3 (ref), sessionIdentifier (copy)
					p3(sessionIdentifier)
				end)
			end)
		elseif skipFacialAgeEstimationWebLinkModal then
			var6:openURL(verificationLink)
		else
			var11(verificationLink)
		end
		return promiseModule.resolve(sessionIdentifier)
	end, {
		entryPointEventCtx, var5, var24, var15, skipFacialAgeEstimationWebLinkModal,
		var6, var7
	})
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), getFFlagEnableRoactNetworkingForChallengeInteceptionModule (copy), logEventOnceIfEnabled (copy), IDVApiProvider (copy), var4 (ref), var20 (ref), var28 (ref), var17 (ref), var26 (ref), var23 (ref), enableFAECancellationAnalytics (copy), var22 (ref), var21 (ref), var27 (ref)
		local var29 = var18
		
		if getFFlagEnableRoactNetworkingForChallengeInteceptionModule() then
			logEventOnceIfEnabled("start_verification_init")
			IDVApiProvider.startVerificationWithWrappedNetworking(var4, { ageEstimation = true }):andThen(function(p1)
				-- upvalues: var29 (write), var20 (copy), logEventOnceIfEnabled (copy)
				var29 = `{var29}_{p1.sessionIdentifier}`
				var20(var29)
				logEventOnceIfEnabled("start_verification_end")
				
				return p1
			end):andThen(function(p1)
				-- upvalues: logEventOnceIfEnabled (copy), var28 (copy), var29 (write)
				logEventOnceIfEnabled("persona_flow_init")
				
				return var28(p1, var29)
			end):andThen(function(p1)
				-- upvalues: logEventOnceIfEnabled (copy), var17 (copy), var26 (copy)
				logEventOnceIfEnabled("persona_flow_end")
				var17(true)
				logEventOnceIfEnabled("status_polling_init")
				
				return var26(p1)
			end):andThen(function()
				-- upvalues: logEventOnceIfEnabled (copy), var23 (copy), var29 (write)
				logEventOnceIfEnabled("status_polling_end")
				
				return var23(var29)
			end):catch(function(p1)
				-- upvalues: logEventOnceIfEnabled (copy), enableFAECancellationAnalytics (copy), var22 (copy), var29 (write), var21 (copy)
				logEventOnceIfEnabled("status_polling_end")
				
				if enableFAECancellationAnalytics and p1 and p1.resultType == Enum.FacialAgeEstimationResultType.Cancel then
					var22(var29)
					
					return
				end
				var21(var29)
			end)
			
			return function()
				-- upvalues: var27 (copy)
				var27()
			end
		end
		IDVApiProvider.startVerification({ ageEstimation = true }):andThen(function(p1)
			-- upvalues: var29 (write), var20 (copy)
			var29 = `{var29}_{p1.sessionIdentifier}`
			var20(var29)
			
			return p1
		end):andThen(function(p1)
			-- upvalues: var28 (copy), var29 (write)
			return var28(p1, var29)
		end):andThen(function(p1)
			-- upvalues: var17 (copy), var26 (copy)
			var17(true)
			
			return var26(p1)
		end):andThen(function()
			-- upvalues: var23 (copy), var29 (write)
			return var23(var29)
		end):catch(function(p1)
			-- upvalues: enableFAECancellationAnalytics (copy), var22 (copy), var29 (write), var21 (copy)
			if enableFAECancellationAnalytics and p1 and p1.resultType == Enum.FacialAgeEstimationResultType.Cancel then
				var22(var29)
				
				return
			end
			var21(var29)
		end)
		
		return function()
			-- upvalues: var27 (copy)
			var27()
		end
	end, {})
	
	return if var8 then reactModule.createElement(FAEFailedModalModule, {
		sessionId = var19,
		entryPointEventCtx = entryPointEventCtx,
		onClose = onFailure,
		onRetry = onRetry
	}) elseif var12 then reactModule.createElement(FAEWithQRCodeUpsellModule, {
		appsFlyerLink = var12,
		sessionId = var19,
		entryPointEventCtx = entryPointEventCtx,
		onCancel = onCancel
	}) elseif var10 then reactModule.createElement(FAEDirectLinkUpsellModule, {
		sessionId = var19,
		entryPointEventCtx = entryPointEventCtx,
		webLink = var10,
		onCancel = onCancel
	}) elseif getFFlagShowFAELoadingModalModule() and var16 and not var14 then reactModule.createElement(FAELoadingModalModule, {
		sessionId = var19,
		entryPointEventCtx = entryPointEventCtx,
		onCancel = onCancel
	}) else reactModule.createElement(loading, {
		size = iconSize.Medium,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end