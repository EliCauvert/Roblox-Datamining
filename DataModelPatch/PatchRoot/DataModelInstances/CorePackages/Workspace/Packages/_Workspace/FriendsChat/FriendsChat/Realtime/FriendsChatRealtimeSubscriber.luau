local Parent = script:FindFirstAncestor("FriendsChat").Parent
local Players = game:GetService("Players")
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local ConversationChannelsModule = require(Parent.AppChat.ConversationChannels)
local FetchNewerMessagesModule = require(Parent.AppChat.fetchNewerMessages)
local ClassifyCommunicationChannelsEventModule = require(script.Parent.classifyCommunicationChannelsEvent)
local ExpChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local GetFriendsChatNavigationStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatNavigationStore)
local GetFriendsChatRealtimeStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatRealtimeStore)
local FStringDebugFriendsChatConversationIdModule = require(script.Parent.Parent.Flags.FStringDebugFriendsChatConversationId)
local NewResult = require(Parent.ExpChatShared).Logger:new(script.Name)

local function fetchNewerMessagesSafe(ActiveConversationId)
	-- upvalues: ExpChatConversationListAdapterModule (copy), FetchNewerMessagesModule (copy), GetFriendsChatRealtimeStoreModule (copy), Players (copy), NewResult (copy)
	local Conversation = ExpChatConversationListAdapterModule.getConversationStore().getConversation(ActiveConversationId, false)
	local LastUpdated = Conversation and Conversation.lastUpdated
	FetchNewerMessagesModule(ActiveConversationId):andThen(function(Result)
		-- upvalues: GetFriendsChatRealtimeStoreModule (upval), Players (upval), ActiveConversationId (copy), ExpChatConversationListAdapterModule (upval), LastUpdated (copy)
		local Response = Result and Result.response
		local ResponseBody = Response and Response.responseBody
		local FriendsChatRealtimeStoreModule = GetFriendsChatRealtimeStoreModule(false)
		local ActiveConversationId1 = FriendsChatRealtimeStoreModule.getActiveConversationId(false)
		local LocalPlayer = Players.LocalPlayer
		local _, UpdateConversationPreviewFromMessagesResult2 = ExpChatConversationListAdapterModule.updateConversationPreviewFromMessages(ActiveConversationId, if ResponseBody then ResponseBody.messages or {} else {}, {
			refreshListOnMissingConversation = true,
			hasUnreadMessages = ActiveConversationId1 ~= ActiveConversationId,
			localUserId = if LocalPlayer then LocalPlayer.UserId else 0,
			unreadFreshnessLastUpdated = LastUpdated
		})
		
		if UpdateConversationPreviewFromMessagesResult2 then
			FriendsChatRealtimeStoreModule.setHasLocalUnread(true)
		end
		if ActiveConversationId1 == ActiveConversationId then
			ExpChatConversationListAdapterModule.markConversationRead(ActiveConversationId, true)
		end
	end):catch(function(Err)
		-- upvalues: NewResult (upval), ActiveConversationId (copy)
		NewResult:warning(`Failed to fetch newer messages for {ActiveConversationId}: {tostring(Err)}`)
	end)
end

local function _(p1)
	local ResponseBody = if p1 == nil then nil else p1.responseBody or p1
	local Conversations = ResponseBody and ResponseBody.conversations
	
	return if Conversations == nil then nil else Conversations[1]
end

local function updateSelectedFriendPlaceholder(p1, p2)
	-- upvalues: ConversationChannelsModule (copy), GetFriendsChatNavigationStoreModule (copy)
	local ResponseBody = if p2 == nil then nil else p2.responseBody or p2
	local Conversations = ResponseBody and ResponseBody.conversations
	local Conversation = if Conversations == nil then nil else Conversations[1]
	
	if Conversation == nil or Conversation.source ~= ConversationChannelsModule.Source.Channels or Conversation.type ~= ConversationChannelsModule.Type.OneToOne or Conversation.participant_user_ids == nil then return end
	local FriendConversationId = ConversationChannelsModule.getFriendConversationId(Conversation.participant_user_ids)
	local FriendsChatNavigationStoreModule = GetFriendsChatNavigationStoreModule(false)
	
	if FriendsChatNavigationStoreModule.getSelectedConversationId(false) == FriendConversationId then
		FriendsChatNavigationStoreModule.setSelectedConversationId(Conversation.id or p1)
	end
