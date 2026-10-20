local Parent = script:FindFirstAncestor("FriendsChat").Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local ConversationChannelsModule = require(Parent.AppChat.ConversationChannels)
local FetchConversationListPageToSignalsModule = require(Parent.AppChat.fetchConversationListPageToSignals)
local GetConversationStoreModule = require(Parent.AppChat.GetConversationStore)
local Logger = require(Parent.AppChat).Components.ChatConversation.logger

local function _(p1)
	if type(p1.created_at) == "string" then
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy)
			return DateTime.fromIsoDate(p1.created_at)
		end)
		
		if Success then
			return Result
		end
	end
	return nil
end

local _ = function(p1)
	return if p1 == nil then nil elseif typeof(p1) == "DateTime" then p1.UnixTimestamp elseif type(p1) == "table" and p1.GetUnixTimestamp ~= nil then p1:GetUnixTimestamp() else nil
end

local _ = function(p1)
	return p1.preview_content or p1.content
end

local _ = function(p1)
	local v1 = nil
	repeat
		if type(p1.created_at) == "string" then
			local Success, Result = pcall(function()
				-- upvalues: p1 (copy)
				return DateTime.fromIsoDate(p1.created_at)
			end)
			
			if Success then
				v1 = Result
				break
			end
		end
		v1 = nil
	until true
	return if v1 == nil then nil else v1.UnixTimestamp
end

local _ = function(p1): boolean
	return p1 ~= nil and (p1.id ~= nil and (p1.is_previewable == true and (p1.preview_content or p1.content) ~= nil))
end

local function getNewestPreviewableMessage(List)
	local v1 = nil
	local v2 = nil
	local Result = nil
	
	for _, value in List do
		local v3 = nil
		if value == nil or (value.id == nil or (value.is_previewable ~= true or (value.preview_content or value.content) == nil)) then
			continue
		end
		repeat
			if type(value.created_at) == "string" then
				local Success
				Success, Result = pcall(function()
					-- upvalues: value (copy)
					return DateTime.fromIsoDate(value.created_at)
				end)
				
				if Success then
					v3 = Result
					break
				end
			end
			v3 = nil
		until true
		local UnixTimestamp = if v3 == nil then nil else v3.UnixTimestamp
		
		if v1 == nil then
			v1 = value
			v2 = UnixTimestamp
		elseif UnixTimestamp ~= nil and (v2 == nil or v2 < UnixTimestamp) then
			v1 = value
			v2 = UnixTimestamp
		end
	end
	return v1
end

local _ = function(p1, p2): boolean
	if p2 == nil then
		return true
	else
		local LastUpdated = p1.lastUpdated
		local UnixTimestamp = if LastUpdated == nil then nil elseif typeof(LastUpdated) == "DateTime" then LastUpdated.UnixTimestamp elseif type(LastUpdated) == "table" and LastUpdated.GetUnixTimestamp ~= nil then LastUpdated:GetUnixTimestamp() else nil
		
		return UnixTimestamp == nil or UnixTimestamp <= p2.UnixTimestamp
	end
end

local _ = function(p1, p2): boolean
	if p1 == nil or p1.is_badgeable ~= true then
		return false
	else
		local SenderUserId = p1.sender_user_id
		
		return SenderUserId ~= nil and (p2 == nil or p2.localUserId == nil or tostring(SenderUserId) ~= tostring(p2.localUserId))
	end
end

local function hasNewerUnreadMessage(List, p1): boolean
	if p1 == nil or p1.hasUnreadMessages ~= true then
		return false
	end
	local UnreadFreshnessLastUpdated = p1.unreadFreshnessLastUpdated
	local UnixTimestamp = (if UnreadFreshnessLastUpdated == nil then nil elseif typeof(UnreadFreshnessLastUpdated) == "DateTime" then UnreadFreshnessLastUpdated.UnixTimestamp elseif type(UnreadFreshnessLastUpdated) == "table" and UnreadFreshnessLastUpdated.GetUnixTimestamp ~= nil then UnreadFreshnessLastUpdated:GetUnixTimestamp() else nil) or 0
	
	for _, value in List do
		local v4 = nil
		if value == nil or value.is_badgeable ~= true then
			v4 = false
		else
			local SenderUserId = value.sender_user_id
			v4 = SenderUserId ~= nil and (p1 == nil or p1.localUserId == nil or tostring(SenderUserId) ~= tostring(p1.localUserId))
		end
		if v4 then
			local v5 = nil
			if type(value.created_at) == "string" then
				local Success, Result = pcall(function()
					-- upvalues: value (copy)
					return DateTime.fromIsoDate(value.created_at)
				end)
				
				if Success then
					v5 = Result
					local UnixTimestamp1 = if v5 == nil then nil else v5.UnixTimestamp
					
					if UnixTimestamp1 ~= nil and UnixTimestamp < UnixTimestamp1 then
						return true
					end
					continue
				end
			end
			v5 = nil
		end
	end
	return false
