local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local SignalsModule = require(Parent.Signals)
local CryoModule = require(Parent.Cryo)
local Debounce = require(Parent.Dash).debounce
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local ReactionActionModule = require(Moments.Enums.ReactionAction)
local MomentsGetMomentsReactionsStoreModule = require(Parent.DataHydration.MomentsGetMomentsReactionsStore)
local MomentsResolveEmoteIdModule = require(Parent.DataHydration.MomentsResolveEmoteId)
local FFlagMomentsReactToFeedItemV2Module = require(Moments.Flags.FFlagMomentsReactToFeedItemV2)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local ReactionType = require(Parent.MomentsTypes).Enums.ReactionType
local t = {}

return function(p1)
	-- upvalues: MomentsGetMomentsReactionsStoreModule (copy), Debounce (copy), CreateSignalFunction (copy), t (copy), CreateComputedFunction (copy), ReactionType (copy), CryoModule (copy), ReactionActionModule (copy), MomentsResolveEmoteIdModule (copy), FFlagMomentsReactToFeedItemV2Module (copy)
	local P0 = p1 or {}
	local MomentsGetMomentsReactionsStoreModuleResult = if P0.momentsReactionsStore == nil then MomentsGetMomentsReactionsStoreModule(false) else P0.momentsReactionsStore
	local Debounce1 = P0.debounce or Debounce
	local Signal, Signal2 = CreateSignalFunction({})
	local Tbl = {}
	local Tbl1 = {}
	local Tbl2 = {}
	local Tbl3 = {}
	local Tbl4 = {}
	local Tbl5 = {}
	local Count = 0
	
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
	
	local function postReactToFeedItemV2(p2)
		-- upvalues: MomentsGetMomentsReactionsStoreModuleResult (copy), MomentsResolveEmoteIdModule (upval)
		local T = if MomentsGetMomentsReactionsStoreModuleResult.getEmojis == nil then {} else MomentsGetMomentsReactionsStoreModuleResult.getEmojis(false)
		local ReactToFeedItemV2Function = MomentsGetMomentsReactionsStoreModuleResult.reactToFeedItemV2
		assert(ReactToFeedItemV2Function ~= nil, "expected reactToFeedItemV2 when FFlagMomentsReactToFeedItemV2 is on")
		
		return ReactToFeedItemV2Function({
			feedItemId = p2.feedItemId,
			reactionType = p2.reactionType,
			emoteId = MomentsResolveEmoteIdModule.resolveEmoteIdForReaction(T, p2.reactionType),
			feedSessionId = p2.feedSessionId
		})
	end
	
	local function _(p2)
		-- upvalues: FFlagMomentsReactToFeedItemV2Module (upval), postReactToFeedItemV2 (copy), MomentsGetMomentsReactionsStoreModuleResult (copy)
		return if FFlagMomentsReactToFeedItemV2Module then postReactToFeedItemV2(p2) else MomentsGetMomentsReactionsStoreModuleResult.reactToFeedItem(p2)
	end
	
	local function flushSync(EntityId, FeedItemId, EntityType, FeedSessionId)
		-- upvalues: Tbl4 (copy), Signal (copy), t (upval), FFlagMomentsReactToFeedItemV2Module (upval), postReactToFeedItemV2 (copy), MomentsGetMomentsReactionsStoreModuleResult (copy)
		local Entry = Tbl4[EntityId]
		local Reaction = if Entry == nil then nil else Entry.reaction
		local UserReaction = (Signal(false)[EntityId] or t).userReaction
		
		if UserReaction == Reaction then return end
		local Reaction1 = if UserReaction == nil then Reaction else UserReaction
		Tbl4[EntityId] = { reaction = UserReaction }
		local config = {
			feedItemId = FeedItemId,
			entityType = EntityType,
			entityId = EntityId,
			reactionType = Reaction1,
			feedSessionId = FeedSessionId
		}
		local PostReactToFeedItemVResult = if FFlagMomentsReactToFeedItemV2Module then postReactToFeedItemV2(config) else MomentsGetMomentsReactionsStoreModuleResult.reactToFeedItem(config)
		
		if type(PostReactToFeedItemVResult) == "table" and PostReactToFeedItemVResult.catch ~= nil then
			PostReactToFeedItemVResult:catch(function() end)
		end
	end
	
	local _ = function(Key)
		-- upvalues: Tbl4 (copy), Signal (copy), t (upval)
		if Tbl4[Key] == nil then
			Tbl4[Key] = { reaction = (Signal(false)[Key] or t).userReaction }
		end
	end
	
	local _ = function(p2)
		-- upvalues: Tbl5 (copy), Count (ref), Debounce1 (copy), flushSync (copy)
		local EntityId = p2.entityId
		local Entry: (any, any, any) -> () = Tbl5[EntityId]
		
		if Entry == nil then
			local Count1 = Count
			Entry = Debounce1(function(FeedItemId, EntityType, FeedSessionId)
				-- upvalues: Count1 (copy), Count (upval), flushSync (upval), EntityId (copy)
				if Count1 == Count then
					flushSync(EntityId, FeedItemId, EntityType, FeedSessionId)
					
					return
				end
			end, 0.5)
			Tbl5[EntityId] = Entry
		end
		Entry(p2.feedItemId, p2.entityType, p2.feedSessionId)
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
			-- upvalues: Count (ref), Tbl4 (copy), Tbl5 (copy), Signal2 (copy), Tbl (copy), Tbl1 (copy), Tbl2 (copy), Tbl3 (copy)
			Count += 1
			table.clear(Tbl4)
			table.clear(Tbl5)
			Signal2({})
			table.clear(Tbl)
			table.clear(Tbl1)
			table.clear(Tbl2)
			table.clear(Tbl3)
		end,
		updateReaction = updateReaction,
		reactToFeedItem = function(p2)
			-- upvalues: Signal (copy), t (upval), Tbl4 (copy), updateReaction (copy), ReactionActionModule (upval), Tbl5 (copy), Count (ref), Debounce1 (copy), flushSync (copy)
			local UserReaction = (Signal(false)[p2.entityId] or t).userReaction
			local EntityId = p2.entityId
			
			if Tbl4[EntityId] == nil then
				Tbl4[EntityId] = { reaction = (Signal(false)[EntityId] or t).userReaction }
			end
			updateReaction({
				action = if UserReaction == nil or UserReaction == p2.reactionType then ReactionActionModule.React else ReactionActionModule.Switch,
				momentId = p2.entityId,
				reaction = p2.reactionType
			})
			local EntityId1 = p2.entityId
			local Entry: (any, any, any) -> () = Tbl5[EntityId1]
			
			if Entry == nil then
				local Count1 = Count
				Entry = Debounce1(function(FeedItemId, EntityType, FeedSessionId)
					-- upvalues: Count1 (copy), Count (upval), flushSync (upval), EntityId1 (copy)
					if Count1 == Count then
						flushSync(EntityId1, FeedItemId, EntityType, FeedSessionId)
						
						return
					end
				end, 0.5)
				Tbl5[EntityId1] = Entry
			end
			Entry(p2.feedItemId, p2.entityType, p2.feedSessionId)
			
			return nil
		end,
		removeFeedItemReaction = function(p2)
			-- upvalues: Tbl4 (copy), Signal (copy), t (upval), updateReaction (copy), ReactionActionModule (upval), Tbl5 (copy), Count (ref), Debounce1 (copy), flushSync (copy)
			local EntityId = p2.entityId
			
			if Tbl4[EntityId] == nil then
				Tbl4[EntityId] = { reaction = (Signal(false)[EntityId] or t).userReaction }
			end
			updateReaction({
				action = ReactionActionModule.Unreact,
				momentId = p2.entityId,
				reaction = p2.reactionType
			})
			local EntityId1 = p2.entityId
			local Entry: (any, any, any) -> () = Tbl5[EntityId1]
			
			if Entry == nil then
				local Count1 = Count
				Entry = Debounce1(function(FeedItemId, EntityType, FeedSessionId)
					-- upvalues: Count1 (copy), Count (upval), flushSync (upval), EntityId1 (copy)
					if Count1 == Count then
						flushSync(EntityId1, FeedItemId, EntityType, FeedSessionId)
						
						return
					end
				end, 0.5)
				Tbl5[EntityId1] = Entry
			end
			Entry(p2.feedItemId, p2.entityType, p2.feedSessionId)
			
			return nil
		end
	}
end