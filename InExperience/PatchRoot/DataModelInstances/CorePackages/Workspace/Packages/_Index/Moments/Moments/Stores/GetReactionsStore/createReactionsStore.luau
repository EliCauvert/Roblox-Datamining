local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local signalsModule = require(parent.Signals)
local cryoModule = require(parent.Cryo)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local momentsTypesModule = require(parent.MomentsTypes)
local reactionActionModule = require(moments.Enums.ReactionAction)
local momentsGetMomentsReactionsStoreModule = require(parent.DataHydration.MomentsGetMomentsReactionsStore)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local reactionType = momentsTypesModule.Enums.ReactionType
local t = {}

return function(p0) --[[ line: 44 | named "createReactionsStore" ]]
	-- upvalues: momentsGetMomentsReactionsStoreModule (ref), createSignal (ref), t (ref), createComputed (ref), reactionType (ref), cryoModule (ref), reactionActionModule (ref)
	p0 = p0 or {}
	local var8 = if p0.momentsReactionsStore ~= nil then momentsGetMomentsReactionsStoreModule(false) else p0.momentsReactionsStore
	local var9, var10 = createSignal({})
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	
	local function updateReaction(p1) --[[ line: 159 ]]
		-- upvalues: var9 (ref), reactionActionModule (copy), cryoModule (copy), var10 (ref)
		local action = p1.action
		local reaction = p1.reaction
		local momentId = p1.momentId
		local var16 = var9(false)
		local var17 = var16[momentId] or {}
		local userReaction = var17.userReaction
		
		if action == reactionActionModule.Unreact and userReaction then
			var17 = cryoModule.Dictionary.join(var17, {
				[userReaction] = math.max((var17[userReaction] or 0) - 1, 0),
				userReaction = cryoModule.None
			})
		end
		if action == reactionActionModule.Switch and userReaction and reaction ~= nil then
			var17 = cryoModule.Dictionary.join(var17, {
				[userReaction] = math.max((var17[userReaction] or 0) - 1, 0),
				[reaction] = math.max((var17[reaction] or 0) + 1, 1),
				userReaction = reaction
			})
		end
		if action == reactionActionModule.React and not userReaction and reaction ~= nil then
			var17 = cryoModule.Dictionary.join(var17, {
				[reaction] = math.max((var17[reaction] or 0) + 1, 1),
				userReaction = reaction
			})
		end
		var10(cryoModule.Dictionary.union(var16, { [momentId] = var17 }))
	end
	
	return {
		getReactionsByMomentId = var9,
		getReactions = function(p2, p3) --[[ line: 56 ]]
			-- upvalues: var9 (ref), t (copy)
			return var9(p3 or false)[p2] or t
		end,
		getReactionsForMoment = function(p4) --[[ line: 60 ]]
			-- upvalues: t_1 (ref), createComputed (copy), var9 (ref), t (copy)
			if t_1[p4] == nil then
				t_1[p4] = createComputed(function(p5) --[[ line: 62 ]]
					-- upvalues: p4 (ref), var9 (copy), t (copy)
					return var9(p5 or false)[p4] or t
				end)
			end
			return t_1[p4]
		end,
		getUserReactionForMoment = function(p6) --[[ line: 69 ]]
			-- upvalues: t_2 (ref), createComputed (copy), var9 (ref), t (copy)
			if t_2[p6] == nil then
				t_2[p6] = createComputed(function(p7) --[[ line: 72 ]]
					-- upvalues: p6 (ref), var9 (copy), t (copy)
					return (var9(p7 or false)[p6] or t).userReaction
				end)
			end
			return t_2[p6]
		end,
		getTotalReactionCountForMoment = function(p8) --[[ line: 80 ]]
			-- upvalues: t_3 (ref), createComputed (copy), var9 (ref), t (copy), reactionType (copy)
			if t_3[p8] == nil then
				t_3[p8] = createComputed(function(p9) --[[ line: 82 ]]
					-- upvalues: p8 (ref), var9 (copy), t (copy), reactionType (copy)
					local var18 = 0
					local var19 = var9(p9 or false)[p8] or t
					
					for i, v in reactionType do
						var18 += var19[v] or 0
					end
					return var18
				end)
			end
			return t_3[p8]
		end,
		getIndividualReactionCountsForMoment = function(p10) --[[ line: 95 ]]
			-- upvalues: t_4 (ref), createComputed (copy), var9 (ref), t (copy), reactionType (copy)
			if t_4[p10] == nil then
				t_4[p10] = createComputed(function(p11) --[[ line: 97 ]]
					-- upvalues: p10 (ref), var9 (copy), t (copy), reactionType (copy)
					local var20 = var9(p11 or false)[p10] or t
					local t_1 = {}
					
					for i, v in reactionType do
						local var22 = var20[v]
						
						if var22 ~= nil and var22 > 0 then
							table.insert(t_1, { reaction = v, count = var22 })
						end
					end
					table.sort(t_1, function(p12, p13) --[[ line: 110 ]]
						return if p12.count == p13.count then p12.reaction < p13.reaction else p13.count < p12.count
					end)
					
					return t_1
				end)
			end
			return t_4[p10]
		end,
		setBatchReactionCounts = function(value) --[[ line: 124 ]]
			-- upvalues: var9 (ref), var10 (ref)
			local var23 = var9(false)
			local cloned = table.clone(var23)
			
			for i, v in value do
				local var25 = var23[i]
				
				if var25 == nil or var25.userReaction == nil or v.userReaction ~= nil then
					cloned[i] = v
				else
					local cloned_1 = table.clone(v)
					local userReaction = var25.userReaction
					cloned_1.userReaction = userReaction
					cloned_1[userReaction] = math.max(v[userReaction] or 0, var25[userReaction] or 0)
					cloned[i] = cloned_1
				end
			end
			var10(cloned)
		end,
		setReactions = function(value, p14) --[[ line: 145 ]]
			-- upvalues: var10 (ref), cryoModule (copy), var9 (ref)
			var10(cryoModule.Dictionary.union(var9(false), { [value] = p14 or {} }))
		end,
		clear = function() --[[ line: 151 ]]
			-- upvalues: var10 (ref), t_1 (ref), t_2 (ref), t_3 (ref), t_4 (ref)
			var10({})
			table.clear(t_1)
			table.clear(t_2)
			table.clear(t_3)
			table.clear(t_4)
		end,
		updateReaction = updateReaction,
		reactToFeedItem = function(p15) --[[ line: 195 ]]
			-- upvalues: var9 (ref), t (copy), updateReaction (ref), reactionActionModule (copy), var8 (ref)
			local userReaction = (var9(false)[p15.entityId] or t).userReaction
			updateReaction({
				action = if userReaction == nil or userReaction == p15.reactionType then reactionActionModule.React else reactionActionModule.Switch,
				momentId = p15.entityId,
				reaction = p15.reactionType
			})
			
			return var8.reactToFeedItem(p15)
		end
	}
end