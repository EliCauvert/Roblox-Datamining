local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)
local ChatPlacementContextModule = require(AppChat.Contexts.ChatPlacementContext)
local UseRelativeTimestampBindingModule = require(AppChat.Hooks.useRelativeTimestampBinding)
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local ChatLandingTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local GetConversationViewModelStoreModule = require(AppChat.Stores.GetConversationViewModelStore)
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local UseIsRobloxSubscriberFunction = require(Parent.UserProfiles).Hooks.useIsRobloxSubscriber
local UseGetOneToOneFriendIdFromConversationIdModule = require(AppChat.Hooks.useGetOneToOneFriendIdFromConversationId)
local UseConversationRowActivationModule = require(script.Parent.useConversationRowActivation)
local NormalizeConversationForTelemetryModule = require(script.Parent.normalizeConversationForTelemetry)

local function _(p1, p2, Enabled)
	return Enabled == true and (p1 and p2)
end

return function(p1)
	-- upvalues: GetConversationStoreModule (copy), GetConversationViewModelStoreModule (copy), ReactModule (copy), SignalsModule (copy), SignalsReactModule (copy), UseChatPagePaddingModule (copy), ChatPlacementContextModule (copy), UseTelemetryModule (copy), ChatLandingTelemetryLayerModule (copy), UseRelativeTimestampBindingModule (copy), UseLocalizationFunction (copy), UseGetOneToOneFriendIdFromConversationIdModule (copy), UseIsRobloxSubscriberFunction (copy), FFlagEnableBlackbirdCheck (copy), UseConversationRowActivationModule (copy), ReactFocusNavigationModule (copy), NormalizeConversationForTelemetryModule (copy)
	local ConversationStoreModule = GetConversationStoreModule(false)
	local ConversationViewModelStoreModule = GetConversationViewModelStoreModule(false)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ConversationViewModelStoreModule (copy), p1 (copy)
		return {
			title = ConversationViewModelStoreModule.getTitle(p1.conversationId),
			subtitle = ConversationViewModelStoreModule.getSubtitle(p1.conversationId),
			isSubtitlePending = ConversationViewModelStoreModule.getIsSubtitlePending(p1.conversationId),
			hasUnreadMessages = ConversationViewModelStoreModule.getHasUnreadMessages(p1.conversationId),
			hasGroupUp = ConversationViewModelStoreModule.getHasGroupUp(p1.conversationId),
			shouldShowOSA = ConversationViewModelStoreModule.getShouldShowOSA(p1.conversationId),
			shouldShowU13ChatOptIn = ConversationViewModelStoreModule.getShouldShowU13ChatOptIn(p1.conversationId),
			conversationType = ConversationViewModelStoreModule.getConversationType(p1.conversationId),
			unixTime = ConversationViewModelStoreModule.getUnixTime(p1.conversationId),
			testId = ConversationViewModelStoreModule.getTestId(p1.conversationId),
			locatorTitle = ConversationViewModelStoreModule.getLocatorTitle(p1.conversationId)
		}
	end, { ConversationViewModelStoreModule, p1.conversationId })
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), ConversationStoreModule (copy), p1 (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: ConversationStoreModule (upval), p1 (upval)
			return ConversationStoreModule.getConversation(p1.conversationId, p2)
		end)
	end, { ConversationStoreModule, p1.conversationId })))
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseMemoResult.title)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(UseMemoResult.subtitle)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(UseMemoResult.isSubtitlePending)
	local UseSignalStateResult4 = SignalsReactModule.useSignalState(UseMemoResult.hasUnreadMessages)
	local UseSignalStateResult5 = SignalsReactModule.useSignalState(UseMemoResult.hasGroupUp)
	local UseSignalStateResult6 = SignalsReactModule.useSignalState(UseMemoResult.shouldShowOSA)
	local UseSignalStateResult7 = SignalsReactModule.useSignalState(UseMemoResult.shouldShowU13ChatOptIn)
	local UseSignalStateResult8 = SignalsReactModule.useSignalState(UseMemoResult.conversationType)
	local UseSignalStateResult9 = SignalsReactModule.useSignalState(UseMemoResult.unixTime)
	local UseSignalStateResult10 = SignalsReactModule.useSignalState(UseMemoResult.testId)
	local UseSignalStateResult11 = SignalsReactModule.useSignalState(UseMemoResult.locatorTitle)
	local HasUseSignalStateResult = UseSignalStateResult1 ~= nil
	local UseChatPagePaddingModuleResult = UseChatPagePaddingModule()
	local UseChatPlacementContextResult = ChatPlacementContextModule.useChatPlacementContext()
	local UseTelemetryModuleResult = UseTelemetryModule(ChatLandingTelemetryLayerModule.Context)
	local UseRelativeTimestampBindingModuleResult = UseRelativeTimestampBindingModule(UseSignalStateResult9)
	local UseLocalizationResult = UseLocalizationFunction({
		pendingSubtitleText = "Feature.Chat.Message.MessageUnavailable"
	})
	local UseGetOneToOneFriendIdFromConversationIdModuleResult = UseGetOneToOneFriendIdFromConversationIdModule(p1.conversationId)
	local UseIsRobloxSubscriberResult = UseIsRobloxSubscriberFunction(if FFlagEnableBlackbirdCheck then UseGetOneToOneFriendIdFromConversationIdModuleResult else nil)
	local UseConversationRowActivationModuleResult = UseConversationRowActivationModule({
		conversationId = p1.conversationId,
		hasConversation = HasUseSignalStateResult,
		shouldShowOSA = UseSignalStateResult6,
		shouldShowU13ChatOptIn = UseSignalStateResult7,
		conversationType = UseSignalStateResult8,
		onActivated = p1.onActivated,
		onSquadJoinButtonActivated = p1.onSquadJoinButtonActivated,
		fireClickEvent = p1.fireClickEvent,
		telemetry = UseTelemetryModuleResult
	})
	local UseSignalStateResult5_1 = p1.isSquadEnabled == true and (HasUseSignalStateResult and UseSignalStateResult5)
	local NoUseSignalStateResult5_1 = not UseSignalStateResult5_1
	local NoUseSignalStateResult3: boolean = HasUseSignalStateResult and (UseSignalStateResult4 and not UseSignalStateResult3)
	local PendingSubtitleText = if HasUseSignalStateResult and UseSignalStateResult3 then UseLocalizationResult.pendingSubtitleText elseif HasUseSignalStateResult then UseSignalStateResult2 else ""
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseConversationRowActivationModuleResult (copy)
		UseConversationRowActivationModuleResult.onActivated()
	end, { UseConversationRowActivationModuleResult.onActivated })
	local IsIsWideMode = p1.isWideMode == true
	local UseContextResult = ReactModule.useContext(ReactFocusNavigationModule.FocusNavigationContext)
	ReactModule.useEffect(function()
		-- upvalues: IsIsWideMode (copy), UseContextResult (copy), UseRefResult (copy), UseResult (copy)
		if IsIsWideMode and UseContextResult then
			local SubscribeResult = UseContextResult.focusedGuiObject:subscribe(function(Current)
				-- upvalues: UseRefResult (upval), UseResult (upval)
				if UseRefResult.current and Current == UseRefResult.current then
					UseResult()
				end
			end)
			
			return function()
				-- upvalues: SubscribeResult (copy)
				SubscribeResult:unsubscribe()
			end
		else
			return function() end
		end
	end, { UseResult, IsIsWideMode, UseContextResult })
	local UseRefResult1 = ReactModule.useRef(p1.fireImpressionEvent)
	local UseRefResult2 = ReactModule.useRef(nil)
	UseRefResult1.current = p1.fireImpressionEvent
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), HasUseSignalStateResult (copy), UseRefResult2 (copy), p1 (copy), ConversationStoreModule (copy), NormalizeConversationForTelemetryModule (upval)
		if UseRefResult1.current == nil or not HasUseSignalStateResult then return end
		if UseRefResult2.current == p1.conversationId then return end
		local Conversation = ConversationStoreModule.getConversation(p1.conversationId, false)
		
		if Conversation ~= nil then
			UseRefResult2.current = p1.conversationId
			UseRefResult1.current(NormalizeConversationForTelemetryModule(Conversation))
			
			return
		end
	end, {
		p1.conversationId,
		HasUseSignalStateResult,
		ConversationStoreModule
	})
	
	return {
		hasConversation = HasUseSignalStateResult,
		conversationId = p1.conversationId,
		title = UseSignalStateResult1 or "",
		testId = UseSignalStateResult10,
		locatorTitle = UseSignalStateResult11,
		entryHeight = p1.entryHeight or 64,
		pagePaddingLeft = UseChatPagePaddingModuleResult.left,
		pagePaddingRight = UseChatPagePaddingModuleResult.right,
		timestampText = UseRelativeTimestampBindingModuleResult,
		subtitleText = PendingSubtitleText,
		showSubscriptionBadge = UseIsRobloxSubscriberResult,
		showSquadButton = UseSignalStateResult5_1,
		showTimestamp = NoUseSignalStateResult5_1,
		showUnread = NoUseSignalStateResult3,
		squadLocation = UseChatPlacementContextResult.chatPlacement,
		participants = if UseSignalStateResult == nil then nil else UseSignalStateResult.participants,
		rowRef = UseRefResult,
		onRowActivated = UseResult,
		onSquadActivated = UseConversationRowActivationModuleResult.onSquadActivated
	}
end