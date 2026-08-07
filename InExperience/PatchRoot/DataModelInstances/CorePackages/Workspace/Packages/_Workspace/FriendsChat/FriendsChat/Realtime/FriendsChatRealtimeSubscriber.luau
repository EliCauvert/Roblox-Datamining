local parent = script:FindFirstAncestor("FriendsChat").Parent
local playersService = game:GetService("Players")
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local expChatSharedModule = require(parent.ExpChatShared)
local conversationChannelsModule = require(parent.AppChat.ConversationChannels)
local fetchNewerMessagesModule = require(parent.AppChat.fetchNewerMessages)
local classifyCommunicationChannelsEventModule = require(script.Parent.classifyCommunicationChannelsEvent)
local expChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local getFriendsChatNavigationStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatNavigationStore)
local getFriendsChatRealtimeStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatRealtimeStore)
local fStringDebugFriendsChatConversationIdModule = require(script.Parent.Parent.Flags.FStringDebugFriendsChatConversationId)
local name = expChatSharedModule.Logger:new(script.Name)

local function fetchNewerMessagesSafe(p0) --[[ line: 59 ]]
	-- upvalues: expChatConversationListAdapterModule (ref), fetchNewerMessagesModule (ref), getFriendsChatRealtimeStoreModule (ref), playersService (ref), name (ref)
	local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(p0, false)
	local lastUpdated = conversation and conversation.lastUpdated
	fetchNewerMessagesModule(p0):andThen(function(p2) --[[ line: 65 ]]
		-- upvalues: getFriendsChatRealtimeStoreModule (copy), playersService (copy), p0 (ref), expChatConversationListAdapterModule (copy), lastUpdated (ref)
		local response = p2 and p2.response
		local responseBody = response and response.responseBody
		local var19 = if responseBody then responseBody.messages or {} else {}
		local var20 = getFriendsChatRealtimeStoreModule(false)
		local activeConversationId = var20.getActiveConversationId(false)
		local localPlayer = playersService.LocalPlayer
		local _, var22 = expChatConversationListAdapterModule.updateConversationPreviewFromMessages(p0, var19, {
			refreshListOnMissingConversation = true,
			hasUnreadMessages = activeConversationId ~= p0,
			localUserId = if localPlayer then localPlayer.UserId else 0,
			unreadFreshnessLastUpdated = lastUpdated
		})
		
		if var22 then
			var20.addLocalUnread(p0)
		end
		if activeConversationId == p0 then
			expChatConversationListAdapterModule.markConversationRead(p0, true)
		end
	end):catch(function(p1) --[[ line: 89 ]]
		-- upvalues: name (copy), p0 (ref)
		name:warning(`Failed to fetch newer messages for {p0}: {tostring(p1)}`)
	end)
end

local function _(p3) --[[ line: 96 | named "getFirstConversationResponse" ]]
	local var23 = p3 == nil and ((if p3 == nil then p3.responseBody else nil) or p3)
	local conversations = var23 and var23.conversations
	
	return if conversations == nil then nil else conversations[1]
end

local function updateSelectedFriendPlaceholder(p4, p5) --[[ line: 102 ]]
	-- upvalues: conversationChannelsModule (ref), getFriendsChatNavigationStoreModule (ref)
	local var25 = p5 == nil and ((if p5 == nil then p5.responseBody else nil) or p5)
	local conversations = var25 and var25.conversations
	local var27 = if conversations ~= nil then nil else conversations[1]
	
	if var27 == nil or var27.source ~= conversationChannelsModule.Source.Channels or (var27.type ~= conversationChannelsModule.Type.OneToOne or var27.participant_user_ids == nil) then return end
	local var28 = getFriendsChatNavigationStoreModule(false)
	
	if var28.getSelectedConversationId(false) == conversationChannelsModule.getFriendConversationId(var27.participant_user_ids) then
		var28.setSelectedConversationId(var27.id or p4)
	end
end

local function fetchConversationDetailsSafe(p6) --[[ line: 121 ]]
	-- upvalues: expChatConversationListAdapterModule (ref), updateSelectedFriendPlaceholder (ref), name (ref)
	expChatConversationListAdapterModule.fetchConversationDetailsToSignals(p6):andThen(function(p8) --[[ line: 123 ]]
		-- upvalues: updateSelectedFriendPlaceholder (copy), p6 (ref)
		updateSelectedFriendPlaceholder(p6, p8)
	end):catch(function(p7) --[[ line: 126 ]]
		-- upvalues: name (copy), p6 (ref)
		name:warning(`Failed to fetch conversation details for {p6}: {tostring(p7)}`)
	end)
end

local _ = function(p9) --[[ line: 132 | named "handleRemove" ]]
	-- upvalues: expChatConversationListAdapterModule (ref), getFriendsChatNavigationStoreModule (ref)
	expChatConversationListAdapterModule.removeConversation(p9)
	local var29 = getFriendsChatNavigationStoreModule(false)
	
	if var29.getSelectedConversationId(false) == p9 then
		var29.setSelectedConversationId(nil)
	end
end

