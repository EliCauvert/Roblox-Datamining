local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.ChatUIPrimitives.MessageList)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local GetConversationStoreModule = require(Parent.AppChat.GetConversationStore)
local GetConversationMessageListStoreModule = require(Parent.AppChat.GetConversationMessageListStore)
local FetchOlderMessagesModule = require(Parent.AppChat.fetchOlderMessages)
local UseChatPlatformModule = require(Parent.ExpChatIntegration.useChatPlatform)
local FFlagFriendsChatPaginateOlderMessagesModule = require(FriendsChat.Flags.FFlagFriendsChatPaginateOlderMessages)
local FIntFriendsChatBubbleMaxMessagesModule = require(FriendsChat.Flags.FIntFriendsChatBubbleMaxMessages)
local UseConversationEnvelopesModule = require(script.Parent.Parent.Message.BubbleEnvelopes.useConversationEnvelopes)
local GetLocalUserIdModule = require(script.Parent.Parent.Utils.getLocalUserId)
local UseChatWindowReportModule = require(script.Parent.Parent.Utils.useChatWindowReport)
local UseLocalizeModule = require(script.Parent.Parent.Utils.useLocalize)
local _ = require(script.Parent.FriendsChatBubbleMessageListView)
local FriendsChatOsaSystemMessageModule = require(script.Parent.FriendsChatOsaSystemMessage)
local GetOsaParticipantUserIdModule = require(script.Parent.getOsaParticipantUserId)
local Binding = ReactModule.createBinding(0)
local NewResult = ExpChatSharedModule.Logger:new(script.Name)

local function isSameOsaState(p1, p2): boolean
	return p1.hasRecord == p2.hasRecord and p1.osaUserId == p2.osaUserId and p1.hasOlderPage == p2.hasOlderPage
end

local function isBelowHideThreshold(p1): boolean
	-- upvalues: ExpChatSharedModule (copy)
	return p1 < ExpChatSharedModule.Config.ChatWindowMessageHideRootFadeThreshold
end

local function getTopFadeSequence(Entry): NumberSequence
	local Entry1 = Entry[1]
	local Entry2: number = Entry[2]
	
	return if Entry2 <= 0 or Entry1 <= Entry2 then NumberSequence.new(0) else NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(Entry2 / Entry1, 0),
		NumberSequenceKeypoint.new(1, 0)
	})
end

