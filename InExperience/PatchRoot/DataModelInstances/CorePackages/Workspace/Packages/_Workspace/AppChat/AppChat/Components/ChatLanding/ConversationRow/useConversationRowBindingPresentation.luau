local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UserProfilesModule = require(Parent.UserProfiles)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)
local ChatPlacementContextModule = require(AppChat.Contexts.ChatPlacementContext)
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local ChatLandingTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local GetConversationViewModelStoreModule = require(AppChat.Stores.GetConversationViewModelStore)
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local FFlagAppChatUseActivationOnFocus = require(Parent.SharedFlags).FFlagAppChatUseActivationOnFocus
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local FFlagAppChatUseBindingConversationFacePileModule = require(AppChat.Flags.FFlagAppChatUseBindingConversationFacePile)
local GetOtherParticipantsModule = require(AppChat.Conversations.getOtherParticipants)
local UseActivationOnFocusFunction = require(Parent.FocusNavigationUtils).useActivationOnFocus
local UseConversationRowActivationModule = require(script.Parent.useConversationRowActivation)
local UseRelativeTimestampSignalBindingModule = require(script.Parent.useRelativeTimestampSignalBinding)
local NormalizeConversationForTelemetryModule = require(script.Parent.normalizeConversationForTelemetry)

local function useSubscriptionBadgeVisibility(Callback, p1)
	-- upvalues: ReactModule (copy), UserProfilesModule (copy), FFlagEnableBlackbirdCheck (copy), FFlagAppChatUseBindingConversationFacePileModule (copy), SignalsModule (copy), GetOtherParticipantsModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local GetResult = UserProfilesModule.Stores.UserProfileStore.get()
	ReactModule.useLayoutEffect(function()
		-- upvalues: FFlagEnableBlackbirdCheck (upval), FFlagAppChatUseBindingConversationFacePileModule (upval), SignalsModule (upval), Callback (copy), p1 (copy), GetOtherParticipantsModule (upval), GetResult (copy), UseBindingResult2 (copy)
		if not FFlagEnableBlackbirdCheck or not FFlagAppChatUseBindingConversationFacePileModule then return end
		local v1 = nil
		local NamesByUserIds = nil
		local IsHasRobloxSubscription = false
		
		return SignalsModule.createEffect(function(p2)
			-- upvalues: Callback (upval), p1 (upval), GetOtherParticipantsModule (upval), v1 (ref), NamesByUserIds (ref), GetResult (upval), IsHasRobloxSubscription (ref), UseBindingResult2 (upval)
			local CallbackResult = Callback(p2)
			local Conversation = p1.getConversation(CallbackResult.id, p2)
			local OtherParticipantsModule = GetOtherParticipantsModule(Conversation, CallbackResult.presentationSignal(p2).localUserId)
			local Text = if Conversation == nil or Conversation.type ~= "one_to_one" or #OtherParticipantsModule ~= 1 then nil else tostring(OtherParticipantsModule[1])
			
			if Text ~= v1 then
				v1 = Text
				NamesByUserIds = if Text == nil then nil else GetResult.fetchNamesByUserIds({ Text })
			end
			local IsHasRobloxSubscription1 = false
			
			if NamesByUserIds ~= nil then
				local Success, Result = pcall(NamesByUserIds, p2)
				
				if Success and Result.status == "success" and #Result.data > 0 then
					local Entry = Result.data[1]
					IsHasRobloxSubscription1 = Entry.getHasRobloxSubscription ~= nil and Entry.getHasRobloxSubscription(p2) == true
				end
			end
			if IsHasRobloxSubscription1 ~= IsHasRobloxSubscription then
				IsHasRobloxSubscription = IsHasRobloxSubscription1
				UseBindingResult2(IsHasRobloxSubscription1)
			end
		end)
	end, { p1, Callback, UseBindingResult2, GetResult })
	
	return UseBindingResult
end

