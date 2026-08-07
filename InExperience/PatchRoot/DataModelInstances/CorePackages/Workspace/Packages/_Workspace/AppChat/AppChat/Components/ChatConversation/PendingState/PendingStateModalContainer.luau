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
local var7 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local refreshAllUnfilteredThreadsDetailsModule = require(appChat.Conversations.Thunks.refreshAllUnfilteredThreadsDetails)
local unfilteredThreadsAMPFeatureNameModule = require(appChat.Components.UnfilteredThreadsAMPFeatureName)
local conversationModalModule = require(script.Parent.Parent.ConversationModal.ConversationModal)
local t = {
	showNetworkErrorToast = function() --[[ line: 46 ]] end,
	onHeightChanged = function() --[[ line: 47 ]] end
}
local t_1 = {
	pending_state_phone_verify = true,
	pending_state_ineligible = true
}
local t_2 = {
	pending_state_phone_verify = "ConversationPvUpsell",
	pending_state_ineligible = "ConversationIneligibleModal"
}

function PendingStateModalContainer(p0) --[[ line: 61 ]]
	-- upvalues: cryoModule (ref), t (ref), useLocalUserId (ref), useAnalyticsModule (ref), useContext (ref), luaAppNavigationContextModule (ref), useNavigation (ref), useDispatch (ref), useSelector (ref), getDeepValue2Module (ref), t_2 (ref), t_1 (ref), useEffectOnMount (ref), useEffect (ref), appChatNetworkingModule (ref), useCallback (ref), appPage (ref), unfilteredThreadsAMPFeatureNameModule (ref), fFlagSignalsNavP3Dispatch (ref), var7 (ref), navigateBack (ref), accessResponseEnum (ref), refreshAllUnfilteredThreadsDetailsModule (ref), navigateDown (ref), reactModule (ref), conversationModalModule (ref)
	local var14 = cryoModule.Dictionary.union(t, p0)
	local var15 = useLocalUserId()
	local var16 = useAnalyticsModule()
	local var17 = useContext(luaAppNavigationContextModule)
	local var18 = useNavigation()
	local var19 = useDispatch()
	local var20 = useSelector(function(p1) --[[ line: 70 ]]
		-- upvalues: getDeepValue2Module (copy), var14 (ref)
		return getDeepValue2Module(p1, `ChatAppReducer.Modals.pendingStateModals.{var14.conversationId}`)
	end) or {}
	local modalVariant = var20.modal_variant
	local var21 = getDeepValue2Module(var20, "modal_layout.id")
	local var22 = getDeepValue2Module(var20, "modal_layout.seen_record_action")
	local var23 = t_2[modalVariant]
	local var24 = t_1[modalVariant]
	local var25 = getDeepValue2Module(var20, "modal_layout.buttons")
	local var26 = var25 and var25[1]
	local var27 = var25 and var25[2]
	useEffectOnMount(function() --[[ line: 83 ]]
		-- upvalues: var16 (ref), var24 (ref), var23 (ref), var14 (ref)
		if var16 and var24 and var23 then
			var16.fireAnalyticsEvent(`{var23}Rendered`, { conversationId = var14.conversationId })
		end
	end)
	useEffect(function() --[[ line: 92 ]]
		-- upvalues: var24 (ref), var19 (ref), appChatNetworkingModule (copy), var22 (ref), var21 (ref)
		if var24 then
			var19(appChatNetworkingModule.rodux.RecordModalSequenceResponse.API(var22, "pending_state_modal", var21)):catch(function(p2) --[[ line: 100 ]]
				warn("Error in PendingStateModalContainer -> RecordModalSequenceResponse seen: " .. tostring(p2))
			end)
		end
	end, {
		var19,
		var24,
		var22,
		var21,
		var14.conversationId
	})
	local var28 = useCallback(function(p3, p4) --[[ line: 114 ]]
		-- upvalues: var19 (ref), appChatNetworkingModule (copy)
		return var19(appChatNetworkingModule.rodux.RemoveUserFromConversation.API(p4, p3))
	end, { var19 })
	local var29 = useCallback(function() --[[ line: 171 ]]
		-- upvalues: var16 (ref), var23 (ref), var14 (ref), var28 (ref), var15 (ref)
		if var16 and var23 then
			var16.fireAnalyticsEvent(`{var23}LeftGroup`, { conversationId = var14.conversationId })
		end
		if var14.conversationId then
			var28(var15, var14.conversationId):catch(function() --[[ line: 179 ]]
				-- upvalues: var14 (copy)
				var14.showNetworkErrorToast()
			end)
		end
	end, {
		var15, var14.conversationId, var23, var16, var28, var14.showNetworkErrorToast
	})
	local var30 = ({
		pending_state_phone_verify = useCallback(function() --[[ line: 130 ]]
			-- upvalues: var16 (ref), var23 (ref), var14 (ref), appPage (copy), unfilteredThreadsAMPFeatureNameModule (copy), fFlagSignalsNavP3Dispatch (copy), var7 (copy), var19 (ref), navigateBack (copy), accessResponseEnum (copy), refreshAllUnfilteredThreadsDetailsModule (copy), navigateDown (copy)
			if var16 and var23 then
				var16.fireAnalyticsEvent(`{var23}ContinueClicked`, { conversationId = var14.conversationId })
			end
			local t = {
				name = appPage.AmpWizardContainer,
				extraProps = {
					featureName = unfilteredThreadsAMPFeatureNameModule,
					completionCallback = function(p5, _) --[[ line: 140 ]]
						-- upvalues: fFlagSignalsNavP3Dispatch (copy), var7 (copy), var19 (copy), navigateBack (copy), accessResponseEnum (copy), var16 (copy), var23 (copy), var14 (copy), refreshAllUnfilteredThreadsDetailsModule (copy)
						if fFlagSignalsNavP3Dispatch then
							var7.back(true)
						else
							var19(navigateBack(true))
						end
						if p5 == accessResponseEnum.Granted then
							if var16 and var23 then
								var16.fireAnalyticsEvent(`{var23}Succeeded`, { conversationId = var14.conversationId })
							end
							var19(refreshAllUnfilteredThreadsDetailsModule(var14.conversationId))
							
							return
						elseif var16 and var23 then
							var16.fireAnalyticsEvent(`{var23}Failed`, { conversationId = var14.conversationId })
						end
					end
				}
			}
			
			if fFlagSignalsNavP3Dispatch then
				var7.down(var7.fromLegacyPage(t))
				
				return
			end
			var19(navigateDown(t))
		end, { var19, var23, var16, var14.conversationId }),
		pending_state_ineligible = useCallback(function() --[[ line: 118 ]]
			-- upvalues: var16 (ref), var23 (ref), var14 (ref), var18 (ref), var17 (ref)
			if var16 and var23 then
				var16.fireAnalyticsEvent(`{var23}LearnMoreClicked`, { conversationId = var14.conversationId })
			end
			if var18 then
				var17.navigateToUnfilteredThreadsLearnMore(var18.navigate)
				
				return
			end
			var17.navigateToUnfilteredThreadsLearnMore()
		end, {
			var17,
			var16,
			var23,
			var14.conversationId,
			var18
		})
	})[modalVariant]
	
	if var24 then
		return reactModule.createElement(conversationModalModule, {
			bodyText = getDeepValue2Module(var20, "modal_layout.body.text"),
			acceptText = if var27 and var30 then var27.text else nil,
			denyText = if var26 then var26.text else nil,
			layoutOrder = var14.layoutOrder,
			onAccepted = var30,
			onDenied = var29,
			onHeightChanged = var14.onHeightChanged
		})
	elseif modalVariant ~= "none" and modalVariant ~= nil and not t_1[modalVariant] then
		warn("Unsupported PendingStateModal variant: " .. modalVariant)
	end
	return nil
end

return memo(PendingStateModalContainer)