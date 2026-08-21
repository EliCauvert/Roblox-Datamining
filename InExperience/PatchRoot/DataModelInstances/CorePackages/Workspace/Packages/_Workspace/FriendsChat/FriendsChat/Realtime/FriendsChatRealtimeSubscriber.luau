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
local handleAiAgentDumpGameContextModule = require(script.Parent.Parent.AiAgent.handleAiAgentDumpGameContext)
local name = expChatSharedModule.Logger:new(script.Name)

local function fetchNewerMessagesSafe(p0, p1) --[[ line: 67 ]]
	-- upvalues: expChatConversationListAdapterModule (ref), getConversationMessageListStoreModule (ref), fetchNewerMessagesModule (ref), handleAiAgentDumpGameContextModule (ref), getFriendsChatRealtimeStoreModule (ref), playersService (ref), name (ref)
	local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(p0, false)
	local lastUpdated = conversation and conversation.lastUpdated
	local t = {}
	
	for i, v in getConversationMessageListStoreModule(false).getOrderedIds(p0, false) do
		t[v] = true
	end
	fetchNewerMessagesModule(p0):andThen(function(p3) --[[ line: 81 ]]
		-- upvalues: handleAiAgentDumpGameContextModule (copy), p0 (ref), t (ref), getFriendsChatRealtimeStoreModule (copy), playersService (copy), expChatConversationListAdapterModule (copy), lastUpdated (ref), p1 (ref)
		local response = p3 and p3.response
		local responseBody = response and response.responseBody
		local var23 = if responseBody then responseBody.messages or {} else {}
		local ingestedIds = p3 and p3.ingestedIds
		handleAiAgentDumpGameContextModule(p0, var23, t)
		local var25 = getFriendsChatRealtimeStoreModule(false)
		local activeConversationId = var25.getActiveConversationId(false)
		local localPlayer = playersService.LocalPlayer
		local _, var27 = expChatConversationListAdapterModule.updateConversationPreviewFromMessages(p0, var23, {
			refreshListOnMissingConversation = true,
			hasUnreadMessages = activeConversationId ~= p0,
			localUserId = if localPlayer then localPlayer.UserId else 0,
			unreadFreshnessLastUpdated = lastUpdated
		})
		
		if var27 then
			var25.addLocalUnread(p0)
		end
		if activeConversationId == p0 then
			expChatConversationListAdapterModule.markConversationRead(p0, true)
			
			if p1 ~= nil then
				local var28 = false
				
				if ingestedIds ~= nil then
					for i, v in ingestedIds do
						if not t[v] then
							var28 = true
							break
						end
					end
				end
				if var28 then
					p1()
				end
			end
		end
	end):catch(function(p2) --[[ line: 121 ]]
		-- upvalues: name (copy), p0 (ref)
		name:warning(`Failed to fetch newer messages for {p0}: {tostring(p2)}`)
	end)
end

local function _(p4) --[[ line: 128 | named "getFirstConversationResponse" ]]
	local var29 = p4 == nil and ((if p4 == nil then p4.responseBody else nil) or p4)
	local conversations = var29 and var29.conversations
	
	return if conversations == nil then nil else conversations[1]
end

local function updateSelectedFriendPlaceholder(p5, p6) --[[ line: 134 ]]
	-- upvalues: conversationChannelsModule (ref), getFriendsChatNavigationStoreModule (ref)
	local var31 = p6 == nil and ((if p6 == nil then p6.responseBody else nil) or p6)
	local conversations = var31 and var31.conversations
	local var33 = if conversations ~= nil then nil else conversations[1]
	
	if var33 == nil or var33.source ~= conversationChannelsModule.Source.Channels or (var33.type ~= conversationChannelsModule.Type.OneToOne or var33.participant_user_ids == nil) then return end
	local var34 = getFriendsChatNavigationStoreModule(false)
	
	if var34.getSelectedConversationId(false) == conversationChannelsModule.getFriendConversationId(var33.participant_user_ids) then
		var34.setSelectedConversationId(var33.id or p5)
	end
