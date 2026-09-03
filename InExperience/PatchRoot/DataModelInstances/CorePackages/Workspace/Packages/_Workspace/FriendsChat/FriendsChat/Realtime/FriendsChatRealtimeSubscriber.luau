local parent = script:FindFirstAncestor("FriendsChat").Parent
local playersService = game:GetService("Players")
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local expChatSharedModule = require(parent.ExpChatShared)
local conversationChannelsModule = require(parent.AppChat.ConversationChannels)
local fetchNewerMessagesModule = require(parent.AppChat.fetchNewerMessages)
local getConversationMessageListStoreModule = require(parent.AppChat.GetConversationMessageListStore)
local classifyCommunicationChannelsEventModule = require(script.Parent.classifyCommunicationChannelsEvent)
local expChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local getFriendsChatNavigationStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatNavigationStore)
local getFriendsChatRealtimeStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatRealtimeStore)
local fFlagFriendsChatRefreshListForNewConversationModule = require(script.Parent.Parent.Flags.FFlagFriendsChatRefreshListForNewConversation)
local fStringDebugFriendsChatConversationIdModule = require(script.Parent.Parent.Flags.FStringDebugFriendsChatConversationId)
local name = expChatSharedModule.Logger:new(script.Name)
local friendshipNotificationsModule = require(script.Parent.FriendshipNotifications)

local function fetchNewerMessagesSafe(p1, p2)
	-- upvalues: expChatConversationListAdapterModule (ref), getConversationMessageListStoreModule (ref), fetchNewerMessagesModule (ref), getFriendsChatRealtimeStoreModule (ref), playersService (ref), name (ref)
	local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(p1, false)
	local lastUpdated = conversation and conversation.lastUpdated
	local t = {}
	
	for i, v in getConversationMessageListStoreModule(false).getOrderedIds(p1, false) do
		t[v] = true
	end
	fetchNewerMessagesModule(p1):andThen(function(p3)
		-- upvalues: getFriendsChatRealtimeStoreModule (copy), playersService (copy), p1 (ref), expChatConversationListAdapterModule (copy), lastUpdated (ref), p2 (ref), t (ref)
		local response = p3 and p3.response
		local responseBody = response and response.responseBody
		local var1 = if responseBody then responseBody.messages or {} else {}
		local ingestedIds = p3 and p3.ingestedIds
		local var2 = getFriendsChatRealtimeStoreModule(false)
		local activeConversationId = var2.getActiveConversationId(false)
		local localPlayer = playersService.LocalPlayer
		local _, var3 = expChatConversationListAdapterModule.updateConversationPreviewFromMessages(p1, var1, {
			refreshListOnMissingConversation = true,
			hasUnreadMessages = activeConversationId ~= p1,
			localUserId = if localPlayer then localPlayer.UserId else 0,
			unreadFreshnessLastUpdated = lastUpdated
		})
		
		if var3 then
			var2.addLocalUnread(p1)
		end
		if activeConversationId == p1 then
			expChatConversationListAdapterModule.markConversationRead(p1, true)
			
			if p2 ~= nil then
				local var4 = false
				
				if ingestedIds ~= nil then
					for i, v in ingestedIds do
						if not t[v] then
							var4 = true
							break
						end
					end
				end
				if var4 then
					p2()
				end
			end
		end
	end):catch(function(p4)
		-- upvalues: name (copy), p1 (ref)
		name:warning(`Failed to fetch newer messages for {p1}: {tostring(p4)}`)
	end)
end

local function _(p4)
	local var5 = p4 == nil and ((if p4 == nil then p4.responseBody else nil) or p4)
	local conversations = var5 and var5.conversations
	
	return if conversations == nil then nil else conversations[1]
end

