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

local function fetchNewerMessagesSafe(p0, p1) --[[ line: 66 ]]
	-- upvalues: expChatConversationListAdapterModule (ref), getConversationMessageListStoreModule (ref), fetchNewerMessagesModule (ref), getFriendsChatRealtimeStoreModule (ref), playersService (ref), name (ref)
	local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(p0, false)
	local lastUpdated = conversation and conversation.lastUpdated
	local t = {}
	
	for i, v in getConversationMessageListStoreModule(false).getOrderedIds(p0, false) do
		t[v] = true
	end
	fetchNewerMessagesModule(p0):andThen(function(p3) --[[ line: 80 ]]
		-- upvalues: getFriendsChatRealtimeStoreModule (copy), playersService (copy), p0 (ref), expChatConversationListAdapterModule (copy), lastUpdated (ref), p1 (ref), t (ref)
		local response = p3 and p3.response
		local responseBody = response and response.responseBody
		local var22 = if responseBody then responseBody.messages or {} else {}
		local ingestedIds = p3 and p3.ingestedIds
		local var24 = getFriendsChatRealtimeStoreModule(false)
		local activeConversationId = var24.getActiveConversationId(false)
		local localPlayer = playersService.LocalPlayer
		local _, var26 = expChatConversationListAdapterModule.updateConversationPreviewFromMessages(p0, var22, {
			refreshListOnMissingConversation = true,
			hasUnreadMessages = activeConversationId ~= p0,
			localUserId = if localPlayer then localPlayer.UserId else 0,
			unreadFreshnessLastUpdated = lastUpdated
		})
		
		if var26 then
			var24.addLocalUnread(p0)
		end
		if activeConversationId == p0 then
			expChatConversationListAdapterModule.markConversationRead(p0, true)
			
			if p1 ~= nil then
				local var27 = false
				
				if ingestedIds ~= nil then
					for i, v in ingestedIds do
						if not t[v] then
							var27 = true
							break
						end
					end
				end
				if var27 then
					p1()
				end
			end
		end
	end):catch(function(p2) --[[ line: 119 ]]
		-- upvalues: name (copy), p0 (ref)
		name:warning(`Failed to fetch newer messages for {p0}: {tostring(p2)}`)
	end)
end

local function _(p4) --[[ line: 126 | named "getFirstConversationResponse" ]]
	local var28 = p4 == nil and ((if p4 == nil then p4.responseBody else nil) or p4)
	local conversations = var28 and var28.conversations
	
	return if conversations == nil then nil else conversations[1]
end

local function updateSelectedFriendPlaceholder(p5, p6) --[[ line: 132 ]]
	-- upvalues: conversationChannelsModule (ref), getFriendsChatNavigationStoreModule (ref)
	local var30 = p6 == nil and ((if p6 == nil then p6.responseBody else nil) or p6)
	local conversations = var30 and var30.conversations
	local var32 = if conversations ~= nil then nil else conversations[1]
	
	if var32 == nil or var32.source ~= conversationChannelsModule.Source.Channels or (var32.type ~= conversationChannelsModule.Type.OneToOne or var32.participant_user_ids == nil) then return end
	local var33 = getFriendsChatNavigationStoreModule(false)
	
	if var33.getSelectedConversationId(false) == conversationChannelsModule.getFriendConversationId(var32.participant_user_ids) then
		var33.setSelectedConversationId(var32.id or p5)
	end
end

local function fetchConversationDetailsSafe(p7, p8, p9) --[[ line: 151 ]]
	-- upvalues: expChatConversationListAdapterModule (ref), updateSelectedFriendPlaceholder (ref), name (ref)
	expChatConversationListAdapterModule.fetchConversationDetailsToSignals(p7):andThen(function(p11) --[[ line: 157 ]]
		-- upvalues: p8 (ref), p9 (ref), p7 (ref), updateSelectedFriendPlaceholder (copy)
		if p8 then
			local var34 = p11 == nil and ((if p11 == nil then p11.responseBody else nil) or p11)
			local conversations = var34 and var34.conversations
			
			if (if conversations ~= nil then nil else conversations[1]) == nil then
				p9(`new conversation {p7}`)
				
				return
			end
		end
		updateSelectedFriendPlaceholder(p7, p11)
	end):catch(function(p10) --[[ line: 167 ]]
		-- upvalues: name (copy), p7 (ref)
		name:warning(`Failed to fetch conversation details for {p7}: {tostring(p10)}`)
	end)
end

local _ = function(p12) --[[ line: 173 | named "handleRemove" ]]
	-- upvalues: expChatConversationListAdapterModule (ref), getFriendsChatNavigationStoreModule (ref)
	expChatConversationListAdapterModule.removeConversation(p12)
	local var36 = getFriendsChatNavigationStoreModule(false)
	
	if var36.getSelectedConversationId(false) == p12 then
		var36.setSelectedConversationId(nil)
	end
end