end

return {
	ConversationSource = ConversationChannelsModule.Source,
	createConversationFromFriendPlaceholder = require(Parent.AppChat.createConversationFromFriendPlaceholder),
	fetchConversationDetailsToSignals = require(Parent.AppChat.fetchConversationDetailsToSignals),
	fetchConversationListPageToSignals = FetchConversationListPageToSignalsModule,
	getConversationStore = function()
		-- upvalues: GetConversationStoreModule (copy)
		return GetConversationStoreModule(false)
	end,
	getConversationTitle = require(Parent.AppChat.getConversationTitle),
	isFriendPlaceholder = function(Text: string, p2): boolean
		-- upvalues: GetConversationStoreModule (copy), ConversationChannelsModule (copy)
		if Text == nil or Text == "" then
			return false
		else
			local Conversation = GetConversationStoreModule(false).getConversation(Text, p2 or false)
			
			return if Conversation == nil then string.sub(Text, 1, 8) == "friends:" else Conversation.source == ConversationChannelsModule.Source.Friends
		end
	end,
	markConversationRead = function(p2, Enabled)
		-- upvalues: GetConversationStoreModule (copy), AppChatNetworkingModule (copy), Logger (copy)
		local ConversationStoreModule = GetConversationStoreModule(false)
		local Conversation = ConversationStoreModule.getConversation(p2, false)
		local IsEnabled = Enabled == true
		
		if Conversation ~= nil then
			if Conversation.hasUnreadMessages == true then
				local Copy = table.clone(Conversation)
				Copy.hasUnreadMessages = false
				ConversationStoreModule.upsertConversation(Copy, false)
				IsEnabled = true
			end
		elseif not IsEnabled then return end
		if not IsEnabled then return end
		return AppChatNetworkingModule.http.MarkConversationRead(nil, p2):catch(function(Err)
			-- upvalues: Logger (upval), p2 (copy)
			Logger:warning(`Failed to mark conversation read for {p2}: {tostring(Err)}`)
		end)
	end,
	removeConversation = function(p3)
		-- upvalues: GetConversationStoreModule (copy)
		GetConversationStoreModule(false).removeConversation(p3)
	end,
	updateConversationPreviewFromMessages = function(p3, p4, p5)
		-- upvalues: GetConversationStoreModule (copy), FetchConversationListPageToSignalsModule (copy), Logger (copy), hasNewerUnreadMessage (copy), getNewestPreviewableMessage (copy)
		local ConversationStoreModule = GetConversationStoreModule(false)
		local Conversation = ConversationStoreModule.getConversation(p3, false)
		
		if Conversation == nil then
			if p5 ~= nil and p5.refreshListOnMissingConversation == true then
				FetchConversationListPageToSignalsModule():catch(function(Err)
					-- upvalues: Logger (upval)
					Logger:warning(`Failed to refresh conversation list after realtime update: {tostring(Err)}`)
				end)
			end
			return false, (hasNewerUnreadMessage(p4, p5))
		else
			local v6 = nil
			local NewestPreviewableMessage = getNewestPreviewableMessage(p4)
			local v7 = nil
			repeat
				if NewestPreviewableMessage == nil then break end
				repeat
					if type(NewestPreviewableMessage.created_at) == "string" then
						local Success, Result = pcall(function()
							-- upvalues: NewestPreviewableMessage (copy)
							return DateTime.fromIsoDate(NewestPreviewableMessage.created_at)
						end)
						
						if Success then
							v7 = Result
							break
						end
					end
					v7 = nil
				until true
				local v8 = nil
				if v7 == nil then
					v8 = true
				else
					local LastUpdated = Conversation.lastUpdated
					local UnixTimestamp = if LastUpdated == nil then nil elseif typeof(LastUpdated) == "DateTime" then LastUpdated.UnixTimestamp elseif type(LastUpdated) == "table" and LastUpdated.GetUnixTimestamp ~= nil then LastUpdated:GetUnixTimestamp() else nil
					v8 = UnixTimestamp == nil or UnixTimestamp <= v7.UnixTimestamp
				end
				if not v8 then break end
				v6 = table.clone(Conversation)
				v6.previewMessageId = tostring(NewestPreviewableMessage.id)
				v6.previewContent = NewestPreviewableMessage.preview_content or NewestPreviewableMessage.content
				v6.lastUpdated = v7 or DateTime.now()
			until true
			local HasNewerUnreadMessage = hasNewerUnreadMessage(p4, p5)
			
			if Conversation.hasUnreadMessages ~= true and HasNewerUnreadMessage then
				v6 = v6 or table.clone(Conversation)
				v6.hasUnreadMessages = true
			end
			if v6 == nil then
				return false, HasNewerUnreadMessage
			else
				ConversationStoreModule.upsertConversation(v6, false)
				
				return true, HasNewerUnreadMessage
			end
		end
	end
}