local function updateSelectedFriendPlaceholder(p4, p5)
	-- upvalues: conversationChannelsModule (ref), getFriendsChatNavigationStoreModule (ref)
	local var5 = p5 == nil and ((if p5 == nil then p5.responseBody else nil) or p5)
	local conversations = var5 and var5.conversations
	local var6 = if conversations ~= nil then nil else conversations[1]
	
	if var6 == nil or var6.source ~= conversationChannelsModule.Source.Channels or (var6.type ~= conversationChannelsModule.Type.OneToOne or var6.participant_user_ids == nil) then return end
	local var7 = getFriendsChatNavigationStoreModule(false)
	
	if var7.getSelectedConversationId(false) == conversationChannelsModule.getFriendConversationId(var6.participant_user_ids) then
		var7.setSelectedConversationId(var6.id or p4)
	end
end

local function fetchConversationDetailsSafe(p4, p5, p6)
	-- upvalues: expChatConversationListAdapterModule (ref), updateSelectedFriendPlaceholder (ref), name (ref)
	expChatConversationListAdapterModule.fetchConversationDetailsToSignals(p4):andThen(function(p7)
		-- upvalues: p5 (ref), p6 (ref), p4 (ref), updateSelectedFriendPlaceholder (copy)
		if p5 then
			local var5 = p7 == nil and ((if p7 == nil then p7.responseBody else nil) or p7)
			local conversations = var5 and var5.conversations
			
			if (if conversations ~= nil then nil else conversations[1]) == nil then
				p6(`new conversation {p4}`)
				
				return
			end
		end
		updateSelectedFriendPlaceholder(p4, p7)
	end):catch(function(p7)
		-- upvalues: name (copy), p4 (ref)
		name:warning(`Failed to fetch conversation details for {p4}: {tostring(p7)}`)
	end)
end

local _ = function(p7)
	-- upvalues: expChatConversationListAdapterModule (ref), getFriendsChatNavigationStoreModule (ref)
	expChatConversationListAdapterModule.removeConversation(p7)
	local var5 = getFriendsChatNavigationStoreModule(false)
	
	if var5.getSelectedConversationId(false) == p7 then
		var5.setSelectedConversationId(nil)
	end
end