end

local function fetchConversationDetailsSafe(p7, p8, p9) --[[ line: 153 ]]
	-- upvalues: expChatConversationListAdapterModule (ref), updateSelectedFriendPlaceholder (ref), name (ref)
	expChatConversationListAdapterModule.fetchConversationDetailsToSignals(p7):andThen(function(p11) --[[ line: 159 ]]
		-- upvalues: p8 (ref), p9 (ref), p7 (ref), updateSelectedFriendPlaceholder (copy)
		if p8 then
			local var35 = p11 == nil and ((if p11 == nil then p11.responseBody else nil) or p11)
			local conversations = var35 and var35.conversations
			
			if (if conversations ~= nil then nil else conversations[1]) == nil then
				p9(`new conversation {p7}`)
				
				return
			end
		end
		updateSelectedFriendPlaceholder(p7, p11)
	end):catch(function(p10) --[[ line: 169 ]]
		-- upvalues: name (copy), p7 (ref)
		name:warning(`Failed to fetch conversation details for {p7}: {tostring(p10)}`)
	end)
end

local _ = function(p12) --[[ line: 175 | named "handleRemove" ]]
	-- upvalues: expChatConversationListAdapterModule (ref), getFriendsChatNavigationStoreModule (ref)
	expChatConversationListAdapterModule.removeConversation(p12)
	local var37 = getFriendsChatNavigationStoreModule(false)
	
	if var37.getSelectedConversationId(false) == p12 then
		var37.setSelectedConversationId(nil)
	end
end

