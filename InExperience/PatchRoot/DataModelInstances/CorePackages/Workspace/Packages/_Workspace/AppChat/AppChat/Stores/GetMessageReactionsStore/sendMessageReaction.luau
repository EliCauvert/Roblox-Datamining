local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local PromiseModule = require(Parent.Promise)
local NewResult = require(AppChat.Logger):new(script.Name)
local GetMessageReactionsStoreModule = require(AppChat.Stores.GetMessageReactionsStore)
local ApplyPendingReactionModule = require(AppChat.Stores.GetMessageReactionsViewModelStore.applyPendingReaction)
local QueueMessageReactionsFetchModule = require(script.Parent.queueMessageReactionsFetch)
local t = {}

local function _(p1)
	-- upvalues: GetMessageReactionsStoreModule (copy)
	local MessageReactions = GetMessageReactionsStoreModule(false).getMessageReactions(p1, false)
	
	if MessageReactions == nil then
		return nil
	end
	for _, reaction in MessageReactions.reactions do
		if reaction.has_user_reacted then
			return reaction.emote_id
		end
	end
	return nil
end

local function sendRequest(ConversationId, p2, SentEmoteId)
	-- upvalues: GetMessageReactionsStoreModule (copy), AppChatNetworkingModule (copy)
	local MessageReactions = GetMessageReactionsStoreModule(false).getMessageReactions(p2, false)
	local EmoteId = nil
	
	if MessageReactions == nil then
		EmoteId = nil
	else
		EmoteId = nil
		
		for _, reaction in MessageReactions.reactions do
			if reaction.has_user_reacted then
				EmoteId = reaction.emote_id
				break
			end
		end
	end
	return if SentEmoteId == nil then AppChatNetworkingModule.http.RemoveMessagesReactions(nil, ConversationId, p2, EmoteId) else AppChatNetworkingModule.http.SetMessagesReactions(nil, ConversationId, p2, SentEmoteId, EmoteId)
end

local _ = function(Key, p3)
	-- upvalues: QueueMessageReactionsFetchModule (copy), t (copy), GetMessageReactionsStoreModule (copy)
	QueueMessageReactionsFetchModule(p3.conversationId, Key):finally(function()
		-- upvalues: t (upval), Key (copy), p3 (copy), GetMessageReactionsStoreModule (upval)
		if t[Key] == p3 then
			t[Key] = nil
			GetMessageReactionsStoreModule(false).setPendingReaction(Key, nil)
			
			return
		end
	end)
end

local Callback = nil

local function onRequestFinished(Key, p3, p4)
	-- upvalues: GetMessageReactionsStoreModule (copy), t (copy), LocalUserIdStore (copy), ApplyPendingReactionModule (copy), Callback (ref), QueueMessageReactionsFetchModule (copy)
	p3.isSending = false
	local MessageReactionsStoreModule = GetMessageReactionsStoreModule(false)
	local MessageReactions = MessageReactionsStoreModule.getMessageReactions(Key, false)
	local Pending = if MessageReactions then MessageReactions.pending else nil
	
	if MessageReactions == nil or Pending == nil then
		t[Key] = nil
		
		return
	end
	if p4 then
		MessageReactionsStoreModule.setConfirmedReactions(Key, ApplyPendingReactionModule({
			reactions = MessageReactions.reactions,
			pending = { emoteId = p3.sentEmoteId }
		}, (tonumber(LocalUserIdStore.getCurrentUserId(false)))))
	end
	if Pending.emoteId ~= p3.sentEmoteId then
		Callback(Key, p3, Pending.emoteId)
		
		return
	end
	if p4 then
		QueueMessageReactionsFetchModule(p3.conversationId, Key):finally(function()
			-- upvalues: t (upval), Key (copy), p3 (copy), GetMessageReactionsStoreModule (upval)
			if t[Key] == p3 then
				t[Key] = nil
				GetMessageReactionsStoreModule(false).setPendingReaction(Key, nil)
				
				return
			end
		end)
		
		return
	else
		t[Key] = nil
		MessageReactionsStoreModule.setPendingReaction(Key, nil)
		QueueMessageReactionsFetchModule(p3.conversationId, Key)
	end
end

Callback = function(Key, p3, EmoteId)
	-- upvalues: PromiseModule (copy), sendRequest (copy), onRequestFinished (copy), NewResult (copy), GetMessageReactionsStoreModule (copy), t (copy), Callback (ref), QueueMessageReactionsFetchModule (copy)
	p3.isSending = true
	p3.sentEmoteId = EmoteId
	PromiseModule.try(function()
		-- upvalues: sendRequest (upval), p3 (copy), Key (copy), EmoteId (copy)
		return sendRequest(p3.conversationId, Key, EmoteId)
	end):andThen(function()
		-- upvalues: onRequestFinished (upval), Key (copy), p3 (copy)
		onRequestFinished(Key, p3, true)
	end, function(p4)
		-- upvalues: NewResult (upval), p3 (copy), Key (copy), EmoteId (copy), GetMessageReactionsStoreModule (upval), t (upval), Callback (upval), QueueMessageReactionsFetchModule (upval)
		NewResult:warning("Failed to update reaction for conversationId: {}, messageId: {}, emoteId: {}, error: {}", p3.conversationId, Key, EmoteId, (tostring(p4)))
		p3.isSending = false
		local MessageReactionsStoreModule = GetMessageReactionsStoreModule(false)
		local MessageReactions = MessageReactionsStoreModule.getMessageReactions(Key, false)
		local Pending = if MessageReactions then MessageReactions.pending else nil
		
		if MessageReactions == nil or Pending == nil then
			t[Key] = nil
			
			return
		end
		if Pending.emoteId == p3.sentEmoteId then
			t[Key] = nil
			MessageReactionsStoreModule.setPendingReaction(Key, nil)
			QueueMessageReactionsFetchModule(p3.conversationId, Key)
			
			return
		else
			Callback(Key, p3, Pending.emoteId)
		end
	end)
end

return function(ConversationId, Key, EmoteId)
	-- upvalues: GetMessageReactionsStoreModule (copy), t (copy), Callback (ref)
	GetMessageReactionsStoreModule(false).setPendingReaction(Key, { emoteId = EmoteId })
	local Entry = t[Key]
	
	if not Entry or not Entry.isSending then
		local config = {
			isSending = false,
			sentEmoteId = nil,
			conversationId = ConversationId
		}
		t[Key] = config
		Callback(Key, config, EmoteId)
		
		return
	end
end