return function(p13) --[[ line: 184 | named "FriendsChatRealtimeSubscriber" ]]
	-- upvalues: reactModule (ref), expChatConversationListAdapterModule (ref), name (ref), realtimeDeliveryModule (ref), classifyCommunicationChannelsEventModule (ref), fetchNewerMessagesSafe (ref), getFriendsChatNavigationStoreModule (ref), fetchConversationDetailsSafe (ref), fFlagFriendsChatRefreshListForNewConversationModule (ref), getFriendsChatRealtimeStoreModule (ref), fStringDebugFriendsChatConversationIdModule (ref)
	local onActiveConversationMessageReceived = p13.onActiveConversationMessageReceived
	local var37 = reactModule.useRef(false)
	local var38 = reactModule.useRef(0)
	
	local function requestConversationListRefresh(p14) --[[ line: 194 ]]
		-- upvalues: var37 (ref), var38 (ref), expChatConversationListAdapterModule (copy), name (copy)
		var37.current = true
		var38.current += 1
		local current = var38.current
		
		local function attempt(p15) --[[ line: 199 ]]
			-- upvalues: var38 (copy), current (ref), expChatConversationListAdapterModule (copy), var37 (copy), name (copy), p14 (ref), attempt (ref)
			if var38.current ~= current then return end
			if expChatConversationListAdapterModule.getConversationStore().getListStatus(false).isFetchingConversations == true then
				if p15 <= 0 then
					var37.current = false
					name:warning(`Gave up refreshing conversation list after {p14}: fetch still in flight`)
					
					return
				end
				task.delay(1, function() --[[ line: 211 ]]
					-- upvalues: attempt (copy), p15 (ref)
					attempt(p15 - 1)
				end)
				
				return
			elseif var37.current then
				var37.current = false
				expChatConversationListAdapterModule.fetchConversationListPageToSignals():catch(function(p16) --[[ line: 222 ]]
					-- upvalues: name (copy), p14 (copy)
					name:warning(`Failed to refresh conversation list after {p14}: {tostring(p16)}`)
				end)
				
				return
			end
		end
		
		attempt(3)
	end
	
	realtimeDeliveryModule.useRealtimeNamespace("CommunicationChannels", function(p17) --[[ line: 230 ]]
		-- upvalues: classifyCommunicationChannelsEventModule (copy), fetchNewerMessagesSafe (copy), onActiveConversationMessageReceived (ref), expChatConversationListAdapterModule (copy), getFriendsChatNavigationStoreModule (copy), fetchConversationDetailsSafe (copy), fFlagFriendsChatRefreshListForNewConversationModule (copy), requestConversationListRefresh (ref)
		local var41 = classifyCommunicationChannelsEventModule(p17)
		local channelId = var41.channelId
		
		if channelId == nil then return end
		if var41.kind == "fetchMessage" then
			fetchNewerMessagesSafe(channelId, onActiveConversationMessageReceived)
			
			return
		elseif var41.kind == "removeConversation" then
			expChatConversationListAdapterModule.removeConversation(channelId)
			local var42 = getFriendsChatNavigationStoreModule(false)
			
			if var42.getSelectedConversationId(false) == channelId then
				var42.setSelectedConversationId(nil)
				
				return
			end
		elseif var41.kind == "fetchConversationDetails" then
			fetchConversationDetailsSafe(channelId, fFlagFriendsChatRefreshListForNewConversationModule and (if p17.Type ~= "AddedToChannel" then p17.Type == "ChannelCreated" else true), requestConversationListRefresh)
		end
	end, {})
	realtimeDeliveryModule.useRealtimeConnectionStateChanged("CommunicationChannels", function(p18, p19) --[[ line: 254 ]]
		-- upvalues: getFriendsChatRealtimeStoreModule (copy), fStringDebugFriendsChatConversationIdModule (copy), fetchNewerMessagesSafe (copy), onActiveConversationMessageReceived (ref)
		if p18 ~= Enum.ConnectionState.Connected or not p19 then return end
		local var43 = getFriendsChatRealtimeStoreModule(false).getActiveConversationId(false) or fStringDebugFriendsChatConversationIdModule
		
		if var43 ~= "" then
			fetchNewerMessagesSafe(var43, onActiveConversationMessageReceived)
		end
	end, {})
	realtimeDeliveryModule.useRealtimeNamespace("FriendshipNotifications", function(p20) --[[ line: 268 ]]
		-- upvalues: name (copy), var37 (ref), var38 (ref), expChatConversationListAdapterModule (copy)
		if p20 == nil or p20.Type ~= "FriendshipCreated" then
			return
		end
		name:info(`Received friendship notification: {p20.Type}`)
		var37.current = true
		var38.current += 1
		local current = var38.current
		local var44 = "friendship update"
		
		local function attempt(p21) --[[ line: 199 ]]
			-- upvalues: var38 (copy), current (ref), expChatConversationListAdapterModule (copy), var37 (copy), name (copy), var44 (ref), attempt (ref)
			if var38.current ~= current then return end
			if expChatConversationListAdapterModule.getConversationStore().getListStatus(false).isFetchingConversations == true then
				if p21 <= 0 then
					var37.current = false
					name:warning(`Gave up refreshing conversation list after {var44}: fetch still in flight`)
					
					return
				end
				task.delay(1, function() --[[ line: 211 ]]
					-- upvalues: attempt (copy), p21 (ref)
					attempt(p21 - 1)
				end)
				
				return
			elseif var37.current then
				var37.current = false
				expChatConversationListAdapterModule.fetchConversationListPageToSignals():catch(function(p22) --[[ line: 222 ]]
					-- upvalues: name (copy), var44 (copy)
					name:warning(`Failed to refresh conversation list after {var44}: {tostring(p22)}`)
				end)
				
				return
			end
		end
		
		attempt(3)
	end, {})
	reactModule.useEffect(function() --[[ line: 276 ]]
		-- upvalues: var38 (ref)
		return function() --[[ line: 277 ]]
			-- upvalues: var38 (copy)
			var38.current += 1
		end
	end, {})
	
	return nil
end