return function() --[[ line: 143 | named "FriendsChatRealtimeSubscriber" ]]
	-- upvalues: reactModule (ref), expChatConversationListAdapterModule (ref), name (ref), realtimeDeliveryModule (ref), classifyCommunicationChannelsEventModule (ref), fetchNewerMessagesSafe (ref), getFriendsChatNavigationStoreModule (ref), fetchConversationDetailsSafe (ref), getFriendsChatRealtimeStoreModule (ref), fStringDebugFriendsChatConversationIdModule (ref)
	local var30 = reactModule.useRef(false)
	local var31 = reactModule.useRef(0)
	
	local function _() --[[ line: 151 | named "requestFriendshipListRefresh" ]]
		-- upvalues: var30 (ref), var31 (ref), expChatConversationListAdapterModule (copy), name (copy)
		var30.current = true
		var31.current += 1
		local current = var31.current
		
		local function attempt(p10) --[[ line: 156 ]]
			-- upvalues: var31 (copy), current (ref), expChatConversationListAdapterModule (copy), var30 (copy), name (copy), attempt (ref)
			if var31.current ~= current then return end
			if expChatConversationListAdapterModule.getConversationStore().getListStatus(false).isFetchingConversations == true then
				if p10 <= 0 then
					var30.current = false
					name:warning("Gave up refreshing conversation list after friendship update: fetch still in flight")
					
					return
				end
				task.delay(1, function() --[[ line: 170 ]]
					-- upvalues: attempt (copy), p10 (ref)
					attempt(p10 - 1)
				end)
				
				return
			elseif var30.current then
				var30.current = false
				expChatConversationListAdapterModule.fetchConversationListPageToSignals():catch(function(p11) --[[ line: 181 ]]
					-- upvalues: name (copy)
					name:warning(`Failed to refresh conversation list after friendship update: {tostring(p11)}`)
				end)
				
				return
			end
		end
		
		attempt(3)
	end
	
	realtimeDeliveryModule.useRealtimeNamespace("CommunicationChannels", function(p12) --[[ line: 189 ]]
		-- upvalues: classifyCommunicationChannelsEventModule (copy), fetchNewerMessagesSafe (copy), expChatConversationListAdapterModule (copy), getFriendsChatNavigationStoreModule (copy), fetchConversationDetailsSafe (copy)
		local var33 = classifyCommunicationChannelsEventModule(p12)
		local channelId = var33.channelId
		
		if channelId == nil then return end
		if var33.kind == "fetchMessage" then
			fetchNewerMessagesSafe(channelId)
			
			return
		elseif var33.kind == "removeConversation" then
			expChatConversationListAdapterModule.removeConversation(channelId)
			local var34 = getFriendsChatNavigationStoreModule(false)
			
			if var34.getSelectedConversationId(false) == channelId then
				var34.setSelectedConversationId(nil)
				
				return
			end
		elseif var33.kind == "fetchConversationDetails" then
			fetchConversationDetailsSafe(channelId)
		end
	end, {})
	realtimeDeliveryModule.useRealtimeConnectionStateChanged("CommunicationChannels", function(p13, p14) --[[ line: 207 ]]
		-- upvalues: getFriendsChatRealtimeStoreModule (copy), fStringDebugFriendsChatConversationIdModule (copy), fetchNewerMessagesSafe (copy)
		if p13 ~= Enum.ConnectionState.Connected or not p14 then return end
		local var35 = getFriendsChatRealtimeStoreModule(false).getActiveConversationId(false) or fStringDebugFriendsChatConversationIdModule
		
		if var35 ~= "" then
			fetchNewerMessagesSafe(var35)
		end
	end, {})
	realtimeDeliveryModule.useRealtimeNamespace("FriendshipNotifications", function(p15) --[[ line: 221 ]]
		-- upvalues: name (copy), var30 (ref), var31 (ref), expChatConversationListAdapterModule (copy)
		if p15 == nil or p15.Type ~= "FriendshipCreated" then
			return
		end
		name:info(`Received friendship notification: {p15.Type}`)
		var30.current = true
		var31.current += 1
		local current = var31.current
		
		local function attempt(p16) --[[ line: 156 ]]
			-- upvalues: var31 (copy), current (ref), expChatConversationListAdapterModule (copy), var30 (copy), name (copy), attempt (ref)
			if var31.current ~= current then return end
			if expChatConversationListAdapterModule.getConversationStore().getListStatus(false).isFetchingConversations == true then
				if p16 <= 0 then
					var30.current = false
					name:warning("Gave up refreshing conversation list after friendship update: fetch still in flight")
					
					return
				end
				task.delay(1, function() --[[ line: 170 ]]
					-- upvalues: attempt (copy), p16 (ref)
					attempt(p16 - 1)
				end)
				
				return
			elseif var30.current then
				var30.current = false
				expChatConversationListAdapterModule.fetchConversationListPageToSignals():catch(function(p17) --[[ line: 181 ]]
					-- upvalues: name (copy)
					name:warning(`Failed to refresh conversation list after friendship update: {tostring(p17)}`)
				end)
				
				return
			end
		end
		
		attempt(3)
	end, {})
	reactModule.useEffect(function() --[[ line: 229 ]]
		-- upvalues: var31 (ref)
		return function() --[[ line: 230 ]]
			-- upvalues: var31 (copy)
			var31.current += 1
		end
	end, {})
	
	return nil
end