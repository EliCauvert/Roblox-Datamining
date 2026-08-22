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

return function(p0) --[[ line: 60 | named "createReactionsStore" ]]
	-- upvalues: momentsGetMomentsReactionsStoreModule (ref), debounce (ref), createSignal (ref), t (ref), createComputed (ref), reactionType (ref), cryoModule (ref), fFlagMomentsDebounceReactionsModule (ref), reactionActionModule (ref), momentsResolveEmoteIdModule (ref), fFlagMomentsReactToFeedItemV2Module (ref), fIntMomentsReactionDebounceMsModule (ref)
	p0 = p0 or {}
	local var12 = if p0.momentsReactionsStore ~= nil then momentsGetMomentsReactionsStoreModule(false) else p0.momentsReactionsStore
	local debounce_1 = p0.debounce or debounce
	local var14, var15 = createSignal({})
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local t_6 = {}
	local var22 = 0
	
	local function getReactions(p1, p2) --[[ line: 85 ]]
		-- upvalues: var14 (ref), t (copy)
		return var14(p2 or false)[p1] or t
	end
	
	local function getReactionsForMoment(p3) --[[ line: 89 ]]
		-- upvalues: t_1 (ref), createComputed (copy), var14 (ref), t (copy)
		if t_1[p3] == nil then
			t_1[p3] = createComputed(function(p4) --[[ line: 91 ]]
				-- upvalues: p3 (ref), var14 (copy), t (copy)
				return var14(p4 or false)[p3] or t
			end)
		end
		return t_1[p3]
	end
	
	local function getUserReactionForMoment(p5) --[[ line: 98 ]]
		-- upvalues: t_2 (ref), createComputed (copy), var14 (ref), t (copy)
		if t_2[p5] == nil then
			t_2[p5] = createComputed(function(p6) --[[ line: 101 ]]
				-- upvalues: p5 (ref), var14 (copy), t (copy)
				return (var14(p6 or false)[p5] or t).userReaction
			end)
		end
		return t_2[p5]
	end
	
	local function getTotalReactionCountForMoment(p7) --[[ line: 109 ]]
		-- upvalues: t_3 (ref), createComputed (copy), var14 (ref), t (copy), reactionType (copy)
		if t_3[p7] == nil then
			t_3[p7] = createComputed(function(p8) --[[ line: 111 ]]
				-- upvalues: p7 (ref), var14 (copy), t (copy), reactionType (copy)
				local var35 = 0
				local var36 = var14(p8 or false)[p7] or t
				
				for i, v in reactionType do
					var35 += var36[v] or 0
				end
				return var35
			end)
		end
		return t_3[p7]
	end
	
	local function getIndividualReactionCountsForMoment(p9) --[[ line: 124 ]]
		-- upvalues: t_4 (ref), createComputed (copy), var14 (ref), t (copy), reactionType (copy)
		if t_4[p9] == nil then
			t_4[p9] = createComputed(function(p10) --[[ line: 126 ]]
				-- upvalues: p9 (ref), var14 (copy), t (copy), reactionType (copy)
				local var37 = var14(p10 or false)[p9] or t
				local t_1 = {}
				
				for i, v in reactionType do
					local var39 = var37[v]
					
					if var39 ~= nil and var39 > 0 then
						table.insert(t_1, { reaction = v, count = var39 })
					end
				end
				table.sort(t_1, function(p11, p12) --[[ line: 139 ]]
					return if p11.count == p12.count then p11.reaction < p12.reaction else p12.count < p11.count
				end)
				
				return t_1
			end)
		end
		return t_4[p9]
	end
	
	local function setBatchReactionCounts(value) --[[ line: 153 ]]
		-- upvalues: var14 (ref), var15 (ref)
		local var40 = var14(false)
		local cloned = table.clone(var40)
		
		for i, v in value do
			local var42 = var40[i]
			
			if var42 == nil or var42.userReaction == nil or v.userReaction ~= nil then
				cloned[i] = v
			else
				local cloned_1 = table.clone(v)
				local userReaction = var42.userReaction
				cloned_1.userReaction = userReaction
				cloned_1[userReaction] = math.max(v[userReaction] or 0, var42[userReaction] or 0)
				cloned[i] = cloned_1
			end
		end
		var15(cloned)
	end
	
	local function setReactions(value, p13) --[[ line: 174 ]]
		-- upvalues: var15 (ref), cryoModule (copy), var14 (ref)
		var15(cryoModule.Dictionary.union(var14(false), { [value] = p13 or {} }))
	end
	
	local function clear() --[[ line: 180 ]]
		-- upvalues: fFlagMomentsDebounceReactionsModule (copy), var22 (write), t_5 (ref), t_6 (ref), var15 (ref), t_1 (ref), t_2 (ref), t_3 (ref), t_4 (ref)
		if fFlagMomentsDebounceReactionsModule then
			var22 += 1
			table.clear(t_5)
			table.clear(t_6)
		end
		var15({})
		table.clear(t_1)
		table.clear(t_2)
		table.clear(t_3)
		table.clear(t_4)
	end
	
	local function updateReaction(p14) --[[ line: 195 ]]
		-- upvalues: var14 (ref), reactionActionModule (copy), cryoModule (copy), var15 (ref)
		local action = p14.action
		local reaction = p14.reaction
		local momentId = p14.momentId
		local var44 = var14(false)
		local var45 = var44[momentId] or {}
		local userReaction = var45.userReaction
		
		if action == reactionActionModule.Unreact and userReaction then
			var45 = cryoModule.Dictionary.join(var45, {
				[userReaction] = math.max((var45[userReaction] or 0) - 1, 0),
				userReaction = cryoModule.None
			})
		end
		if action == reactionActionModule.Switch and userReaction and reaction ~= nil then
			var45 = cryoModule.Dictionary.join(var45, {
				[userReaction] = math.max((var45[userReaction] or 0) - 1, 0),
				[reaction] = math.max((var45[reaction] or 0) + 1, 1),
				userReaction = reaction
			})
		end
		if action == reactionActionModule.React and not userReaction and reaction ~= nil then
			var45 = cryoModule.Dictionary.join(var45, {
				[reaction] = math.max((var45[reaction] or 0) + 1, 1),
				userReaction = reaction
			})
		end
		var15(cryoModule.Dictionary.union(var44, { [momentId] = var45 }))
	end
	
	local function postReactToFeedItemV2(p15) --[[ line: 231 ]]
		-- upvalues: var12 (ref), momentsResolveEmoteIdModule (copy)
		local var46 = if var12.getEmojis ~= nil then {} else var12.getEmojis(false)
		local reactToFeedItemV2 = var12.reactToFeedItemV2
		assert(reactToFeedItemV2 ~= nil, "expected reactToFeedItemV2 when FFlagMomentsReactToFeedItemV2 is on")
		
		return reactToFeedItemV2({
			feedItemId = p15.feedItemId,
			reactionType = p15.reactionType,
			emoteId = momentsResolveEmoteIdModule.resolveEmoteIdForReaction(var46, p15.reactionType),
			feedSessionId = p15.feedSessionId
		})
	end
	
	local function postReactionRequest(p16) --[[ line: 243 ]]
		-- upvalues: fFlagMomentsReactToFeedItemV2Module (copy), postReactToFeedItemV2 (ref), var12 (ref)
		return if fFlagMomentsReactToFeedItemV2Module then postReactToFeedItemV2(p16) else var12.reactToFeedItem(p16)
	end
	
	local function flushSync(p17, p18, p19, p20) --[[ line: 255 ]]
		-- upvalues: t_5 (ref), var14 (ref), t (copy), fFlagMomentsReactToFeedItemV2Module (copy), postReactToFeedItemV2 (ref), var12 (ref)
		local var47 = t_5[p17]
		local var48 = if var47 ~= nil then nil else var47.reaction
		local userReaction = (var14(false)[p17] or t).userReaction
		
		if userReaction == var48 then return end
		local var49 = if userReaction ~= nil then var48 else userReaction
		t_5[p17] = { reaction = userReaction }
		local t_1 = {
			feedItemId = p18,
			entityType = p19,
			entityId = p17,
			reactionType = var49,
			feedSessionId = p20
		}
		local var51 = if fFlagMomentsReactToFeedItemV2Module then postReactToFeedItemV2(t_1) else var12.reactToFeedItem(t_1)
		
		if type(var51) == "table" and var51.catch ~= nil then
			var51:catch(function() --[[ line: 279 ]] end)
		end
	end
	
	local function _(p21) --[[ line: 285 | named "seedSyncBaseline" ]]
		-- upvalues: t_5 (ref), var14 (ref), t (copy)
		if t_5[p21] == nil then
			t_5[p21] = { reaction = (var14(false)[p21] or t).userReaction }
		end
	end
	
	local _ = function(p22) --[[ line: 294 | named "scheduleSync" ]]
		-- upvalues: t_6 (ref), var22 (write), debounce_1 (ref), flushSync (ref), fIntMomentsReactionDebounceMsModule (copy)
		local entityId = p22.entityId
		local var52 = t_6[entityId]
		
		if var52 == nil then
			local var53 = var22
			var52 = debounce_1(function(p23, p24, p25) --[[ line: 302 ]]
				-- upvalues: var53 (ref), var22 (copy), flushSync (copy), entityId (ref)
				if var53 == var22 then
					flushSync(entityId, p23, p24, p25)
					
					return
				end
			end, fIntMomentsReactionDebounceMsModule / 1000)
			t_6[entityId] = var52
		end
		var52(p22.feedItemId, p22.entityType, p22.feedSessionId)
	end
	
	return {
		getReactionsByMomentId = var14,
		getReactions = getReactions,
		getReactionsForMoment = getReactionsForMoment,
		getUserReactionForMoment = getUserReactionForMoment,
		getTotalReactionCountForMoment = getTotalReactionCountForMoment,
		getIndividualReactionCountsForMoment = getIndividualReactionCountsForMoment,
		setBatchReactionCounts = setBatchReactionCounts,
		setReactions = setReactions,
		clear = clear,
		updateReaction = updateReaction,
		reactToFeedItem = function(p26) --[[ line: 313 ]]
			-- upvalues: var14 (ref), t (copy), fFlagMomentsDebounceReactionsModule (copy), t_5 (ref), updateReaction (ref), reactionActionModule (copy), t_6 (ref), var22 (write), debounce_1 (ref), flushSync (ref), fIntMomentsReactionDebounceMsModule (copy), postReactionRequest (ref)
			local userReaction = (var14(false)[p26.entityId] or t).userReaction
			
			if fFlagMomentsDebounceReactionsModule then
				local entityId = p26.entityId
				
				if t_5[entityId] == nil then
					t_5[entityId] = { reaction = (var14(false)[entityId] or t).userReaction }
				end
			end
			updateReaction({
				action = if userReaction == nil or userReaction == p26.reactionType then reactionActionModule.React else reactionActionModule.Switch,
				momentId = p26.entityId,
				reaction = p26.reactionType
			})
			
			if not fFlagMomentsDebounceReactionsModule then
				return postReactionRequest(p26)
			end
			local entityId = p26.entityId
			local var54 = t_6[entityId]
			
			if var54 == nil then
				local var55 = var22
				var54 = debounce_1(function(p27, p28, p29) --[[ line: 302 ]]
					-- upvalues: var55 (ref), var22 (copy), flushSync (copy), entityId (ref)
					if var55 == var22 then
						flushSync(entityId, p27, p28, p29)
						
						return
					end
				end, fIntMomentsReactionDebounceMsModule / 1000)
				t_6[entityId] = var54
			end
			var54(p26.feedItemId, p26.entityType, p26.feedSessionId)
			
			return nil
		end,
		removeFeedItemReaction = function(p30) --[[ line: 333 ]]
			-- upvalues: fFlagMomentsDebounceReactionsModule (copy), t_5 (ref), var14 (ref), t (copy), updateReaction (ref), reactionActionModule (copy), t_6 (ref), var22 (write), debounce_1 (ref), flushSync (ref), fIntMomentsReactionDebounceMsModule (copy), fFlagMomentsReactToFeedItemV2Module (copy), postReactToFeedItemV2 (ref)
			if fFlagMomentsDebounceReactionsModule then
				local entityId = p30.entityId
				
				if t_5[entityId] == nil then
					t_5[entityId] = { reaction = (var14(false)[entityId] or t).userReaction }
				end
			end
			updateReaction({
				action = reactionActionModule.Unreact,
				momentId = p30.entityId,
				reaction = p30.reactionType
			})
			
			if fFlagMomentsDebounceReactionsModule then
				local entityId = p30.entityId
				local var56 = t_6[entityId]
				
				if var56 == nil then
					local var57 = var22
					var56 = debounce_1(function(p31, p32, p33) --[[ line: 302 ]]
						-- upvalues: var57 (ref), var22 (copy), flushSync (copy), entityId (ref)
						if var57 == var22 then
							flushSync(entityId, p31, p32, p33)
							
							return
						end
					end, fIntMomentsReactionDebounceMsModule / 1000)
					t_6[entityId] = var56
				end
				var56(p30.feedItemId, p30.entityType, p30.feedSessionId)
				
				return nil
			else
				return if fFlagMomentsReactToFeedItemV2Module then postReactToFeedItemV2(p30) else nil
			end
		end
	}
end