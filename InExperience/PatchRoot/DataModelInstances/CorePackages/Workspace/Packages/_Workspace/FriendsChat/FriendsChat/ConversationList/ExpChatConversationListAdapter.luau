local parent = script:FindFirstAncestor("FriendsChat").Parent
local appChatModule = require(parent.AppChat)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local conversationChannelsModule = require(parent.AppChat.ConversationChannels)
local createConversationFromFriendPlaceholderModule = require(parent.AppChat.createConversationFromFriendPlaceholder)
local fetchConversationDetailsToSignalsModule = require(parent.AppChat.fetchConversationDetailsToSignals)
local fetchConversationListPageToSignalsModule = require(parent.AppChat.fetchConversationListPageToSignals)
local getConversationTitleModule = require(parent.AppChat.getConversationTitle)
local getConversationStoreModule = require(parent.AppChat.GetConversationStore)
local logger = appChatModule.Components.ChatConversation.logger

local function getConversationStore()
	-- upvalues: getConversationStoreModule (ref)
	return getConversationStoreModule(false)
end

local function isFriendPlaceholder(p1, p2)
	-- upvalues: getConversationStoreModule (ref), conversationChannelsModule (ref)
	if p1 == nil or p1 == "" then
		return false
	end
	local conversation = getConversationStoreModule(false).getConversation(p1, p2 or false)
	
	return if conversation == nil then string.sub(p1, 1, 8) == "friends:" else conversation.source == conversationChannelsModule.Source.Friends
end

local function markConversationRead(p1, p2)
	-- upvalues: getConversationStoreModule (ref), appChatNetworkingModule (ref), logger (ref)
	local var1 = getConversationStoreModule(false)
	local conversation = var1.getConversation(p1, false)
	local var2 = p2 == true
	
	if conversation == nil then
		if not var2 then return end
	elseif conversation.hasUnreadMessages == true then
		local cloned = table.clone(conversation)
		cloned.hasUnreadMessages = false
		var1.upsertConversation(cloned, false)
		var2 = true
	end
	if var2 then
		return appChatNetworkingModule.http.MarkConversationRead(nil, p1):catch(function(p3)
			-- upvalues: logger (copy), p1 (ref)
			logger:warning(`Failed to mark conversation read for {p1}: {tostring(p3)}`)
		end)
	end
end

local function removeConversation(p3)
	-- upvalues: getConversationStoreModule (ref)
	getConversationStoreModule(false).removeConversation(p3)
end

local function _(p3)
	if type(p3.created_at) == "string" then
		local ok, status = pcall(function()
			-- upvalues: p3 (ref)
			return DateTime.fromIsoDate(p3.created_at)
		end)
		
		return if ok then status else nil
	end
end

local _ = function(p3)
	return if p3 == nil then nil elseif typeof(p3) == "DateTime" then p3.UnixTimestamp elseif type(p3) == "table" and p3.GetUnixTimestamp ~= nil then p3:GetUnixTimestamp() else nil
end

local _ = function(p3)
	return p3.preview_content or p3.content
end

local _ = function(p3)
	local var3
	if type(p3.created_at) == "string" then
		local ok, status = pcall(function()
			-- upvalues: p3 (ref)
			return DateTime.fromIsoDate(p3.created_at)
		end)
		var3 = if ok then status else nil
	end
	return if var3 == nil then nil else var3.UnixTimestamp
end

local _ = function(p3)
	local var3 = false
	
	if p3 ~= nil then
		var3 = false
		
		if p3.id ~= nil then
			var3 = false
			
			if p3.is_previewable == true then
				var3 = (p3.preview_content or p3.content) ~= nil
			end
		end
	end
	return var3
end

local function getNewestPreviewableMessage(p3)
	local var3 = nil
	local var4 = nil
	
	for i, v in p3 do
		local var5 = false
		
		if v ~= nil then
			var5 = false
			
			if v.id ~= nil then
				var5 = false
				
				if v.is_previewable == true then
					var5 = (v.preview_content or v.content) ~= nil
				end
			end
		end
		if var5 then
			local var6
			if type(v.created_at) == "string" then
				local ok, status = pcall(function()
					-- upvalues: v (ref)
					return DateTime.fromIsoDate(v.created_at)
				end)
				var6 = if ok then status else nil
			end
			local var7 = if var6 ~= nil then nil else var6.UnixTimestamp
			
			if var3 == nil then
				var3 = v
				var4 = var7
			elseif var7 ~= nil and (var4 == nil or var4 < var7) then
				var3 = v
				var4 = var7
			end
		end
	end
	return var3
end

