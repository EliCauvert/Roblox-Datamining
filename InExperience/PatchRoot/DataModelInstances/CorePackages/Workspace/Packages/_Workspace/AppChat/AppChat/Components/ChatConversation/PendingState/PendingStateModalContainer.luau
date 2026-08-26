local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local cryoModule = require(parent.Cryo)
local luaAppNavigationContextModule = require(appChat.LuaAppNavigationContext)
local reactModule = require(parent.React)
local getDeepValue2Module = require(appChat.Utils.getDeepValue2)
local memo = reactModule.memo
local useCallback = reactModule.useCallback
local useContext = reactModule.useContext
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local useEffectOnMount = require(parent.RoactUtils).Hooks.useEffectOnMount
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useNavigation = require(parent.Navigation).useNavigation
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useAnalyticsModule = require(appChat.Analytics.useAnalytics)
local accessResponseEnum = require(parent.AmpUpsell).AmpEnums.AccessResponseEnum
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateBack = require(parent.NavigationRodux).Thunks.NavigateBack
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local refreshAllUnfilteredThreadsDetailsModule = require(appChat.Conversations.Thunks.refreshAllUnfilteredThreadsDetails)
local unfilteredThreadsAMPFeatureNameModule = require(appChat.Components.UnfilteredThreadsAMPFeatureName)
local conversationModalModule = require(script.Parent.Parent.ConversationModal.ConversationModal)
local t = {
	showNetworkErrorToast = function() end,
	onHeightChanged = function() end
}
local t_1 = {
	pending_state_phone_verify = true,
	pending_state_ineligible = true
}
local t_2 = {
	pending_state_phone_verify = "ConversationPvUpsell",
	pending_state_ineligible = "ConversationIneligibleModal"
}