return function(p1)
	-- upvalues: GetConversationStoreModule (copy), GetConversationViewModelStoreModule (copy), UseLocalizationFunction (copy), ReactModule (copy), SignalsModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), SignalsReactModule (copy), UseRelativeTimestampSignalBindingModule (copy), useSubscriptionBadgeVisibility (copy), UseChatPagePaddingModule (copy), ChatPlacementContextModule (copy), UseTelemetryModule (copy), ChatLandingTelemetryLayerModule (copy), UseConversationRowActivationModule (copy), FFlagAppChatUseActivationOnFocus (copy), UseActivationOnFocusFunction (copy), ReactFocusNavigationModule (copy), NormalizeConversationForTelemetryModule (copy)
	local ConversationStoreModule = GetConversationStoreModule(false)
	local ConversationViewModelStoreModule = GetConversationViewModelStoreModule(false)
	local PendingSubtitleText = UseLocalizationFunction({
		pendingSubtitleText = "Feature.Chat.Message.MessageUnavailable"
	}).pendingSubtitleText
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), SignalsModule (upval), ConversationViewModelStoreModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (upval)
		return {
			conversationId = SignalsModule.createComputed(function(p2)
				-- upvalues: p1 (upval)
				return p1.itemSignal(p2).id
			end),
			presentation = SignalsModule.createComputed(function(p2)
				-- upvalues: p1 (upval)
				return p1.itemSignal(p2).presentationSignal(p2)
			end),
			hasConversation = SignalsModule.createComputed(function(p2): boolean
				-- upvalues: ConversationViewModelStoreModule (upval), p1 (upval)
				return ConversationViewModelStoreModule.getTitle(p1.itemSignal(p2).id)(p2) ~= nil
			end),
			shouldShowOSA = SignalsModule.createComputed(function(p2)
				-- upvalues: ConversationViewModelStoreModule (upval), p1 (upval)
				return ConversationViewModelStoreModule.getShouldShowOSA(p1.itemSignal(p2).id)(p2)
			end),
			shouldShowU13ChatOptIn = SignalsModule.createComputed(function(p2)
				-- upvalues: ConversationViewModelStoreModule (upval), p1 (upval)
				return ConversationViewModelStoreModule.getShouldShowU13ChatOptIn(p1.itemSignal(p2).id)(p2)
			end),
			conversationType = SignalsModule.createComputed(function(p2)
				-- upvalues: ConversationViewModelStoreModule (upval), p1 (upval)
				return ConversationViewModelStoreModule.getConversationType(p1.itemSignal(p2).id)(p2)
			end),
			testId = SignalsModule.createComputed(function(p2)
				-- upvalues: FFlagDebugAppChatEnableDomLocatorsModule (upval), ConversationViewModelStoreModule (upval), p1 (upval)
				return if FFlagDebugAppChatEnableDomLocatorsModule then ConversationViewModelStoreModule.getTestId(p1.itemSignal(p2).id)(p2) else nil
			end),
			locatorTitle = SignalsModule.createComputed(function(p2)
				-- upvalues: FFlagDebugAppChatEnableDomLocatorsModule (upval), ConversationViewModelStoreModule (upval), p1 (upval)
				return if FFlagDebugAppChatEnableDomLocatorsModule then ConversationViewModelStoreModule.getLocatorTitle(p1.itemSignal(p2).id)(p2) else nil
			end),
			showSquadButton = SignalsModule.createComputed(function(p2): boolean
				-- upvalues: p1 (upval), ConversationViewModelStoreModule (upval)
				local ItemSignalResult = p1.itemSignal(p2)
				
				return ItemSignalResult.presentationSignal(p2).isSquadEnabled == true and (ConversationViewModelStoreModule.getTitle(ItemSignalResult.id)(p2) ~= nil and ConversationViewModelStoreModule.getHasGroupUp(ItemSignalResult.id)(p2) == true)
			end)
		}
	end, { ConversationViewModelStoreModule, p1.itemSignal })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult.presentation)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseMemoResult.hasConversation)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(UseMemoResult.shouldShowOSA)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(UseMemoResult.shouldShowU13ChatOptIn)
	local UseSignalStateResult4 = SignalsReactModule.useSignalState(UseMemoResult.conversationType)
	local UseSignalStateResult5 = SignalsReactModule.useSignalState(UseMemoResult.testId)
	local UseSignalStateResult6 = SignalsReactModule.useSignalState(UseMemoResult.locatorTitle)
	local UseSignalStateResult7 = SignalsReactModule.useSignalState(UseMemoResult.showSquadButton)
	local UseResult = ReactModule.useCallback(function(p2, p3)
		-- upvalues: ConversationViewModelStoreModule (copy)
		return ConversationViewModelStoreModule.getTitle(p2.id)(p3) or ""
	end, { ConversationViewModelStoreModule })
	local UseResult1 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: ConversationViewModelStoreModule (copy), PendingSubtitleText (copy)
		local IsSubtitlePending = ConversationViewModelStoreModule.getIsSubtitlePending(p2.id)
		
		return if ConversationViewModelStoreModule.getTitle(p2.id)(p3) == nil then "" elseif IsSubtitlePending(p3) then PendingSubtitleText else ConversationViewModelStoreModule.getSubtitle(p2.id)(p3) or ""
	end, { ConversationViewModelStoreModule, PendingSubtitleText })
	local UseResult2 = ReactModule.useCallback(function(p2, p3): boolean
		-- upvalues: ConversationViewModelStoreModule (copy)
		return ConversationViewModelStoreModule.getTitle(p2.id)(p3) ~= nil and (ConversationViewModelStoreModule.getHasUnreadMessages(p2.id)(p3) == true and not ConversationViewModelStoreModule.getIsSubtitlePending(p2.id)(p3))
	end, { ConversationViewModelStoreModule })
	local UseResult3 = ReactModule.useCallback(function(p2)
		return p2.id
	end, {})
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(function(p2)
		-- upvalues: UseResult (copy), p1 (copy)
		return UseResult(p1.itemSignal(p2), p2)
	end)
	local UseSignalBindingResult1 = SignalsReactModule.useSignalBinding(function(p2)
		-- upvalues: UseResult1 (copy), p1 (copy)
		return UseResult1(p1.itemSignal(p2), p2)
	end)
	local UseSignalBindingResult2 = SignalsReactModule.useSignalBinding(function(p2)
		-- upvalues: UseResult2 (copy), p1 (copy)
		return UseResult2(p1.itemSignal(p2), p2)
	end)
	local UseRelativeTimestampSignalBindingModuleResult = UseRelativeTimestampSignalBindingModule(p1.itemSignal, (ReactModule.useCallback(function(p2, p3)
		-- upvalues: ConversationViewModelStoreModule (copy)
		return ConversationViewModelStoreModule.getUnixTime(p2.id)(p3)
	end, { ConversationViewModelStoreModule })))
	local NoUseSignalStateResult7 = not UseSignalStateResult7
	local UseSubscriptionBadgeVisibilityResult = useSubscriptionBadgeVisibility(p1.itemSignal, ConversationStoreModule)
	local UseSignalBindingResult3 = SignalsReactModule.useSignalBinding(function(p2)
		-- upvalues: UseResult3 (copy), p1 (copy)
		return UseResult3(p1.itemSignal(p2))
	end)
	local UseChatPagePaddingModuleResult = UseChatPagePaddingModule()
	local UseChatPlacementContextResult = ChatPlacementContextModule.useChatPlacementContext()
	local UseConversationRowActivationModuleResult = UseConversationRowActivationModule({
		conversationId = UseMemoResult.conversationId(false),
		hasConversation = UseSignalStateResult1,
		shouldShowOSA = UseSignalStateResult2,
		shouldShowU13ChatOptIn = UseSignalStateResult3,
		conversationType = UseSignalStateResult4,
		onActivated = UseSignalStateResult.onActivated,
		onSquadJoinButtonActivated = UseSignalStateResult.onSquadJoinButtonActivated,
		fireClickEvent = UseSignalStateResult.fireClickEvent,
		telemetry = UseTelemetryModule(ChatLandingTelemetryLayerModule.Context),
		getCurrentOptions = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), ConversationViewModelStoreModule (copy)
			local ItemSignalResult = p1.itemSignal(false)
			local Id = ItemSignalResult.id
			local PresentationSignalResult = ItemSignalResult.presentationSignal(false)
			
			return {
				conversationId = Id,
				hasConversation = ConversationViewModelStoreModule.getTitle(Id)(false) ~= nil,
				shouldShowOSA = ConversationViewModelStoreModule.getShouldShowOSA(Id)(false),
				shouldShowU13ChatOptIn = ConversationViewModelStoreModule.getShouldShowU13ChatOptIn(Id)(false),
				conversationType = ConversationViewModelStoreModule.getConversationType(Id)(false),
				onActivated = PresentationSignalResult.onActivated,
				onSquadJoinButtonActivated = PresentationSignalResult.onSquadJoinButtonActivated,
				fireClickEvent = PresentationSignalResult.fireClickEvent
			}
		end, { ConversationViewModelStoreModule, p1.itemSignal })
	})
	local UseRefResult = ReactModule.useRef(nil)
	local OnActivatedFunction = UseConversationRowActivationModuleResult.onActivated
	local IsIsWideMode = UseSignalStateResult.isWideMode == true
	
	if FFlagAppChatUseActivationOnFocus then
		UseActivationOnFocusFunction(IsIsWideMode, UseRefResult, OnActivatedFunction, nil, (ReactModule.useCallback(function()
			-- upvalues: p1 (copy)
			return p1.itemSignal(false).id
		end, { p1.itemSignal })))
	else
		local UseContextResult = ReactModule.useContext(ReactFocusNavigationModule.FocusNavigationContext)
		ReactModule.useEffect(function()
			-- upvalues: IsIsWideMode (copy), UseContextResult (copy), UseRefResult (copy), OnActivatedFunction (copy)
			if IsIsWideMode and UseContextResult then
				local SubscribeResult = UseContextResult.focusedGuiObject:subscribe(function(Current)
					-- upvalues: UseRefResult (upval), OnActivatedFunction (upval)
					if UseRefResult.current and Current == UseRefResult.current then
						OnActivatedFunction()
					end
				end)
				
				return function()
					-- upvalues: SubscribeResult (copy)
					SubscribeResult:unsubscribe()
				end
			else
				return function() end
			end
		end, {
			OnActivatedFunction,
			IsIsWideMode,
			UseContextResult,
			UseRefResult
		})
	end
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), p1 (copy), UseRefResult1 (copy), ConversationStoreModule (copy), NormalizeConversationForTelemetryModule (upval)
		return SignalsModule.createEffect(function(p2)
			-- upvalues: p1 (upval), UseRefResult1 (upval), ConversationStoreModule (upval), NormalizeConversationForTelemetryModule (upval)
			local ItemSignalResult = p1.itemSignal(p2)
			local FireImpressionEventFunction: (any) -> () = ItemSignalResult.presentationSignal(p2).fireImpressionEvent
			
			if FireImpressionEventFunction == nil or UseRefResult1.current == ItemSignalResult.id then return end
			local Conversation = ConversationStoreModule.getConversation(ItemSignalResult.id, p2)
			
			if Conversation ~= nil then
				UseRefResult1.current = ItemSignalResult.id
				FireImpressionEventFunction(NormalizeConversationForTelemetryModule(Conversation))
				
				return
			end
		end)
	end, { ConversationStoreModule, p1.itemSignal })
	
	return {
		hasConversation = UseSignalStateResult1,
		title = UseSignalBindingResult,
		testId = UseSignalStateResult5,
		locatorTitle = UseSignalStateResult6,
		entryHeight = UseSignalStateResult.entryHeight or 64,
		pagePaddingLeft = UseChatPagePaddingModuleResult.left,
		pagePaddingRight = UseChatPagePaddingModuleResult.right,
		timestampText = UseRelativeTimestampSignalBindingModuleResult,
		subtitleText = UseSignalBindingResult1,
		showSubscriptionBadge = UseSubscriptionBadgeVisibilityResult,
		showSquadButton = UseSignalStateResult7,
		showTimestamp = NoUseSignalStateResult7,
		showUnread = UseSignalBindingResult2,
		squadLocation = UseChatPlacementContextResult.chatPlacement,
		rowRef = UseRefResult,
		onRowActivated = OnActivatedFunction,
		onSquadActivated = UseConversationRowActivationModuleResult.onSquadActivated,
		showBackground = if UseSignalStateResult.showBackground == nil then not ChatPlacementContextModule.isPlacementInExperience(UseChatPlacementContextResult.chatPlacement) else UseSignalStateResult.showBackground,
		debugCellValue = if UseSignalStateResult.isDebugEnabled then UseSignalBindingResult3 else nil
	}
end