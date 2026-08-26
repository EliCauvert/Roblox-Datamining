local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local foundationModule = require(parent.Foundation)
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local getDeepValue2Module = require(appChat.Utils.getDeepValue2)
local memo = reactModule.memo
local useAnalyticsModule = require(appChat.Analytics.useAnalytics)
local useCallback = reactModule.useCallback
local useConversationTopModalModule = require(appChat.Hooks.useConversationTopModal)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local accessResponseEnum = require(parent.AmpUpsell).AmpEnums.AccessResponseEnum
local appChatNetworkingModule = require(parent.AppChatNetworking)
local appPage = require(parent.RobloxAppEnums).AppPage
local _ = require(appChat.Models.ConversationChannels)
local dismissedConversationTopModalModule = require(appChat.Conversations.Actions.DismissedConversationTopModal)
local enumScreensModule = require(appChat.EnumScreens)
local eventNamesModule = require(appChat.Analytics.EventNames)
local navigateBack = require(parent.NavigationRodux).Thunks.NavigateBack
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local refreshAllUnfilteredThreadsDetailsModule = require(appChat.Conversations.Thunks.refreshAllUnfilteredThreadsDetails)
local unfilteredThreadsAMPFeatureNameModule = require(appChat.Components.UnfilteredThreadsAMPFeatureName)
local conversationModalModule = require(script.Parent.ConversationModal.ConversationModal)
local conversationBannerDeprecatedModule = require(script.Parent.ConversationBanner.ConversationBannerDeprecated)
local t = {
	conversation = {},
	navigateToScreen = function(...) end,
	setModalHeight = function(_) end
}
local t_1 = {
	conversation_banner_group_phone_verification = true,
	conversation_banner_group_duplicate_upgrade = true,
	conversation_banner_learn_more = true,
	conversation_banner_one_to_one_phone_verification = true
}
local createUnfilteredChatPartialModal = enumScreensModule.CreateUnfilteredChatPartialModal
local learnMorePartialModal = enumScreensModule.LearnMorePartialModal
local t_2 = {
	conversation_banner_group_phone_verification = "ConversationPvBanner",
	conversation_banner_one_to_one_phone_verification = "ConversationPvBanner",
	conversation_banner_group_duplicate_upgrade = "ConversationUpgradeBanner",
	conversation_banner_learn_more = "ConversationLearnMoreBanner"
}

return memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useAnalyticsModule (ref), useDispatch (ref), useRef (ref), useEffect (ref), useSelector (ref), getDeepValue2Module (ref), useConversationTopModalModule (ref), t_2 (ref), t_1 (ref), useCallback (ref), eventNamesModule (ref), appChatNetworkingModule (ref), dismissedConversationTopModalModule (ref), appPage (ref), unfilteredThreadsAMPFeatureNameModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateBack (ref), accessResponseEnum (ref), refreshAllUnfilteredThreadsDetailsModule (ref), navigateDown (ref), createUnfilteredChatPartialModal (ref), learnMorePartialModal (ref), reactModule (ref), conversationBannerDeprecatedModule (ref), conversationModalModule (ref), foundationModule (ref)
	local var2 = cryoModule.Dictionary.union(t, p1)
	local var3 = useStyle()
	local var4 = useAnalyticsModule()
	local var5 = useDispatch()
	local size1000 = var3.Tokens.Size.Size_1000
	local var6 = useRef(var2.setModalHeight)
	useEffect(function()
		-- upvalues: var6 (ref), var2 (ref)
		var6.current = var2.setModalHeight
	end, { var2.setModalHeight })
	useEffect(function()
		-- upvalues: var6 (ref)
		return function()
			-- upvalues: var6 (copy)
			if var6.current then
				var6.current(0)
			end
		end
	end, {})
	local var7 = useSelector(function(p2)
		-- upvalues: getDeepValue2Module (copy), var2 (ref)
		return getDeepValue2Module(p2, `ChatAppReducer.Modals.conversationTopModalsDismissed.{var2.conversation.id}`) or {}
	end)
	local id = useConversationTopModalModule(var2.conversation.id) or {}
	local modalVariant = id.modal_variant
	local var8 = getDeepValue2Module(id, "modal_layout.id")
	local var9 = getDeepValue2Module(id, "modal_layout.seen_record_action")
	local var10 = getDeepValue2Module(id, "modal_layout.dismiss_record_action")
	local var11 = t_2[modalVariant]
	local var12 = t_1[modalVariant] and not var7[modalVariant]
	local var13 = getDeepValue2Module(id, "modal_layout.buttons")
	local var14 = var13 and var13[1]
	local var15 = var13 and var13[2]
	local var16 = useCallback(function()
		-- upvalues: var4 (ref), var11 (ref), eventNamesModule (copy), var2 (ref)
		if var4 and var11 then
			var4.fireAnalyticsEvent(eventNamesModule[`{var11}ActionClicked`], { conversationId = var2.conversation.id })
		end
	end, { var4, var11, var2.conversation.id })
	local var17 = useCallback(function()
		-- upvalues: var5 (ref), appChatNetworkingModule (copy), var10 (ref), var8 (ref), dismissedConversationTopModalModule (copy), var2 (ref), modalVariant (ref)
		var5(appChatNetworkingModule.rodux.RecordModalSequenceResponse.API(var10, "conversation_top_modal", var8)):catch(function(p2)
			warn("Error in ConversationTopModalContainer -> RecordModalSequenceResponse dismissed: " .. tostring(p2))
		end)
		var5(dismissedConversationTopModalModule(var2.conversation.id, modalVariant))
	end, {
		var5,
		var10,
		modalVariant,
		var8,
		var2.conversation.id
	})
	local var18 = useCallback(function()
		-- upvalues: var16 (ref), appPage (copy), unfilteredThreadsAMPFeatureNameModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var5 (ref), navigateBack (copy), accessResponseEnum (copy), refreshAllUnfilteredThreadsDetailsModule (copy), var2 (ref), navigateDown (copy)
		var16()
		local t = {
			name = appPage.AmpWizardContainer,
			extraProps = {
				featureName = unfilteredThreadsAMPFeatureNameModule,
				completionCallback = function(p2, _)
					-- upvalues: fFlagSignalsNavP3Dispatch (copy), var1 (copy), var5 (copy), navigateBack (copy), accessResponseEnum (copy), refreshAllUnfilteredThreadsDetailsModule (copy), var2 (copy)
					if fFlagSignalsNavP3Dispatch then
						var1.back(true)
					else
						var5(navigateBack(true))
					end
					if p2 == accessResponseEnum.Granted then
						var5(refreshAllUnfilteredThreadsDetailsModule(var2.conversation.id))
					end
				end
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var5(navigateDown(t))
	end, { var16, var5, var2.conversation.id })
	local var19 = useCallback(function()
		-- upvalues: var16 (ref), var2 (ref), createUnfilteredChatPartialModal (copy)
		var16()
		var2.navigateToScreen(createUnfilteredChatPartialModal, {}, true)
	end, { var2.navigateToScreen, var16 })
	local var20 = useCallback(function()
		-- upvalues: var16 (ref), var2 (ref), learnMorePartialModal (copy)
		var16()
		var2.navigateToScreen(learnMorePartialModal, {}, true)
	end, { var2.navigateToScreen, var16 })
	useEffect(function()
		-- upvalues: var12 (ref), var5 (ref), appChatNetworkingModule (copy), var9 (ref), var8 (ref)
		if var12 then
			var5(appChatNetworkingModule.rodux.RecordModalSequenceResponse.API(var9, "conversation_top_modal", var8)):catch(function(p2)
				warn("Error in ConversationTopModalContainer -> RecordModalSequenceResponse seen: " .. tostring(p2))
			end)
		end
	end, {
		var5,
		var12,
		var9,
		var8,
		var2.conversation.id
	})
	useEffect(function()
		-- upvalues: var12 (ref), var4 (ref), var11 (ref), eventNamesModule (copy), var2 (ref)
		if var12 and var4 and var11 then
			var4.fireAnalyticsEvent(eventNamesModule[`{var11}Rendered`], { conversationId = var2.conversation.id })
		end
	end, { var12, var4, var11, var2.conversation.id })
	local var21 = ({
		conversation_banner_group_phone_verification = var18,
		conversation_banner_one_to_one_phone_verification = var18,
		conversation_banner_group_duplicate_upgrade = var19
	})[modalVariant]
	local var22 = nil
	
	if var12 then
		var22 = if modalVariant == "conversation_banner_learn_more" then reactModule.createElement(conversationBannerDeprecatedModule, {
			actionText = if var14 then var14.text else nil,
			bodyText = getDeepValue2Module(id, "modal_layout.body.text"),
			height = size1000,
			onActivated = var20,
			style = var3
		}) else reactModule.createElement(conversationModalModule, {
			bodyText = getDeepValue2Module(id, "modal_layout.body.text"),
			denyText = if var14 then var14.text else nil,
			acceptText = if var15 and var21 then var15.text else nil,
			paddingTop = var3.Tokens.Size.Size_300,
			paddingBottom = var3.Tokens.Size.Size_300,
			verticalSpacing = var3.Tokens.Size.Size_300,
			onAccepted = var21,
			onDenied = var17,
			style = var3
		})
	elseif modalVariant ~= "none" and modalVariant ~= nil and not t_1[modalVariant] then
		warn("Unsupported ConversationTopModal variant: " .. modalVariant)
	end
	return reactModule.createElement(foundationModule.View, {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = var2.layoutOrder,
		onAbsoluteSizeChanged = function(value)
			-- upvalues: var2 (ref)
			var2.setModalHeight(value.AbsoluteSize.Y)
		end
	}, { conversationTopModal = var22 })
end)