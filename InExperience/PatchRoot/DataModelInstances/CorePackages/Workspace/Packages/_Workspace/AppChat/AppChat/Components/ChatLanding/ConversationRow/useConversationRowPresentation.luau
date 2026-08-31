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

local function _(p1, p2, p3)
	return p3 == true and (p1 and p2)
end

return function(p1)
	-- upvalues: getConversationStoreModule (ref), getConversationViewModelStoreModule (ref), reactModule (ref), signalsModule (ref), signalsReactModule (ref), useChatPagePaddingModule (ref), chatPlacementContextModule (ref), useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), useRelativeTimestampBindingModule (ref), useLocalization (ref), useGetOneToOneFriendIdFromConversationIdModule (ref), useIsRobloxSubscriber (ref), fFlagEnableBlackbirdCheck (ref), useConversationRowActivationModule (ref), reactFocusNavigationModule (ref), normalizeConversationForTelemetryModule (ref)
	local var1 = getConversationStoreModule(false)
	local var2 = getConversationViewModelStoreModule(false)
	local var3 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), p1 (ref)
		return {
			title = var2.getTitle(p1.conversationId),
			subtitle = var2.getSubtitle(p1.conversationId),
			isSubtitlePending = var2.getIsSubtitlePending(p1.conversationId),
			hasUnreadMessages = var2.getHasUnreadMessages(p1.conversationId),
			hasGroupUp = var2.getHasGroupUp(p1.conversationId),
			shouldShowOSA = var2.getShouldShowOSA(p1.conversationId),
			shouldShowU13ChatOptIn = var2.getShouldShowU13ChatOptIn(p1.conversationId),
			conversationType = var2.getConversationType(p1.conversationId),
			unixTime = var2.getUnixTime(p1.conversationId),
			testId = var2.getTestId(p1.conversationId),
			locatorTitle = var2.getLocatorTitle(p1.conversationId)
		}
	end, { var2, p1.conversationId })
	local var4 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var1 (ref), p1 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var1 (copy), p1 (copy)
			return var1.getConversation(p1.conversationId, p2)
		end)
	end, { var1, p1.conversationId }))
	local var5 = signalsReactModule.useSignalState(var3.title)
	local var6 = signalsReactModule.useSignalState(var3.subtitle)
	local var7 = signalsReactModule.useSignalState(var3.isSubtitlePending)
	local var8 = signalsReactModule.useSignalState(var3.hasUnreadMessages)
	local var9 = signalsReactModule.useSignalState(var3.hasGroupUp)
	local var10 = signalsReactModule.useSignalState(var3.shouldShowOSA)
	local var11 = signalsReactModule.useSignalState(var3.shouldShowU13ChatOptIn)
	local var12 = signalsReactModule.useSignalState(var3.conversationType)
	local var13 = signalsReactModule.useSignalState(var3.unixTime)
	local var14 = signalsReactModule.useSignalState(var3.testId)
	local var15 = signalsReactModule.useSignalState(var3.locatorTitle)
	local var16 = var5 ~= nil
	local var17 = useChatPagePaddingModule()
	local var18 = chatPlacementContextModule.useChatPlacementContext()
	local var19 = useTelemetryModule(chatLandingTelemetryLayerModule.Context)
	local var20 = useRelativeTimestampBindingModule(var13)
	local var21 = useLocalization({
		pendingSubtitleText = "Feature.Chat.Message.MessageUnavailable"
	})
	local var22 = useIsRobloxSubscriber(if fFlagEnableBlackbirdCheck then useGetOneToOneFriendIdFromConversationIdModule(p1.conversationId) else nil)
	local var23 = useConversationRowActivationModule({
		conversationId = p1.conversationId,
		hasConversation = var16,
		shouldShowOSA = var10,
		shouldShowU13ChatOptIn = var11,
		conversationType = var12,
		onActivated = p1.onActivated,
		onSquadJoinButtonActivated = p1.onSquadJoinButtonActivated,
		fireClickEvent = p1.fireClickEvent,
		telemetry = var19
	})
	local var24 = p1.isSquadEnabled == true and (var16 and var9)
	local var25 = not var24
	local var26 = var16 and (var8 and not var7)
	local var27 = if var16 and var7 then var21.pendingSubtitleText elseif var16 then var6 else ""
	local var28 = reactModule.useRef(nil)
	local var29 = reactModule.useCallback(function()
		-- upvalues: var23 (ref)
		var23.onActivated()
	end, { var23.onActivated })
	local var30 = p1.isWideMode == true
	local var31 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	reactModule.useEffect(function()
		-- upvalues: var30 (ref), var31 (ref), var28 (ref), var29 (ref)
		if var30 and var31 then
			local var32 = var31.focusedGuiObject:subscribe(function(p2)
				-- upvalues: var28 (copy), var29 (copy)
				if var28.current and p2 == var28.current then
					var29()
				end
			end)
			
			return function()
				-- upvalues: var32 (ref)
				var32:unsubscribe()
			end
		end
		return function() end
	end, { var29, var30, var31 })
	local var32 = reactModule.useRef(p1.fireImpressionEvent)
	local var33 = reactModule.useRef(nil)
	var32.current = p1.fireImpressionEvent
	reactModule.useEffect(function()
		-- upvalues: var32 (ref), var16 (ref), var33 (ref), p1 (ref), var1 (ref), normalizeConversationForTelemetryModule (copy)
		if var32.current == nil or not var16 then return end
		if var33.current == p1.conversationId then return end
		local conversation = var1.getConversation(p1.conversationId, false)
		
		if conversation == nil then
			return
		end
		var33.current = p1.conversationId
		var32.current(normalizeConversationForTelemetryModule(conversation))
	end, { p1.conversationId, var16, var1 })
	
	return {
		hasConversation = var16,
		conversationId = p1.conversationId,
		title = var5 or "",
		testId = var14,
		locatorTitle = var15,
		entryHeight = p1.entryHeight or 64,
		pagePaddingLeft = var17.left,
		pagePaddingRight = var17.right,
		timestampText = var20,
		subtitleText = var27,
		showSubscriptionBadge = var22,
		showSquadButton = var24,
		showTimestamp = var25,
		showUnread = var26,
		showBackground = if p1.showBackground ~= nil then not chatPlacementContextModule.isPlacementInExperience(var18.chatPlacement) else p1.showBackground,
		squadLocation = var18.chatPlacement,
		participants = if var4 ~= nil then nil else var4.participants,
		rowRef = var28,
		onRowActivated = var29,
		onSquadActivated = var23.onSquadActivated
	}
end