return function(p7)
	-- upvalues: reactModule (ref), expChatConversationListAdapterModule (ref), name (ref), realtimeDeliveryModule (ref), classifyCommunicationChannelsEventModule (ref), fetchNewerMessagesSafe (ref), getFriendsChatNavigationStoreModule (ref), fetchConversationDetailsSafe (ref), fFlagFriendsChatRefreshListForNewConversationModule (ref), getFriendsChatRealtimeStoreModule (ref), fStringDebugFriendsChatConversationIdModule (ref), friendshipNotificationsModule (ref)
	local onActiveConversationMessageReceived = p7.onActiveConversationMessageReceived
	local var5 = reactModule.useRef(false)
	local var6 = reactModule.useRef(0)
	
	local function requestConversationListRefresh(p8)
		-- upvalues: var5 (ref), var6 (ref), expChatConversationListAdapterModule (copy), name (copy)
		var5.current = true
		var6.current += 1
		local current = var6.current
		
		local function attempt(p9)
			-- upvalues: var6 (copy), current (ref), expChatConversationListAdapterModule (copy), var5 (copy), name (copy), p8 (ref), attempt (ref)
			if var6.current ~= current then return end
			if expChatConversationListAdapterModule.getConversationStore().getListStatus(false).isFetchingConversations == true then
				if p9 <= 0 then
					var5.current = false
					name:warning(`Gave up refreshing conversation list after {p8}: fetch still in flight`)
					
					return
				end
				task.delay(1, function()
					-- upvalues: attempt (copy), p9 (ref)
					attempt(p9 - 1)
				end)
				
				return
			elseif var5.current then
				var5.current = false
				expChatConversationListAdapterModule.fetchConversationListPageToSignals():catch(function(p10)
					-- upvalues: name (copy), p8 (copy)
					name:warning(`Failed to refresh conversation list after {p8}: {tostring(p10)}`)
				end)
				
				return
			end
		end
		
		attempt(3)
	end
	
	realtimeDeliveryModule.useRealtimeNamespace("CommunicationChannels", function(p8)
		-- upvalues: classifyCommunicationChannelsEventModule (copy), fetchNewerMessagesSafe (copy), onActiveConversationMessageReceived (ref), expChatConversationListAdapterModule (copy), getFriendsChatNavigationStoreModule (copy), fetchConversationDetailsSafe (copy), fFlagFriendsChatRefreshListForNewConversationModule (copy), requestConversationListRefresh (ref)
		local var7 = classifyCommunicationChannelsEventModule(p8)
		local channelId = var7.channelId
		
		if channelId == nil then return end
		if var7.kind == "fetchMessage" then
			fetchNewerMessagesSafe(channelId, onActiveConversationMessageReceived)
			
			return
		elseif var7.kind == "removeConversation" then
			expChatConversationListAdapterModule.removeConversation(channelId)
			local var8 = getFriendsChatNavigationStoreModule(false)
			
			if var8.getSelectedConversationId(false) == channelId then
				var8.setSelectedConversationId(nil)
				
				return
			end
		elseif var7.kind == "fetchConversationDetails" then
			fetchConversationDetailsSafe(channelId, fFlagFriendsChatRefreshListForNewConversationModule and (if p8.Type ~= "AddedToChannel" then p8.Type == "ChannelCreated" else true), requestConversationListRefresh)
		end
	end, {})
	realtimeDeliveryModule.useRealtimeConnectionStateChanged("CommunicationChannels", function(p8, p9)
		-- upvalues: getFriendsChatRealtimeStoreModule (copy), fStringDebugFriendsChatConversationIdModule (copy), fetchNewerMessagesSafe (copy), onActiveConversationMessageReceived (ref)
		if p8 ~= Enum.ConnectionState.Connected or not p9 then return end
		local var7 = getFriendsChatRealtimeStoreModule(false).getActiveConversationId(false) or fStringDebugFriendsChatConversationIdModule
		
		if var7 ~= "" then
			fetchNewerMessagesSafe(var7, onActiveConversationMessageReceived)
		end
	end, {})
	realtimeDeliveryModule.useRealtimeNamespace(friendshipNotificationsModule.Namespace, function(p8)
		-- upvalues: friendshipNotificationsModule (copy), name (copy), var5 (ref), var6 (ref), expChatConversationListAdapterModule (copy)
		if p8 == nil or p8.Type ~= friendshipNotificationsModule.EventType.Created then
			return
		end
		name:info(`Received friendship notification: {p8.Type}`)
		var5.current = true
		var6.current += 1
		local current = var6.current
		local var7 = "friendship update"
		
		local function attempt(p9)
			-- upvalues: var6 (copy), current (ref), expChatConversationListAdapterModule (copy), var5 (copy), name (copy), var7 (ref), attempt (ref)
			if var6.current ~= current then return end
			if expChatConversationListAdapterModule.getConversationStore().getListStatus(false).isFetchingConversations == true then
				if p9 <= 0 then
					var5.current = false
					name:warning(`Gave up refreshing conversation list after {var7}: fetch still in flight`)
					
					return
				end
				task.delay(1, function()
					-- upvalues: attempt (copy), p9 (ref)
					attempt(p9 - 1)
				end)
				
				return
			elseif var5.current then
				var5.current = false
				expChatConversationListAdapterModule.fetchConversationListPageToSignals():catch(function(p10)
					-- upvalues: name (copy), var7 (copy)
					name:warning(`Failed to refresh conversation list after {var7}: {tostring(p10)}`)
				end)
				
				return
			end
		end
		
		attempt(3)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var6 (ref)
		return function()
			-- upvalues: var6 (copy)
			var6.current += 1
		end
	end, {})
	
	return nil
end