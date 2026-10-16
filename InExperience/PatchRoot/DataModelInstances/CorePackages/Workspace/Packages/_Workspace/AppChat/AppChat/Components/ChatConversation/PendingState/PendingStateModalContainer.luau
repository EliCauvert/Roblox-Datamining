local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local CryoModule = require(Parent.Cryo)
local LuaAppNavigationContextModule = require(AppChat.LuaAppNavigationContext)
local ReactModule = require(Parent.React)
local GetDeepValue2Module = require(AppChat.Utils.getDeepValue2)
local MemoFunction = ReactModule.memo
local UseCallbackFunction = ReactModule.useCallback
local UseContextFunction = ReactModule.useContext
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseEffectOnMountFunction = require(Parent.RoactUtils).Hooks.useEffectOnMount
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseAnalyticsModule = require(AppChat.Analytics.useAnalytics)
local AccessResponseEnum = require(Parent.AmpUpsell).AmpEnums.AccessResponseEnum
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local RefreshAllUnfilteredThreadsDetailsModule = require(AppChat.Conversations.Thunks.refreshAllUnfilteredThreadsDetails)
local UnfilteredThreadsAMPFeatureNameModule = require(AppChat.Components.UnfilteredThreadsAMPFeatureName)
local ConversationModalModule = require(script.Parent.Parent.ConversationModal.ConversationModal)
local config = {
	showNetworkErrorToast = function() --[[ Line: 46 ]] end,
	onHeightChanged = function() --[[ Line: 47 ]] end
}
local config1 = {
	pending_state_phone_verify = true,
	pending_state_ineligible = true
}
local config2 = {
	pending_state_phone_verify = "ConversationPvUpsell",
	pending_state_ineligible = "ConversationIneligibleModal"
}

