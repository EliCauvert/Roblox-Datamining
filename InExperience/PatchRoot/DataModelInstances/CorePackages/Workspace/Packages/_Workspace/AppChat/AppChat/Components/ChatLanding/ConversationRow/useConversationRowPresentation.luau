local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useChatPagePaddingModule = require(appChat.Contexts.ChatPagePadding.useChatPagePadding)
local chatPlacementContextModule = require(appChat.Contexts.ChatPlacementContext)
local useRelativeTimestampBindingModule = require(appChat.Hooks.useRelativeTimestampBinding)
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local chatLandingTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local getConversationStoreModule = require(appChat.Stores.GetConversationStore)
local getConversationViewModelStoreModule = require(appChat.Stores.GetConversationViewModelStore)
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local useIsRobloxSubscriber = require(parent.UserProfiles).Hooks.useIsRobloxSubscriber
local useGetOneToOneFriendIdFromConversationIdModule = require(appChat.Hooks.useGetOneToOneFriendIdFromConversationId)
local useConversationRowActivationModule = require(script.Parent.useConversationRowActivation)
local normalizeConversationForTelemetryModule = require(script.Parent.normalizeConversationForTelemetry)

local function _(p0, p1, p2) --[[ line: 60 | named "isShowingSquadButton" ]]
	return p2 == true and (p0 and p1)
end

