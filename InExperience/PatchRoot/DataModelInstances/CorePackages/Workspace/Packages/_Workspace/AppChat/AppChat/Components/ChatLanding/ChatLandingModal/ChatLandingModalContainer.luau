local HttpService = game:GetService("HttpService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local LuaAppNavigationContextModule = require(AppChat.LuaAppNavigationContext)
local GetDeepValue2Module = require(AppChat.Utils.getDeepValue2)
local UseAnalyticsModule = require(AppChat.Analytics.useAnalytics)
local UseCallbackFunction = ReactModule.useCallback
local UseContextFunction = ReactModule.useContext
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseEffectOnMountFunction = require(Parent.RoactUtils).Hooks.useEffectOnMount
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseStateFunction = ReactModule.useState
local UseRefFunction = ReactModule.useRef
local UseIsGuiInChatVisibleModule = require(AppChat.Hooks.useIsGuiInChatVisible)
local UseRecordModalSeenWithDelayModule = require(AppChat.Hooks.useRecordModalSeenWithDelay)
local ChatLandingModalTelemetryModule = require(script.Parent.ChatLandingModalTelemetry)
local ChatLandingTelemetryEventsModule = require(AppChat.Components.ChatLanding.ChatLandingTelemetryEvents)
local ChatLandingTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local ModalTelemetryModule = require(AppChat.Components.ModalTelemetry)
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local ButtonEnum = require(Parent.UIBlox).App.Button.Enum
local AccessResponseEnum = require(Parent.AmpUpsell).AmpEnums.AccessResponseEnum
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local ChatLandingModalVariant = AppChatNetworkingModule.Constants.ChatLandingModalVariant
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local RefreshAllUnfilteredThreadsDetailsModule = require(AppChat.Conversations.Thunks.refreshAllUnfilteredThreadsDetails)
local UnfilteredThreadsAMPFeatureNameModule = require(AppChat.Components.UnfilteredThreadsAMPFeatureName)
local OpenTcLearnMoreLinkModule = require(AppChat.Conversations.Thunks.OpenTcLearnMoreLink)
local ModalConfigurationModule = require(AppChat.Models.ModalConfiguration)
local AppChatFAEBannerModule = require(AppChat.Components.FaeBanner.AppChatFAEBanner)
local FIntAppChatModalSeenImpressionDelayMsModule = require(AppChat.Flags.FIntAppChatModalSeenImpressionDelayMs)
local FFlagAppChatLandingModalTelemetryModule = require(AppChat.Flags.FFlagAppChatLandingModalTelemetry)
local FFlagDebugAppChatFaeModule = require(AppChat.Flags.FFlagDebugAppChatFae)
local FStringCanAccessTrustedContactsAmpFeature = require(Parent.SharedFlags).FStringCanAccessTrustedContactsAmpFeature
local FStringCanAccessTrustedContactsAmpNameSpace = require(Parent.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace
local FFlagDebugAEGIS1AppChatBannerModule = require(AppChat.Flags.FFlagDebugAEGIS1AppChatBanner)
local FFlagTestDeviceForFAEUpsell = require(Parent.SocialExperiments).FFlagTestDeviceForFAEUpsell
local DeviceMeetsRequirementsForFAEFunction = require(Parent.SocialExperiments).deviceMeetsRequirementsForFAE
local GetAgeVerifiedChangedSignalFunction = require(Parent.SocialUpsell).Signals.GetAgeVerifiedChangedSignal
local ChatLandingModalModule = require(script.Parent.ChatLandingModal)
local config = {
	fully_eligible_ftux = true,
	party_only_ftux = true,
	phone_verify = true,
	[ChatLandingModalVariant.AgeAssuranceUpsell] = true
}
local config1 = {
	fully_eligible_ftux = "ChatLandingUnfilteredThreadsFtux",
	phone_verify = "ChatLandingPvUpsell"
}

return ReactModule.memo(function(_)
	-- upvalues: UseDispatchFunction (copy), UseAnalyticsModule (copy), UseContextFunction (copy), LuaAppNavigationContextModule (copy), UseNavigationFunction (copy), UseStateFunction (copy), UseIsInExperienceModule (copy), UseSelectorFunction (copy), ModalConfigurationModule (copy), GetDeepValue2Module (copy), config1 (copy), config (copy), ChatLandingModalVariant (copy), UseTelemetryModule (copy), ChatLandingTelemetryLayerModule (copy), UseEffectOnMountFunction (copy), FFlagAppChatLandingModalTelemetryModule (copy), ChatLandingTelemetryEventsModule (copy), UseEffectFunction (copy), ChatLandingModalTelemetryModule (copy), UseCallbackFunction (copy), AppPage (copy), UnfilteredThreadsAMPFeatureNameModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), AccessResponseEnum (copy), RefreshAllUnfilteredThreadsDetailsModule (copy), NavigateDownFunction (copy), HttpService (copy), FStringCanAccessTrustedContactsAmpFeature (copy), FStringCanAccessTrustedContactsAmpNameSpace (copy), ModalTelemetryModule (copy), FFlagDebugAppChatFaeModule (copy), FFlagDebugAEGIS1AppChatBannerModule (copy), OpenTcLearnMoreLinkModule (copy), AppChatNetworkingModule (copy), CryoModule (copy), ReactModule (copy), UseRefFunction (copy), UseIsGuiInChatVisibleModule (copy), UseRecordModalSeenWithDelayModule (copy), FIntAppChatModalSeenImpressionDelayMsModule (copy), FFlagTestDeviceForFAEUpsell (copy), DeviceMeetsRequirementsForFAEFunction (copy), AppChatFAEBannerModule (copy), ChatLandingModalModule (copy), ButtonEnum (copy), GetAgeVerifiedChangedSignalFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseContextResult = UseContextFunction(LuaAppNavigationContextModule)
	local UseNavigationResult = UseNavigationFunction()
	local UseStateResult, UseStateResult2 = UseStateFunction({})
	local UseIsInExperienceModuleResult = UseIsInExperienceModule()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: ModalConfigurationModule (upval), GetDeepValue2Module (upval)
		local Default = ModalConfigurationModule.default
		
		return GetDeepValue2Module(p1, "ChatAppReducer.Modals.chatLandingModal") or Default
	end)
	local ModalVariant = UseSelectorResult.modal_variant
	local ModalLayoutId = GetDeepValue2Module(UseSelectorResult, "modal_layout.id")
	local ModalLayoutSeenRecordAction = GetDeepValue2Module(UseSelectorResult, "modal_layout.seen_record_action")
	local ModalLayoutDismissedRecordAction = GetDeepValue2Module(UseSelectorResult, "modal_layout.dismissed_record_action")
	local ModalLayoutButtons = GetDeepValue2Module(UseSelectorResult, "modal_layout.buttons")
	local ModalLayoutButton = ModalLayoutButtons and ModalLayoutButtons[1]
	local Entry = config1[ModalVariant]
	local Inverted: boolean = if config[ModalVariant] then not UseStateResult[ModalVariant] else ModalVariant == ChatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal and not UseStateResult[ModalVariant]
	local UseTelemetryModuleResult = UseTelemetryModule(ChatLandingTelemetryLayerModule.Context)
	UseEffectOnMountFunction(function()
		-- upvalues: UseAnalyticsModuleResult (copy), Entry (copy), Inverted (copy), FFlagAppChatLandingModalTelemetryModule (upval), UseTelemetryModuleResult (copy), ChatLandingTelemetryEventsModule (upval)
		if UseAnalyticsModuleResult and Entry and Inverted then
			UseAnalyticsModuleResult.fireAnalyticsEvent(`{Entry}Rendered`)
		end
		if FFlagAppChatLandingModalTelemetryModule and Entry and Inverted then
			UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule[`{Entry}Rendered`], {})
		end
	end)
	UseEffectFunction(function()
		-- upvalues: Inverted (copy), ModalVariant (copy), ChatLandingModalVariant (upval), UseTelemetryModuleResult (copy), ChatLandingModalTelemetryModule (upval)
		if Inverted and ModalVariant == ChatLandingModalVariant.AgeAssuranceUpsell then
			UseTelemetryModuleResult.emit(ChatLandingModalTelemetryModule.Events.FaeModalShown, {})
		end
		if Inverted then
			UseTelemetryModuleResult.emit(ChatLandingModalTelemetryModule.Events.ModalRendered, { modalVariant = ModalVariant })
		end
	end, { ModalVariant, Inverted })
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseAnalyticsModuleResult (copy), Entry (copy), FFlagAppChatLandingModalTelemetryModule (upval), UseTelemetryModuleResult (copy), ChatLandingTelemetryEventsModule (upval), AppPage (upval), UnfilteredThreadsAMPFeatureNameModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval), AccessResponseEnum (upval), RefreshAllUnfilteredThreadsDetailsModule (upval), UseIsInExperienceModuleResult (copy), NavigateDownFunction (upval)
		if UseAnalyticsModuleResult and Entry then
			UseAnalyticsModuleResult.fireAnalyticsEvent(`{Entry}ContinueClicked`)
		end
		if FFlagAppChatLandingModalTelemetryModule and Entry then
			UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule[`{Entry}ContinueClicked`], {})
		end
		local config = {
			name = AppPage.AmpWizardContainer,
			extraProps = {
				featureName = UnfilteredThreadsAMPFeatureNameModule,
				completionCallback = function(Granted, _)
					-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateBackFunction (upval), AccessResponseEnum (upval), UseAnalyticsModuleResult (upval), Entry (upval), FFlagAppChatLandingModalTelemetryModule (upval), UseTelemetryModuleResult (upval), ChatLandingTelemetryEventsModule (upval), RefreshAllUnfilteredThreadsDetailsModule (upval), UseIsInExperienceModuleResult (upval)
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.back(true)
					else
						UseDispatchResult(NavigateBackFunction(true))
					end
					if Granted == AccessResponseEnum.Granted then
						if UseAnalyticsModuleResult and Entry then
							UseAnalyticsModuleResult.fireAnalyticsEvent(`{Entry}Succeeded`)
						end
						if FFlagAppChatLandingModalTelemetryModule and Entry then
							UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule[`{Entry}Succeeded`], {})
						end
						UseDispatchResult(RefreshAllUnfilteredThreadsDetailsModule(nil, UseIsInExperienceModuleResult))
						
						return
					else
						if UseAnalyticsModuleResult and Entry then
							UseAnalyticsModuleResult.fireAnalyticsEvent(`{Entry}Failed`)
						end
						if FFlagAppChatLandingModalTelemetryModule and Entry then
							UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule[`{Entry}Failed`], {})
						end
					end
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
		UseDispatchResult,
		UseIsInExperienceModuleResult,
		UseAnalyticsModuleResult,
		Entry,
		if FFlagAppChatLandingModalTelemetryModule then UseTelemetryModuleResult else false
	})
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: HttpService (upval), UseTelemetryModuleResult (copy), ChatLandingModalTelemetryModule (upval), AppPage (upval), FStringCanAccessTrustedContactsAmpFeature (upval), FStringCanAccessTrustedContactsAmpNameSpace (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval), AccessResponseEnum (upval), ModalVariant (copy), ModalTelemetryModule (upval), RefreshAllUnfilteredThreadsDetailsModule (upval), UseIsInExperienceModuleResult (copy), FFlagDebugAppChatFaeModule (upval), FFlagDebugAEGIS1AppChatBannerModule (upval), NavigateDownFunction (upval)
		local Guid = HttpService:GenerateGUID(false)
		UseTelemetryModuleResult.emit(ChatLandingModalTelemetryModule.Events.TelemetryFaeButtonClick, {
			state = Guid,
			btn = ChatLandingModalTelemetryModule.Constants.ConfirmFaeBtn
		})
		local config = {
			name = AppPage.AmpWizardContainer,
			extraProps = {
				featureName = FStringCanAccessTrustedContactsAmpFeature,
				entryPointEventCtx = ChatLandingModalTelemetryModule.Constants.EventStreamCtx,
				metadata = { sessionId = Guid },
				nameSpace = FStringCanAccessTrustedContactsAmpNameSpace,
				completionCallback = function(Granted, _)
					-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateBackFunction (upval), AccessResponseEnum (upval), UseTelemetryModuleResult (upval), ChatLandingModalTelemetryModule (upval), ModalVariant (upval), ModalTelemetryModule (upval), RefreshAllUnfilteredThreadsDetailsModule (upval), UseIsInExperienceModuleResult (upval), FFlagDebugAppChatFaeModule (upval), FFlagDebugAEGIS1AppChatBannerModule (upval)
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.back(true)
					else
						UseDispatchResult(NavigateBackFunction(true))
					end
					if Granted == AccessResponseEnum.Granted then
						UseTelemetryModuleResult.emit(ChatLandingModalTelemetryModule.Events.ModalActionResult, {
							modalVariant = ModalVariant,
							action = ModalTelemetryModule.Enums.ModalActions.PrimaryCta,
							actionResult = ModalTelemetryModule.Enums.ModalActionResults.Success
						})
						UseDispatchResult(RefreshAllUnfilteredThreadsDetailsModule(nil, UseIsInExperienceModuleResult))
					else
						UseTelemetryModuleResult.emit(ChatLandingModalTelemetryModule.Events.ModalActionResult, {
							modalVariant = ModalVariant,
							action = ModalTelemetryModule.Enums.ModalActions.PrimaryCta,
							actionResult = ModalTelemetryModule.Enums.ModalActionResults.Failure
						})
					end
					if FFlagDebugAppChatFaeModule or FFlagDebugAEGIS1AppChatBannerModule then
						UseDispatchResult({ type = "DEBUG_DismissChatLandingModal" })
					end
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
		UseDispatchResult,
		UseIsInExperienceModuleResult,
		UseTelemetryModuleResult,
		ModalVariant
	})
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: UseAnalyticsModuleResult (copy), Entry (copy), FFlagAppChatLandingModalTelemetryModule (upval), UseTelemetryModuleResult (copy), ChatLandingTelemetryEventsModule (upval), UseNavigationResult (copy), UseContextResult (copy)
		if UseAnalyticsModuleResult and Entry then
			UseAnalyticsModuleResult.fireAnalyticsEvent(`{Entry}LearnMoreClicked`)
		end
		if FFlagAppChatLandingModalTelemetryModule and Entry then
			UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule[`{Entry}LearnMoreClicked`], {})
		end
		UseContextResult.navigateToUnfilteredThreadsLearnMore(if UseNavigationResult then UseNavigationResult.navigate else nil)
	end, {
		UseContextResult,
		UseAnalyticsModuleResult,
		UseNavigationResult,
		Entry,
		if FFlagAppChatLandingModalTelemetryModule then UseTelemetryModuleResult else false
	})
	local UseCallbackResult3 = UseCallbackFunction(function()
		-- upvalues: UseDispatchResult (copy), OpenTcLearnMoreLinkModule (upval)
		UseDispatchResult(OpenTcLearnMoreLinkModule())
	end, { UseDispatchResult })
	local UseCallbackResult4 = UseCallbackFunction(function()
		-- upvalues: UseAnalyticsModuleResult (copy), Entry (copy), FFlagAppChatLandingModalTelemetryModule (upval), UseTelemetryModuleResult (copy), ChatLandingTelemetryEventsModule (upval), ModalVariant (copy), ChatLandingModalVariant (upval), ChatLandingModalTelemetryModule (upval), HttpService (upval), ModalTelemetryModule (upval), UseDispatchResult (copy), AppChatNetworkingModule (upval), ModalLayoutDismissedRecordAction (copy), ModalLayoutId (copy), FFlagDebugAppChatFaeModule (upval), FFlagDebugAEGIS1AppChatBannerModule (upval), UseStateResult2 (copy), CryoModule (upval), UseStateResult (copy)
		if UseAnalyticsModuleResult and Entry then
			UseAnalyticsModuleResult.fireAnalyticsEvent(`{Entry}Dismissed`)
		end
		if FFlagAppChatLandingModalTelemetryModule and Entry then
			UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule[`{Entry}Dismissed`], {})
		end
		if ModalVariant == ChatLandingModalVariant.AgeAssuranceUpsell then
			UseTelemetryModuleResult.emit(ChatLandingModalTelemetryModule.Events.TelemetryFaeButtonClick, {
				state = HttpService:GenerateGUID(false),
				btn = ChatLandingModalTelemetryModule.Constants.CancelFaeBtn
			})
		end
		UseTelemetryModuleResult.emit(ChatLandingModalTelemetryModule.Events.ModalAction, {
			modalVariant = ModalVariant,
			action = ModalTelemetryModule.Enums.ModalActions.Dismiss
		})
		UseDispatchResult(AppChatNetworkingModule.rodux.RecordModalSequenceResponse.API(ModalLayoutDismissedRecordAction, "chat_landing_modal", ModalLayoutId)):catch(function(Err)
			warn("Error in ChatLandingModalContainer -> RecordModalSequenceResponse dismissed: " .. tostring(Err), Err)
		end)
		
		if FFlagDebugAppChatFaeModule and ModalVariant == ChatLandingModalVariant.AgeAssuranceUpsell or FFlagDebugAEGIS1AppChatBannerModule and ModalVariant == ChatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal then
			UseDispatchResult({ type = "DEBUG_DismissChatLandingModal" })
			
			return
		else
			UseStateResult2(CryoModule.Dictionary.join(UseStateResult, { [ModalVariant] = true }))
		end
	end, {
		UseStateResult, UseStateResult2, UseDispatchResult, UseAnalyticsModuleResult,
		Entry, ModalLayoutDismissedRecordAction, ModalVariant, ModalLayoutId,
		UseTelemetryModuleResult
	})
	local Entry1 = ({
		[ChatLandingModalVariant.AgeAssuranceUpsell] = UseCallbackResult3
	})[ModalVariant]
	local UseCallbackResult5 = UseCallbackFunction(function(...)
		-- upvalues: UseTelemetryModuleResult (copy), ChatLandingModalTelemetryModule (upval), ModalVariant (copy), ModalTelemetryModule (upval), Entry1 (copy)
		UseTelemetryModuleResult.emit(ChatLandingModalTelemetryModule.Events.ModalAction, {
			modalVariant = ModalVariant,
			action = ModalTelemetryModule.Enums.ModalActions.InlineCta
		})
		Entry1(...)
	end, { Entry1, UseTelemetryModuleResult, ModalVariant })
	local AdditionalContent = UseSelectorResult and UseSelectorResult.modal_layout and UseSelectorResult.modal_layout.body and UseSelectorResult.modal_layout.body.additional_content or {}
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), AdditionalContent (copy), AppChatNetworkingModule (upval), UseCallbackResult5 (copy)
		return CryoModule.List.map(AdditionalContent, function(p1)
			-- upvalues: AppChatNetworkingModule (upval), UseCallbackResult5 (upval)
			local config = { type = p1.type, text = p1.text }
			
			if p1.type == AppChatNetworkingModule.Constants.ModalContentType.Link then
				config.onActivated = UseCallbackResult5
			end
			return config
		end)
	end, { AdditionalContent, Entry1, UseCallbackResult5 })
	local Entry2 = ({
		phone_verify = UseCallbackResult,
		fully_eligible_ftux = UseCallbackResult2,
		[ChatLandingModalVariant.AgeAssuranceUpsell] = UseCallbackResult1
	})[ModalVariant]
	local UseCallbackResult6 = UseCallbackFunction(function(...)
		-- upvalues: UseTelemetryModuleResult (copy), ChatLandingModalTelemetryModule (upval), ModalVariant (copy), ModalTelemetryModule (upval), Entry2 (copy)
		UseTelemetryModuleResult.emit(ChatLandingModalTelemetryModule.Events.ModalAction, {
			modalVariant = ModalVariant,
			action = ModalTelemetryModule.Enums.ModalActions.PrimaryCta
		})
		Entry2(...)
	end, { Entry2, UseTelemetryModuleResult, ModalVariant })
	local UseRefResult = UseRefFunction(nil)
	UseRecordModalSeenWithDelayModule({
		modalSequence = "chat_landing_modal",
		modalId = ModalLayoutId,
		actionToRecord = ModalLayoutSeenRecordAction,
		delayMs = FIntAppChatModalSeenImpressionDelayMsModule,
		canRecordAction = UseIsGuiInChatVisibleModule(UseRefResult, { UseRefResult.current, Inverted }) and Inverted
	})
	local UseResult = if FFlagDebugAppChatFaeModule then ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy)
		UseDispatchResult({ type = "DEBUG_ShowAppChatFaeUpsell" })
	end, { UseDispatchResult }) else function() end
	local UseResult1 = if FFlagDebugAEGIS1AppChatBannerModule then ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy)
		UseDispatchResult({ type = "DEBUG_ShowChatLandingAgeVerifiedTimedModal" })
	end, { UseDispatchResult }) else nil
	
	if FFlagTestDeviceForFAEUpsell and not DeviceMeetsRequirementsForFAEFunction() then
		return nil
	end
	if Inverted then
		return if ModalVariant == ChatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal then ReactModule.createElement(AppChatFAEBannerModule, {
			modalConfiguration = UseSelectorResult,
			onDismiss = UseCallbackResult4
		}) else ReactModule.createElement(ChatLandingModalModule, {
			titleLabelText = GetDeepValue2Module(UseSelectorResult, "modal_layout.label.text"),
			titleText = GetDeepValue2Module(UseSelectorResult, "modal_layout.header.text"),
			bodyText = GetDeepValue2Module(UseSelectorResult, "modal_layout.body.text"),
			additionalContent = UseMemoResult,
			actionText = ModalLayoutButton and ModalLayoutButton.text,
			buttonType = if ModalVariant == "fully_eligible_ftux" then ButtonEnum.ButtonType.Secondary else ButtonEnum.ButtonType.PrimarySystem,
			onActivated = UseCallbackResult6,
			onDismissed = UseCallbackResult4,
			hideActionButton = not ModalLayoutButton or not Entry2,
			ref = UseRefResult
		})
	end
	if ModalVariant ~= "none" and ModalVariant ~= nil and not config[ModalVariant] then
		warn("Unsupported ChatLandingModal variant: " .. ModalVariant)
	end
	return if FFlagDebugAEGIS1AppChatBannerModule then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 200)
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.Name,
			Padding = UDim.new(0, 10)
		}),
		Btn1 = ReactModule.createElement("TextButton", {
			Text = "DEBUG Show Chat Landing Age Verfication Timed Modal",
			Size = UDim2.new(0, 200, 0, 50),
			[ReactModule.Event.Activated] = UseResult1
		}),
		Btn2 = ReactModule.createElement("TextButton", {
			Text = "DEBUG Fire Age Verified event",
			Size = UDim2.new(0, 200, 0, 50),
			[ReactModule.Event.Activated] = function()
				-- upvalues: GetAgeVerifiedChangedSignalFunction (upval)
				GetAgeVerifiedChangedSignalFunction():fire()
			end
		})
	}) elseif FFlagDebugAppChatFaeModule then ReactModule.createElement("TextButton", {
		Text = "DEBUG Show FAE Upsell",
		Size = UDim2.new(0, 200, 0, 50),
		[ReactModule.Event.Activated] = UseResult
	}) else nil
end)