end

local function fetchConversationDetailsSafe(ChannelId)
	-- upvalues: ExpChatConversationListAdapterModule (copy), updateSelectedFriendPlaceholder (copy), NewResult (copy)
	ExpChatConversationListAdapterModule.fetchConversationDetailsToSignals(ChannelId):andThen(function(Result)
		-- upvalues: updateSelectedFriendPlaceholder (upval), ChannelId (copy)
		updateSelectedFriendPlaceholder(ChannelId, Result)
	end):catch(function(Err)
		-- upvalues: NewResult (upval), ChannelId (copy)
		NewResult:warning(`Failed to fetch conversation details for {ChannelId}: {tostring(Err)}`)
	end)
end

local _ = function(SelectedConversationId)
	-- upvalues: ExpChatConversationListAdapterModule (copy), GetFriendsChatNavigationStoreModule (copy)
	ExpChatConversationListAdapterModule.removeConversation(SelectedConversationId)
	local FriendsChatNavigationStoreModule = GetFriendsChatNavigationStoreModule(false)
	
	if FriendsChatNavigationStoreModule.getSelectedConversationId(false) == SelectedConversationId then
		FriendsChatNavigationStoreModule.setSelectedConversationId(nil)
	end
end

return function()
	-- upvalues: RealtimeDeliveryModule (copy), ClassifyCommunicationChannelsEventModule (copy), fetchNewerMessagesSafe (copy), ExpChatConversationListAdapterModule (copy), GetFriendsChatNavigationStoreModule (copy), fetchConversationDetailsSafe (copy), GetFriendsChatRealtimeStoreModule (copy), FStringDebugFriendsChatConversationIdModule (copy)
	RealtimeDeliveryModule.useRealtimeNamespace("CommunicationChannels", function(p1)
		-- upvalues: ClassifyCommunicationChannelsEventModule (upval), fetchNewerMessagesSafe (upval), ExpChatConversationListAdapterModule (upval), GetFriendsChatNavigationStoreModule (upval), fetchConversationDetailsSafe (upval)
		local ClassifyCommunicationChannelsEventModuleResult = ClassifyCommunicationChannelsEventModule(p1)
		local ChannelId = ClassifyCommunicationChannelsEventModuleResult.channelId
		
		if ChannelId == nil then return end
		if ClassifyCommunicationChannelsEventModuleResult.kind == "fetchMessage" then
			fetchNewerMessagesSafe(ChannelId)
			
			return
		end
		if ClassifyCommunicationChannelsEventModuleResult.kind == "removeConversation" then
			ExpChatConversationListAdapterModule.removeConversation(ChannelId)
			local FriendsChatNavigationStoreModule = GetFriendsChatNavigationStoreModule(false)
			
			if FriendsChatNavigationStoreModule.getSelectedConversationId(false) == ChannelId then
				FriendsChatNavigationStoreModule.setSelectedConversationId(nil)
				
				return
			end
		elseif ClassifyCommunicationChannelsEventModuleResult.kind == "fetchConversationDetails" then
			fetchConversationDetailsSafe(ChannelId)
		end
	end, {})
	RealtimeDeliveryModule.useRealtimeConnectionStateChanged("CommunicationChannels", function(ConnectionState, p1)
		-- upvalues: GetFriendsChatRealtimeStoreModule (upval), FStringDebugFriendsChatConversationIdModule (upval), fetchNewerMessagesSafe (upval)
		if ConnectionState ~= Enum.ConnectionState.Connected or not p1 then return end
		local ActiveConversationId = GetFriendsChatRealtimeStoreModule(false).getActiveConversationId(false) or FStringDebugFriendsChatConversationIdModule
		
		if ActiveConversationId ~= "" then
			fetchNewerMessagesSafe(ActiveConversationId)
		end
	end, {})
	
	return nil
end