local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.ChatUIPrimitives.MessageList)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local GetConversationStoreModule = require(Parent.AppChat.GetConversationStore)
local UseChatPlatformModule = require(Parent.ExpChatIntegration.useChatPlatform)
local UseConversationEnvelopesModule = require(script.Parent.Parent.Message.BubbleEnvelopes.useConversationEnvelopes)
local GetLocalUserIdModule = require(script.Parent.Parent.Utils.getLocalUserId)
local UseChatWindowReportModule = require(script.Parent.Parent.Utils.useChatWindowReport)
local UseLocalizeModule = require(script.Parent.Parent.Utils.useLocalize)
local _ = require(script.Parent.FriendsChatBubbleMessageListView)
local FriendsChatOsaSystemMessageModule = require(script.Parent.FriendsChatOsaSystemMessage)
local GetOsaParticipantUserIdModule = require(script.Parent.getOsaParticipantUserId)
local FFlagFriendsChatOsaSystemMessage = require(Parent.SharedFlags).FFlagFriendsChatOsaSystemMessage
local Binding = ReactModule.createBinding(0)
local config = { hasRecord = false, osaUserId = nil }

local function isSameOsaState(p1, p2): boolean
	return p1.hasRecord == p2.hasRecord and p1.osaUserId == p2.osaUserId
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
	-- upvalues: UseLocalizeModule (copy), ReactModule (copy), getTopFadeSequence (copy), UseConversationEnvelopesModule (copy), SignalsModule (copy), FFlagFriendsChatOsaSystemMessage (copy), config (copy), GetConversationStoreModule (copy), GetOsaParticipantUserIdModule (copy), isSameOsaState (copy), SignalsReactModule (copy), FriendsChatOsaSystemMessageModule (copy), UseChatPlatformModule (copy), GetLocalUserIdModule (copy), Binding (copy), isBelowHideThreshold (copy), UseChatWindowReportModule (copy)
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
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), FFlagFriendsChatOsaSystemMessage (upval), config (upval), GetConversationStoreModule (upval), ConversationId (copy), GetOsaParticipantUserIdModule (upval), isSameOsaState (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: FFlagFriendsChatOsaSystemMessage (upval), config (upval), GetConversationStoreModule (upval), ConversationId (upval), GetOsaParticipantUserIdModule (upval)
			if FFlagFriendsChatOsaSystemMessage then
				local Conversation = GetConversationStoreModule(p2).getConversation(ConversationId, p2)
				
				return {
					hasRecord = Conversation ~= nil,
					osaUserId = GetOsaParticipantUserIdModule(Conversation)
				}
			else
				return config
			end
		end, isSameOsaState)
	end, { ConversationId })))
	local OsaUserId = UseSignalStateResult.osaUserId
	local End: string = if OsaUserId == nil or not p1.shouldOpenToOsaSystemMessage then "end" else "start"
	local IsEnd = (not FFlagFriendsChatOsaSystemMessage or (not p1.isRealConversation or UseSignalStateResult.hasRecord)) and (End == "end" or p1.hasLoadedNewestPage)
	local ChatWindowSettings = p1.chatWindowSettings
	local IsSpatialUIEnabled = p1.isSpatialUIEnabled
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: OsaUserId (copy), ReactModule (upval), FriendsChatOsaSystemMessageModule (upval), ConversationId (copy), ChatWindowSettings (copy), IsSpatialUIEnabled (copy), UseLocalizeModuleResult (copy)
		return if OsaUserId == nil then nil else ReactModule.createElement(FriendsChatOsaSystemMessageModule, {
			conversationId = ConversationId,
			userId = OsaUserId,
			chatWindowSettings = ChatWindowSettings,
			isSpatialUIEnabled = IsSpatialUIEnabled,
			localize = UseLocalizeModuleResult
		})
	end, {
		ConversationId,
		OsaUserId,
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
			-- upvalues: UseConversationEnvelopesModuleResult (copy), LocalUserIdModule (copy), UseMemoResult1 (copy), End (copy), UseResult2 (copy), UseResult1 (copy)
			return {
				displayMode = "bubble",
				maxGroupGapMs = 300000,
				getMessageEnvelopes = UseConversationEnvelopesModuleResult.getEnvelopes,
				observingUserId = if LocalUserIdModule then tostring(LocalUserIdModule) else nil,
				header = UseMemoResult1,
				initialScrollPosition = End,
				onUserScrollInput = UseResult2,
				onCanvasPositionChanged = UseResult1
			}
		end, {
			UseConversationEnvelopesModuleResult, LocalUserIdModule, UseMemoResult1, End,
			UseResult2, UseResult1
		})
	}
end