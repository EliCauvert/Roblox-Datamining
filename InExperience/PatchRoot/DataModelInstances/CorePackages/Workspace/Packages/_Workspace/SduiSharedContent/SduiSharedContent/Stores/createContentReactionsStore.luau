local DataHydrationModule = require(script:FindFirstAncestor("SduiSharedContent").Parent.DataHydration)
local _ = require(script.Parent.ContentReactionsStoreTypes)

local function _(p1, p2): boolean
	return p1.emoteId == p2.emoteId and (p1.reactionType == p2.reactionType and p1.reactionCount == p2.reactionCount) and p1.hasUserAppliedReaction == p2.hasUserAppliedReaction
end

local function areReactionListsEqual(ServerReactions, ServerReactions1): boolean
	if #ServerReactions ~= #ServerReactions1 then
		return false
	end
	for i, serverReaction in ServerReactions do
		local ServerReaction = ServerReactions1[i]
		
		if serverReaction.emoteId ~= ServerReaction.emoteId or (serverReaction.reactionType ~= ServerReaction.reactionType or (serverReaction.reactionCount ~= ServerReaction.reactionCount or serverReaction.hasUserAppliedReaction ~= ServerReaction.hasUserAppliedReaction)) then
			return false
		end
	end
	return true
end

local _ = function(List, p1): boolean
	for _, value in List do
		if value.emoteId == p1.emoteId then
			return value.hasUserAppliedReaction == p1.hasUserAppliedReaction
		end
	end
	return not p1.hasUserAppliedReaction
end

local function reconcile(DataResult, ServerReactions)
	-- upvalues: areReactionListsEqual (copy)
	if DataResult == nil then
		return { serverReactions = ServerReactions, emotes = {} }
	end
	if areReactionListsEqual(DataResult.serverReactions, ServerReactions) then
		return DataResult
	end
	local Emotes = {}
	
	for i, emote in DataResult.emotes do
		if emote.isPending then
			Emotes[i] = {
				restore = nil,
				isPending = true,
				reaction = emote.reaction,
				addedAt = emote.addedAt
			}
		end
	end
	return { serverReactions = ServerReactions, emotes = Emotes }
end

local function resolve(p2)
	local List = {}
	local t = {}
	
	for _, serverReaction in p2.serverReactions do
		t[serverReaction.emoteId] = true
		local Emote = p2.emotes[serverReaction.emoteId]
		table.insert(List, if Emote then Emote.reaction else serverReaction)
	end
	local List1 = {}
	
	for i, emote in p2.emotes do
		if not t[i] and emote.reaction.hasUserAppliedReaction then
			table.insert(List1, emote)
		end
	end
	table.sort(List1, function(A, B): boolean
		return A.addedAt < B.addedAt
	end)
	
	for _, value in List1 do
		table.insert(List, value.reaction)
	end
	return List
end

local _ = function(List): number
	local Largest = 1
	
	for _, value in List do
		Largest = math.max(Largest, value.addedAt + 1)
	end
	return Largest
end

local function applyReaction(p3, Restore, Reaction)
	local EmoteId = Reaction.emoteId
	local Emote = p3.emotes[EmoteId]
	local Copy = table.clone(p3.emotes)
	local config = { isPending = true, reaction = Reaction, restore = Restore }
	local AddedAt = nil
	
	if Emote then
		AddedAt = Emote.addedAt
	else
		local Largest = 1
		
		for _, emote in p3.emotes do
			Largest = math.max(Largest, emote.addedAt + 1)
		end
		AddedAt = Largest
	end
	config.addedAt = AddedAt
	Copy[EmoteId] = config
	
	return { serverReactions = p3.serverReactions, emotes = Copy }
end

