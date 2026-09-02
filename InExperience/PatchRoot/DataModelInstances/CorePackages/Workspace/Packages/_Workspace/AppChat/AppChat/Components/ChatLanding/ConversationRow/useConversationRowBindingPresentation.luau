local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local userProfilesModule = require(parent.UserProfiles)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useChatPagePaddingModule = require(appChat.Contexts.ChatPagePadding.useChatPagePadding)
local chatPlacementContextModule = require(appChat.Contexts.ChatPlacementContext)
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local chatLandingTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local getConversationStoreModule = require(appChat.Stores.GetConversationStore)
local getConversationViewModelStoreModule = require(appChat.Stores.GetConversationViewModelStore)
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local fFlagAppChatUseBindingConversationFacePileModule = require(appChat.Flags.FFlagAppChatUseBindingConversationFacePile)
local getOtherParticipantsModule = require(appChat.Conversations.getOtherParticipants)
local useConversationRowActivationModule = require(script.Parent.useConversationRowActivation)
local useRelativeTimestampSignalBindingModule = require(script.Parent.useRelativeTimestampSignalBinding)
local normalizeConversationForTelemetryModule = require(script.Parent.normalizeConversationForTelemetry)

local function useSubscriptionBadgeVisibility(p1, p2)
	-- upvalues: reactModule (ref), userProfilesModule (ref), fFlagEnableBlackbirdCheck (ref), fFlagAppChatUseBindingConversationFacePileModule (ref), signalsModule (ref), getOtherParticipantsModule (ref)
	local var1, var2 = reactModule.useBinding(false)
	local var3 = userProfilesModule.Stores.UserProfileStore.get()
	reactModule.useLayoutEffect(function()
		-- upvalues: fFlagEnableBlackbirdCheck (copy), fFlagAppChatUseBindingConversationFacePileModule (copy), signalsModule (copy), p1 (ref), p2 (ref), getOtherParticipantsModule (copy), var3 (ref), var2 (ref)
		if fFlagEnableBlackbirdCheck and fFlagAppChatUseBindingConversationFacePileModule then
			local var4 = nil
			local var5 = nil
			local var6 = false
			
			return signalsModule.createEffect(function(p3)
				-- upvalues: p1 (copy), p2 (copy), getOtherParticipantsModule (copy), var4 (write), var5 (write), var3 (copy), var6 (write), var2 (copy)
				local var7 = p1(p3)
				local conversation = p2.getConversation(var7.id, p3)
				local var8 = getOtherParticipantsModule(conversation, var7.presentationSignal(p3).localUserId)
				local var9 = if conversation == nil or conversation.type ~= "one_to_one" or #var8 ~= 1 then nil else tostring(var8[1])
				
				if var9 ~= var4 then
					var4 = var9
					var5 = if var9 ~= nil then nil else var3.fetchNamesByUserIds({ var9 })
				end
				local var10 = false
				
				if var5 ~= nil then
					local ok, status = pcall(var5, p3)
					
					if ok and status.status == "success" and #status.data > 0 then
						local var11 = status.data[1]
						var10 = var11.getHasRobloxSubscription ~= nil and var11.getHasRobloxSubscription(p3) == true
					end
				end
				if var10 ~= var6 then
					var6 = var10
					var2(var10)
				end
			end)
		end
	end, { p2, p1, var2, var3 })
	
	return var1
end