return function(p3) --[[ line: 64 | named "useConversationRowPresentation" ]]
	-- upvalues: getConversationStoreModule (ref), getConversationViewModelStoreModule (ref), reactModule (ref), signalsModule (ref), signalsReactModule (ref), useChatPagePaddingModule (ref), chatPlacementContextModule (ref), useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), useRelativeTimestampBindingModule (ref), useLocalization (ref), useGetOneToOneFriendIdFromConversationIdModule (ref), useIsRobloxSubscriber (ref), fFlagEnableBlackbirdCheck (ref), useConversationRowActivationModule (ref), reactFocusNavigationModule (ref), normalizeConversationForTelemetryModule (ref)
	local var15 = getConversationStoreModule(false)
	local var16 = getConversationViewModelStoreModule(false)
	local var17 = reactModule.useMemo(function() --[[ line: 67 ]]
		-- upvalues: var16 (ref), p3 (ref)
		return {
			title = var16.getTitle(p3.conversationId),
			subtitle = var16.getSubtitle(p3.conversationId),
			isSubtitlePending = var16.getIsSubtitlePending(p3.conversationId),
			hasUnreadMessages = var16.getHasUnreadMessages(p3.conversationId),
			hasGroupUp = var16.getHasGroupUp(p3.conversationId),
			shouldShowOSA = var16.getShouldShowOSA(p3.conversationId),
			shouldShowU13ChatOptIn = var16.getShouldShowU13ChatOptIn(p3.conversationId),
			conversationType = var16.getConversationType(p3.conversationId),
			unixTime = var16.getUnixTime(p3.conversationId),
			testId = var16.getTestId(p3.conversationId),
			locatorTitle = var16.getLocatorTitle(p3.conversationId)
		}
	end, { var16, p3.conversationId })
	local var18 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 82 ]]
		-- upvalues: signalsModule (copy), var15 (ref), p3 (ref)
		return signalsModule.createComputed(function(p4) --[[ line: 83 ]]
			-- upvalues: var15 (copy), p3 (copy)
			return var15.getConversation(p3.conversationId, p4)
		end)
	end, { var15, p3.conversationId }))
	local var19 = signalsReactModule.useSignalState(var17.title)
	local var20 = signalsReactModule.useSignalState(var17.subtitle)
	local var21 = signalsReactModule.useSignalState(var17.isSubtitlePending)
	local var22 = signalsReactModule.useSignalState(var17.hasUnreadMessages)
	local var23 = signalsReactModule.useSignalState(var17.hasGroupUp)
	local var24 = signalsReactModule.useSignalState(var17.shouldShowOSA)
	local var25 = signalsReactModule.useSignalState(var17.shouldShowU13ChatOptIn)
	local var26 = signalsReactModule.useSignalState(var17.conversationType)
	local var27 = signalsReactModule.useSignalState(var17.unixTime)
	local var28 = signalsReactModule.useSignalState(var17.testId)
	local var29 = signalsReactModule.useSignalState(var17.locatorTitle)
	local var30 = var19 ~= nil
	local var31 = useChatPagePaddingModule()
	local var32 = chatPlacementContextModule.useChatPlacementContext()
	local var33 = useTelemetryModule(chatLandingTelemetryLayerModule.Context)
	local var34 = useRelativeTimestampBindingModule(var27)
	local var35 = useLocalization({
		pendingSubtitleText = "Feature.Chat.Message.MessageUnavailable"
	})
	local var36 = useIsRobloxSubscriber(if fFlagEnableBlackbirdCheck then useGetOneToOneFriendIdFromConversationIdModule(p3.conversationId) else nil)
	local var37 = useConversationRowActivationModule({
		conversationId = p3.conversationId,
		hasConversation = var30,
		shouldShowOSA = var24,
		shouldShowU13ChatOptIn = var25,
		conversationType = var26,
		onActivated = p3.onActivated,
		onSquadJoinButtonActivated = p3.onSquadJoinButtonActivated,
		fireClickEvent = p3.fireClickEvent,
		telemetry = var33
	})
	local var38 = p3.isSquadEnabled == true and (var30 and var23)
	local var39 = not var38
	local var40 = var30 and (var22 and not var21)
	local var41 = if var30 and var21 then var35.pendingSubtitleText elseif var30 then var20 else ""
	local var42 = reactModule.useRef(nil)
	local var43 = reactModule.useCallback(function() --[[ line: 131 ]]
		-- upvalues: var37 (ref)
		var37.onActivated()
	end, { var37.onActivated })
	local var44 = p3.isWideMode == true
	local var45 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	reactModule.useEffect(function() --[[ line: 138 ]]
		-- upvalues: var44 (ref), var45 (ref), var42 (ref), var43 (ref)
		if var44 and var45 then
			local var48 = var45.focusedGuiObject:subscribe(function(p5) --[[ line: 142 ]]
				-- upvalues: var42 (copy), var43 (copy)
				if var42.current and p5 == var42.current then
					var43()
				end
			end)
			
			return function() --[[ line: 147 ]]
				-- upvalues: var48 (ref)
				var48:unsubscribe()
			end
		end
		return function() --[[ line: 140 ]] end
	end, { var43, var44, var45 })
	local var46 = reactModule.useRef(p3.fireImpressionEvent)
	local var47 = reactModule.useRef(nil)
	var46.current = p3.fireImpressionEvent
	reactModule.useEffect(function() --[[ line: 156 ]]
		-- upvalues: var46 (ref), var30 (ref), var47 (ref), p3 (ref), var15 (ref), normalizeConversationForTelemetryModule (copy)
		if var46.current == nil or not var30 then return end
		if var47.current == p3.conversationId then return end
		local conversation = var15.getConversation(p3.conversationId, false)
		
		if conversation == nil then
			return
		end
		var47.current = p3.conversationId
		var46.current(normalizeConversationForTelemetryModule(conversation))
	end, { p3.conversationId, var30, var15 })
	
	return {
		hasConversation = var30,
		conversationId = p3.conversationId,
		title = var19 or "",
		testId = var28,
		locatorTitle = var29,
		entryHeight = p3.entryHeight or 64,
		pagePaddingLeft = var31.left,
		pagePaddingRight = var31.right,
		timestampText = var34,
		subtitleText = var41,
		showSubscriptionBadge = var36,
		showSquadButton = var38,
		showTimestamp = var39,
		showUnread = var40,
		squadLocation = var32.chatPlacement,
		participants = if var18 ~= nil then nil else var18.participants,
		rowRef = var42,
		onRowActivated = var43,
		onSquadActivated = var37.onSquadActivated
	}
end