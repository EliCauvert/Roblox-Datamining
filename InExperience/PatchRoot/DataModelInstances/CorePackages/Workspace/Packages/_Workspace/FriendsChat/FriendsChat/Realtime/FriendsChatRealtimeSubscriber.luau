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
local fStringDebugFriendsChatConversationIdModule = require(script.Parent.Parent.Flags.FStringDebugFriendsChatConversationId)
local name = expChatSharedModule.Logger:new(script.Name)

local function fetchNewerMessagesSafe(p0, p1) --[[ line: 64 ]]
	-- upvalues: expChatConversationListAdapterModule (ref), getConversationMessageListStoreModule (ref), fetchNewerMessagesModule (ref), getFriendsChatRealtimeStoreModule (ref), playersService (ref), name (ref)
	local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(p0, false)
	local lastUpdated = conversation and conversation.lastUpdated
	local t = {}
	
	for i, v in getConversationMessageListStoreModule(false).getOrderedIds(p0, false) do
		t[v] = true
	end
	fetchNewerMessagesModule(p0):andThen(function(p3) --[[ line: 78 ]]
		-- upvalues: getFriendsChatRealtimeStoreModule (copy), playersService (copy), p0 (ref), expChatConversationListAdapterModule (copy), lastUpdated (ref), p1 (ref), t (ref)
		local response = p3 and p3.response
		local responseBody = response and response.responseBody
		local var21 = if responseBody then responseBody.messages or {} else {}
		local ingestedIds = p3 and p3.ingestedIds
		local var23 = getFriendsChatRealtimeStoreModule(false)
		local activeConversationId = var23.getActiveConversationId(false)
		local localPlayer = playersService.LocalPlayer
		local _, var25 = expChatConversationListAdapterModule.updateConversationPreviewFromMessages(p0, var21, {
			refreshListOnMissingConversation = true,
			hasUnreadMessages = activeConversationId ~= p0,
			localUserId = if localPlayer then localPlayer.UserId else 0,
			unreadFreshnessLastUpdated = lastUpdated
		})
		
		if var25 then
			var23.addLocalUnread(p0)
		end
		if activeConversationId == p0 then
			expChatConversationListAdapterModule.markConversationRead(p0, true)
			
			if p1 ~= nil then
				local var26 = false
				
				if ingestedIds ~= nil then
					for i, v in ingestedIds do
						if not t[v] then
							var26 = true
							break
						end
					end
				end
				if var26 then
					p1()
				end
			end
		end
	end):catch(function(p2) --[[ line: 117 ]]
		-- upvalues: name (copy), p0 (ref)
		name:warning(`Failed to fetch newer messages for {p0}: {tostring(p2)}`)
	end)
end

local function _(p4) --[[ line: 124 | named "getFirstConversationResponse" ]]
	local var27 = p4 == nil and ((if p4 == nil then p4.responseBody else nil) or p4)
	local conversations = var27 and var27.conversations
	
	return if conversations == nil then nil else conversations[1]
end

local function updateSelectedFriendPlaceholder(p5, p6) --[[ line: 130 ]]
	-- upvalues: conversationChannelsModule (ref), getFriendsChatNavigationStoreModule (ref)
	local var29 = p6 == nil and ((if p6 == nil then p6.responseBody else nil) or p6)
	local conversations = var29 and var29.conversations
	local var31 = if conversations ~= nil then nil else conversations[1]
	
	if var31 == nil or var31.source ~= conversationChannelsModule.Source.Channels or (var31.type ~= conversationChannelsModule.Type.OneToOne or var31.participant_user_ids == nil) then return end
	local var32 = getFriendsChatNavigationStoreModule(false)
	
	if var32.getSelectedConversationId(false) == conversationChannelsModule.getFriendConversationId(var31.participant_user_ids) then
		var32.setSelectedConversationId(var31.id or p5)
	end
end

local function fetchConversationDetailsSafe(p7) --[[ line: 149 ]]
	-- upvalues: expChatConversationListAdapterModule (ref), updateSelectedFriendPlaceholder (ref), name (ref)
	expChatConversationListAdapterModule.fetchConversationDetailsToSignals(p7):andThen(function(p9) --[[ line: 151 ]]
		-- upvalues: updateSelectedFriendPlaceholder (copy), p7 (ref)
		updateSelectedFriendPlaceholder(p7, p9)
	end):catch(function(p8) --[[ line: 154 ]]
		-- upvalues: name (copy), p7 (ref)
		name:warning(`Failed to fetch conversation details for {p7}: {tostring(p8)}`)
	end)
end

local _ = function(p10) --[[ line: 160 | named "handleRemove" ]]
	-- upvalues: expChatConversationListAdapterModule (ref), getFriendsChatNavigationStoreModule (ref)
	expChatConversationListAdapterModule.removeConversation(p10)
	local var33 = getFriendsChatNavigationStoreModule(false)
	
	if var33.getSelectedConversationId(false) == p10 then
		var33.setSelectedConversationId(nil)
	end
end