function PendingStateModalContainer(p1)
	-- upvalues: cryoModule (ref), t (ref), useLocalUserId (ref), useAnalyticsModule (ref), useContext (ref), luaAppNavigationContextModule (ref), useNavigation (ref), useDispatch (ref), useSelector (ref), getDeepValue2Module (ref), t_2 (ref), t_1 (ref), useEffectOnMount (ref), useEffect (ref), appChatNetworkingModule (ref), useCallback (ref), appPage (ref), unfilteredThreadsAMPFeatureNameModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateBack (ref), accessResponseEnum (ref), refreshAllUnfilteredThreadsDetailsModule (ref), navigateDown (ref), reactModule (ref), conversationModalModule (ref)
	local var2 = cryoModule.Dictionary.union(t, p1)
	local var3 = useLocalUserId()
	local var4 = useAnalyticsModule()
	local var5 = useContext(luaAppNavigationContextModule)
	local var6 = useNavigation()
	local var7 = useDispatch()
	local var8 = useSelector(function(p2)
		-- upvalues: getDeepValue2Module (copy), var2 (ref)
		return getDeepValue2Module(p2, `ChatAppReducer.Modals.pendingStateModals.{var2.conversationId}`)
	end) or {}
	local modalVariant = var8.modal_variant
	local var9 = getDeepValue2Module(var8, "modal_layout.id")
	local var10 = getDeepValue2Module(var8, "modal_layout.seen_record_action")
	local var11 = t_2[modalVariant]
	local var12 = t_1[modalVariant]
	local var13 = getDeepValue2Module(var8, "modal_layout.buttons")
	local var14 = var13 and var13[1]
	local var15 = var13 and var13[2]
	useEffectOnMount(function()
		-- upvalues: var4 (ref), var12 (ref), var11 (ref), var2 (ref)
		if var4 and var12 and var11 then
			var4.fireAnalyticsEvent(`{var11}Rendered`, { conversationId = var2.conversationId })
		end
	end)
	useEffect(function()
		-- upvalues: var12 (ref), var7 (ref), appChatNetworkingModule (copy), var10 (ref), var9 (ref)
		if var12 then
			var7(appChatNetworkingModule.rodux.RecordModalSequenceResponse.API(var10, "pending_state_modal", var9)):catch(function(p2)
				warn("Error in PendingStateModalContainer -> RecordModalSequenceResponse seen: " .. tostring(p2))
			end)
		end
	end, {
		var7,
		var12,
		var10,
		var9,
		var2.conversationId
	})
	local var16 = useCallback(function(p2, p3)
		-- upvalues: var7 (ref), appChatNetworkingModule (copy)
		return var7(appChatNetworkingModule.rodux.RemoveUserFromConversation.API(p3, p2))
	end, { var7 })
	local var17 = useCallback(function()
		-- upvalues: var4 (ref), var11 (ref), var2 (ref), var16 (ref), var3 (ref)
		if var4 and var11 then
			var4.fireAnalyticsEvent(`{var11}LeftGroup`, { conversationId = var2.conversationId })
		end
		if var2.conversationId then
			var16(var3, var2.conversationId):catch(function()
				-- upvalues: var2 (copy)
				var2.showNetworkErrorToast()
			end)
		end
	end, {
		var3, var2.conversationId, var11, var4, var16, var2.showNetworkErrorToast
	})
	local var18 = ({
		pending_state_phone_verify = useCallback(function()
			-- upvalues: var4 (ref), var11 (ref), var2 (ref), appPage (copy), unfilteredThreadsAMPFeatureNameModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var7 (ref), navigateBack (copy), accessResponseEnum (copy), refreshAllUnfilteredThreadsDetailsModule (copy), navigateDown (copy)
			if var4 and var11 then
				var4.fireAnalyticsEvent(`{var11}ContinueClicked`, { conversationId = var2.conversationId })
			end
			local t = {
				name = appPage.AmpWizardContainer,
				extraProps = {
					featureName = unfilteredThreadsAMPFeatureNameModule,
					completionCallback = function(p2, _)
						-- upvalues: fFlagSignalsNavP3Dispatch (copy), var1 (copy), var7 (copy), navigateBack (copy), accessResponseEnum (copy), var4 (copy), var11 (copy), var2 (copy), refreshAllUnfilteredThreadsDetailsModule (copy)
						if fFlagSignalsNavP3Dispatch then
							var1.back(true)
						else
							var7(navigateBack(true))
						end
						if p2 == accessResponseEnum.Granted then
							if var4 and var11 then
								var4.fireAnalyticsEvent(`{var11}Succeeded`, { conversationId = var2.conversationId })
							end
							var7(refreshAllUnfilteredThreadsDetailsModule(var2.conversationId))
							
							return
						elseif var4 and var11 then
							var4.fireAnalyticsEvent(`{var11}Failed`, { conversationId = var2.conversationId })
						end
					end
				}
			}
			
			if fFlagSignalsNavP3Dispatch then
				var1.down(var1.fromLegacyPage(t))
				
				return
			end
			var7(navigateDown(t))
		end, { var7, var11, var4, var2.conversationId }),
		pending_state_ineligible = useCallback(function()
			-- upvalues: var4 (ref), var11 (ref), var2 (ref), var6 (ref), var5 (ref)
			if var4 and var11 then
				var4.fireAnalyticsEvent(`{var11}LearnMoreClicked`, { conversationId = var2.conversationId })
			end
			if var6 then
				var5.navigateToUnfilteredThreadsLearnMore(var6.navigate)
				
				return
			end
			var5.navigateToUnfilteredThreadsLearnMore()
		end, {
			var5,
			var4,
			var11,
			var2.conversationId,
			var6
		})
	})[modalVariant]
	
	if var12 then
		return reactModule.createElement(conversationModalModule, {
			bodyText = getDeepValue2Module(var8, "modal_layout.body.text"),
			acceptText = if var15 and var18 then var15.text else nil,
			denyText = if var14 then var14.text else nil,
			layoutOrder = var2.layoutOrder,
			onAccepted = var18,
			onDenied = var17,
			onHeightChanged = var2.onHeightChanged
		})
	elseif modalVariant ~= "none" and modalVariant ~= nil and not t_1[modalVariant] then
		warn("Unsupported PendingStateModal variant: " .. modalVariant)
	end
	return nil
end

return memo(PendingStateModalContainer)