return function(p13) --[[ line: 186 | named "FriendsChatRealtimeSubscriber" ]]
	-- upvalues: reactModule (ref), expChatConversationListAdapterModule (ref), name (ref), realtimeDeliveryModule (ref), classifyCommunicationChannelsEventModule (ref), fetchNewerMessagesSafe (ref), getFriendsChatNavigationStoreModule (ref), fetchConversationDetailsSafe (ref), fFlagFriendsChatRefreshListForNewConversationModule (ref), getFriendsChatRealtimeStoreModule (ref), fStringDebugFriendsChatConversationIdModule (ref)
	local onActiveConversationMessageReceived = p13.onActiveConversationMessageReceived
	local var38 = reactModule.useRef(false)
	local var39 = reactModule.useRef(0)
	
	local function requestConversationListRefresh(p14) --[[ line: 196 ]]
		-- upvalues: var38 (ref), var39 (ref), expChatConversationListAdapterModule (copy), name (copy)
		var38.current = true
		var39.current += 1
		local current = var39.current
		
		local function attempt(p15) --[[ line: 201 ]]
			-- upvalues: var39 (copy), current (ref), expChatConversationListAdapterModule (copy), var38 (copy), name (copy), p14 (ref), attempt (ref)
			if var39.current ~= current then return end
			if expChatConversationListAdapterModule.getConversationStore().getListStatus(false).isFetchingConversations == true then
				if p15 <= 0 then
					var38.current = false
					name:warning(`Gave up refreshing conversation list after {p14}: fetch still in flight`)
					
					return
				end
				task.delay(1, function() --[[ line: 213 ]]
					-- upvalues: attempt (copy), p15 (ref)
					attempt(p15 - 1)
				end)
				
				return
			elseif var38.current then
				var38.current = false
				expChatConversationListAdapterModule.fetchConversationListPageToSignals():catch(function(p16) --[[ line: 224 ]]
					-- upvalues: name (copy), p14 (copy)
					name:warning(`Failed to refresh conversation list after {p14}: {tostring(p16)}`)
				end)
				
				return
			end
		end
		
		attempt(3)
	end
	
	realtimeDeliveryModule.useRealtimeNamespace("CommunicationChannels", function(p17) --[[ line: 232 ]]
		-- upvalues: classifyCommunicationChannelsEventModule (copy), fetchNewerMessagesSafe (copy), onActiveConversationMessageReceived (ref), expChatConversationListAdapterModule (copy), getFriendsChatNavigationStoreModule (copy), fetchConversationDetailsSafe (copy), fFlagFriendsChatRefreshListForNewConversationModule (copy), requestConversationListRefresh (ref)
		local var42 = classifyCommunicationChannelsEventModule(p17)
		local channelId = var42.channelId
		
		if channelId == nil then return end
		if var42.kind == "fetchMessage" then
			fetchNewerMessagesSafe(channelId, onActiveConversationMessageReceived)
			
			return
		elseif var42.kind == "removeConversation" then
			expChatConversationListAdapterModule.removeConversation(channelId)
			local var43 = getFriendsChatNavigationStoreModule(false)
			
			if var43.getSelectedConversationId(false) == channelId then
				var43.setSelectedConversationId(nil)
				
				return
			end
		elseif var42.kind == "fetchConversationDetails" then
			fetchConversationDetailsSafe(channelId, fFlagFriendsChatRefreshListForNewConversationModule and (if p17.Type ~= "AddedToChannel" then p17.Type == "ChannelCreated" else true), requestConversationListRefresh)
		end
	end, {})
	realtimeDeliveryModule.useRealtimeConnectionStateChanged("CommunicationChannels", function(p18, p19) --[[ line: 255 ]]
		-- upvalues: getFriendsChatRealtimeStoreModule (copy), fStringDebugFriendsChatConversationIdModule (copy), fetchNewerMessagesSafe (copy), onActiveConversationMessageReceived (ref)
		if p18 ~= Enum.ConnectionState.Connected or not p19 then return end
		local var44 = getFriendsChatRealtimeStoreModule(false).getActiveConversationId(false) or fStringDebugFriendsChatConversationIdModule
		
		if var44 ~= "" then
			fetchNewerMessagesSafe(var44, onActiveConversationMessageReceived)
		end
	end, {})
	realtimeDeliveryModule.useRealtimeNamespace("FriendshipNotifications", function(p20) --[[ line: 269 ]]
		-- upvalues: name (copy), var38 (ref), var39 (ref), expChatConversationListAdapterModule (copy)
		if p20 == nil or p20.Type ~= "FriendshipCreated" then
			return
		end
		name:info(`Received friendship notification: {p20.Type}`)
		var38.current = true
		var39.current += 1
		local current = var39.current
		local var45 = "friendship update"
		
		local function attempt(p21) --[[ line: 201 ]]
			-- upvalues: var39 (copy), current (ref), expChatConversationListAdapterModule (copy), var38 (copy), name (copy), var45 (ref), attempt (ref)
			if var39.current ~= current then return end
			if expChatConversationListAdapterModule.getConversationStore().getListStatus(false).isFetchingConversations == true then
				if p21 <= 0 then
					var38.current = false
					name:warning(`Gave up refreshing conversation list after {var45}: fetch still in flight`)
					
					return
				end
				task.delay(1, function() --[[ line: 213 ]]
					-- upvalues: attempt (copy), p21 (ref)
					attempt(p21 - 1)
				end)
				
				return
			elseif var38.current then
				var38.current = false
				expChatConversationListAdapterModule.fetchConversationListPageToSignals():catch(function(p22) --[[ line: 224 ]]
					-- upvalues: name (copy), var45 (copy)
					name:warning(`Failed to refresh conversation list after {var45}: {tostring(p22)}`)
				end)
				
				return
			end
		end
		
		attempt(3)
	end, {})
	reactModule.useEffect(function() --[[ line: 277 ]]
		-- upvalues: var39 (ref)
		return function() --[[ line: 278 ]]
			-- upvalues: var39 (copy)
			var39.current += 1
		end
	end, {})
	
	return nil
end