local function settleReaction(DataResult, Key, p4)
	local Emote = DataResult.emotes[Key]
	
	if Emote == nil or not Emote.isPending then
		return DataResult
	end
	local Reaction = if p4 then Emote.reaction else Emote.restore
	
	if p4 and Emote.restore == nil then
		local Reaction1 = Emote.reaction
		local IsHasUserAppliedReactionMatch = nil
		
		for _, serverReaction in DataResult.serverReactions do
			if serverReaction.emoteId == Reaction1.emoteId then
				IsHasUserAppliedReactionMatch = serverReaction.hasUserAppliedReaction == Reaction1.hasUserAppliedReaction
				if IsHasUserAppliedReactionMatch then
					Reaction = nil
				end
			else
				continue
			end
		end
		IsHasUserAppliedReactionMatch = not Reaction1.hasUserAppliedReaction
	end
	local Copy = table.clone(DataResult.emotes)
	
	if Reaction then
		Copy[Key] = {
			restore = nil,
			isPending = false,
			reaction = Reaction,
			addedAt = Emote.addedAt
		}
	else
		Copy[Key] = nil
	end
	return {
		serverReactions = DataResult.serverReactions,
		emotes = Copy
	}
end

return function()
	-- upvalues: DataHydrationModule (copy), resolve (copy), reconcile (copy), settleReaction (copy), applyReaction (copy)
	local DataCache = DataHydrationModule.createDataCache()
	
	local function _(p5)
		-- upvalues: DataCache (copy)
		return DataCache.getItem(p5).data(false)
	end
	
	local _ = function(p5, Key, p6)
		-- upvalues: DataCache (copy), settleReaction (upval)
		local DataResult = DataCache.getItem(p5).data(false)
		
		if DataResult then
			DataCache.replaceItem(p5, (settleReaction(DataResult, Key, p6)))
		end
	end
	
	return {
		getContentReactions = function(p5)
			-- upvalues: DataCache (copy)
			return (DataCache.getItem(p5))
		end,
		getReactions = function(p5, ServerReactions)
			-- upvalues: DataCache (copy), resolve (upval), reconcile (upval)
			local DataResult = DataCache.getItem(p5).data(false)
			
			return if DataResult == nil then ServerReactions else resolve((reconcile(DataResult, ServerReactions)))
		end,
		isReactionPending = function(p5, p6)
			-- upvalues: DataCache (copy)
			local DataResult = DataCache.getItem(p5).data(false)
			local Emote = if DataResult then DataResult.emotes[p6] else nil
			
			return Emote ~= nil and Emote.isPending
		end,
		reconcileReactions = function(p5, ServerReactions)
			-- upvalues: DataCache (copy), reconcile (upval)
			local DataResult = DataCache.getItem(p5).data(false)
			
			if DataResult then
				local ReconcileResult = reconcile(DataResult, ServerReactions)
				
				if ReconcileResult ~= DataResult then
					DataCache.replaceItem(p5, ReconcileResult)
				end
			end
		end,
		updateReaction = function(p5, ServerReactions, Restore, Reaction, Promise)
			-- upvalues: DataCache (copy), applyReaction (upval), reconcile (upval), settleReaction (upval)
			local EmoteId = Reaction.emoteId
			DataCache.replaceItem(p5, (applyReaction(reconcile(DataCache.getItem(p5).data(false), ServerReactions), Restore, Reaction)))
			Promise:andThen(function()
				-- upvalues: p5 (copy), EmoteId (copy), DataCache (upval), settleReaction (upval)
				local DataResult = DataCache.getItem(p5).data(false)
				
				if DataResult then
					DataCache.replaceItem(p5, (settleReaction(DataResult, EmoteId, true)))
				end
			end, function()
				-- upvalues: p5 (copy), EmoteId (copy), DataCache (upval), settleReaction (upval)
				local DataResult = DataCache.getItem(p5).data(false)
				
				if DataResult then
					DataCache.replaceItem(p5, (settleReaction(DataResult, EmoteId, false)))
				end
			end)
		end,
		clear = DataCache.clear,
		dispose = DataCache.dispose
	}
end