function PendingStateModalContainer(p1) --[[ Line: 61 ]]
	-- upvalues: CryoModule (copy), config (copy), UseLocalUserIdFunction (copy), UseAnalyticsModule (copy), UseContextFunction (copy), LuaAppNavigationContextModule (copy), UseNavigationFunction (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), GetDeepValue2Module (copy), config2 (copy), config1 (copy), UseEffectOnMountFunction (copy), UseEffectFunction (copy), AppChatNetworkingModule (copy), UseCallbackFunction (copy), AppPage (copy), UnfilteredThreadsAMPFeatureNameModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), AccessResponseEnum (copy), RefreshAllUnfilteredThreadsDetailsModule (copy), NavigateDownFunction (copy), ReactModule (copy), ConversationModalModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseContextResult = UseContextFunction(LuaAppNavigationContextModule)
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 70 ]]
		-- upvalues: GetDeepValue2Module (upval), UnionResult (copy)
		return GetDeepValue2Module(p2, `ChatAppReducer.Modals.pendingStateModals.{UnionResult.conversationId}`)
	end) or {}
	local ModalVariant = UseSelectorResult.modal_variant
	local ModalLayoutId = GetDeepValue2Module(UseSelectorResult, "modal_layout.id")
	local ModalLayoutSeenRecordAction = GetDeepValue2Module(UseSelectorResult, "modal_layout.seen_record_action")
	local Entry = config2[ModalVariant]
	local Entry1 = config1[ModalVariant]
	local ModalLayoutButtons = GetDeepValue2Module(UseSelectorResult, "modal_layout.buttons")
	local ModalLayoutButton = ModalLayoutButtons and ModalLayoutButtons[1]
	local ModalLayoutButton1 = ModalLayoutButtons and ModalLayoutButtons[2]
	UseEffectOnMountFunction(function() --[[ Line: 83 ]]
		-- upvalues: UseAnalyticsModuleResult (copy), Entry1 (copy), Entry (copy), UnionResult (copy)
		if UseAnalyticsModuleResult and Entry1 and Entry then
			UseAnalyticsModuleResult.fireAnalyticsEvent(`{Entry}Rendered`, { conversationId = UnionResult.conversationId })
		end
	end)
	UseEffectFunction(function() --[[ Line: 92 ]]
		-- upvalues: Entry1 (copy), UseDispatchResult (copy), AppChatNetworkingModule (upval), ModalLayoutSeenRecordAction (copy), ModalLayoutId (copy)
		if Entry1 then
			UseDispatchResult(AppChatNetworkingModule.rodux.RecordModalSequenceResponse.API(ModalLayoutSeenRecordAction, "pending_state_modal", ModalLayoutId)):catch(function(Err) --[[ Line: 100 ]]
				warn("Error in PendingStateModalContainer -> RecordModalSequenceResponse seen: " .. tostring(Err))
			end)
		end
	end, {
		UseDispatchResult,
		Entry1,
		ModalLayoutSeenRecordAction,
		ModalLayoutId,
		UnionResult.conversationId
	})
	local UseCallbackResult = UseCallbackFunction(function(p2, p3) --[[ Line: 114 ]]
		-- upvalues: UseDispatchResult (copy), AppChatNetworkingModule (upval)
		return UseDispatchResult(AppChatNetworkingModule.rodux.RemoveUserFromConversation.API(p3, p2))
	end, { UseDispatchResult })
	local UseCallbackResult1 = UseCallbackFunction(function() --[[ Line: 118 ]]
		-- upvalues: UseAnalyticsModuleResult (copy), Entry (copy), UnionResult (copy), UseNavigationResult (copy), UseContextResult (copy)
		if UseAnalyticsModuleResult and Entry then
			UseAnalyticsModuleResult.fireAnalyticsEvent(`{Entry}LearnMoreClicked`, { conversationId = UnionResult.conversationId })
		end
		if UseNavigationResult then
			UseContextResult.navigateToUnfilteredThreadsLearnMore(UseNavigationResult.navigate)
			
			return
		else
			UseContextResult.navigateToUnfilteredThreadsLearnMore()
		end
	end, {
		UseContextResult,
		UseAnalyticsModuleResult,
		Entry,
		UnionResult.conversationId,
		UseNavigationResult
	})
	local UseCallbackResult2 = UseCallbackFunction(function() --[[ Line: 130 ]]
		-- upvalues: UseAnalyticsModuleResult (copy), Entry (copy), UnionResult (copy), AppPage (upval), UnfilteredThreadsAMPFeatureNameModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval), AccessResponseEnum (upval), RefreshAllUnfilteredThreadsDetailsModule (upval), NavigateDownFunction (upval)
		if UseAnalyticsModuleResult and Entry then
			UseAnalyticsModuleResult.fireAnalyticsEvent(`{Entry}ContinueClicked`, { conversationId = UnionResult.conversationId })
		end
		local config = {
			name = AppPage.AmpWizardContainer,
			extraProps = {
				featureName = UnfilteredThreadsAMPFeatureNameModule,
				completionCallback = function(Granted, _) --[[ Line: 140 ]]
					-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateBackFunction (upval), AccessResponseEnum (upval), UseAnalyticsModuleResult (upval), Entry (upval), UnionResult (upval), RefreshAllUnfilteredThreadsDetailsModule (upval)
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.back(true)
					else
						UseDispatchResult(NavigateBackFunction(true))
					end
					if Granted == AccessResponseEnum.Granted then
						if UseAnalyticsModuleResult and Entry then
							UseAnalyticsModuleResult.fireAnalyticsEvent(`{Entry}Succeeded`, { conversationId = UnionResult.conversationId })
						end
						UseDispatchResult(RefreshAllUnfilteredThreadsDetailsModule(UnionResult.conversationId))
						
						return
					elseif UseAnalyticsModuleResult and Entry then
						UseAnalyticsModuleResult.fireAnalyticsEvent(`{Entry}Failed`, { conversationId = UnionResult.conversationId })
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
		Entry,
		UseAnalyticsModuleResult,
		UnionResult.conversationId
	})
	local UseCallbackResult3 = UseCallbackFunction(function() --[[ Line: 171 ]]
		-- upvalues: UseAnalyticsModuleResult (copy), Entry (copy), UnionResult (copy), UseCallbackResult (copy), UseLocalUserIdResult (copy)
		if UseAnalyticsModuleResult and Entry then
			UseAnalyticsModuleResult.fireAnalyticsEvent(`{Entry}LeftGroup`, { conversationId = UnionResult.conversationId })
		end
		if UnionResult.conversationId then
			UseCallbackResult(UseLocalUserIdResult, UnionResult.conversationId):catch(function() --[[ Line: 179 ]]
				-- upvalues: UnionResult (upval)
				UnionResult.showNetworkErrorToast()
			end)
		end
	end, {
		UseLocalUserIdResult, UnionResult.conversationId, Entry,
		UseAnalyticsModuleResult, UseCallbackResult, UnionResult.showNetworkErrorToast
	})
	local Entry2 = ({
		pending_state_phone_verify = UseCallbackResult2,
		pending_state_ineligible = UseCallbackResult1
	})[ModalVariant]
	
	if Entry1 then
		return ReactModule.createElement(ConversationModalModule, {
			bodyText = GetDeepValue2Module(UseSelectorResult, "modal_layout.body.text"),
			acceptText = if ModalLayoutButton1 and Entry2 then ModalLayoutButton1.text else nil,
			denyText = if ModalLayoutButton then ModalLayoutButton.text else nil,
			layoutOrder = UnionResult.layoutOrder,
			onAccepted = Entry2,
			onDenied = UseCallbackResult3,
			onHeightChanged = UnionResult.onHeightChanged
		})
	end
	if ModalVariant ~= "none" and ModalVariant ~= nil and not config1[ModalVariant] then
		warn("Unsupported PendingStateModal variant: " .. ModalVariant)
	end
	return nil
end

return MemoFunction(PendingStateModalContainer)