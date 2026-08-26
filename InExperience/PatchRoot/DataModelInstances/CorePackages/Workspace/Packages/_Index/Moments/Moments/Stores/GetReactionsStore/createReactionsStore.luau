local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local signalsModule = require(parent.Signals)
local cryoModule = require(parent.Cryo)
local debounce = require(parent.Dash).debounce
local _ = require(parent.DataHydration.MomentsStoreTypes)
local momentsTypesModule = require(parent.MomentsTypes)
local reactionActionModule = require(moments.Enums.ReactionAction)
local momentsGetMomentsReactionsStoreModule = require(parent.DataHydration.MomentsGetMomentsReactionsStore)
local momentsResolveEmoteIdModule = require(parent.DataHydration.MomentsResolveEmoteId)
local fFlagMomentsReactToFeedItemV2Module = require(moments.Flags.FFlagMomentsReactToFeedItemV2)
local fFlagMomentsDebounceReactionsModule = require(moments.Flags.FFlagMomentsDebounceReactions)
local fIntMomentsReactionDebounceMsModule = require(moments.Flags.FIntMomentsReactionDebounceMs)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local reactionType = momentsTypesModule.Enums.ReactionType
local t = {}

return function(p1)
	-- upvalues: momentsGetMomentsReactionsStoreModule (ref), debounce (ref), createSignal (ref), t (ref), createComputed (ref), reactionType (ref), cryoModule (ref), fFlagMomentsDebounceReactionsModule (ref), reactionActionModule (ref), momentsResolveEmoteIdModule (ref), fFlagMomentsReactToFeedItemV2Module (ref), fIntMomentsReactionDebounceMsModule (ref)
	p1 = p1 or {}
	local var1 = if p1.momentsReactionsStore ~= nil then momentsGetMomentsReactionsStoreModule(false) else p1.momentsReactionsStore
	local debounce_1 = p1.debounce or debounce
	local var2, var3 = createSignal({})
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local t_6 = {}
	local var4 = 0
	
	local function getReactions(p2, p3)
		-- upvalues: var2 (ref), t (copy)
		return var2(p3 or false)[p2] or t
	end
	
	local function getReactionsForMoment(p2)
		-- upvalues: t_1 (ref), createComputed (copy), var2 (ref), t (copy)
		if t_1[p2] == nil then
			t_1[p2] = createComputed(function(p3)
				-- upvalues: p2 (ref), var2 (copy), t (copy)
				return var2(p3 or false)[p2] or t
			end)
		end
		return t_1[p2]
	end
	
	local function getUserReactionForMoment(p2)
		-- upvalues: t_2 (ref), createComputed (copy), var2 (ref), t (copy)
		if t_2[p2] == nil then
			t_2[p2] = createComputed(function(p3)
				-- upvalues: p2 (ref), var2 (copy), t (copy)
				return (var2(p3 or false)[p2] or t).userReaction
			end)
		end
		return t_2[p2]
	end
	
	local function getTotalReactionCountForMoment(p2)
		-- upvalues: t_3 (ref), createComputed (copy), var2 (ref), t (copy), reactionType (copy)
		if t_3[p2] == nil then
			t_3[p2] = createComputed(function(p3)
				-- upvalues: p2 (ref), var2 (copy), t (copy), reactionType (copy)
				local var5 = 0
				local var6 = var2(p3 or false)[p2] or t
				
				for i, v in reactionType do
					var5 += var6[v] or 0
				end
				return var5
			end)
		end
		return t_3[p2]
	end
	
	local function getIndividualReactionCountsForMoment(p3)
		-- upvalues: t_4 (ref), createComputed (copy), var2 (ref), t (copy), reactionType (copy)
		if t_4[p3] == nil then
			t_4[p3] = createComputed(function(p4)
				-- upvalues: p3 (ref), var2 (copy), t (copy), reactionType (copy)
				local var5 = var2(p4 or false)[p3] or t
				local t_1 = {}
				
				for i, v in reactionType do
					local var6 = var5[v]
					
					if var6 ~= nil and var6 > 0 then
						table.insert(t_1, { reaction = v, count = var6 })
					end
				end
				table.sort(t_1, function(p5, p6)
					return if p5.count == p6.count then p5.reaction < p6.reaction else p6.count < p5.count
				end)
				
				return t_1
			end)
		end
		return t_4[p3]
	end
	
	local function setBatchReactionCounts(value)
		-- upvalues: var2 (ref), var3 (ref)
		local var5 = var2(false)
		local cloned = table.clone(var5)
		
		for i, v in value do
			local var6 = var5[i]
			
			if var6 == nil or var6.userReaction == nil or v.userReaction ~= nil then
				cloned[i] = v
			else
				local cloned_1 = table.clone(v)
				local userReaction = var6.userReaction
				cloned_1.userReaction = userReaction
				cloned_1[userReaction] = math.max(v[userReaction] or 0, var6[userReaction] or 0)
				cloned[i] = cloned_1
			end
		end
		var3(cloned)
	end
	
	local function setReactions(value, p4)
		-- upvalues: var3 (ref), cryoModule (copy), var2 (ref)
		var3(cryoModule.Dictionary.union(var2(false), { [value] = p4 or {} }))
	end
	
	local function clear()
		-- upvalues: fFlagMomentsDebounceReactionsModule (copy), var4 (write), t_5 (ref), t_6 (ref), var3 (ref), t_1 (ref), t_2 (ref), t_3 (ref), t_4 (ref)
		if fFlagMomentsDebounceReactionsModule then
			var4 += 1
			table.clear(t_5)
			table.clear(t_6)
		end
		var3({})
		table.clear(t_1)
		table.clear(t_2)
		table.clear(t_3)
		table.clear(t_4)
	end
	
	local function updateReaction(p4)
		-- upvalues: var2 (ref), reactionActionModule (copy), cryoModule (copy), var3 (ref)
		local action = p4.action
		local reaction = p4.reaction
		local momentId = p4.momentId
		local var7 = var2(false)
		local var8 = var7[momentId] or {}
		local userReaction = var8.userReaction
		
		if action == reactionActionModule.Unreact and userReaction then
			var8 = cryoModule.Dictionary.join(var8, {
				[userReaction] = math.max((var8[userReaction] or 0) - 1, 0),
				userReaction = cryoModule.None
			})
		end
		if action == reactionActionModule.Switch and userReaction and reaction ~= nil then
			var8 = cryoModule.Dictionary.join(var8, {
				[userReaction] = math.max((var8[userReaction] or 0) - 1, 0),
				[reaction] = math.max((var8[reaction] or 0) + 1, 1),
				userReaction = reaction
			})
		end
		if action == reactionActionModule.React and not userReaction and reaction ~= nil then
			var8 = cryoModule.Dictionary.join(var8, {
				[reaction] = math.max((var8[reaction] or 0) + 1, 1),
				userReaction = reaction
			})
		end
		var3(cryoModule.Dictionary.union(var7, { [momentId] = var8 }))
	end
	
	local function postReactToFeedItemV2(p4)
		-- upvalues: var1 (ref), momentsResolveEmoteIdModule (copy)
		local var7 = if var1.getEmojis ~= nil then {} else var1.getEmojis(false)
		local reactToFeedItemV2 = var1.reactToFeedItemV2
		assert(reactToFeedItemV2 ~= nil, "expected reactToFeedItemV2 when FFlagMomentsReactToFeedItemV2 is on")
		
		return reactToFeedItemV2({
			feedItemId = p4.feedItemId,
			reactionType = p4.reactionType,
			emoteId = momentsResolveEmoteIdModule.resolveEmoteIdForReaction(var7, p4.reactionType),
			feedSessionId = p4.feedSessionId
		})
	end
	
	local function postReactionRequest(p4)
		-- upvalues: fFlagMomentsReactToFeedItemV2Module (copy), postReactToFeedItemV2 (ref), var1 (ref)
		return if fFlagMomentsReactToFeedItemV2Module then postReactToFeedItemV2(p4) else var1.reactToFeedItem(p4)
	end
	
	local function flushSync(p4, p5, p6, p7)
		-- upvalues: t_5 (ref), var2 (ref), t (copy), fFlagMomentsReactToFeedItemV2Module (copy), postReactToFeedItemV2 (ref), var1 (ref)
		local var7 = t_5[p4]
		local var8 = if var7 ~= nil then nil else var7.reaction
		local userReaction = (var2(false)[p4] or t).userReaction
		
		if userReaction == var8 then return end
		local var9 = if userReaction ~= nil then var8 else userReaction
		t_5[p4] = { reaction = userReaction }
		local t_1 = {
			feedItemId = p5,
			entityType = p6,
			entityId = p4,
			reactionType = var9,
			feedSessionId = p7
		}
		local var10 = if fFlagMomentsReactToFeedItemV2Module then postReactToFeedItemV2(t_1) else var1.reactToFeedItem(t_1)
		
		if type(var10) == "table" and var10.catch ~= nil then
			var10:catch(function() end)
		end
	end
	
	local function _(p4)
		-- upvalues: t_5 (ref), var2 (ref), t (copy)
		if t_5[p4] == nil then
			t_5[p4] = { reaction = (var2(false)[p4] or t).userReaction }
		end
	end
	
	local _ = function(p4)
		-- upvalues: t_6 (ref), var4 (write), debounce_1 (ref), flushSync (ref), fIntMomentsReactionDebounceMsModule (copy)
		local entityId = p4.entityId
		local var7 = t_6[entityId]
		
		if var7 == nil then
			local var8 = var4
			var7 = debounce_1(function(p5, p6, p7)
				-- upvalues: var8 (ref), var4 (copy), flushSync (copy), entityId (ref)
				if var8 == var4 then
					flushSync(entityId, p5, p6, p7)
					
					return
				end
			end, fIntMomentsReactionDebounceMsModule / 1000)
			t_6[entityId] = var7
		end
		var7(p4.feedItemId, p4.entityType, p4.feedSessionId)
	end
	
	return {
		getReactionsByMomentId = var2,
		getReactions = getReactions,
		getReactionsForMoment = getReactionsForMoment,
		getUserReactionForMoment = getUserReactionForMoment,
		getTotalReactionCountForMoment = getTotalReactionCountForMoment,
		getIndividualReactionCountsForMoment = getIndividualReactionCountsForMoment,
		setBatchReactionCounts = setBatchReactionCounts,
		setReactions = setReactions,
		clear = clear,
		updateReaction = updateReaction,
		reactToFeedItem = function(p4)
			-- upvalues: var2 (ref), t (copy), fFlagMomentsDebounceReactionsModule (copy), t_5 (ref), updateReaction (ref), reactionActionModule (copy), t_6 (ref), var4 (write), debounce_1 (ref), flushSync (ref), fIntMomentsReactionDebounceMsModule (copy), postReactionRequest (ref)
			local userReaction = (var2(false)[p4.entityId] or t).userReaction
			
			if fFlagMomentsDebounceReactionsModule then
				local entityId = p4.entityId
				
				if t_5[entityId] == nil then
					t_5[entityId] = { reaction = (var2(false)[entityId] or t).userReaction }
				end
			end
			updateReaction({
				action = if userReaction == nil or userReaction == p4.reactionType then reactionActionModule.React else reactionActionModule.Switch,
				momentId = p4.entityId,
				reaction = p4.reactionType
			})
			
			if not fFlagMomentsDebounceReactionsModule then
				return postReactionRequest(p4)
			end
			local entityId = p4.entityId
			local var7 = t_6[entityId]
			
			if var7 == nil then
				local var8 = var4
				var7 = debounce_1(function(p5, p6, p7)
					-- upvalues: var8 (ref), var4 (copy), flushSync (copy), entityId (ref)
					if var8 == var4 then
						flushSync(entityId, p5, p6, p7)
						
						return
					end
				end, fIntMomentsReactionDebounceMsModule / 1000)
				t_6[entityId] = var7
			end
			var7(p4.feedItemId, p4.entityType, p4.feedSessionId)
			
			return nil
		end,
		removeFeedItemReaction = function(p4)
			-- upvalues: fFlagMomentsDebounceReactionsModule (copy), t_5 (ref), var2 (ref), t (copy), updateReaction (ref), reactionActionModule (copy), t_6 (ref), var4 (write), debounce_1 (ref), flushSync (ref), fIntMomentsReactionDebounceMsModule (copy), fFlagMomentsReactToFeedItemV2Module (copy), postReactToFeedItemV2 (ref)
			if fFlagMomentsDebounceReactionsModule then
				local entityId = p4.entityId
				
				if t_5[entityId] == nil then
					t_5[entityId] = { reaction = (var2(false)[entityId] or t).userReaction }
				end
			end
			updateReaction({
				action = reactionActionModule.Unreact,
				momentId = p4.entityId,
				reaction = p4.reactionType
			})
			
			if fFlagMomentsDebounceReactionsModule then
				local entityId = p4.entityId
				local var7 = t_6[entityId]
				
				if var7 == nil then
					local var8 = var4
					var7 = debounce_1(function(p5, p6, p7)
						-- upvalues: var8 (ref), var4 (copy), flushSync (copy), entityId (ref)
						if var8 == var4 then
							flushSync(entityId, p5, p6, p7)
							
							return
						end
					end, fIntMomentsReactionDebounceMsModule / 1000)
					t_6[entityId] = var7
				end
				var7(p4.feedItemId, p4.entityType, p4.feedSessionId)
				
				return nil
			else
				return if fFlagMomentsReactToFeedItemV2Module then postReactToFeedItemV2(p4) else nil
			end
		end
	}
end