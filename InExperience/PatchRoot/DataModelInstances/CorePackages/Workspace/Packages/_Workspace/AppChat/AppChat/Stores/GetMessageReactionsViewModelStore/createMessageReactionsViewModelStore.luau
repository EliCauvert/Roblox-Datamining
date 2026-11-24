local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(Parent.AppChatNetworking)
local DashModule = require(Parent.Dash)
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local _ = require(Parent.Reactions)
local SignalsModule = require(Parent.Signals)
local GetEmojiSetsStoreModule = require(AppChat.Stores.GetEmojiSetsStore)
local ApplyPendingReactionModule = require(script.Parent.applyPendingReaction)
local _ = require(script.Parent.Parent.GetMessageReactionsStore.createMessageReactionsStore)
local t = {}
local t1 = {}

local function areReactorsEqual(p1, p2)
	-- upvalues: t1 (copy), DashModule (copy)
	local Reactors = if p1.reactions_page then p1.reactions_page.reactors else t1
	local Reactors1 = if p2.reactions_page then p2.reactions_page.reactors else t1
	
	return #Reactors == #Reactors1 and DashModule.all(Reactors, function(p3, p4): boolean
		-- upvalues: Reactors1 (copy)
		local Reactor = Reactors1[p4]
		
		return p3.user_id == Reactor.user_id and p3.reacted_at == Reactor.reacted_at
	end)
end

local function areReactionListsEqual(p1, p2)
	-- upvalues: DashModule (copy), areReactorsEqual (copy)
	return #p1 == #p2 and DashModule.all(p1, function(p3, p4)
		-- upvalues: p2 (copy), areReactorsEqual (upval)
		local v1 = p2[p4]
		
		return p3.emote_id == v1.emote_id and (p3.count == v1.count and p3.has_user_reacted == v1.has_user_reacted) and areReactorsEqual(p3, v1)
	end)
end

return function(p1)
	-- upvalues: SignalsModule (copy), t (copy), LocalUserIdStore (copy), ApplyPendingReactionModule (copy), areReactionListsEqual (copy), GetEmojiSetsStoreModule (copy), DashModule (copy)
	local t2 = {}
	local t3 = {}
	
	return {
		getDisplayReactions = function(Key)
			-- upvalues: t2 (copy), SignalsModule (upval), p1 (copy), t (upval), LocalUserIdStore (upval), ApplyPendingReactionModule (upval), areReactionListsEqual (upval)
			local Entry = t2[Key]
			
			if Entry == nil then
				local Computed = SignalsModule.createComputed(function(p2)
					-- upvalues: p1 (upval), Key (copy), t (upval), LocalUserIdStore (upval), ApplyPendingReactionModule (upval)
					local MessageReactions = p1.getMessageReactions(Key, p2)
					
					return if MessageReactions == nil then t else ApplyPendingReactionModule(MessageReactions, (tonumber(LocalUserIdStore.getCurrentUserId(p2))))
				end, areReactionListsEqual)
				t2[Key] = Computed
				
				return Computed
			else
				return Entry
			end
		end,
		getReactionCounts = function(Key)
			-- upvalues: t3 (copy), t2 (copy), SignalsModule (upval), p1 (copy), t (upval), LocalUserIdStore (upval), ApplyPendingReactionModule (upval), areReactionListsEqual (upval), GetEmojiSetsStoreModule (upval), DashModule (upval)
			local Entry = t3[Key]
			
			if Entry ~= nil then
				return Entry
			end
			local Entry1 = t2[Key]
			local Callback = nil
			
			if Entry1 == nil then
				local Computed = SignalsModule.createComputed(function(p2)
					-- upvalues: p1 (upval), Key (copy), t (upval), LocalUserIdStore (upval), ApplyPendingReactionModule (upval)
					local MessageReactions = p1.getMessageReactions(Key, p2)
					
					return if MessageReactions == nil then t else ApplyPendingReactionModule(MessageReactions, (tonumber(LocalUserIdStore.getCurrentUserId(p2))))
				end, areReactionListsEqual)
				t2[Key] = Computed
				Callback = Computed
			else
				Callback = Entry1
			end
			local Computed = SignalsModule.createComputed(function(p2)
				-- upvalues: GetEmojiSetsStoreModule (upval), Callback (copy)
				local EmojiSetsStoreModule = GetEmojiSetsStoreModule(p2)
				local NewCounts = {}
				local Flag = false
				
				for _, value in Callback(p2) do
					local ReactionType = EmojiSetsStoreModule.getReactionType(value.emote_id, p2)
					
					if ReactionType ~= nil and value.count > 0 then
						NewCounts[ReactionType] = (NewCounts[ReactionType] or 0) + value.count
						Flag = true
					end
				end
				return if Flag then NewCounts else nil
			end, DashModule.shallowEqual)
			t3[Key] = Computed
			
			return Computed
		end,
		evictMessages = function(List)
			-- upvalues: t2 (copy), t3 (copy)
			for _, value in List do
				t2[value] = nil
				t3[value] = nil
			end
		end
	}
end