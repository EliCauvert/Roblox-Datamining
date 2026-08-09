local parent = script:FindFirstAncestor("ExpChat").Parent
local appChatModule = require(parent.AppChat)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local conversationModule = require(parent.AppChat.Conversation)
local conversationChannelsModule = require(parent.AppChat.ConversationChannels)
local createConversationFromFriendPlaceholderModule = require(parent.AppChat.createConversationFromFriendPlaceholder)
local fetchConversationListPageToSignalsModule = require(parent.AppChat.fetchConversationListPageToSignals)
local getConversationTitleModule = require(parent.AppChat.getConversationTitle)
local getConversationStoreModule = require(parent.AppChat.GetConversationStore)
local logger = appChatModule.Components.ChatConversation.logger

local function getConversationStore() --[[ line: 29 ]]
	-- upvalues: getConversationStoreModule (ref)
	return getConversationStoreModule(false)
end

local function isFriendsConversation(p0, p1) --[[ line: 33 ]]
	-- upvalues: getConversationStoreModule (ref), conversationChannelsModule (ref)
	if p0 == nil or p0 == "" then
		return false
	end
	local conversation = getConversationStoreModule(false).getConversation(p0, p1 or false)
	
	return conversation ~= nil and conversation.source == conversationChannelsModule.Source.Friends
end

local function markConversationRead(p2, p3) --[[ line: 41 ]]
	-- upvalues: getConversationStoreModule (ref), appChatNetworkingModule (ref), logger (ref)
	local var13 = getConversationStoreModule(false)
	local conversation = var13.getConversation(p2, false)
	local var15 = p3 == true
	
	if conversation == nil then
		if not var15 then return end
	elseif conversation.hasUnreadMessages == true then
		local cloned = table.clone(conversation)
		cloned.hasUnreadMessages = false
		var13.upsertConversation(cloned, false)
		var15 = true
	end
	if var15 then
		return appChatNetworkingModule.http.MarkConversationRead(nil, p2):catch(function(p4) --[[ line: 60 ]]
			-- upvalues: logger (copy), p2 (ref)
			logger:warning(`Failed to mark conversation read for {p2}: {tostring(p4)}`)
		end)
	end
end

local function _(p5) --[[ line: 65 | named "getMessageTimestamp" ]]
	if type(p5.created_at) == "string" then
		local ok, status = pcall(function() --[[ line: 67 ]]
			-- upvalues: p5 (ref)
			return DateTime.fromIsoDate(p5.created_at)
		end)
		
		return if ok then status else nil
	end
end

local _ = function(p6) --[[ line: 78 | named "getUnixTime" ]]
	return if p6 == nil then nil elseif typeof(p6) == "DateTime" then p6.UnixTimestamp elseif type(p6) == "table" and p6.GetUnixTimestamp ~= nil then p6:GetUnixTimestamp() else nil
end

local _ = function(p7) --[[ line: 91 | named "getPreviewContent" ]]
	return p7.preview_content or p7.content
end

local function getPreviewableMessage(p8) --[[ line: 95 ]]
	for i, v in p8 do
		if v ~= nil and v.id ~= nil and (v.is_previewable == true and (v.preview_content or v.content) ~= nil) then
			return v
		end
	end
	return nil
end

local _ = function(p9, p10) --[[ line: 109 | named "shouldUpdatePreview" ]]
	if p10 == nil then
		return true
	end
	local lastUpdated = p9.lastUpdated
	local var17 = if lastUpdated == nil then nil elseif typeof(lastUpdated) == "DateTime" then lastUpdated.UnixTimestamp elseif type(lastUpdated) == "table" and lastUpdated.GetUnixTimestamp ~= nil then lastUpdated:GetUnixTimestamp() else nil
	
	return var17 == nil or var17 <= p10.UnixTimestamp
end

local _ = function(p11, p12) --[[ line: 122 | named "getHasUnreadMessages" ]]
	return if p12 == nil or p12.hasUnreadMessages == nil then nil elseif p12.hasUnreadMessages then p11.is_badgeable == true and (p12.localUserId == nil or tostring(p11.sender_user_id) ~= tostring(p12.localUserId)) else false
end

return {
	ConversationSource = conversationChannelsModule.Source,
	ConversationType = conversationModule.Type,
	createConversationFromFriendPlaceholder = createConversationFromFriendPlaceholderModule,
	fetchConversationListPageToSignals = fetchConversationListPageToSignalsModule,
	getConversationStore = getConversationStore,
	getConversationTitle = getConversationTitleModule,
	isFriendsConversation = isFriendsConversation,
	markConversationRead = markConversationRead,
	updateConversationPreviewFromMessages = function(p13, p14, p15) --[[ line: 138 ]]
		-- upvalues: getConversationStoreModule (ref), fetchConversationListPageToSignalsModule (ref), logger (ref), getPreviewableMessage (ref)
		local var18 = getConversationStoreModule(false)
		local conversation = var18.getConversation(p13, false)
		
		if conversation == nil then
			if p15 ~= nil and p15.refreshListOnMissingConversation == true then
				fetchConversationListPageToSignalsModule():catch(function(p16) --[[ line: 147 ]]
					-- upvalues: logger (copy)
					logger:warning(`Failed to refresh conversation list after realtime update: {tostring(p16)}`)
				end)
			end
			return false
		else
			local var21, var22
			local var20 = getPreviewableMessage(p14)
			
			if var20 == nil then
				return false
			elseif type(var20.created_at) == "string" then
				local ok, status = pcall(function() --[[ line: 67 ]]
					-- upvalues: var20 (ref)
					return DateTime.fromIsoDate(var20.created_at)
				end)
				var21 = if ok then status else nil
			end
			if var21 == nil then
				var22 = true
			else
				local lastUpdated = conversation.lastUpdated
				local var23 = if lastUpdated == nil then nil elseif typeof(lastUpdated) == "DateTime" then lastUpdated.UnixTimestamp elseif type(lastUpdated) == "table" and lastUpdated.GetUnixTimestamp ~= nil then lastUpdated:GetUnixTimestamp() else nil
				var22 = var23 == nil or var23 <= var21.UnixTimestamp
			end
			if not var22 then
				return false
			end
			local var25
			local cloned = table.clone(conversation)
			cloned.previewMessageId = tostring(var20.id)
			cloned.previewContent = var20.preview_content or var20.content
			cloned.lastUpdated = var21 or DateTime.now()
			
			if p15 == nil or p15.hasUnreadMessages == nil then
				var25 = nil
			elseif not p15.hasUnreadMessages then
				var25 = false
			elseif var20.is_badgeable ~= true then
				var25 = false
			elseif p15.localUserId ~= nil then
				var25 = tostring(var20.sender_user_id) ~= tostring(p15.localUserId)
			end
			if var25 ~= nil then
				cloned.hasUnreadMessages = var25
			end
			var18.upsertConversation(cloned, false)
			
			return true
		end
	end
}