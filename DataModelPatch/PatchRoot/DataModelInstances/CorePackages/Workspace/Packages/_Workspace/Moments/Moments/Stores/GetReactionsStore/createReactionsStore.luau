local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local SignalsModule = require(Parent.Signals)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local ReactionActionModule = require(Moments.Enums.ReactionAction)
local MomentsGetMomentsReactionsStoreModule = require(Parent.DataHydration.MomentsGetMomentsReactionsStore)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local ReactionType = require(Parent.MomentsTypes).Enums.ReactionType
local t = {}

return function(p1)
	-- upvalues: MomentsGetMomentsReactionsStoreModule (copy), CreateSignalFunction (copy), t (copy), CreateComputedFunction (copy), ReactionType (copy), CryoModule (copy), ReactionActionModule (copy)
	local P0 = p1 or {}
	local MomentsGetMomentsReactionsStoreModuleResult = if P0.momentsReactionsStore == nil then MomentsGetMomentsReactionsStoreModule(false) else P0.momentsReactionsStore
	local Signal, Signal2 = CreateSignalFunction({})
	local Tbl = {}
	local Tbl1 = {}
	local Tbl2 = {}
	local Tbl3 = {}
	
	local function updateReaction(p2)
		-- upvalues: Signal (copy), ReactionActionModule (upval), CryoModule (upval), Signal2 (copy)
		local Action = p2.action
		local Reaction = p2.reaction
		local MomentId = p2.momentId
		local SignalResult = Signal(false)
		local SignalResultEntry = SignalResult[MomentId] or {}
		local UserReaction = SignalResultEntry.userReaction
		
		if Action == ReactionActionModule.Unreact and UserReaction then
			SignalResultEntry = CryoModule.Dictionary.join(SignalResultEntry, {
				[UserReaction] = math.max((SignalResultEntry[UserReaction] or 0) - 1, 0),
				userReaction = CryoModule.None
			})
		end
		if Action == ReactionActionModule.Switch and UserReaction and Reaction ~= nil then
			SignalResultEntry = CryoModule.Dictionary.join(SignalResultEntry, {
				[UserReaction] = math.max((SignalResultEntry[UserReaction] or 0) - 1, 0),
				[Reaction] = math.max((SignalResultEntry[Reaction] or 0) + 1, 1),
				userReaction = Reaction
			})
		end
		if Action == ReactionActionModule.React and not UserReaction and Reaction ~= nil then
			SignalResultEntry = CryoModule.Dictionary.join(SignalResultEntry, {
				[Reaction] = math.max((SignalResultEntry[Reaction] or 0) + 1, 1),
				userReaction = Reaction
			})
		end
		Signal2((CryoModule.Dictionary.union(SignalResult, { [MomentId] = SignalResultEntry })))
	end
	
	return {
		getReactionsByMomentId = Signal,
		getReactions = function(p2, p3)
			-- upvalues: Signal (copy), t (upval)
			return Signal(p3 or false)[p2] or t
		end,
		getReactionsForMoment = function(Key)
			-- upvalues: Tbl (copy), CreateComputedFunction (upval), Signal (copy), t (upval)
			if Tbl[Key] == nil then
				Tbl[Key] = CreateComputedFunction(function(p2)
					-- upvalues: Key (copy), Signal (upval), t (upval)
					return Signal(p2 or false)[Key] or t
				end)
			end
			return Tbl[Key]
		end,
		getUserReactionForMoment = function(Key)
			-- upvalues: Tbl1 (copy), CreateComputedFunction (upval), Signal (copy), t (upval)
			if Tbl1[Key] == nil then
				Tbl1[Key] = CreateComputedFunction(function(p2)
					-- upvalues: Key (copy), Signal (upval), t (upval)
					return (Signal(p2 or false)[Key] or t).userReaction
				end)
			end
			return Tbl1[Key]
		end,
		getTotalReactionCountForMoment = function(Key)
			-- upvalues: Tbl2 (copy), CreateComputedFunction (upval), Signal (copy), t (upval), ReactionType (upval)
			if Tbl2[Key] == nil then
				Tbl2[Key] = CreateComputedFunction(function(p2): number
					-- upvalues: Key (copy), Signal (upval), t (upval), ReactionType (upval)
					local Total = 0
					local SignalResultEntry = Signal(p2 or false)[Key] or t
					for _, value in ReactionType do
						Total += SignalResultEntry[value] or 0
					end
					return Total
				end)
			end
			return Tbl2[Key]
		end,
		getIndividualReactionCountsForMoment = function(Key)
			-- upvalues: Tbl3 (copy), CreateComputedFunction (upval), Signal (copy), t (upval), ReactionType (upval)
			if Tbl3[Key] == nil then
				Tbl3[Key] = CreateComputedFunction(function(p2)
					-- upvalues: Key (copy), Signal (upval), t (upval), ReactionType (upval)
					local SignalResultEntry = Signal(p2 or false)[Key] or t
					local List = {}
					
					for _, Reaction in ReactionType do
						local SignalResultEntry1: number = SignalResultEntry[Reaction]
						
						if SignalResultEntry1 ~= nil and SignalResultEntry1 > 0 then
							table.insert(List, { reaction = Reaction, count = SignalResultEntry1 })
						end
					end
					table.sort(List, function(A, B): boolean
						return if A.count == B.count then A.reaction < B.reaction else B.count < A.count
					end)
					
					return List
				end)
			end
			return Tbl3[Key]
		end,
		setBatchReactionCounts = function(List)
			-- upvalues: Signal (copy), Signal2 (copy)
			local SignalResult = Signal(false)
			local Copy = table.clone(SignalResult)
			
			for i, value in List do
				local SignalResultEntry = SignalResult[i]
				
				if SignalResultEntry == nil or SignalResultEntry.userReaction == nil or value.userReaction ~= nil then
					Copy[i] = value
				else
					local Copy1 = table.clone(value)
					local UserReaction = SignalResultEntry.userReaction
					Copy1.userReaction = UserReaction
					Copy1[UserReaction] = math.max(value[UserReaction] or 0, SignalResultEntry[UserReaction] or 0)
					Copy[i] = Copy1
				end
			end
			Signal2(Copy)
		end,
		setReactions = function(p2, p3)
			-- upvalues: Signal2 (copy), CryoModule (upval), Signal (copy)
			Signal2((CryoModule.Dictionary.union(Signal(false), { [p2] = p3 or {} })))
		end,
		clear = function()
			-- upvalues: Signal2 (copy), Tbl (copy), Tbl1 (copy), Tbl2 (copy), Tbl3 (copy)
			Signal2({})
			table.clear(Tbl)
			table.clear(Tbl1)
			table.clear(Tbl2)
			table.clear(Tbl3)
		end,
		updateReaction = updateReaction,
		reactToFeedItem = function(p2)
			-- upvalues: Signal (copy), t (upval), updateReaction (copy), ReactionActionModule (upval), MomentsGetMomentsReactionsStoreModuleResult (copy)
			local UserReaction = (Signal(false)[p2.entityId] or t).userReaction
			updateReaction({
				action = if UserReaction == nil or UserReaction == p2.reactionType then ReactionActionModule.React else ReactionActionModule.Switch,
				momentId = p2.entityId,
				reaction = p2.reactionType
			})
			
			return MomentsGetMomentsReactionsStoreModuleResult.reactToFeedItem(p2)
		end
	}
end