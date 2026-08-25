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
local var11 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
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

return memo(function(p0)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useAnalyticsModule (ref), useDispatch (ref), useRef (ref), useEffect (ref), useSelector (ref), getDeepValue2Module (ref), useConversationTopModalModule (ref), t_2 (ref), t_1 (ref), useCallback (ref), eventNamesModule (ref), appChatNetworkingModule (ref), dismissedConversationTopModalModule (ref), appPage (ref), unfilteredThreadsAMPFeatureNameModule (ref), fFlagSignalsNavP3Dispatch (ref), var11 (ref), navigateBack (ref), accessResponseEnum (ref), refreshAllUnfilteredThreadsDetailsModule (ref), navigateDown (ref), createUnfilteredChatPartialModal (ref), learnMorePartialModal (ref), reactModule (ref), conversationBannerDeprecatedModule (ref), conversationModalModule (ref), foundationModule (ref)
	local var19 = cryoModule.Dictionary.union(t, p0)
	local var20 = useStyle()
	local var21 = useAnalyticsModule()
	local var22 = useDispatch()
	local size1000 = var20.Tokens.Size.Size_1000
	local var23 = useRef(var19.setModalHeight)
	useEffect(function()
		-- upvalues: var23 (ref), var19 (ref)
		var23.current = var19.setModalHeight
	end, { var19.setModalHeight })
	useEffect(function()
		-- upvalues: var23 (ref)
		return function()
			-- upvalues: var23 (copy)
			if var23.current then
				var23.current(0)
			end
		end
	end, {})
	local var24 = useSelector(function(p1)
		-- upvalues: getDeepValue2Module (copy), var19 (ref)
		return getDeepValue2Module(p1, `ChatAppReducer.Modals.conversationTopModalsDismissed.{var19.conversation.id}`) or {}
	end)
	local id = useConversationTopModalModule(var19.conversation.id) or {}
	local modalVariant = id.modal_variant
	local var26 = getDeepValue2Module(id, "modal_layout.id")
	local var27 = getDeepValue2Module(id, "modal_layout.seen_record_action")
	local var28 = getDeepValue2Module(id, "modal_layout.dismiss_record_action")
	local var29 = t_2[modalVariant]
	local var30 = t_1[modalVariant] and not var24[modalVariant]
	local var31 = getDeepValue2Module(id, "modal_layout.buttons")
	local var32 = var31 and var31[1]
	local var33 = var31 and var31[2]
	local var34 = useCallback(function()
		-- upvalues: var21 (ref), var29 (ref), eventNamesModule (copy), var19 (ref)
		if var21 and var29 then
			var21.fireAnalyticsEvent(eventNamesModule[`{var29}ActionClicked`], { conversationId = var19.conversation.id })
		end
	end, { var21, var29, var19.conversation.id })
	local var35 = useCallback(function()
		-- upvalues: var22 (ref), appChatNetworkingModule (copy), var28 (ref), var26 (ref), dismissedConversationTopModalModule (copy), var19 (ref), modalVariant (ref)
		var22(appChatNetworkingModule.rodux.RecordModalSequenceResponse.API(var28, "conversation_top_modal", var26)):catch(function(p2)
			warn("Error in ConversationTopModalContainer -> RecordModalSequenceResponse dismissed: " .. tostring(p2))
		end)
		var22(dismissedConversationTopModalModule(var19.conversation.id, modalVariant))
	end, {
		var22,
		var28,
		modalVariant,
		var26,
		var19.conversation.id
	})
	local var36 = useCallback(function()
		-- upvalues: var34 (ref), appPage (copy), unfilteredThreadsAMPFeatureNameModule (copy), fFlagSignalsNavP3Dispatch (copy), var11 (copy), var22 (ref), navigateBack (copy), accessResponseEnum (copy), refreshAllUnfilteredThreadsDetailsModule (copy), var19 (ref), navigateDown (copy)
		var34()
		local t = {
			name = appPage.AmpWizardContainer,
			extraProps = {
				featureName = unfilteredThreadsAMPFeatureNameModule,
				completionCallback = function(p3, _)
					-- upvalues: fFlagSignalsNavP3Dispatch (copy), var11 (copy), var22 (copy), navigateBack (copy), accessResponseEnum (copy), refreshAllUnfilteredThreadsDetailsModule (copy), var19 (copy)
					if fFlagSignalsNavP3Dispatch then
						var11.back(true)
					else
						var22(navigateBack(true))
					end
					if p3 == accessResponseEnum.Granted then
						var22(refreshAllUnfilteredThreadsDetailsModule(var19.conversation.id))
					end
				end
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var11.down(var11.fromLegacyPage(t))
			
			return
		end
		var22(navigateDown(t))
	end, { var34, var22, var19.conversation.id })
	local var37 = useCallback(function()
		-- upvalues: var34 (ref), var19 (ref), createUnfilteredChatPartialModal (copy)
		var34()
		var19.navigateToScreen(createUnfilteredChatPartialModal, {}, true)
	end, { var19.navigateToScreen, var34 })
	local var38 = useCallback(function()
		-- upvalues: var34 (ref), var19 (ref), learnMorePartialModal (copy)
		var34()
		var19.navigateToScreen(learnMorePartialModal, {}, true)
	end, { var19.navigateToScreen, var34 })
	useEffect(function()
		-- upvalues: var30 (ref), var22 (ref), appChatNetworkingModule (copy), var27 (ref), var26 (ref)
		if var30 then
			var22(appChatNetworkingModule.rodux.RecordModalSequenceResponse.API(var27, "conversation_top_modal", var26)):catch(function(p4)
				warn("Error in ConversationTopModalContainer -> RecordModalSequenceResponse seen: " .. tostring(p4))
			end)
		end
	end, {
		var22,
		var30,
		var27,
		var26,
		var19.conversation.id
	})
	useEffect(function()
		-- upvalues: var30 (ref), var21 (ref), var29 (ref), eventNamesModule (copy), var19 (ref)
		if var30 and var21 and var29 then
			var21.fireAnalyticsEvent(eventNamesModule[`{var29}Rendered`], { conversationId = var19.conversation.id })
		end
	end, { var30, var21, var29, var19.conversation.id })
	local var39 = ({
		conversation_banner_group_phone_verification = var36,
		conversation_banner_one_to_one_phone_verification = var36,
		conversation_banner_group_duplicate_upgrade = var37
	})[modalVariant]
	local var40 = nil
	
	if var30 then
		var40 = if modalVariant == "conversation_banner_learn_more" then reactModule.createElement(conversationBannerDeprecatedModule, {
			actionText = if var32 then var32.text else nil,
			bodyText = getDeepValue2Module(id, "modal_layout.body.text"),
			height = size1000,
			onActivated = var38,
			style = var20
		}) else reactModule.createElement(conversationModalModule, {
			bodyText = getDeepValue2Module(id, "modal_layout.body.text"),
			denyText = if var32 then var32.text else nil,
			acceptText = if var33 and var39 then var33.text else nil,
			paddingTop = var20.Tokens.Size.Size_300,
			paddingBottom = var20.Tokens.Size.Size_300,
			verticalSpacing = var20.Tokens.Size.Size_300,
			onAccepted = var39,
			onDenied = var35,
			style = var20
		})
	elseif modalVariant ~= "none" and modalVariant ~= nil and not t_1[modalVariant] then
		warn("Unsupported ConversationTopModal variant: " .. modalVariant)
	end
	return reactModule.createElement(foundationModule.View, {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = var19.layoutOrder,
		onAbsoluteSizeChanged = function(value)
			-- upvalues: var19 (ref)
			var19.setModalHeight(value.AbsoluteSize.Y)
		end
	}, { conversationTopModal = var40 })
end)