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

local function getConversationStore() --[[ line: 29 ]]
	-- upvalues: getConversationStoreModule (ref)
	return getConversationStoreModule(false)
end

local function isFriendPlaceholder(p0, p1) --[[ line: 33 ]]
	-- upvalues: getConversationStoreModule (ref), conversationChannelsModule (ref)
	if p0 == nil or p0 == "" then
		return false
	end
	local conversation = getConversationStoreModule(false).getConversation(p0, p1 or false)
	
	return if conversation == nil then string.sub(p0, 1, 8) == "friends:" else conversation.source == conversationChannelsModule.Source.Friends
end

local function markConversationRead(p2, p3) --[[ line: 44 ]]
	-- upvalues: getConversationStoreModule (ref), appChatNetworkingModule (ref), logger (ref)
	local var15 = getConversationStoreModule(false)
	local conversation = var15.getConversation(p2, false)
	local var17 = p3 == true
	
	if conversation == nil then
		if not var17 then return end
	elseif conversation.hasUnreadMessages == true then
		local cloned = table.clone(conversation)
		cloned.hasUnreadMessages = false
		var15.upsertConversation(cloned, false)
		var17 = true
	end
	if var17 then
		return appChatNetworkingModule.http.MarkConversationRead(nil, p2):catch(function(p4) --[[ line: 63 ]]
			-- upvalues: logger (copy), p2 (ref)
			logger:warning(`Failed to mark conversation read for {p2}: {tostring(p4)}`)
		end)
	end
end

local function removeConversation(p5) --[[ line: 71 ]]
	-- upvalues: getConversationStoreModule (ref)
	getConversationStoreModule(false).removeConversation(p5)
end

local function _(p6) --[[ line: 75 | named "getMessageTimestamp" ]]
	if type(p6.created_at) == "string" then
		local ok, status = pcall(function() --[[ line: 77 ]]
			-- upvalues: p6 (ref)
			return DateTime.fromIsoDate(p6.created_at)
		end)
		
		return if ok then status else nil
	end
end

local _ = function(p7) --[[ line: 88 | named "getUnixTime" ]]
	return if p7 == nil then nil elseif typeof(p7) == "DateTime" then p7.UnixTimestamp elseif type(p7) == "table" and p7.GetUnixTimestamp ~= nil then p7:GetUnixTimestamp() else nil
end

local _ = function(p8) --[[ line: 101 | named "getPreviewContent" ]]
	return p8.preview_content or p8.content
end

local _ = function(p9) --[[ line: 105 | named "getMessageUnixTime" ]]
	local var19
	if type(p9.created_at) == "string" then
		local ok, status = pcall(function() --[[ line: 77 ]]
			-- upvalues: p9 (ref)
			return DateTime.fromIsoDate(p9.created_at)
		end)
		var19 = if ok then status else nil
	end
	return if var19 == nil then nil else var19.UnixTimestamp
end

local _ = function(p10) --[[ line: 110 | named "isPreviewableMessage" ]]
	local var20 = false
	
	if p10 ~= nil then
		var20 = false
		
		if p10.id ~= nil then
			var20 = false
			
			if p10.is_previewable == true then
				var20 = (p10.preview_content or p10.content) ~= nil
			end
		end
	end
	return var20
end

local function getNewestPreviewableMessage(p11) --[[ line: 119 ]]
	local var21 = nil
	local var22 = nil
	
	for i, v in p11 do
		local var23 = false
		
		if v ~= nil then
			var23 = false
			
			if v.id ~= nil then
				var23 = false
				
				if v.is_previewable == true then
					var23 = (v.preview_content or v.content) ~= nil
				end
			end
		end
		if var23 then
			local var24
			if type(v.created_at) == "string" then
				local ok, status = pcall(function() --[[ line: 77 ]]
					-- upvalues: v (ref)
					return DateTime.fromIsoDate(v.created_at)
				end)
				var24 = if ok then status else nil
			end
			local var25 = if var24 ~= nil then nil else var24.UnixTimestamp
			
			if var21 == nil then
				var21 = v
				var22 = var25
			elseif var25 ~= nil and (var22 == nil or var22 < var25) then
				var21 = v
				var22 = var25
			end
		end
	end
	return var21
end