return function(p1)
	-- upvalues: getConversationStoreModule (ref), getConversationViewModelStoreModule (ref), useLocalization (ref), reactModule (ref), signalsModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), signalsReactModule (ref), useRelativeTimestampSignalBindingModule (ref), useSubscriptionBadgeVisibility (ref), useChatPagePaddingModule (ref), chatPlacementContextModule (ref), useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), useConversationRowActivationModule (ref), reactFocusNavigationModule (ref), normalizeConversationForTelemetryModule (ref)
	local var1 = getConversationStoreModule(false)
	local var2 = getConversationViewModelStoreModule(false)
	local pendingSubtitleText = useLocalization({
		pendingSubtitleText = "Feature.Chat.Message.MessageUnavailable"
	}).pendingSubtitleText
	local var3 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), signalsModule (copy), var2 (ref), fFlagDebugAppChatEnableDomLocatorsModule (copy)
		return {
			conversationId = signalsModule.createComputed(function(p2)
				-- upvalues: p1 (copy)
				return p1.itemSignal(p2).id
			end),
			presentation = signalsModule.createComputed(function(p2)
				-- upvalues: p1 (copy)
				return p1.itemSignal(p2).presentationSignal(p2)
			end),
			hasConversation = signalsModule.createComputed(function(p2)
				-- upvalues: var2 (copy), p1 (copy)
				return var2.getTitle(p1.itemSignal(p2).id)(p2) ~= nil
			end),
			shouldShowOSA = signalsModule.createComputed(function(p2)
				-- upvalues: var2 (copy), p1 (copy)
				return var2.getShouldShowOSA(p1.itemSignal(p2).id)(p2)
			end),
			shouldShowU13ChatOptIn = signalsModule.createComputed(function(p2)
				-- upvalues: var2 (copy), p1 (copy)
				return var2.getShouldShowU13ChatOptIn(p1.itemSignal(p2).id)(p2)
			end),
			conversationType = signalsModule.createComputed(function(p2)
				-- upvalues: var2 (copy), p1 (copy)
				return var2.getConversationType(p1.itemSignal(p2).id)(p2)
			end),
			testId = signalsModule.createComputed(function(p2)
				-- upvalues: fFlagDebugAppChatEnableDomLocatorsModule (copy), var2 (copy), p1 (copy)
				return if fFlagDebugAppChatEnableDomLocatorsModule then var2.getTestId(p1.itemSignal(p2).id)(p2) else nil
			end),
			locatorTitle = signalsModule.createComputed(function(p2)
				-- upvalues: fFlagDebugAppChatEnableDomLocatorsModule (copy), var2 (copy), p1 (copy)
				return if fFlagDebugAppChatEnableDomLocatorsModule then var2.getLocatorTitle(p1.itemSignal(p2).id)(p2) else nil
			end),
			showSquadButton = signalsModule.createComputed(function(p2)
				-- upvalues: p1 (copy), var2 (copy)
				local var4 = p1.itemSignal(p2)
				
				return var4.presentationSignal(p2).isSquadEnabled == true and (var2.getTitle(var4.id)(p2) ~= nil and var2.getHasGroupUp(var4.id)(p2) == true)
			end)
		}
	end, { var2, p1.itemSignal })
	local var4 = signalsReactModule.useSignalState(var3.presentation)
	local var5 = signalsReactModule.useSignalState(var3.hasConversation)
	local var6 = signalsReactModule.useSignalState(var3.shouldShowOSA)
	local var7 = signalsReactModule.useSignalState(var3.shouldShowU13ChatOptIn)
	local var8 = signalsReactModule.useSignalState(var3.conversationType)
	local var9 = signalsReactModule.useSignalState(var3.testId)
	local var10 = signalsReactModule.useSignalState(var3.locatorTitle)
	local var11 = signalsReactModule.useSignalState(var3.showSquadButton)
	local var12 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var2 (ref)
		return var2.getTitle(p2.id)(p3) or ""
	end, { var2 })
	local var13 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var2 (ref), pendingSubtitleText (ref)
		return if var2.getTitle(p2.id)(p3) == nil then "" elseif var2.getIsSubtitlePending(p2.id)(p3) then pendingSubtitleText else var2.getSubtitle(p2.id)(p3) or ""
	end, { var2, pendingSubtitleText })
	local var14 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var2 (ref)
		return var2.getTitle(p2.id)(p3) ~= nil and (var2.getHasUnreadMessages(p2.id)(p3) == true and not var2.getIsSubtitlePending(p2.id)(p3))
	end, { var2 })
	local var15 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var2 (ref)
		return var2.getUnixTime(p2.id)(p3)
	end, { var2 })
	local var16 = reactModule.useCallback(function(p2)
		return p2.id
	end, {})
	local var17 = signalsReactModule.useSignalBinding(function(p2)
		-- upvalues: var12 (ref), p1 (ref)
		return var12(p1.itemSignal(p2), p2)
	end)
	local var18 = signalsReactModule.useSignalBinding(function(p2)
		-- upvalues: var13 (ref), p1 (ref)
		return var13(p1.itemSignal(p2), p2)
	end)
	local var19 = signalsReactModule.useSignalBinding(function(p2)
		-- upvalues: var14 (ref), p1 (ref)
		return var14(p1.itemSignal(p2), p2)
	end)
	local var20 = useRelativeTimestampSignalBindingModule(p1.itemSignal, var15)
	local var21 = not var11
	local var22 = useSubscriptionBadgeVisibility(p1.itemSignal, var1)
	local var23 = signalsReactModule.useSignalBinding(function(p2)
		-- upvalues: var16 (ref), p1 (ref)
		return var16(p1.itemSignal(p2))
	end)
	local var24 = useChatPagePaddingModule()
	local var25 = chatPlacementContextModule.useChatPlacementContext()
	local var26 = useConversationRowActivationModule({
		conversationId = var3.conversationId(false),
		hasConversation = var5,
		shouldShowOSA = var6,
		shouldShowU13ChatOptIn = var7,
		conversationType = var8,
		onActivated = var4.onActivated,
		onSquadJoinButtonActivated = var4.onSquadJoinButtonActivated,
		fireClickEvent = var4.fireClickEvent,
		telemetry = useTelemetryModule(chatLandingTelemetryLayerModule.Context),
		getCurrentOptions = reactModule.useCallback(function()
			-- upvalues: p1 (ref), var2 (ref)
			local var27 = p1.itemSignal(false)
			local id = var27.id
			local var28 = var27.presentationSignal(false)
			
			return {
				conversationId = id,
				hasConversation = var2.getTitle(id)(false) ~= nil,
				shouldShowOSA = var2.getShouldShowOSA(id)(false),
				shouldShowU13ChatOptIn = var2.getShouldShowU13ChatOptIn(id)(false),
				conversationType = var2.getConversationType(id)(false),
				onActivated = var28.onActivated,
				onSquadJoinButtonActivated = var28.onSquadJoinButtonActivated,
				fireClickEvent = var28.fireClickEvent
			}
		end, { var2, p1.itemSignal })
	})
	local var27 = reactModule.useRef(nil)
	local onActivated = var26.onActivated
	local var28 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	local var29 = var4.isWideMode == true
	reactModule.useEffect(function()
		-- upvalues: var29 (ref), var28 (ref), var27 (ref), onActivated (ref)
		if var29 and var28 then
			local var30 = var28.focusedGuiObject:subscribe(function(p2)
				-- upvalues: var27 (copy), onActivated (copy)
				if var27.current and p2 == var27.current then
					onActivated()
				end
			end)
			
			return function()
				-- upvalues: var30 (ref)
				var30:unsubscribe()
			end
		end
		return function() end
	end, { onActivated, var29, var28, var27 })
	local var30 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), p1 (ref), var30 (ref), var1 (ref), normalizeConversationForTelemetryModule (copy)
		return signalsModule.createEffect(function(p2)
			-- upvalues: p1 (copy), var30 (copy), var1 (copy), normalizeConversationForTelemetryModule (copy)
			local var31 = p1.itemSignal(p2)
			local fireImpressionEvent = var31.presentationSignal(p2).fireImpressionEvent
			
			if fireImpressionEvent == nil or var30.current == var31.id then return end
			local conversation = var1.getConversation(var31.id, p2)
			
			if conversation == nil then
				return
			end
			var30.current = var31.id
			fireImpressionEvent(normalizeConversationForTelemetryModule(conversation))
		end)
	end, { var1, p1.itemSignal })
	
	return {
		hasConversation = var5,
		title = var17,
		testId = var9,
		locatorTitle = var10,
		entryHeight = var4.entryHeight or 64,
		pagePaddingLeft = var24.left,
		pagePaddingRight = var24.right,
		timestampText = var20,
		subtitleText = var18,
		showSubscriptionBadge = var22,
		showSquadButton = var11,
		showTimestamp = var21,
		showUnread = var19,
		squadLocation = var25.chatPlacement,
		rowRef = var27,
		onRowActivated = onActivated,
		onSquadActivated = var26.onSquadActivated,
		showBackground = if var4.showBackground ~= nil then not chatPlacementContextModule.isPlacementInExperience(var25.chatPlacement) else var4.showBackground,
		debugCellValue = if var4.isDebugEnabled then var23 else nil
	}
end