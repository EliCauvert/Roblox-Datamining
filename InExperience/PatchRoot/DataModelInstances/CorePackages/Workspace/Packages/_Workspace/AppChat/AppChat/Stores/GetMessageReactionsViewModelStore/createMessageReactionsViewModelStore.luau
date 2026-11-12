local Parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(Parent.AppChatNetworking)
local DashModule = require(Parent.Dash)
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local SignalsModule = require(Parent.Signals)
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
	-- upvalues: SignalsModule (copy), t (copy), LocalUserIdStore (copy), ApplyPendingReactionModule (copy), areReactionListsEqual (copy)
	local t2 = {}
	
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
		evictMessages = function(List)
			-- upvalues: t2 (copy)
			for _, value in List do
				t2[value] = nil
			end
		end
	}
end