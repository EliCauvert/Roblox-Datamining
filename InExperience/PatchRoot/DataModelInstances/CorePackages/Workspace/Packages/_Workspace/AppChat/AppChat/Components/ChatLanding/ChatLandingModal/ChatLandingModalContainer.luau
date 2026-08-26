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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
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
	-- upvalues: useDispatch (ref), useAnalyticsModule (ref), useContext (ref), luaAppNavigationContextModule (ref), useNavigation (ref), useState (ref), useIsInExperienceModule (ref), useSelector (ref), modalConfigurationModule (ref), getDeepValue2Module (ref), t_1 (ref), t (ref), chatLandingModalVariant (ref), useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), useEffectOnMount (ref), useEffect (ref), chatLandingModalTelemetryModule (ref), useCallback (ref), appPage (ref), unfilteredThreadsAMPFeatureNameModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateBack (ref), accessResponseEnum (ref), refreshAllUnfilteredThreadsDetailsModule (ref), navigateDown (ref), httpService (ref), fStringCanAccessTrustedContactsAmpFeature (ref), fStringCanAccessTrustedContactsAmpNameSpace (ref), modalTelemetryModule (ref), fFlagDebugAppChatFaeModule (ref), fFlagDebugAEGIS1AppChatBannerModule (ref), openTcLearnMoreLinkModule (ref), appChatNetworkingModule (ref), cryoModule (ref), reactModule (ref), useRef (ref), useIsGuiInChatVisibleModule (ref), useRecordModalSeenWithDelayModule (ref), fIntAppChatModalSeenImpressionDelayMsModule (ref), fFlagTestDeviceForFAEUpsell (ref), deviceMeetsRequirementsForFAE (ref), appChatFAEBannerModule (ref), chatLandingModalModule (ref), enum (ref), getAgeVerifiedChangedSignal (ref)
	local var2
	local var3 = useDispatch()
	local var4 = useAnalyticsModule()
	local var5 = useContext(luaAppNavigationContextModule)
	local var6 = useNavigation()
	local var7, var8 = useState({})
	local var9 = useIsInExperienceModule()
	local var10 = useSelector(function(p1)
		-- upvalues: modalConfigurationModule (copy), getDeepValue2Module (copy)
		return getDeepValue2Module(p1, "ChatAppReducer.Modals.chatLandingModal") or modalConfigurationModule.default
	end)
	local modalVariant = var10.modal_variant
	local var11 = getDeepValue2Module(var10, "modal_layout.id")
	local var12 = getDeepValue2Module(var10, "modal_layout.seen_record_action")
	local var13 = getDeepValue2Module(var10, "modal_layout.dismissed_record_action")
	local var14 = getDeepValue2Module(var10, "modal_layout.buttons")
	local var15 = var14 and var14[1]
	local var16 = t_1[modalVariant]
	
	if not t[modalVariant] then
		var2 = modalVariant == chatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal and not var7[modalVariant]
	end
	local var17 = useTelemetryModule(chatLandingTelemetryLayerModule.Context)
	useEffectOnMount(function()
		-- upvalues: var4 (ref), var16 (ref), var2 (ref)
		if var4 and var16 and var2 then
			var4.fireAnalyticsEvent(`{var16}Rendered`)
		end
	end)
	useEffect(function()
		-- upvalues: var2 (ref), modalVariant (ref), chatLandingModalVariant (copy), var17 (ref), chatLandingModalTelemetryModule (copy)
		if var2 and modalVariant == chatLandingModalVariant.AgeAssuranceUpsell then
			var17.emit(chatLandingModalTelemetryModule.Events.FaeModalShown, {})
		end
		if var2 then
			var17.emit(chatLandingModalTelemetryModule.Events.ModalRendered, { modalVariant = modalVariant })
		end
	end, { modalVariant, var2 })
	local var18 = useCallback(function()
		-- upvalues: var4 (ref), var16 (ref), appPage (copy), unfilteredThreadsAMPFeatureNameModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var3 (ref), navigateBack (copy), accessResponseEnum (copy), refreshAllUnfilteredThreadsDetailsModule (copy), var9 (ref), navigateDown (copy)
		if var4 and var16 then
			var4.fireAnalyticsEvent(`{var16}ContinueClicked`)
		end
		local t = {
			name = appPage.AmpWizardContainer,
			extraProps = {
				featureName = unfilteredThreadsAMPFeatureNameModule,
				completionCallback = function(p1, _)
					-- upvalues: fFlagSignalsNavP3Dispatch (copy), var1 (copy), var3 (copy), navigateBack (copy), accessResponseEnum (copy), var4 (copy), var16 (copy), refreshAllUnfilteredThreadsDetailsModule (copy), var9 (copy)
					if fFlagSignalsNavP3Dispatch then
						var1.back(true)
					else
						var3(navigateBack(true))
					end
					if p1 == accessResponseEnum.Granted then
						if var4 and var16 then
							var4.fireAnalyticsEvent(`{var16}Succeeded`)
						end
						var3(refreshAllUnfilteredThreadsDetailsModule(nil, var9))
						
						return
					elseif var4 and var16 then
						var4.fireAnalyticsEvent(`{var16}Failed`)
					end
				end
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var3(navigateDown(t))
	end, { var3, var4, var16 })
	local var19 = useCallback(function()
		-- upvalues: httpService (copy), var17 (ref), chatLandingModalTelemetryModule (copy), appPage (copy), fStringCanAccessTrustedContactsAmpFeature (copy), fStringCanAccessTrustedContactsAmpNameSpace (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var3 (ref), navigateBack (copy), accessResponseEnum (copy), modalVariant (ref), modalTelemetryModule (copy), refreshAllUnfilteredThreadsDetailsModule (copy), var9 (ref), fFlagDebugAppChatFaeModule (copy), fFlagDebugAEGIS1AppChatBannerModule (copy), navigateDown (copy)
		local var20 = httpService:GenerateGUID(false)
		var17.emit(chatLandingModalTelemetryModule.Events.TelemetryFaeButtonClick, {
			state = var20,
			btn = chatLandingModalTelemetryModule.Constants.ConfirmFaeBtn
		})
		local t = {
			name = appPage.AmpWizardContainer,
			extraProps = {
				featureName = fStringCanAccessTrustedContactsAmpFeature,
				entryPointEventCtx = chatLandingModalTelemetryModule.Constants.EventStreamCtx,
				metadata = { sessionId = var20 },
				nameSpace = fStringCanAccessTrustedContactsAmpNameSpace,
				completionCallback = function(p1, _)
					-- upvalues: fFlagSignalsNavP3Dispatch (copy), var1 (copy), var3 (copy), navigateBack (copy), accessResponseEnum (copy), var17 (copy), chatLandingModalTelemetryModule (copy), modalVariant (copy), modalTelemetryModule (copy), refreshAllUnfilteredThreadsDetailsModule (copy), var9 (copy), fFlagDebugAppChatFaeModule (copy), fFlagDebugAEGIS1AppChatBannerModule (copy)
					if fFlagSignalsNavP3Dispatch then
						var1.back(true)
					else
						var3(navigateBack(true))
					end
					if p1 == accessResponseEnum.Granted then
						var17.emit(chatLandingModalTelemetryModule.Events.ModalActionResult, {
							modalVariant = modalVariant,
							action = modalTelemetryModule.Enums.ModalActions.PrimaryCta,
							actionResult = modalTelemetryModule.Enums.ModalActionResults.Success
						})
						var3(refreshAllUnfilteredThreadsDetailsModule(nil, var9))
					else
						var17.emit(chatLandingModalTelemetryModule.Events.ModalActionResult, {
							modalVariant = modalVariant,
							action = modalTelemetryModule.Enums.ModalActions.PrimaryCta,
							actionResult = modalTelemetryModule.Enums.ModalActionResults.Failure
						})
					end
					if fFlagDebugAppChatFaeModule or fFlagDebugAEGIS1AppChatBannerModule then
						var3({ type = "DEBUG_DismissChatLandingModal" })
					end
				end
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var3(navigateDown(t))
	end, { var3, var9, var17, modalVariant })
	local var20 = useCallback(function()
		-- upvalues: var4 (ref), var16 (ref), var6 (ref), var5 (ref)
		if var4 and var16 then
			var4.fireAnalyticsEvent(`{var16}LearnMoreClicked`)
		end
		var5.navigateToUnfilteredThreadsLearnMore(if var6 then var6.navigate else nil)
	end, { var5, var4, var6, var16 })
	local var21 = useCallback(function()
		-- upvalues: var4 (ref), var16 (ref), modalVariant (ref), chatLandingModalVariant (copy), var17 (ref), chatLandingModalTelemetryModule (copy), httpService (copy), modalTelemetryModule (copy), var3 (ref), appChatNetworkingModule (copy), var13 (ref), var11 (ref), fFlagDebugAppChatFaeModule (copy), fFlagDebugAEGIS1AppChatBannerModule (copy), var8 (ref), cryoModule (copy), var7 (ref)
		if var4 and var16 then
			var4.fireAnalyticsEvent(`{var16}Dismissed`)
		end
		if modalVariant == chatLandingModalVariant.AgeAssuranceUpsell then
			var17.emit(chatLandingModalTelemetryModule.Events.TelemetryFaeButtonClick, {
				state = httpService:GenerateGUID(false),
				btn = chatLandingModalTelemetryModule.Constants.CancelFaeBtn
			})
		end
		var17.emit(chatLandingModalTelemetryModule.Events.ModalAction, {
			modalVariant = modalVariant,
			action = modalTelemetryModule.Enums.ModalActions.Dismiss
		})
		var3(appChatNetworkingModule.rodux.RecordModalSequenceResponse.API(var13, "chat_landing_modal", var11)):catch(function(p1)
			warn("Error in ChatLandingModalContainer -> RecordModalSequenceResponse dismissed: " .. tostring(p1), p1)
		end)
		
		if fFlagDebugAppChatFaeModule and modalVariant == chatLandingModalVariant.AgeAssuranceUpsell or fFlagDebugAEGIS1AppChatBannerModule and modalVariant == chatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal then
			var3({ type = "DEBUG_DismissChatLandingModal" })
			
			return
		end
		var8(cryoModule.Dictionary.join(var7, { [modalVariant] = true }))
	end, {
		var7, var8, var3, var4, var16, var13, modalVariant, var11, var17
	})
	local var22 = ({
		[chatLandingModalVariant.AgeAssuranceUpsell] = useCallback(function()
			-- upvalues: var3 (ref), openTcLearnMoreLinkModule (copy)
			var3(openTcLearnMoreLinkModule())
		end, { var3 })
	})[modalVariant]
	local var23 = useCallback(function(...)
		-- upvalues: var17 (ref), chatLandingModalTelemetryModule (copy), modalVariant (ref), modalTelemetryModule (copy), var22 (ref)
		var17.emit(chatLandingModalTelemetryModule.Events.ModalAction, {
			modalVariant = modalVariant,
			action = modalTelemetryModule.Enums.ModalActions.InlineCta
		})
		var22(...)
	end, { var22, var17, modalVariant })
	local additionalContent = var10 and (var10.modal_layout and (var10.modal_layout.body and (var10.modal_layout.body.additional_content or {})))
	local var24 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), additionalContent (ref), appChatNetworkingModule (copy), var23 (ref)
		return cryoModule.List.map(additionalContent, function(p1)
			-- upvalues: appChatNetworkingModule (copy), var23 (copy)
			local t = { type = p1.type, text = p1.text }
			
			if p1.type == appChatNetworkingModule.Constants.ModalContentType.Link then
				t.onActivated = var23
			end
			return t
		end)
	end, { additionalContent, var22, var23 })
	local var25 = ({
		phone_verify = var18,
		fully_eligible_ftux = var20,
		[chatLandingModalVariant.AgeAssuranceUpsell] = var19
	})[modalVariant]
	local var26 = useCallback(function(...)
		-- upvalues: var17 (ref), chatLandingModalTelemetryModule (copy), modalVariant (ref), modalTelemetryModule (copy), var25 (ref)
		var17.emit(chatLandingModalTelemetryModule.Events.ModalAction, {
			modalVariant = modalVariant,
			action = modalTelemetryModule.Enums.ModalActions.PrimaryCta
		})
		var25(...)
	end, { var25, var17, modalVariant })
	local var27 = useRef(nil)
	useRecordModalSeenWithDelayModule({
		modalSequence = "chat_landing_modal",
		modalId = var11,
		actionToRecord = var12,
		delayMs = fIntAppChatModalSeenImpressionDelayMsModule,
		canRecordAction = useIsGuiInChatVisibleModule(var27, { var27.current, var2 }) and var2
	})
	local var28 = if fFlagDebugAppChatFaeModule then reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		var3({ type = "DEBUG_ShowAppChatFaeUpsell" })
	end, { var3 }) else function() end
	local var29 = if fFlagDebugAEGIS1AppChatBannerModule then reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		var3({ type = "DEBUG_ShowChatLandingAgeVerifiedTimedModal" })
	end, { var3 }) else nil
	
	if fFlagTestDeviceForFAEUpsell and not deviceMeetsRequirementsForFAE() then
		return nil
	elseif var2 then
		return if modalVariant == chatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal then reactModule.createElement(appChatFAEBannerModule, { modalConfiguration = var10, onDismiss = var21 }) else reactModule.createElement(chatLandingModalModule, {
			titleLabelText = getDeepValue2Module(var10, "modal_layout.label.text"),
			titleText = getDeepValue2Module(var10, "modal_layout.header.text"),
			bodyText = getDeepValue2Module(var10, "modal_layout.body.text"),
			additionalContent = var24,
			actionText = var15 and var15.text,
			buttonType = if modalVariant == "fully_eligible_ftux" then enum.ButtonType.Secondary else enum.ButtonType.PrimarySystem,
			onActivated = var26,
			onDismissed = var21,
			hideActionButton = not var15 or not var25,
			ref = var27
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
			[reactModule.Event.Activated] = var29
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
		[reactModule.Event.Activated] = var28
	}) else nil
end)