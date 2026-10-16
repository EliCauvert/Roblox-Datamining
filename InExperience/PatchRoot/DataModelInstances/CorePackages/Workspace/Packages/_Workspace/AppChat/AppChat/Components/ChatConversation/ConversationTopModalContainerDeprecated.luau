local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FoundationModule = require(Parent.Foundation)
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local GetDeepValue2Module = require(AppChat.Utils.getDeepValue2)
local UseAnalyticsModule = require(AppChat.Analytics.useAnalytics)
local UseCallbackFunction = ReactModule.useCallback
local UseConversationTopModalModule = require(AppChat.Hooks.useConversationTopModal)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local AccessResponseEnum = require(Parent.AmpUpsell).AmpEnums.AccessResponseEnum
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local _ = require(AppChat.Models.ConversationChannels)
local DismissedConversationTopModalModule = require(AppChat.Conversations.Actions.DismissedConversationTopModal)
local EnumScreensModule = require(AppChat.EnumScreens)
local EventNamesModule = require(AppChat.Analytics.EventNames)
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local RefreshAllUnfilteredThreadsDetailsModule = require(AppChat.Conversations.Thunks.refreshAllUnfilteredThreadsDetails)
local UnfilteredThreadsAMPFeatureNameModule = require(AppChat.Components.UnfilteredThreadsAMPFeatureName)
local ConversationModalModule = require(script.Parent.ConversationModal.ConversationModal)
local ConversationBannerDeprecatedModule = require(script.Parent.ConversationBanner.ConversationBannerDeprecated)
local config = {
	conversation = {},
	navigateToScreen = function(...) --[[ Line: 50 ]] end,
	setModalHeight = function(_) --[[ Line: 51 ]] end
}
local config1 = {
	conversation_banner_group_phone_verification = true,
	conversation_banner_group_duplicate_upgrade = true,
	conversation_banner_learn_more = true,
	conversation_banner_one_to_one_phone_verification = true
}
local CreateUnfilteredChatPartialModal = EnumScreensModule.CreateUnfilteredChatPartialModal
local LearnMorePartialModal = EnumScreensModule.LearnMorePartialModal
local config2 = {
	conversation_banner_group_phone_verification = "ConversationPvBanner",
	conversation_banner_one_to_one_phone_verification = "ConversationPvBanner",
	conversation_banner_group_duplicate_upgrade = "ConversationUpgradeBanner",
	conversation_banner_learn_more = "ConversationLearnMoreBanner"
}