local _ = function(p12, p13) --[[ line: 138 | named "shouldUpdatePreview" ]]
	if p13 == nil then
		return true
	end
	local lastUpdated = p12.lastUpdated
	local var26 = if lastUpdated == nil then nil elseif typeof(lastUpdated) == "DateTime" then lastUpdated.UnixTimestamp elseif type(lastUpdated) == "table" and lastUpdated.GetUnixTimestamp ~= nil then lastUpdated:GetUnixTimestamp() else nil
	
	return var26 == nil or var26 <= p13.UnixTimestamp
end

local _ = function(p14, p15) --[[ line: 151 | named "isUnreadCandidateMessage" ]]
	if p14 == nil or p14.is_badgeable ~= true then
		return false
	end
	local senderUserId = p14.sender_user_id
	
	return if senderUserId == nil then false else p15 == nil or p15.localUserId == nil or tostring(senderUserId) ~= tostring(p15.localUserId)
end

local function hasNewerUnreadMessage(p16, p17) --[[ line: 172 ]]
	if p17 == nil or p17.hasUnreadMessages ~= true then
		return false
	end
	local unreadFreshnessLastUpdated = p17.unreadFreshnessLastUpdated
	local var27 = (if unreadFreshnessLastUpdated == nil then nil elseif typeof(unreadFreshnessLastUpdated) == "DateTime" then unreadFreshnessLastUpdated.UnixTimestamp elseif type(unreadFreshnessLastUpdated) == "table" and unreadFreshnessLastUpdated.GetUnixTimestamp ~= nil then unreadFreshnessLastUpdated:GetUnixTimestamp() else nil) or 0
	
	for i, v in p16 do
		local var28
		if v == nil or v.is_badgeable ~= true then
			var28 = false
		else
			local senderUserId = v.sender_user_id
			
			if senderUserId == nil then
				var28 = false
			elseif p17 ~= nil and p17.localUserId ~= nil then
				var28 = tostring(senderUserId) ~= tostring(p17.localUserId)
			end
		end
		if var28 then
			local var29
			if type(v.created_at) == "string" then
				local ok, status = pcall(function() --[[ line: 77 ]]
					-- upvalues: v (ref)
					return DateTime.fromIsoDate(v.created_at)
				end)
				var29 = if ok then status else nil
			end
			var28 = if var29 ~= nil then nil else var29.UnixTimestamp
			
			if var28 ~= nil and var27 < var28 then
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
	updateConversationPreviewFromMessages = function(p18, p19, p20) --[[ line: 197 ]]
		-- upvalues: getConversationStoreModule (ref), fetchConversationListPageToSignalsModule (ref), logger (ref), hasNewerUnreadMessage (ref), getNewestPreviewableMessage (ref)
		local var30 = getConversationStoreModule(false)
		local conversation = var30.getConversation(p18, false)
		
		if conversation == nil then
			if p20 ~= nil and p20.refreshListOnMissingConversation == true then
				fetchConversationListPageToSignalsModule():catch(function(p21) --[[ line: 206 ]]
					-- upvalues: logger (copy)
					logger:warning(`Failed to refresh conversation list after realtime update: {tostring(p21)}`)
				end)
			end
			return false, hasNewerUnreadMessage(p19, p20)
		else
			local var32 = nil
			local var33 = getNewestPreviewableMessage(p19)
			
			if var33 ~= nil then
				local var34, var35
				if type(var33.created_at) == "string" then
					local ok, status = pcall(function() --[[ line: 77 ]]
						-- upvalues: var33 (ref)
						return DateTime.fromIsoDate(var33.created_at)
					end)
					var34 = if ok then status else nil
				end
				if var34 == nil then
					var35 = true
				else
					local lastUpdated = conversation.lastUpdated
					local var36 = if lastUpdated == nil then nil elseif typeof(lastUpdated) == "DateTime" then lastUpdated.UnixTimestamp elseif type(lastUpdated) == "table" and lastUpdated.GetUnixTimestamp ~= nil then lastUpdated:GetUnixTimestamp() else nil
					var35 = var36 == nil or var36 <= var34.UnixTimestamp
				end
				if var35 then
					var32 = table.clone(conversation)
					var32.previewMessageId = tostring(var33.id)
					var32.previewContent = var33.preview_content or var33.content
					var32.lastUpdated = var34 or DateTime.now()
				end
			end
			local var37 = hasNewerUnreadMessage(p19, p20)
			
			if conversation.hasUnreadMessages ~= true and var37 then
				var32 = var32 or table.clone(conversation)
				var32.hasUnreadMessages = true
			end
			if var32 == nil then
				return false, var37
			end
			var30.upsertConversation(var32, false)
			
			return true, var37
		end
	end
}