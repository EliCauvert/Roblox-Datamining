local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local signalsModule = require(parent.Signals)
local cryoModule = require(parent.Cryo)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local momentsTypesModule = require(parent.MomentsTypes)
local reactionActionModule = require(moments.Enums.ReactionAction)
local momentsGetMomentsReactionsStoreModule = require(parent.DataHydration.MomentsGetMomentsReactionsStore)
local momentsResolveEmoteIdModule = require(parent.DataHydration.MomentsResolveEmoteId)
local fFlagMomentsReactToFeedItemV2Module = require(moments.Flags.FFlagMomentsReactToFeedItemV2)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local reactionType = momentsTypesModule.Enums.ReactionType
local t = {}

return function(p0) --[[ line: 47 | named "createReactionsStore" ]]
	-- upvalues: momentsGetMomentsReactionsStoreModule (ref), createSignal (ref), t (ref), createComputed (ref), reactionType (ref), cryoModule (ref), reactionActionModule (ref), momentsResolveEmoteIdModule (ref), fFlagMomentsReactToFeedItemV2Module (ref)
	p0 = p0 or {}
	local var10 = if p0.momentsReactionsStore ~= nil then momentsGetMomentsReactionsStoreModule(false) else p0.momentsReactionsStore
	local var11, var12 = createSignal({})
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	
	local function getReactions(p1, p2) --[[ line: 59 ]]
		-- upvalues: var11 (ref), t (copy)
		return var11(p2 or false)[p1] or t
	end
	
	local function getReactionsForMoment(p3) --[[ line: 63 ]]
		-- upvalues: t_1 (ref), createComputed (copy), var11 (ref), t (copy)
		if t_1[p3] == nil then
			t_1[p3] = createComputed(function(p4) --[[ line: 65 ]]
				-- upvalues: p3 (ref), var11 (copy), t (copy)
				return var11(p4 or false)[p3] or t
			end)
		end
		return t_1[p3]
	end
	
	local function getUserReactionForMoment(p5) --[[ line: 72 ]]
		-- upvalues: t_2 (ref), createComputed (copy), var11 (ref), t (copy)
		if t_2[p5] == nil then
			t_2[p5] = createComputed(function(p6) --[[ line: 75 ]]
				-- upvalues: p5 (ref), var11 (copy), t (copy)
				return (var11(p6 or false)[p5] or t).userReaction
			end)
		end
		return t_2[p5]
	end
	
	local function getTotalReactionCountForMoment(p7) --[[ line: 83 ]]
		-- upvalues: t_3 (ref), createComputed (copy), var11 (ref), t (copy), reactionType (copy)
		if t_3[p7] == nil then
			t_3[p7] = createComputed(function(p8) --[[ line: 85 ]]
				-- upvalues: p7 (ref), var11 (copy), t (copy), reactionType (copy)
				local var27 = 0
				local var28 = var11(p8 or false)[p7] or t
				
				for i, v in reactionType do
					var27 += var28[v] or 0
				end
				return var27
			end)
		end
		return t_3[p7]
	end
	
	local function getIndividualReactionCountsForMoment(p9) --[[ line: 98 ]]
		-- upvalues: t_4 (ref), createComputed (copy), var11 (ref), t (copy), reactionType (copy)
		if t_4[p9] == nil then
			t_4[p9] = createComputed(function(p10) --[[ line: 100 ]]
				-- upvalues: p9 (ref), var11 (copy), t (copy), reactionType (copy)
				local var29 = var11(p10 or false)[p9] or t
				local t_1 = {}
				
				for i, v in reactionType do
					local var31 = var29[v]
					
					if var31 ~= nil and var31 > 0 then
						table.insert(t_1, { reaction = v, count = var31 })
					end
				end
				table.sort(t_1, function(p11, p12) --[[ line: 113 ]]
					return if p11.count == p12.count then p11.reaction < p12.reaction else p12.count < p11.count
				end)
				
				return t_1
			end)
		end
		return t_4[p9]
	end
	
	local function setBatchReactionCounts(value) --[[ line: 127 ]]
		-- upvalues: var11 (ref), var12 (ref)
		local var32 = var11(false)
		local cloned = table.clone(var32)
		
		for i, v in value do
			local var34 = var32[i]
			
			if var34 == nil or var34.userReaction == nil or v.userReaction ~= nil then
				cloned[i] = v
			else
				local cloned_1 = table.clone(v)
				local userReaction = var34.userReaction
				cloned_1.userReaction = userReaction
				cloned_1[userReaction] = math.max(v[userReaction] or 0, var34[userReaction] or 0)
				cloned[i] = cloned_1
			end
		end
		var12(cloned)
	end
	
	local function setReactions(value, p13) --[[ line: 148 ]]
		-- upvalues: var12 (ref), cryoModule (copy), var11 (ref)
		var12(cryoModule.Dictionary.union(var11(false), { [value] = p13 or {} }))
	end
	
	local function clear() --[[ line: 154 ]]
		-- upvalues: var12 (ref), t_1 (ref), t_2 (ref), t_3 (ref), t_4 (ref)
		var12({})
		table.clear(t_1)
		table.clear(t_2)
		table.clear(t_3)
		table.clear(t_4)
	end
	
	local function updateReaction(p14) --[[ line: 162 ]]
		-- upvalues: var11 (ref), reactionActionModule (copy), cryoModule (copy), var12 (ref)
		local action = p14.action
		local reaction = p14.reaction
		local momentId = p14.momentId
		local var36 = var11(false)
		local var37 = var36[momentId] or {}
		local userReaction = var37.userReaction
		
		if action == reactionActionModule.Unreact and userReaction then
			var37 = cryoModule.Dictionary.join(var37, {
				[userReaction] = math.max((var37[userReaction] or 0) - 1, 0),
				userReaction = cryoModule.None
			})
		end
		if action == reactionActionModule.Switch and userReaction and reaction ~= nil then
			var37 = cryoModule.Dictionary.join(var37, {
				[userReaction] = math.max((var37[userReaction] or 0) - 1, 0),
				[reaction] = math.max((var37[reaction] or 0) + 1, 1),
				userReaction = reaction
			})
		end
		if action == reactionActionModule.React and not userReaction and reaction ~= nil then
			var37 = cryoModule.Dictionary.join(var37, {
				[reaction] = math.max((var37[reaction] or 0) + 1, 1),
				userReaction = reaction
			})
		end
		var12(cryoModule.Dictionary.union(var36, { [momentId] = var37 }))
	end
	
	local function postReactToFeedItemV2(p15) --[[ line: 198 ]]
		-- upvalues: var10 (ref), momentsResolveEmoteIdModule (copy)
		local var38 = if var10.getEmojis ~= nil then {} else var10.getEmojis(false)
		local reactToFeedItemV2 = var10.reactToFeedItemV2
		assert(reactToFeedItemV2 ~= nil, "expected reactToFeedItemV2 when FFlagMomentsReactToFeedItemV2 is on")
		
		return reactToFeedItemV2({
			feedItemId = p15.feedItemId,
			reactionType = p15.reactionType,
			emoteId = momentsResolveEmoteIdModule.resolveEmoteIdForReaction(var38, p15.reactionType),
			feedSessionId = p15.feedSessionId
		})
	end
	
	return {
		getReactionsByMomentId = var11,
		getReactions = getReactions,
		getReactionsForMoment = getReactionsForMoment,
		getUserReactionForMoment = getUserReactionForMoment,
		getTotalReactionCountForMoment = getTotalReactionCountForMoment,
		getIndividualReactionCountsForMoment = getIndividualReactionCountsForMoment,
		setBatchReactionCounts = setBatchReactionCounts,
		setReactions = setReactions,
		clear = clear,
		updateReaction = updateReaction,
		reactToFeedItem = function(p16) --[[ line: 210 ]]
			-- upvalues: var11 (ref), t (copy), updateReaction (ref), reactionActionModule (copy), fFlagMomentsReactToFeedItemV2Module (copy), postReactToFeedItemV2 (ref), var10 (ref)
			local userReaction = (var11(false)[p16.entityId] or t).userReaction
			updateReaction({
				action = if userReaction == nil or userReaction == p16.reactionType then reactionActionModule.React else reactionActionModule.Switch,
				momentId = p16.entityId,
				reaction = p16.reactionType
			})
			
			return if fFlagMomentsReactToFeedItemV2Module then postReactToFeedItemV2(p16) else var10.reactToFeedItem(p16)
		end,
		removeFeedItemReaction = function(p17) --[[ line: 226 ]]
			-- upvalues: updateReaction (ref), reactionActionModule (copy), fFlagMomentsReactToFeedItemV2Module (copy), postReactToFeedItemV2 (ref)
			updateReaction({
				action = reactionActionModule.Unreact,
				momentId = p17.entityId,
				reaction = p17.reactionType
			})
			
			return if fFlagMomentsReactToFeedItemV2Module then postReactToFeedItemV2(p17) else nil
		end
	}
end