return ReactModule.memo(function(p1) --[[ Line: 71 | Named "ConversationTopModalContainer" ]]
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), UseAnalyticsModule (copy), UseDispatchFunction (copy), UseRefFunction (copy), UseEffectFunction (copy), UseSelectorFunction (copy), GetDeepValue2Module (copy), UseConversationTopModalModule (copy), config2 (copy), config1 (copy), UseCallbackFunction (copy), EventNamesModule (copy), AppChatNetworkingModule (copy), DismissedConversationTopModalModule (copy), AppPage (copy), UnfilteredThreadsAMPFeatureNameModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), AccessResponseEnum (copy), RefreshAllUnfilteredThreadsDetailsModule (copy), NavigateDownFunction (copy), CreateUnfilteredChatPartialModal (copy), LearnMorePartialModal (copy), ReactModule (copy), ConversationBannerDeprecatedModule (copy), ConversationModalModule (copy), FoundationModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseStyleResult = UseStyleFunction()
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local Size1000 = UseStyleResult.Tokens.Size.Size_1000
	local UseRefResult = UseRefFunction(UnionResult.setModalHeight)
	UseEffectFunction(function() --[[ Line: 80 ]]
		-- upvalues: UseRefResult (copy), UnionResult (copy)
		UseRefResult.current = UnionResult.setModalHeight
	end, { UnionResult.setModalHeight })
	UseEffectFunction(function() --[[ Line: 83 ]]
		-- upvalues: UseRefResult (copy)
		return function() --[[ Line: 84 ]]
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				UseRefResult.current(0)
			end
		end
	end, {})
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 91 ]]
		-- upvalues: GetDeepValue2Module (upval), UnionResult (copy)
		return GetDeepValue2Module(p2, `ChatAppReducer.Modals.conversationTopModalsDismissed.{UnionResult.conversation.id}`) or {}
	end)
	local UseConversationTopModalModuleResult = UseConversationTopModalModule(UnionResult.conversation.id) or {}
	local ModalVariant = UseConversationTopModalModuleResult.modal_variant
	local ModalLayoutId = GetDeepValue2Module(UseConversationTopModalModuleResult, "modal_layout.id")
	local ModalLayoutSeenRecordAction = GetDeepValue2Module(UseConversationTopModalModuleResult, "modal_layout.seen_record_action")
	local ModalLayoutDismissRecordAction = GetDeepValue2Module(UseConversationTopModalModuleResult, "modal_layout.dismiss_record_action")
	local Entry = config2[ModalVariant]
	local Inverted: boolean = config1[ModalVariant] and not UseSelectorResult[ModalVariant]
	local ModalLayoutButtons = GetDeepValue2Module(UseConversationTopModalModuleResult, "modal_layout.buttons")
	local ModalLayoutButton = ModalLayoutButtons and ModalLayoutButtons[1]
	local ModalLayoutButton1 = ModalLayoutButtons and ModalLayoutButtons[2]
	local UseCallbackResult = UseCallbackFunction(function() --[[ Line: 107 ]]
		-- upvalues: UseAnalyticsModuleResult (copy), Entry (copy), EventNamesModule (upval), UnionResult (copy)
		if UseAnalyticsModuleResult and Entry then
			UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule[`{Entry}ActionClicked`], { conversationId = UnionResult.conversation.id })
		end
	end, {
		UseAnalyticsModuleResult,
		Entry,
		UnionResult.conversation.id
	})
	local UseCallbackResult1 = UseCallbackFunction(function() --[[ Line: 115 ]]
		-- upvalues: UseDispatchResult (copy), AppChatNetworkingModule (upval), ModalLayoutDismissRecordAction (copy), ModalLayoutId (copy), DismissedConversationTopModalModule (upval), UnionResult (copy), ModalVariant (copy)
		UseDispatchResult(AppChatNetworkingModule.rodux.RecordModalSequenceResponse.API(ModalLayoutDismissRecordAction, "conversation_top_modal", ModalLayoutId)):catch(function(Err) --[[ Line: 122 ]]
			warn("Error in ConversationTopModalContainer -> RecordModalSequenceResponse dismissed: " .. tostring(Err))
		end)
		UseDispatchResult(DismissedConversationTopModalModule(UnionResult.conversation.id, ModalVariant))
	end, {
		UseDispatchResult,
		ModalLayoutDismissRecordAction,
		ModalVariant,
		ModalLayoutId,
		UnionResult.conversation.id
	})
	local UseCallbackResult2 = UseCallbackFunction(function() --[[ Line: 127 ]]
		-- upvalues: UseCallbackResult (copy), AppPage (upval), UnfilteredThreadsAMPFeatureNameModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval), AccessResponseEnum (upval), RefreshAllUnfilteredThreadsDetailsModule (upval), UnionResult (copy), NavigateDownFunction (upval)
		UseCallbackResult()
		local config = {
			name = AppPage.AmpWizardContainer,
			extraProps = {
				featureName = UnfilteredThreadsAMPFeatureNameModule,
				completionCallback = function(Granted, _) --[[ Line: 133 ]]
					-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateBackFunction (upval), AccessResponseEnum (upval), RefreshAllUnfilteredThreadsDetailsModule (upval), UnionResult (upval)
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.back(true)
					else
						UseDispatchResult(NavigateBackFunction(true))
					end
					if Granted == AccessResponseEnum.Granted then
						UseDispatchResult(RefreshAllUnfilteredThreadsDetailsModule(UnionResult.conversation.id))
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
		UseCallbackResult,
		UseDispatchResult,
		UnionResult.conversation.id
	})
	local UseCallbackResult3 = UseCallbackFunction(function() --[[ Line: 153 ]]
		-- upvalues: UseCallbackResult (copy), UnionResult (copy), CreateUnfilteredChatPartialModal (upval)
		UseCallbackResult()
		UnionResult.navigateToScreen(CreateUnfilteredChatPartialModal, {}, true)
	end, { UnionResult.navigateToScreen, UseCallbackResult })
	local UseCallbackResult4 = UseCallbackFunction(function() --[[ Line: 157 ]]
		-- upvalues: UseCallbackResult (copy), UnionResult (copy), LearnMorePartialModal (upval)
		UseCallbackResult()
		UnionResult.navigateToScreen(LearnMorePartialModal, {}, true)
	end, { UnionResult.navigateToScreen, UseCallbackResult })
	UseEffectFunction(function() --[[ Line: 163 ]]
		-- upvalues: Inverted (copy), UseDispatchResult (copy), AppChatNetworkingModule (upval), ModalLayoutSeenRecordAction (copy), ModalLayoutId (copy)
		if Inverted then
			UseDispatchResult(AppChatNetworkingModule.rodux.RecordModalSequenceResponse.API(ModalLayoutSeenRecordAction, "conversation_top_modal", ModalLayoutId)):catch(function(Err) --[[ Line: 171 ]]
				warn("Error in ConversationTopModalContainer -> RecordModalSequenceResponse seen: " .. tostring(Err))
			end)
		end
	end, {
		UseDispatchResult,
		Inverted,
		ModalLayoutSeenRecordAction,
		ModalLayoutId,
		UnionResult.conversation.id
	})
	UseEffectFunction(function() --[[ Line: 188 ]]
		-- upvalues: Inverted (copy), UseAnalyticsModuleResult (copy), Entry (copy), EventNamesModule (upval), UnionResult (copy)
		if Inverted and UseAnalyticsModuleResult and Entry then
			UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule[`{Entry}Rendered`], { conversationId = UnionResult.conversation.id })
		end
	end, {
		Inverted,
		UseAnalyticsModuleResult,
		Entry,
		UnionResult.conversation.id
	})
	local Entry1 = ({
		conversation_banner_group_phone_verification = UseCallbackResult2,
		conversation_banner_one_to_one_phone_verification = UseCallbackResult2,
		conversation_banner_group_duplicate_upgrade = UseCallbackResult3
	})[ModalVariant]
	local Element = nil
	
	if Inverted then
		Element = if ModalVariant == "conversation_banner_learn_more" then ReactModule.createElement(ConversationBannerDeprecatedModule, {
			actionText = if ModalLayoutButton then ModalLayoutButton.text else nil,
			bodyText = GetDeepValue2Module(UseConversationTopModalModuleResult, "modal_layout.body.text"),
			height = Size1000,
			onActivated = UseCallbackResult4,
			style = UseStyleResult
		}) else ReactModule.createElement(ConversationModalModule, {
			bodyText = GetDeepValue2Module(UseConversationTopModalModuleResult, "modal_layout.body.text"),
			denyText = if ModalLayoutButton then ModalLayoutButton.text else nil,
			acceptText = if ModalLayoutButton1 and Entry1 then ModalLayoutButton1.text else nil,
			paddingTop = UseStyleResult.Tokens.Size.Size_300,
			paddingBottom = UseStyleResult.Tokens.Size.Size_300,
			verticalSpacing = UseStyleResult.Tokens.Size.Size_300,
			onAccepted = Entry1,
			onDenied = UseCallbackResult1,
			style = UseStyleResult
		})
	elseif ModalVariant ~= "none" and (ModalVariant ~= nil and not config1[ModalVariant]) then
		warn("Unsupported ConversationTopModal variant: " .. ModalVariant)
	end
	return ReactModule.createElement(FoundationModule.View, {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = UnionResult.layoutOrder,
		onAbsoluteSizeChanged = function(Frame) --[[ Line: 242 ]]
			-- upvalues: UnionResult (copy)
			UnionResult.setModalHeight(Frame.AbsoluteSize.Y)
		end
	}, { conversationTopModal = Element })
end)