local _ = function(p4, p5)
	if p5 == nil then
		return true
	end
	local lastUpdated = p4.lastUpdated
	local var8 = if lastUpdated == nil then nil elseif typeof(lastUpdated) == "DateTime" then lastUpdated.UnixTimestamp elseif type(lastUpdated) == "table" and lastUpdated.GetUnixTimestamp ~= nil then lastUpdated:GetUnixTimestamp() else nil
	
	return var8 == nil or var8 <= p5.UnixTimestamp
end

local _ = function(p4, p5)
	if p4 == nil or p4.is_badgeable ~= true then
		return false
	end
	local senderUserId = p4.sender_user_id
	
	return if senderUserId == nil then false else p5 == nil or p5.localUserId == nil or tostring(senderUserId) ~= tostring(p5.localUserId)
end

local function hasNewerUnreadMessage(p4, p5)
	if p5 == nil or p5.hasUnreadMessages ~= true then
		return false
	end
	local unreadFreshnessLastUpdated = p5.unreadFreshnessLastUpdated
	local var8 = (if unreadFreshnessLastUpdated == nil then nil elseif typeof(unreadFreshnessLastUpdated) == "DateTime" then unreadFreshnessLastUpdated.UnixTimestamp elseif type(unreadFreshnessLastUpdated) == "table" and unreadFreshnessLastUpdated.GetUnixTimestamp ~= nil then unreadFreshnessLastUpdated:GetUnixTimestamp() else nil) or 0
	
	for i, v in p4 do
		local var9
		if v == nil or v.is_badgeable ~= true then
			var9 = false
		else
			local senderUserId = v.sender_user_id
			
			if senderUserId == nil then
				var9 = false
			elseif p5 ~= nil and p5.localUserId ~= nil then
				var9 = tostring(senderUserId) ~= tostring(p5.localUserId)
			end
		end
		if var9 then
			local var10
			if type(v.created_at) == "string" then
				local ok, status = pcall(function()
					-- upvalues: v (ref)
					return DateTime.fromIsoDate(v.created_at)
				end)
				var10 = if ok then status else nil
			end
			var9 = if var10 ~= nil then nil else var10.UnixTimestamp
			
			if var9 ~= nil and var8 < var9 then
				return true
			end
		end
	end
	return false
end

return {
	ConversationSource = conversationChannelsModule.Source,
	createConversationFromFriendPlaceholder = createConversationFromFriendPlaceholderModule,
	fetchConversationDetailsToSignals = fetchConversationDetailsToSignalsModule,
	fetchConversationListPageToSignals = fetchConversationListPageToSignalsModule,
	getConversationStore = getConversationStore,
	getConversationTitle = getConversationTitleModule,
	isFriendPlaceholder = isFriendPlaceholder,
	markConversationRead = markConversationRead,
	removeConversation = removeConversation,
	updateConversationPreviewFromMessages = function(p6, p7, p8)
		-- upvalues: getConversationStoreModule (ref), fetchConversationListPageToSignalsModule (ref), logger (ref), hasNewerUnreadMessage (ref), getNewestPreviewableMessage (ref)
		local var11 = getConversationStoreModule(false)
		local conversation = var11.getConversation(p6, false)
		
		if conversation == nil then
			if p8 ~= nil and p8.refreshListOnMissingConversation == true then
				fetchConversationListPageToSignalsModule():catch(function(p9)
					-- upvalues: logger (copy)
					logger:warning(`Failed to refresh conversation list after realtime update: {tostring(p9)}`)
				end)
			end
			return false, hasNewerUnreadMessage(p7, p8)
		else
			local var12 = nil
			local var13 = getNewestPreviewableMessage(p7)
			
			if var13 ~= nil then
				local var14, var15
				if type(var13.created_at) == "string" then
					local ok, status = pcall(function()
						-- upvalues: var13 (ref)
						return DateTime.fromIsoDate(var13.created_at)
					end)
					var14 = if ok then status else nil
				end
				if var14 == nil then
					var15 = true
				else
					local lastUpdated = conversation.lastUpdated
					local var16 = if lastUpdated == nil then nil elseif typeof(lastUpdated) == "DateTime" then lastUpdated.UnixTimestamp elseif type(lastUpdated) == "table" and lastUpdated.GetUnixTimestamp ~= nil then lastUpdated:GetUnixTimestamp() else nil
					var15 = var16 == nil or var16 <= var14.UnixTimestamp
				end
				if var15 then
					var12 = table.clone(conversation)
					var12.previewMessageId = tostring(var13.id)
					var12.previewContent = var13.preview_content or var13.content
					var12.lastUpdated = var14 or DateTime.now()
				end
			end
			local var17 = hasNewerUnreadMessage(p7, p8)
			
			if conversation.hasUnreadMessages ~= true and var17 then
				var12 = var12 or table.clone(conversation)
				var12.hasUnreadMessages = true
			end
			if var12 == nil then
				return false, var17
			end
			var11.upsertConversation(var12, false)
			
			return true, var17
		end
	end
}