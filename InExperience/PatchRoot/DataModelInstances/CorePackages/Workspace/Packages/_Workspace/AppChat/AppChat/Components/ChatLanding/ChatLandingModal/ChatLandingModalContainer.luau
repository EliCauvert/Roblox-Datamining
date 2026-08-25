local httpService = game:GetService("HttpService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local luaAppNavigationContextModule = require(appChat.LuaAppNavigationContext)
local getDeepValue2Module = require(appChat.Utils.getDeepValue2)
local memo = reactModule.memo
local useAnalyticsModule = require(appChat.Analytics.useAnalytics)
local useCallback = reactModule.useCallback
local useContext = reactModule.useContext
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local useEffectOnMount = require(parent.RoactUtils).Hooks.useEffectOnMount
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local useNavigation = require(parent.Navigation).useNavigation
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useState = reactModule.useState
local useRef = reactModule.useRef
local useIsGuiInChatVisibleModule = require(appChat.Hooks.useIsGuiInChatVisible)
local useRecordModalSeenWithDelayModule = require(appChat.Hooks.useRecordModalSeenWithDelay)
local chatLandingModalTelemetryModule = require(script.Parent.ChatLandingModalTelemetry)
local chatLandingTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local modalTelemetryModule = require(appChat.Components.ModalTelemetry)
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local enum = require(parent.UIBlox).App.Button.Enum
local socialUpsellModule = require(parent.SocialUpsell)
local accessResponseEnum = require(parent.AmpUpsell).AmpEnums.AccessResponseEnum
local appChatNetworkingModule = require(parent.AppChatNetworking)
local chatLandingModalVariant = appChatNetworkingModule.Constants.ChatLandingModalVariant
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateBack = require(parent.NavigationRodux).Thunks.NavigateBack
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var16 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local refreshAllUnfilteredThreadsDetailsModule = require(appChat.Conversations.Thunks.refreshAllUnfilteredThreadsDetails)
local unfilteredThreadsAMPFeatureNameModule = require(appChat.Components.UnfilteredThreadsAMPFeatureName)
local openTcLearnMoreLinkModule = require(appChat.Conversations.Thunks.OpenTcLearnMoreLink)
local modalConfigurationModule = require(appChat.Models.ModalConfiguration)
local appChatFAEBannerModule = require(appChat.Components.FaeBanner.AppChatFAEBanner)
local fIntAppChatModalSeenImpressionDelayMsModule = require(appChat.Flags.FIntAppChatModalSeenImpressionDelayMs)
local fFlagDebugAppChatFaeModule = require(appChat.Flags.FFlagDebugAppChatFae)
local fStringCanAccessTrustedContactsAmpFeature = require(parent.SharedFlags).FStringCanAccessTrustedContactsAmpFeature
local fStringCanAccessTrustedContactsAmpNameSpace = require(parent.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace
local fFlagDebugAEGIS1AppChatBannerModule = require(appChat.Flags.FFlagDebugAEGIS1AppChatBanner)
local fFlagTestDeviceForFAEUpsell = require(parent.SocialExperiments).FFlagTestDeviceForFAEUpsell
local deviceMeetsRequirementsForFAE = require(parent.SocialExperiments).deviceMeetsRequirementsForFAE
local getAgeVerifiedChangedSignal = socialUpsellModule.Signals.GetAgeVerifiedChangedSignal
local chatLandingModalModule = require(script.Parent.ChatLandingModal)
local t = {
	fully_eligible_ftux = true,
	party_only_ftux = true,
	phone_verify = true,
	[chatLandingModalVariant.AgeAssuranceUpsell] = true
}
local t_1 = {
	fully_eligible_ftux = "ChatLandingUnfilteredThreadsFtux",
	phone_verify = "ChatLandingPvUpsell"
}

return memo(function(_)
	-- upvalues: useDispatch (ref), useAnalyticsModule (ref), useContext (ref), luaAppNavigationContextModule (ref), useNavigation (ref), useState (ref), useIsInExperienceModule (ref), useSelector (ref), modalConfigurationModule (ref), getDeepValue2Module (ref), t_1 (ref), t (ref), chatLandingModalVariant (ref), useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), useEffectOnMount (ref), useEffect (ref), chatLandingModalTelemetryModule (ref), useCallback (ref), appPage (ref), unfilteredThreadsAMPFeatureNameModule (ref), fFlagSignalsNavP3Dispatch (ref), var16 (ref), navigateBack (ref), accessResponseEnum (ref), refreshAllUnfilteredThreadsDetailsModule (ref), navigateDown (ref), httpService (ref), fStringCanAccessTrustedContactsAmpFeature (ref), fStringCanAccessTrustedContactsAmpNameSpace (ref), modalTelemetryModule (ref), fFlagDebugAppChatFaeModule (ref), fFlagDebugAEGIS1AppChatBannerModule (ref), openTcLearnMoreLinkModule (ref), appChatNetworkingModule (ref), cryoModule (ref), reactModule (ref), useRef (ref), useIsGuiInChatVisibleModule (ref), useRecordModalSeenWithDelayModule (ref), fIntAppChatModalSeenImpressionDelayMsModule (ref), fFlagTestDeviceForFAEUpsell (ref), deviceMeetsRequirementsForFAE (ref), appChatFAEBannerModule (ref), chatLandingModalModule (ref), enum (ref), getAgeVerifiedChangedSignal (ref)
	local var42
	local var28 = useDispatch()
	local var29 = useAnalyticsModule()
	local var30 = useContext(luaAppNavigationContextModule)
	local var31 = useNavigation()
	local var32, var33 = useState({})
	local var34 = useIsInExperienceModule()
	local var35 = useSelector(function(p0)
		-- upvalues: modalConfigurationModule (copy), getDeepValue2Module (copy)
		return getDeepValue2Module(p0, "ChatAppReducer.Modals.chatLandingModal") or modalConfigurationModule.default
	end)
	local modalVariant = var35.modal_variant
	local var36 = getDeepValue2Module(var35, "modal_layout.id")
	local var37 = getDeepValue2Module(var35, "modal_layout.seen_record_action")
	local var38 = getDeepValue2Module(var35, "modal_layout.dismissed_record_action")
	local var39 = getDeepValue2Module(var35, "modal_layout.buttons")
	local var40 = var39 and var39[1]
	local var41 = t_1[modalVariant]
	
	if not t[modalVariant] then
		var42 = modalVariant == chatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal and not var32[modalVariant]
	end
	local var43 = useTelemetryModule(chatLandingTelemetryLayerModule.Context)
	useEffectOnMount(function()
		-- upvalues: var29 (ref), var41 (ref), var42 (ref)
		if var29 and var41 and var42 then
			var29.fireAnalyticsEvent(`{var41}Rendered`)
		end
	end)
	useEffect(function()
		-- upvalues: var42 (ref), modalVariant (ref), chatLandingModalVariant (copy), var43 (ref), chatLandingModalTelemetryModule (copy)
		if var42 and modalVariant == chatLandingModalVariant.AgeAssuranceUpsell then
			var43.emit(chatLandingModalTelemetryModule.Events.FaeModalShown, {})
		end
		if var42 then
			var43.emit(chatLandingModalTelemetryModule.Events.ModalRendered, { modalVariant = modalVariant })
		end
	end, { modalVariant, var42 })
	local var44 = useCallback(function()
		-- upvalues: var29 (ref), var41 (ref), appPage (copy), unfilteredThreadsAMPFeatureNameModule (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), var28 (ref), navigateBack (copy), accessResponseEnum (copy), refreshAllUnfilteredThreadsDetailsModule (copy), var34 (ref), navigateDown (copy)
		if var29 and var41 then
			var29.fireAnalyticsEvent(`{var41}ContinueClicked`)
		end
		local t = {
			name = appPage.AmpWizardContainer,
			extraProps = {
				featureName = unfilteredThreadsAMPFeatureNameModule,
				completionCallback = function(p1, _)
					-- upvalues: fFlagSignalsNavP3Dispatch (copy), var16 (copy), var28 (copy), navigateBack (copy), accessResponseEnum (copy), var29 (copy), var41 (copy), refreshAllUnfilteredThreadsDetailsModule (copy), var34 (copy)
					if fFlagSignalsNavP3Dispatch then
						var16.back(true)
					else
						var28(navigateBack(true))
					end
					if p1 == accessResponseEnum.Granted then
						if var29 and var41 then
							var29.fireAnalyticsEvent(`{var41}Succeeded`)
						end
						var28(refreshAllUnfilteredThreadsDetailsModule(nil, var34))
						
						return
					elseif var29 and var41 then
						var29.fireAnalyticsEvent(`{var41}Failed`)
					end
				end
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var16.down(var16.fromLegacyPage(t))
			
			return
		end
		var28(navigateDown(t))
	end, { var28, var29, var41 })
	local var45 = useCallback(function()
		-- upvalues: httpService (copy), var43 (ref), chatLandingModalTelemetryModule (copy), appPage (copy), fStringCanAccessTrustedContactsAmpFeature (copy), fStringCanAccessTrustedContactsAmpNameSpace (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), var28 (ref), navigateBack (copy), accessResponseEnum (copy), modalVariant (ref), modalTelemetryModule (copy), refreshAllUnfilteredThreadsDetailsModule (copy), var34 (ref), fFlagDebugAppChatFaeModule (copy), fFlagDebugAEGIS1AppChatBannerModule (copy), navigateDown (copy)
		local var58 = httpService:GenerateGUID(false)
		var43.emit(chatLandingModalTelemetryModule.Events.TelemetryFaeButtonClick, {
			state = var58,
			btn = chatLandingModalTelemetryModule.Constants.ConfirmFaeBtn
		})
		local t = {
			name = appPage.AmpWizardContainer,
			extraProps = {
				featureName = fStringCanAccessTrustedContactsAmpFeature,
				entryPointEventCtx = chatLandingModalTelemetryModule.Constants.EventStreamCtx,
				metadata = { sessionId = var58 },
				nameSpace = fStringCanAccessTrustedContactsAmpNameSpace,
				completionCallback = function(p2, _)
					-- upvalues: fFlagSignalsNavP3Dispatch (copy), var16 (copy), var28 (copy), navigateBack (copy), accessResponseEnum (copy), var43 (copy), chatLandingModalTelemetryModule (copy), modalVariant (copy), modalTelemetryModule (copy), refreshAllUnfilteredThreadsDetailsModule (copy), var34 (copy), fFlagDebugAppChatFaeModule (copy), fFlagDebugAEGIS1AppChatBannerModule (copy)
					if fFlagSignalsNavP3Dispatch then
						var16.back(true)
					else
						var28(navigateBack(true))
					end
					if p2 == accessResponseEnum.Granted then
						var43.emit(chatLandingModalTelemetryModule.Events.ModalActionResult, {
							modalVariant = modalVariant,
							action = modalTelemetryModule.Enums.ModalActions.PrimaryCta,
							actionResult = modalTelemetryModule.Enums.ModalActionResults.Success
						})
						var28(refreshAllUnfilteredThreadsDetailsModule(nil, var34))
					else
						var43.emit(chatLandingModalTelemetryModule.Events.ModalActionResult, {
							modalVariant = modalVariant,
							action = modalTelemetryModule.Enums.ModalActions.PrimaryCta,
							actionResult = modalTelemetryModule.Enums.ModalActionResults.Failure
						})
					end
					if fFlagDebugAppChatFaeModule or fFlagDebugAEGIS1AppChatBannerModule then
						var28({ type = "DEBUG_DismissChatLandingModal" })
					end
				end
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var16.down(var16.fromLegacyPage(t))
			
			return
		end
		var28(navigateDown(t))
	end, { var28, var34, var43, modalVariant })
	local var46 = useCallback(function()
		-- upvalues: var29 (ref), var41 (ref), var31 (ref), var30 (ref)
		if var29 and var41 then
			var29.fireAnalyticsEvent(`{var41}LearnMoreClicked`)
		end
		var30.navigateToUnfilteredThreadsLearnMore(if var31 then var31.navigate else nil)
	end, { var30, var29, var31, var41 })
	local var47 = useCallback(function()
		-- upvalues: var29 (ref), var41 (ref), modalVariant (ref), chatLandingModalVariant (copy), var43 (ref), chatLandingModalTelemetryModule (copy), httpService (copy), modalTelemetryModule (copy), var28 (ref), appChatNetworkingModule (copy), var38 (ref), var36 (ref), fFlagDebugAppChatFaeModule (copy), fFlagDebugAEGIS1AppChatBannerModule (copy), var33 (ref), cryoModule (copy), var32 (ref)
		if var29 and var41 then
			var29.fireAnalyticsEvent(`{var41}Dismissed`)
		end
		if modalVariant == chatLandingModalVariant.AgeAssuranceUpsell then
			var43.emit(chatLandingModalTelemetryModule.Events.TelemetryFaeButtonClick, {
				state = httpService:GenerateGUID(false),
				btn = chatLandingModalTelemetryModule.Constants.CancelFaeBtn
			})
		end
		var43.emit(chatLandingModalTelemetryModule.Events.ModalAction, {
			modalVariant = modalVariant,
			action = modalTelemetryModule.Enums.ModalActions.Dismiss
		})
		var28(appChatNetworkingModule.rodux.RecordModalSequenceResponse.API(var38, "chat_landing_modal", var36)):catch(function(p3)
			warn("Error in ChatLandingModalContainer -> RecordModalSequenceResponse dismissed: " .. tostring(p3), p3)
		end)
		
		if fFlagDebugAppChatFaeModule and modalVariant == chatLandingModalVariant.AgeAssuranceUpsell or fFlagDebugAEGIS1AppChatBannerModule and modalVariant == chatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal then
			var28({ type = "DEBUG_DismissChatLandingModal" })
			
			return
		end
		var33(cryoModule.Dictionary.join(var32, { [modalVariant] = true }))
	end, {
		var32, var33, var28, var29, var41, var38, modalVariant, var36, var43
	})
	local var48 = ({
		[chatLandingModalVariant.AgeAssuranceUpsell] = useCallback(function()
			-- upvalues: var28 (ref), openTcLearnMoreLinkModule (copy)
			var28(openTcLearnMoreLinkModule())
		end, { var28 })
	})[modalVariant]
	local var49 = useCallback(function(...)
		-- upvalues: var43 (ref), chatLandingModalTelemetryModule (copy), modalVariant (ref), modalTelemetryModule (copy), var48 (ref)
		var43.emit(chatLandingModalTelemetryModule.Events.ModalAction, {
			modalVariant = modalVariant,
			action = modalTelemetryModule.Enums.ModalActions.InlineCta
		})
		var48(...)
	end, { var48, var43, modalVariant })
	local additionalContent = var35 and (var35.modal_layout and (var35.modal_layout.body and (var35.modal_layout.body.additional_content or {})))
	local var51 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), additionalContent (ref), appChatNetworkingModule (copy), var49 (ref)
		return cryoModule.List.map(additionalContent, function(p4)
			-- upvalues: appChatNetworkingModule (copy), var49 (copy)
			local t = { type = p4.type, text = p4.text }
			
			if p4.type == appChatNetworkingModule.Constants.ModalContentType.Link then
				t.onActivated = var49
			end
			return t
		end)
	end, { additionalContent, var48, var49 })
	local var52 = ({
		phone_verify = var44,
		fully_eligible_ftux = var46,
		[chatLandingModalVariant.AgeAssuranceUpsell] = var45
	})[modalVariant]
	local var53 = useCallback(function(...)
		-- upvalues: var43 (ref), chatLandingModalTelemetryModule (copy), modalVariant (ref), modalTelemetryModule (copy), var52 (ref)
		var43.emit(chatLandingModalTelemetryModule.Events.ModalAction, {
			modalVariant = modalVariant,
			action = modalTelemetryModule.Enums.ModalActions.PrimaryCta
		})
		var52(...)
	end, { var52, var43, modalVariant })
	local var54 = useRef(nil)
	useRecordModalSeenWithDelayModule({
		modalSequence = "chat_landing_modal",
		modalId = var36,
		actionToRecord = var37,
		delayMs = fIntAppChatModalSeenImpressionDelayMsModule,
		canRecordAction = useIsGuiInChatVisibleModule(var54, { var54.current, var42 }) and var42
	})
	local var55 = if fFlagDebugAppChatFaeModule then reactModule.useCallback(function()
		-- upvalues: var28 (ref)
		var28({ type = "DEBUG_ShowAppChatFaeUpsell" })
	end, { var28 }) else function() end
	local var56 = if fFlagDebugAEGIS1AppChatBannerModule then reactModule.useCallback(function()
		-- upvalues: var28 (ref)
		var28({ type = "DEBUG_ShowChatLandingAgeVerifiedTimedModal" })
	end, { var28 }) else nil
	
	if fFlagTestDeviceForFAEUpsell and not deviceMeetsRequirementsForFAE() then
		return nil
	elseif var42 then
		return if modalVariant == chatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal then reactModule.createElement(appChatFAEBannerModule, { modalConfiguration = var35, onDismiss = var47 }) else reactModule.createElement(chatLandingModalModule, {
			titleLabelText = getDeepValue2Module(var35, "modal_layout.label.text"),
			titleText = getDeepValue2Module(var35, "modal_layout.header.text"),
			bodyText = getDeepValue2Module(var35, "modal_layout.body.text"),
			additionalContent = var51,
			actionText = var40 and var40.text,
			buttonType = if modalVariant == "fully_eligible_ftux" then enum.ButtonType.Secondary else enum.ButtonType.PrimarySystem,
			onActivated = var53,
			onDismissed = var47,
			hideActionButton = not var40 or not var52,
			ref = var54
		})
	elseif modalVariant ~= "none" and modalVariant ~= nil and not t[modalVariant] then
		warn("Unsupported ChatLandingModal variant: " .. modalVariant)
	end
	return if fFlagDebugAEGIS1AppChatBannerModule then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 200)
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.Name,
			Padding = UDim.new(0, 10)
		}),
		Btn1 = reactModule.createElement("TextButton", {
			Text = "DEBUG Show Chat Landing Age Verfication Timed Modal",
			Size = UDim2.new(0, 200, 0, 50),
			[reactModule.Event.Activated] = var56
		}),
		Btn2 = reactModule.createElement("TextButton", {
			Text = "DEBUG Fire Age Verified event",
			Size = UDim2.new(0, 200, 0, 50),
			[reactModule.Event.Activated] = function()
				-- upvalues: getAgeVerifiedChangedSignal (copy)
				getAgeVerifiedChangedSignal():fire()
			end
		})
	}) elseif fFlagDebugAppChatFaeModule then reactModule.createElement("TextButton", {
		Text = "DEBUG Show FAE Upsell",
		Size = UDim2.new(0, 200, 0, 50),
		[reactModule.Event.Activated] = var55
	}) else nil
end)