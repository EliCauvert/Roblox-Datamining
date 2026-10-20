local Parent = script:FindFirstAncestor("FriendsChat").Parent
local Players = game:GetService("Players")
local ReactModule = require(Parent.React)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local ConversationChannelsModule = require(Parent.AppChat.ConversationChannels)
local FetchNewerMessagesModule = require(Parent.AppChat.fetchNewerMessages)
local GetConversationMessageListStoreModule = require(Parent.AppChat.GetConversationMessageListStore)
local ClassifyCommunicationChannelsEventModule = require(script.Parent.classifyCommunicationChannelsEvent)
local ExpChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local GetFriendsChatNavigationStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatNavigationStore)
local GetFriendsChatRealtimeStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatRealtimeStore)
local FFlagFriendsChatRefreshListForNewConversationModule = require(script.Parent.Parent.Flags.FFlagFriendsChatRefreshListForNewConversation)
local FStringDebugFriendsChatConversationIdModule = require(script.Parent.Parent.Flags.FStringDebugFriendsChatConversationId)
local NewResult = require(Parent.ExpChatShared).Logger:new(script.Name)
local FriendshipNotificationsModule = require(script.Parent.FriendshipNotifications)

local function fetchNewerMessagesSafe(ActiveConversationId, Callback)
	-- upvalues: ExpChatConversationListAdapterModule (copy), GetConversationMessageListStoreModule (copy), FetchNewerMessagesModule (copy), GetFriendsChatRealtimeStoreModule (copy), Players (copy), NewResult (copy)
	local Conversation = ExpChatConversationListAdapterModule.getConversationStore().getConversation(ActiveConversationId, false)
	local LastUpdated = Conversation and Conversation.lastUpdated
	local t = {}
	
	for _, value in GetConversationMessageListStoreModule(false).getOrderedIds(ActiveConversationId, false) do
		t[value] = true
	end
	FetchNewerMessagesModule(ActiveConversationId):andThen(function(Result)
		-- upvalues: GetFriendsChatRealtimeStoreModule (upval), Players (upval), ActiveConversationId (copy), ExpChatConversationListAdapterModule (upval), LastUpdated (copy), Callback (copy), t (copy)
		local Response = Result and Result.response
		local ResponseBody = Response and Response.responseBody
		local IngestedIds = Result and Result.ingestedIds
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
			FriendsChatRealtimeStoreModule.addLocalUnread(ActiveConversationId)
		end
		if ActiveConversationId1 == ActiveConversationId then
			ExpChatConversationListAdapterModule.markConversationRead(ActiveConversationId, true)
			
			if Callback ~= nil then
				local Flag = false
				
				if IngestedIds ~= nil then
					for _, ingestedId in IngestedIds do
						if not t[ingestedId] then
							Flag = true
							break
						end
					end
				end
				if Flag then
					Callback()
				end
			end
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

local function fetchConversationDetailsSafe(ChannelId, IsAddedToChannel, Callback)
	-- upvalues: ExpChatConversationListAdapterModule (copy), updateSelectedFriendPlaceholder (copy), NewResult (copy)
	ExpChatConversationListAdapterModule.fetchConversationDetailsToSignals(ChannelId):andThen(function(Result)
		-- upvalues: IsAddedToChannel (copy), Callback (copy), ChannelId (copy), updateSelectedFriendPlaceholder (upval)
		if IsAddedToChannel then
			local ResponseBody = if Result == nil then nil else Result.responseBody or Result
			local Conversations = ResponseBody and ResponseBody.conversations
			
			if (if Conversations == nil then nil else Conversations[1]) == nil then
				Callback(`new conversation {ChannelId}`)
				
				return
			end
		end
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

return function(p1)
	-- upvalues: ReactModule (copy), ExpChatConversationListAdapterModule (copy), NewResult (copy), RealtimeDeliveryModule (copy), ClassifyCommunicationChannelsEventModule (copy), fetchNewerMessagesSafe (copy), GetFriendsChatNavigationStoreModule (copy), fetchConversationDetailsSafe (copy), FFlagFriendsChatRefreshListForNewConversationModule (copy), GetFriendsChatRealtimeStoreModule (copy), FStringDebugFriendsChatConversationIdModule (copy), FriendshipNotificationsModule (copy)
	local OnActiveConversationMessageReceived = p1.onActiveConversationMessageReceived
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(0)
	
	local function requestConversationListRefresh(p2)
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), ExpChatConversationListAdapterModule (upval), NewResult (upval)
		UseRefResult.current = true
		UseRefResult1.current += 1
		local Current = UseRefResult1.current
		
		local function attempt(p3: number)
			-- upvalues: UseRefResult1 (upval), Current (copy), ExpChatConversationListAdapterModule (upval), UseRefResult (upval), NewResult (upval), p2 (copy), attempt (copy)
			if UseRefResult1.current ~= Current then return end
			if ExpChatConversationListAdapterModule.getConversationStore().getListStatus(false).isFetchingConversations == true then
				if p3 <= 0 then
					UseRefResult.current = false
					NewResult:warning(`Gave up refreshing conversation list after {p2}: fetch still in flight`)
					
					return
				else
					task.delay(1, function()
						-- upvalues: attempt (upval), p3 (copy)
						attempt(p3 - 1)
					end)
					
					return
				end
			elseif UseRefResult.current then
				UseRefResult.current = false
				ExpChatConversationListAdapterModule.fetchConversationListPageToSignals():catch(function(Err)
					-- upvalues: NewResult (upval), p2 (upval)
					NewResult:warning(`Failed to refresh conversation list after {p2}: {tostring(Err)}`)
				end)
				
				return
			else
			end
		end
		
		attempt(3)
	end
	
	RealtimeDeliveryModule.useRealtimeNamespace("CommunicationChannels", function(p2)
		-- upvalues: ClassifyCommunicationChannelsEventModule (upval), fetchNewerMessagesSafe (upval), OnActiveConversationMessageReceived (copy), ExpChatConversationListAdapterModule (upval), GetFriendsChatNavigationStoreModule (upval), fetchConversationDetailsSafe (upval), FFlagFriendsChatRefreshListForNewConversationModule (upval), requestConversationListRefresh (copy)
		local ClassifyCommunicationChannelsEventModuleResult = ClassifyCommunicationChannelsEventModule(p2)
		local ChannelId = ClassifyCommunicationChannelsEventModuleResult.channelId
		
		if ChannelId == nil then return end
		if ClassifyCommunicationChannelsEventModuleResult.kind == "fetchMessage" then
			fetchNewerMessagesSafe(ChannelId, OnActiveConversationMessageReceived)
			
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
			fetchConversationDetailsSafe(ChannelId, FFlagFriendsChatRefreshListForNewConversationModule and (p2.Type == "AddedToChannel" or p2.Type == "ChannelCreated"), requestConversationListRefresh)
		end
	end, {})
	RealtimeDeliveryModule.useRealtimeConnectionStateChanged("CommunicationChannels", function(ConnectionState, p2)
		-- upvalues: GetFriendsChatRealtimeStoreModule (upval), FStringDebugFriendsChatConversationIdModule (upval), fetchNewerMessagesSafe (upval), OnActiveConversationMessageReceived (copy)
		if ConnectionState ~= Enum.ConnectionState.Connected or not p2 then return end
		local ActiveConversationId = GetFriendsChatRealtimeStoreModule(false).getActiveConversationId(false) or FStringDebugFriendsChatConversationIdModule
		
		if ActiveConversationId ~= "" then
			fetchNewerMessagesSafe(ActiveConversationId, OnActiveConversationMessageReceived)
		end
	end, {})
	RealtimeDeliveryModule.useRealtimeNamespace(FriendshipNotificationsModule.Namespace, function(p2)
		-- upvalues: FriendshipNotificationsModule (upval), NewResult (upval), UseRefResult (copy), UseRefResult1 (copy), ExpChatConversationListAdapterModule (upval)
		if p2 ~= nil and p2.Type == FriendshipNotificationsModule.EventType.Created then
			NewResult:info(`Received friendship notification: {p2.Type}`)
			UseRefResult.current = true
			UseRefResult1.current += 1
			local Current = UseRefResult1.current
			local v1 = "friendship update"
			
			local function attempt(p3: number)
				-- upvalues: UseRefResult1 (upval), Current (copy), ExpChatConversationListAdapterModule (upval), UseRefResult (upval), NewResult (upval), v1 (copy), attempt (copy)
				if UseRefResult1.current ~= Current then return end
				if ExpChatConversationListAdapterModule.getConversationStore().getListStatus(false).isFetchingConversations == true then
					if p3 <= 0 then
						UseRefResult.current = false
						NewResult:warning(`Gave up refreshing conversation list after {v1}: fetch still in flight`)
						
						return
					else
						task.delay(1, function()
							-- upvalues: attempt (upval), p3 (copy)
							attempt(p3 - 1)
						end)
						
						return
					end
				elseif UseRefResult.current then
					UseRefResult.current = false
					ExpChatConversationListAdapterModule.fetchConversationListPageToSignals():catch(function(Err)
						-- upvalues: NewResult (upval), v1 (upval)
						NewResult:warning(`Failed to refresh conversation list after {v1}: {tostring(Err)}`)
					end)
					
					return
				else
				end
			end
			
			attempt(3)
			
			return
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy)
		return function()
			-- upvalues: UseRefResult1 (upval)
			UseRefResult1.current += 1
		end
	end, {})
	
	return nil
end