return function(p11) --[[ line: 171 | named "FriendsChatRealtimeSubscriber" ]]
	-- upvalues: reactModule (ref), expChatConversationListAdapterModule (ref), name (ref), realtimeDeliveryModule (ref), classifyCommunicationChannelsEventModule (ref), fetchNewerMessagesSafe (ref), getFriendsChatNavigationStoreModule (ref), fetchConversationDetailsSafe (ref), getFriendsChatRealtimeStoreModule (ref), fStringDebugFriendsChatConversationIdModule (ref)
	local onActiveConversationMessageReceived = p11.onActiveConversationMessageReceived
	local var34 = reactModule.useRef(false)
	local var35 = reactModule.useRef(0)
	
	local function _() --[[ line: 181 | named "requestFriendshipListRefresh" ]]
		-- upvalues: var34 (ref), var35 (ref), expChatConversationListAdapterModule (copy), name (copy)
		var34.current = true
		var35.current += 1
		local current = var35.current
		
		local function attempt(p12) --[[ line: 186 ]]
			-- upvalues: var35 (copy), current (ref), expChatConversationListAdapterModule (copy), var34 (copy), name (copy), attempt (ref)
			if var35.current ~= current then return end
			if expChatConversationListAdapterModule.getConversationStore().getListStatus(false).isFetchingConversations == true then
				if p12 <= 0 then
					var34.current = false
					name:warning("Gave up refreshing conversation list after friendship update: fetch still in flight")
					
					return
				end
				task.delay(1, function() --[[ line: 200 ]]
					-- upvalues: attempt (copy), p12 (ref)
					attempt(p12 - 1)
				end)
				
				return
			elseif var34.current then
				var34.current = false
				expChatConversationListAdapterModule.fetchConversationListPageToSignals():catch(function(p13) --[[ line: 211 ]]
					-- upvalues: name (copy)
					name:warning(`Failed to refresh conversation list after friendship update: {tostring(p13)}`)
				end)
				
				return
			end
		end
		
		attempt(3)
	end
	
	realtimeDeliveryModule.useRealtimeNamespace("CommunicationChannels", function(p14) --[[ line: 219 ]]
		-- upvalues: classifyCommunicationChannelsEventModule (copy), fetchNewerMessagesSafe (copy), onActiveConversationMessageReceived (ref), expChatConversationListAdapterModule (copy), getFriendsChatNavigationStoreModule (copy), fetchConversationDetailsSafe (copy)
		local var37 = classifyCommunicationChannelsEventModule(p14)
		local channelId = var37.channelId
		
		if channelId == nil then return end
		if var37.kind == "fetchMessage" then
			fetchNewerMessagesSafe(channelId, onActiveConversationMessageReceived)
			
			return
		elseif var37.kind == "removeConversation" then
			expChatConversationListAdapterModule.removeConversation(channelId)
			local var38 = getFriendsChatNavigationStoreModule(false)
			
			if var38.getSelectedConversationId(false) == channelId then
				var38.setSelectedConversationId(nil)
				
				return
			end
		elseif var37.kind == "fetchConversationDetails" then
			fetchConversationDetailsSafe(channelId)
		end
	end, {})
	realtimeDeliveryModule.useRealtimeConnectionStateChanged("CommunicationChannels", function(p15, p16) --[[ line: 237 ]]
		-- upvalues: getFriendsChatRealtimeStoreModule (copy), fStringDebugFriendsChatConversationIdModule (copy), fetchNewerMessagesSafe (copy), onActiveConversationMessageReceived (ref)
		if p15 ~= Enum.ConnectionState.Connected or not p16 then return end
		local var39 = getFriendsChatRealtimeStoreModule(false).getActiveConversationId(false) or fStringDebugFriendsChatConversationIdModule
		
		if var39 ~= "" then
			fetchNewerMessagesSafe(var39, onActiveConversationMessageReceived)
		end
	end, {})
	realtimeDeliveryModule.useRealtimeNamespace("FriendshipNotifications", function(p17) --[[ line: 251 ]]
		-- upvalues: name (copy), var34 (ref), var35 (ref), expChatConversationListAdapterModule (copy)
		if p17 == nil or p17.Type ~= "FriendshipCreated" then
			return
		end
		name:info(`Received friendship notification: {p17.Type}`)
		var34.current = true
		var35.current += 1
		local current = var35.current
		
		local function attempt(p18) --[[ line: 186 ]]
			-- upvalues: var35 (copy), current (ref), expChatConversationListAdapterModule (copy), var34 (copy), name (copy), attempt (ref)
			if var35.current ~= current then return end
			if expChatConversationListAdapterModule.getConversationStore().getListStatus(false).isFetchingConversations == true then
				if p18 <= 0 then
					var34.current = false
					name:warning("Gave up refreshing conversation list after friendship update: fetch still in flight")
					
					return
				end
				task.delay(1, function() --[[ line: 200 ]]
					-- upvalues: attempt (copy), p18 (ref)
					attempt(p18 - 1)
				end)
				
				return
			elseif var34.current then
				var34.current = false
				expChatConversationListAdapterModule.fetchConversationListPageToSignals():catch(function(p19) --[[ line: 211 ]]
					-- upvalues: name (copy)
					name:warning(`Failed to refresh conversation list after friendship update: {tostring(p19)}`)
				end)
				
				return
			end
		end
		
		attempt(3)
	end, {})
	reactModule.useEffect(function() --[[ line: 259 ]]
		-- upvalues: var35 (ref)
		return function() --[[ line: 260 ]]
			-- upvalues: var35 (copy)
			var35.current += 1
		end
	end, {})
	
	return nil
end