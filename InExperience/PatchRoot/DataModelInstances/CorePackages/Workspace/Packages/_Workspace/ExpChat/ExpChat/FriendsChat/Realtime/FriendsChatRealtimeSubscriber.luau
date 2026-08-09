local parent = script:FindFirstAncestor("ExpChat").Parent
local playersService = game:GetService("Players")
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local expChatSharedModule = require(parent.ExpChatShared)
local fetchNewerMessagesModule = require(parent.AppChat.fetchNewerMessages)
local handleCommunicationChannelsMessageEventModule = require(script.Parent.handleCommunicationChannelsMessageEvent)
local expChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local getFriendsChatRealtimeStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatRealtimeStore)
local fStringDebugFriendsChatConversationIdModule = require(script.Parent.Parent.Flags.FStringDebugFriendsChatConversationId)
local name = expChatSharedModule.Logger:new(script.Name)

local function fetchNewerMessagesSafe(p0) --[[ line: 36 ]]
	-- upvalues: fetchNewerMessagesModule (ref), getFriendsChatRealtimeStoreModule (ref), playersService (ref), expChatConversationListAdapterModule (ref), name (ref)
	fetchNewerMessagesModule(p0):andThen(function(p2) --[[ line: 38 ]]
		-- upvalues: getFriendsChatRealtimeStoreModule (copy), playersService (copy), expChatConversationListAdapterModule (copy), p0 (ref)
		local response = p2 and p2.response
		local responseBody = response and response.responseBody
		local var12 = if responseBody then responseBody.messages or {} else {}
		local activeConversationId = getFriendsChatRealtimeStoreModule(false).getActiveConversationId(false)
		local localPlayer = playersService.LocalPlayer
		expChatConversationListAdapterModule.updateConversationPreviewFromMessages(p0, var12, {
			refreshListOnMissingConversation = true,
			hasUnreadMessages = activeConversationId ~= p0,
			localUserId = if localPlayer then localPlayer.UserId else 0
		})
		
		if activeConversationId == p0 then
			expChatConversationListAdapterModule.markConversationRead(p0, true)
		end
	end):catch(function(p1) --[[ line: 53 ]]
		-- upvalues: name (copy), p0 (ref)
		name:warning(`Failed to fetch newer messages for {p0}: {tostring(p1)}`)
	end)
end

return function() --[[ line: 58 | named "FriendsChatRealtimeSubscriber" ]]
	-- upvalues: realtimeDeliveryModule (ref), handleCommunicationChannelsMessageEventModule (ref), fetchNewerMessagesSafe (ref), getFriendsChatRealtimeStoreModule (ref), fStringDebugFriendsChatConversationIdModule (ref)
	realtimeDeliveryModule.useRealtimeNamespace("CommunicationChannels", function(p3) --[[ line: 59 ]]
		-- upvalues: handleCommunicationChannelsMessageEventModule (copy), fetchNewerMessagesSafe (copy)
		handleCommunicationChannelsMessageEventModule(p3, fetchNewerMessagesSafe)
	end, {})
	realtimeDeliveryModule.useRealtimeConnectionStateChanged("CommunicationChannels", function(p4, p5) --[[ line: 65 ]]
		-- upvalues: getFriendsChatRealtimeStoreModule (copy), fStringDebugFriendsChatConversationIdModule (copy), fetchNewerMessagesSafe (copy)
		if p4 ~= Enum.ConnectionState.Connected or not p5 then return end
		local var14 = getFriendsChatRealtimeStoreModule(false).getActiveConversationId(false) or fStringDebugFriendsChatConversationIdModule
		
		if var14 ~= "" then
			fetchNewerMessagesSafe(var14)
		end
	end, {})
	
	return nil
end