return function(p1)
	-- upvalues: UseLocalizeModule (copy), ReactModule (copy), getTopFadeSequence (copy), UseConversationEnvelopesModule (copy), FFlagFriendsChatPaginateOlderMessagesModule (copy), FIntFriendsChatBubbleMaxMessagesModule (copy), SignalsModule (copy), GetConversationStoreModule (copy), GetConversationMessageListStoreModule (copy), GetOsaParticipantUserIdModule (copy), isSameOsaState (copy), SignalsReactModule (copy), FriendsChatOsaSystemMessageModule (copy), UseChatPlatformModule (copy), GetLocalUserIdModule (copy), FetchOlderMessagesModule (copy), NewResult (copy), Binding (copy), isBelowHideThreshold (copy), UseChatWindowReportModule (copy)
	local UseLocalizeModuleResult = UseLocalizeModule()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(Frame.AbsoluteSize.Y)
	end, {})
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseResult (copy)
		local Current = UseRefResult.current
		
		if Current then
			UseResult(Current)
		end
	end, { UseResult })
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseBindingResult1 (copy), UseBindingResult2_1 (copy)
		local ClampedValue = math.clamp(p2.Y, 0, 16)
		
		if ClampedValue ~= UseBindingResult1:getValue() then
			UseBindingResult2_1(ClampedValue)
		end
	end, { UseBindingResult1, UseBindingResult2_1 })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), UseBindingResult (copy), UseBindingResult1 (copy), getTopFadeSequence (upval)
		return ReactModule.joinBindings({ UseBindingResult, UseBindingResult1 }):map(getTopFadeSequence)
	end, { UseBindingResult, UseBindingResult1 })
	local ConversationId = p1.conversationId
	local UseConversationEnvelopesModuleResult = UseConversationEnvelopesModule({
		conversationId = ConversationId,
		shouldReadMessages = p1.hasConversationId
	})
	local ConversationId1 = if FFlagFriendsChatPaginateOlderMessagesModule and FIntFriendsChatBubbleMaxMessagesModule == 0 and p1.isRealConversation then ConversationId else nil
	local HasConversationId = ConversationId1 ~= nil
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), GetConversationStoreModule (upval), ConversationId (copy), HasConversationId (copy), GetConversationMessageListStoreModule (upval), GetOsaParticipantUserIdModule (upval), isSameOsaState (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: GetConversationStoreModule (upval), ConversationId (upval), HasConversationId (upval), GetConversationMessageListStoreModule (upval), GetOsaParticipantUserIdModule (upval)
			local Conversation = GetConversationStoreModule(p2).getConversation(ConversationId, p2)
			local Metadata = if HasConversationId then GetConversationMessageListStoreModule(p2).getMetadata(ConversationId, p2) else nil
			
			return {
				hasRecord = Conversation ~= nil,
				osaUserId = GetOsaParticipantUserIdModule(Conversation),
				hasOlderPage = Metadata ~= nil and (Metadata.nextPageCursor ~= nil and not Metadata.fetchedOldest)
			}
		end, isSameOsaState)
	end, { ConversationId, HasConversationId })))
	local OsaUserId = UseSignalStateResult.osaUserId
	local End: string = if OsaUserId == nil or not p1.shouldOpenToOsaSystemMessage then "end" else "start"
	local IsEnd = (not p1.isRealConversation or UseSignalStateResult.hasRecord) and (End == "end" or p1.hasLoadedNewestPage)
	local ShouldOpenToOsaSystemMessage = p1.shouldOpenToOsaSystemMessage
	
	if FFlagFriendsChatPaginateOlderMessagesModule then
		local UseRefResult1 = ReactModule.useRef(nil)
		
		if IsEnd and (UseRefResult1.current == nil or UseRefResult1.current.conversationId ~= ConversationId) then
			UseRefResult1.current = {
				conversationId = ConversationId,
				atDisclosure = p1.shouldOpenToOsaSystemMessage
			}
		end
		local Current = UseRefResult1.current
		
		if Current ~= nil and Current.conversationId == ConversationId then
			ShouldOpenToOsaSystemMessage = Current.atDisclosure
		end
	end
	local NoHasConversationId = not HasConversationId or p1.hasLoadedNewestPage and (ShouldOpenToOsaSystemMessage or not UseSignalStateResult.hasOlderPage)
	local OsaUserId1 = if NoHasConversationId then OsaUserId else nil
	local ChatWindowSettings = p1.chatWindowSettings
	local IsSpatialUIEnabled = p1.isSpatialUIEnabled
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: OsaUserId1 (copy), ReactModule (upval), FriendsChatOsaSystemMessageModule (upval), ConversationId (copy), ChatWindowSettings (copy), IsSpatialUIEnabled (copy), UseLocalizeModuleResult (copy)
		return if OsaUserId1 == nil then nil else ReactModule.createElement(FriendsChatOsaSystemMessageModule, {
			conversationId = ConversationId,
			userId = OsaUserId1,
			chatWindowSettings = ChatWindowSettings,
			isSpatialUIEnabled = IsSpatialUIEnabled,
			localize = UseLocalizeModuleResult
		})
	end, {
		ConversationId,
		OsaUserId1,
		ChatWindowSettings,
		IsSpatialUIEnabled,
		UseLocalizeModuleResult
	})
	local GetTransparencyStoreFunction = UseChatPlatformModule().getTransparencyStore
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: GetTransparencyStoreFunction (copy)
		GetTransparencyStoreFunction(false).resetAllTransparency()
	end, { GetTransparencyStoreFunction })
	local LocalUserIdModule = GetLocalUserIdModule()
	local TextTransparency = p1.textTransparency or Binding
	
	return {
		layoutOrder = p1.layoutOrder,
		conversationId = ConversationId,
		isReady = IsEnd,
		topInset = p1.topInset,
		textTransparency = TextTransparency,
		messagesVisible = ReactModule.useMemo(function()
			-- upvalues: TextTransparency (copy), isBelowHideThreshold (upval)
			return TextTransparency:map(isBelowHideThreshold)
		end, { TextTransparency }),
		topFade = UseMemoResult,
		maskRef = UseRefResult,
		onMaskAbsoluteSizeChanged = UseResult,
		onSlotAbsoluteSizeChanged = UseChatWindowReportModule(p1.onAbsoluteSizeChanged),
		onSlotAbsolutePositionChanged = UseChatWindowReportModule(p1.onAbsolutePositionChanged),
		onHovered = p1.onHovered,
		onUnhovered = p1.onUnhovered,
		messageListProps = ReactModule.useMemo(function()
			-- upvalues: ConversationId1 (copy), FetchOlderMessagesModule (upval), NewResult (upval), UseConversationEnvelopesModuleResult (copy), LocalUserIdModule (copy), UseMemoResult1 (copy), End (copy), UseResult2 (copy), UseResult1 (copy)
			return {
				displayMode = "bubble",
				maxGroupGapMs = 300000,
				getMessageEnvelopes = UseConversationEnvelopesModuleResult.getEnvelopes,
				observingUserId = if LocalUserIdModule then tostring(LocalUserIdModule) else nil,
				header = UseMemoResult1,
				initialScrollPosition = End,
				onUserScrollInput = UseResult2,
				onCanvasPositionChanged = UseResult1,
				onNearOldestMessage = if ConversationId1 == nil then nil else function()
					-- upvalues: FetchOlderMessagesModule (upval), ConversationId1 (copy), NewResult (upval)
					FetchOlderMessagesModule(ConversationId1):catch(function(Err)
						-- upvalues: NewResult (upval), ConversationId1 (upval)
						NewResult:warning(`Failed to fetch older messages for {ConversationId1}: {tostring(Err)}`)
					end)
				end
			}
		end, {
			UseConversationEnvelopesModuleResult, LocalUserIdModule, UseMemoResult1, End,
			UseResult2, UseResult1, ConversationId1
		})
	}
end