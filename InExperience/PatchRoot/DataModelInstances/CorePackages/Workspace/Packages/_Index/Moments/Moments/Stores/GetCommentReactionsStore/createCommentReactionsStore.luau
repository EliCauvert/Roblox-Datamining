local Parent = script:FindFirstAncestor("Moments").Parent
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.MomentsTypes)

local function _(p1) --[[ Line: 90 | Named "selectedEmoteId" ]]
	return if p1 == nil or p1.userReaction == nil then nil else p1.userReaction.emoteId
end

local _ = function(p1, EmoteId): boolean --[[ Line: 94 | Named "selectionsAgree" ]]
	return (if p1 == nil or p1.userReaction == nil then nil else p1.userReaction.emoteId) == EmoteId
end

local _ = function(p1, FeedItemId, p2) --[[ Line: 98 | Named "restrictionFromState" ]]
	local CommentRestrictionsByCommentIdEntry = p1.commentRestrictionsByCommentId[p2]
	local GlobalRestriction = p1.globalRestriction
	
	if not GlobalRestriction then
		GlobalRestriction = p1.feedRestrictionsByFeedItemId[FeedItemId]
		
		if not GlobalRestriction then
			if CommentRestrictionsByCommentIdEntry ~= nil and CommentRestrictionsByCommentIdEntry.feedItemId == FeedItemId then
				return CommentRestrictionsByCommentIdEntry.errorCode
			end
			GlobalRestriction = nil
		end
	end
	return GlobalRestriction
end

local _ = function(Key, Key1) --[[ Line: 107 | Named "transitionDeltas" ]]
	local t = {}
	
	if Key ~= nil and Key ~= Key1 then
		t[Key] = -1
	end
	if Key1 ~= nil and Key1 ~= Key then
		t[Key1] = (t[Key1] or 0) + 1
	end
	return t
end

local function combineDeltas(Tbl, List) --[[ Line: 118 ]]
	local Copy = table.clone(Tbl)
	
	for i, value in List do
		local v1 = (Copy[i] or 0) + value
		
		if v1 == 0 then
			Copy[i] = nil
		else
			Copy[i] = v1
		end
	end
	return Copy
end

local function projectReactions(p1, RollbackState) --[[ Line: 131 ]]
	local Buffer = table.create(#p1.counts)
	local t = {}
	
	for EmoteId, count in p1.counts do
		table.insert(Buffer, {
			emoteId = count.emoteId,
			count = math.max(0, count.count + (RollbackState.countDeltas[count.emoteId] or 0))
		})
		t[count.emoteId] = true
	end
	for EmoteId, countDelta in RollbackState.countDeltas do
		if not t[EmoteId] and countDelta > 0 then
			table.insert(Buffer, { emoteId = EmoteId, count = countDelta })
		end
	end
	return {
		counts = Buffer,
		userReaction = if RollbackState.desiredEmoteId == nil then nil else { emoteId = RollbackState.desiredEmoteId }
	}
end

return function() --[[ Line: 157 | Named "createCommentReactionsStore" ]]
	-- upvalues: SignalsModule (copy), projectReactions (copy), combineDeltas (copy)
	local Signal, Signal2 = SignalsModule.createSignal({
		globalRestriction = nil,
		cooldownUntilMs = 0,
		intentsByCommentId = {},
		feedRestrictionsByFeedItemId = {},
		commentRestrictionsByCommentId = {}
	})
	local Signal1, Signal2_1 = SignalsModule.createSignal(0)
	local Flag = false
	
	local function _(Callback) --[[ Line: 168 | Named "updateState" ]]
		-- upvalues: Flag (ref), Signal2 (copy), Signal (copy)
		if not Flag then
			Signal2(Callback(Signal(false)))
		end
	end
	
	local _ = function(p2, Generation, Status): boolean --[[ Line: 255 | Named "updateIntentStatus" ]]
		-- upvalues: Signal (copy), Flag (ref), Signal2 (copy)
		local IntentsByCommentIdEntry = Signal(false).intentsByCommentId[p2]
		
		if Flag or IntentsByCommentIdEntry == nil or IntentsByCommentIdEntry.generation ~= Generation then
			return false
		end
		local function v42(p3) --[[ Line: 260 ]]
			-- upvalues: IntentsByCommentIdEntry (copy), Status (copy), p2 (copy)
			local Copy = table.clone(p3.intentsByCommentId)
			local Copy1 = table.clone(IntentsByCommentIdEntry)
			Copy1.status = Status
			
			if Status == "LocallyConfirmed" then
				Copy1.rollbackState = nil
			end
			Copy[p2] = Copy1
			
			return {
				intentsByCommentId = Copy,
				globalRestriction = p3.globalRestriction,
				feedRestrictionsByFeedItemId = p3.feedRestrictionsByFeedItemId,
				commentRestrictionsByCommentId = p3.commentRestrictionsByCommentId,
				cooldownUntilMs = p3.cooldownUntilMs
			}
		end
		
		if not Flag then
			Signal2((v42(Signal(false))))
		end
		return true
	end
	
	local function clear() --[[ Line: 530 ]]
		-- upvalues: Flag (ref), Signal2_1 (copy), Signal1 (copy), Signal2 (copy)
		if not Flag then
			Signal2_1(Signal1(false) + 1)
			Signal2({
				globalRestriction = nil,
				cooldownUntilMs = 0,
				intentsByCommentId = {},
				feedRestrictionsByFeedItemId = {},
				commentRestrictionsByCommentId = {}
			})
			
			return
		end
	end
	
	return {
		getGeneration = Signal1,
		getCooldownUntilMs = function(p2) --[[ Line: 178 ]]
			-- upvalues: Signal (copy)
			return Signal(p2 or false).cooldownUntilMs
		end,
		getIntent = function(p2, p3) --[[ Line: 174 ]]
			-- upvalues: Signal (copy)
			return Signal(p3 or false).intentsByCommentId[p2]
		end,
		getRestriction = function(FeedItemId, p2, p3) --[[ Line: 182 ]]
			-- upvalues: Signal (copy)
			local SignalResult = Signal(p3 or false)
			local CommentRestrictionsByCommentIdEntry = SignalResult.commentRestrictionsByCommentId[p2]
			local GlobalRestriction = SignalResult.globalRestriction
			
			if not GlobalRestriction then
				GlobalRestriction = SignalResult.feedRestrictionsByFeedItemId[FeedItemId]
				
				if not GlobalRestriction then
					if CommentRestrictionsByCommentIdEntry ~= nil and CommentRestrictionsByCommentIdEntry.feedItemId == FeedItemId then
						return CommentRestrictionsByCommentIdEntry.errorCode
					end
					GlobalRestriction = nil
				end
			end
			return GlobalRestriction
		end,
		getProjection = function(FeedItemId, p2, p3, p4) --[[ Line: 186 ]]
			-- upvalues: Signal (copy), projectReactions (upval)
			local SignalResult = Signal(p4 or false)
			local IntentsByCommentIdEntry = SignalResult.intentsByCommentId[p2]
			local CommentRestrictionsByCommentIdEntry = SignalResult.commentRestrictionsByCommentId[p2]
			
			return {
				reactions = if p3 == nil or IntentsByCommentIdEntry == nil then p3 else projectReactions(p3, IntentsByCommentIdEntry),
				status = if IntentsByCommentIdEntry == nil then nil else IntentsByCommentIdEntry.status,
				restriction = SignalResult.globalRestriction or (SignalResult.feedRestrictionsByFeedItemId[FeedItemId] or (if CommentRestrictionsByCommentIdEntry == nil or CommentRestrictionsByCommentIdEntry.feedItemId ~= FeedItemId then nil else CommentRestrictionsByCommentIdEntry.errorCode)),
				generation = if IntentsByCommentIdEntry == nil then nil else IntentsByCommentIdEntry.generation
			}
		end,
		beginIntent = function(FeedItemId, p2, p3, DesiredEmoteId) --[[ Line: 204 ]]
			-- upvalues: Flag (ref), Signal1 (copy), Signal2_1 (copy), combineDeltas (upval), Signal2 (copy), Signal (copy)
			if Flag then
				return Signal1(false)
			end
			local NewSignalResult = Signal1(false) + 1
			Signal2_1(NewSignalResult)
			
			local function v31(p4) --[[ Line: 215 ]]
				-- upvalues: p2 (copy), p3 (copy), FeedItemId (copy), DesiredEmoteId (copy), combineDeltas (upval), NewSignalResult (copy)
				local Copy = table.clone(p4.intentsByCommentId)
				local Entry = Copy[p2]
				local EmoteId = if p3 == nil or p3.userReaction == nil then nil else p3.userReaction.emoteId
				local CountDeltas = {}
				local RollbackState = nil
				
				if Entry ~= nil then
					EmoteId = Entry.desiredEmoteId
					CountDeltas = Entry.countDeltas
					
					if Entry.rollbackState == nil then
						if Entry.status == "LocallyConfirmed" then
							RollbackState = {
								desiredEmoteId = Entry.desiredEmoteId,
								countDeltas = table.clone(Entry.countDeltas)
							}
						end
					else
						RollbackState = {
							desiredEmoteId = Entry.rollbackState.desiredEmoteId,
							countDeltas = table.clone(Entry.rollbackState.countDeltas)
						}
					end
				end
				local config = {
					status = "Pending",
					feedItemId = FeedItemId,
					desiredEmoteId = DesiredEmoteId
				}
				local CountDeltas1 = CountDeltas
				local DesiredEmoteId1 = EmoteId
				local t = {}
				
				if DesiredEmoteId1 ~= nil and DesiredEmoteId1 ~= DesiredEmoteId then
					t[DesiredEmoteId1] = -1
				end
				if DesiredEmoteId ~= nil and DesiredEmoteId ~= DesiredEmoteId1 then
					t[DesiredEmoteId] = (t[DesiredEmoteId] or 0) + 1
				end
				config.countDeltas = combineDeltas(CountDeltas1, t)
				config.generation = NewSignalResult
				config.rollbackState = RollbackState
				Copy[p2] = config
				
				return {
					intentsByCommentId = Copy,
					globalRestriction = p4.globalRestriction,
					feedRestrictionsByFeedItemId = p4.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = p4.commentRestrictionsByCommentId,
					cooldownUntilMs = p4.cooldownUntilMs
				}
			end
			
			if not Flag then
				Signal2((v31(Signal(false))))
			end
			return NewSignalResult
		end,
		markPending = function(p2, Generation): boolean --[[ Line: 559 ]]
			-- upvalues: Signal (copy), Flag (ref), Signal2 (copy)
			local IntentsByCommentIdEntry = Signal(false).intentsByCommentId[p2]
			
			if Flag or IntentsByCommentIdEntry == nil or IntentsByCommentIdEntry.generation ~= Generation then
				return false
			end
			local Status = "Pending"
			
			local function v92(p3) --[[ Line: 260 ]]
				-- upvalues: IntentsByCommentIdEntry (copy), Status (copy), p2 (copy)
				local Copy = table.clone(p3.intentsByCommentId)
				local Copy1 = table.clone(IntentsByCommentIdEntry)
				Copy1.status = Status
				
				if Status == "LocallyConfirmed" then
					Copy1.rollbackState = nil
				end
				Copy[p2] = Copy1
				
				return {
					intentsByCommentId = Copy,
					globalRestriction = p3.globalRestriction,
					feedRestrictionsByFeedItemId = p3.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = p3.commentRestrictionsByCommentId,
					cooldownUntilMs = p3.cooldownUntilMs
				}
			end
			
			if not Flag then
				Signal2((v92(Signal(false))))
			end
			return true
		end,
		markUncertain = function(p2, Generation): boolean --[[ Line: 562 ]]
			-- upvalues: Signal (copy), Flag (ref), Signal2 (copy)
			local IntentsByCommentIdEntry = Signal(false).intentsByCommentId[p2]
			
			if Flag or IntentsByCommentIdEntry == nil or IntentsByCommentIdEntry.generation ~= Generation then
				return false
			end
			local Status = "Uncertain"
			
			local function v95(p3) --[[ Line: 260 ]]
				-- upvalues: IntentsByCommentIdEntry (copy), Status (copy), p2 (copy)
				local Copy = table.clone(p3.intentsByCommentId)
				local Copy1 = table.clone(IntentsByCommentIdEntry)
				Copy1.status = Status
				
				if Status == "LocallyConfirmed" then
					Copy1.rollbackState = nil
				end
				Copy[p2] = Copy1
				
				return {
					intentsByCommentId = Copy,
					globalRestriction = p3.globalRestriction,
					feedRestrictionsByFeedItemId = p3.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = p3.commentRestrictionsByCommentId,
					cooldownUntilMs = p3.cooldownUntilMs
				}
			end
			
			if not Flag then
				Signal2((v95(Signal(false))))
			end
			return true
		end,
		markLocallyConfirmed = function(p2, Generation): boolean --[[ Line: 565 ]]
			-- upvalues: Signal (copy), Flag (ref), Signal2 (copy)
			local IntentsByCommentIdEntry = Signal(false).intentsByCommentId[p2]
			
			if Flag or IntentsByCommentIdEntry == nil or IntentsByCommentIdEntry.generation ~= Generation then
				return false
			end
			local Status = "LocallyConfirmed"
			
			local function v98(p3) --[[ Line: 260 ]]
				-- upvalues: IntentsByCommentIdEntry (copy), Status (copy), p2 (copy)
				local Copy = table.clone(p3.intentsByCommentId)
				local Copy1 = table.clone(IntentsByCommentIdEntry)
				Copy1.status = Status
				
				if Status == "LocallyConfirmed" then
					Copy1.rollbackState = nil
				end
				Copy[p2] = Copy1
				
				return {
					intentsByCommentId = Copy,
					globalRestriction = p3.globalRestriction,
					feedRestrictionsByFeedItemId = p3.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = p3.commentRestrictionsByCommentId,
					cooldownUntilMs = p3.cooldownUntilMs
				}
			end
			
			if not Flag then
				Signal2((v98(Signal(false))))
			end
			return true
		end,
		confirmAndRebase = function(p2, Generation, p3): boolean --[[ Line: 279 ]]
			-- upvalues: Signal (copy), Flag (ref), Signal2 (copy)
			local IntentsByCommentIdEntry = Signal(false).intentsByCommentId[p2]
			
			if Flag or IntentsByCommentIdEntry == nil or IntentsByCommentIdEntry.generation ~= Generation then
				return false
			end
			local function v46(p4) --[[ Line: 288 ]]
				-- upvalues: IntentsByCommentIdEntry (copy), p3 (copy), p2 (copy)
				local Copy = table.clone(p4.intentsByCommentId)
				local Copy1 = table.clone(IntentsByCommentIdEntry)
				local EmoteId = if p3 == nil or p3.userReaction == nil then nil else p3.userReaction.emoteId
				local DesiredEmoteId = IntentsByCommentIdEntry.desiredEmoteId
				local CountDeltas = {}
				
				if EmoteId ~= nil and EmoteId ~= DesiredEmoteId then
					CountDeltas[EmoteId] = -1
				end
				if DesiredEmoteId ~= nil and DesiredEmoteId ~= EmoteId then
					CountDeltas[DesiredEmoteId] = (CountDeltas[DesiredEmoteId] or 0) + 1
				end
				Copy1.countDeltas = CountDeltas
				Copy1.rollbackState = nil
				Copy1.status = "LocallyConfirmed"
				Copy[p2] = Copy1
				
				return {
					intentsByCommentId = Copy,
					globalRestriction = p4.globalRestriction,
					feedRestrictionsByFeedItemId = p4.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = p4.commentRestrictionsByCommentId,
					cooldownUntilMs = p4.cooldownUntilMs
				}
			end
			
			if not Flag then
				Signal2((v46(Signal(false))))
			end
			return true
		end,
		rollback = function(p2, Generation, ErrorCode): boolean --[[ Line: 307 ]]
			-- upvalues: Signal (copy), Flag (ref), Signal2 (copy)
			local IntentsByCommentIdEntry = Signal(false).intentsByCommentId[p2]
			
			if Flag or IntentsByCommentIdEntry == nil or IntentsByCommentIdEntry.generation ~= Generation then
				return false
			end
			local function v53(p3) --[[ Line: 312 ]]
				-- upvalues: IntentsByCommentIdEntry (copy), p2 (copy), ErrorCode (copy)
				local Copy = table.clone(p3.intentsByCommentId)
				
				if IntentsByCommentIdEntry.rollbackState == nil then
					Copy[p2] = nil
				else
					Copy[p2] = {
						rollbackState = nil,
						status = "LocallyConfirmed",
						feedItemId = IntentsByCommentIdEntry.feedItemId,
						desiredEmoteId = IntentsByCommentIdEntry.rollbackState.desiredEmoteId,
						countDeltas = table.clone(IntentsByCommentIdEntry.rollbackState.countDeltas),
						generation = IntentsByCommentIdEntry.generation
					}
				end
				local Copy1 = table.clone(p3.commentRestrictionsByCommentId)
				
				if ErrorCode == nil then
					Copy1[p2] = nil
				else
					Copy1[p2] = {
						feedItemId = IntentsByCommentIdEntry.feedItemId,
						errorCode = ErrorCode,
						generation = IntentsByCommentIdEntry.generation
					}
				end
				return {
					intentsByCommentId = Copy,
					globalRestriction = p3.globalRestriction,
					feedRestrictionsByFeedItemId = p3.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = Copy1,
					cooldownUntilMs = p3.cooldownUntilMs
				}
			end
			
			if not Flag then
				Signal2((v53(Signal(false))))
			end
			return true
		end,
		expireIntent = function(Key, Generation): boolean --[[ Line: 347 ]]
			-- upvalues: Signal (copy), Flag (ref), Signal2 (copy)
			local IntentsByCommentIdEntry = Signal(false).intentsByCommentId[Key]
			
			if Flag or IntentsByCommentIdEntry == nil or IntentsByCommentIdEntry.generation ~= Generation then
				return false
			end
			local function _(p2) --[[ Line: 352 ]]
				-- upvalues: Key (copy)
				local Copy = table.clone(p2.intentsByCommentId)
				Copy[Key] = nil
				
				return {
					intentsByCommentId = Copy,
					globalRestriction = p2.globalRestriction,
					feedRestrictionsByFeedItemId = p2.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = p2.commentRestrictionsByCommentId,
					cooldownUntilMs = p2.cooldownUntilMs
				}
			end
			
			if not Flag then
				local SignalResult = Signal(false)
				local Copy = table.clone(SignalResult.intentsByCommentId)
				Copy[Key] = nil
				Signal2({
					intentsByCommentId = Copy,
					globalRestriction = SignalResult.globalRestriction,
					feedRestrictionsByFeedItemId = SignalResult.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = SignalResult.commentRestrictionsByCommentId,
					cooldownUntilMs = SignalResult.cooldownUntilMs
				})
			end
			return true
		end,
		reconcile = function(FeedItemId, p2, p3, p4): boolean --[[ Line: 366 ]]
			-- upvalues: Flag (ref), Signal2 (copy), Signal (copy)
			if p3 == nil then
				return false
			end
			local Flag1 = false
			
			local function v62(p5) --[[ Line: 376 ]]
				-- upvalues: p2 (copy), FeedItemId (copy), p4 (copy), p3 (copy), Flag1 (ref)
				local Copy = table.clone(p5.commentRestrictionsByCommentId)
				local Entry = Copy[p2]
				
				if Entry ~= nil and Entry.feedItemId == FeedItemId and Entry.generation <= p4 then
					Copy[p2] = nil
				end
				local IntentsByCommentIdEntry = p5.intentsByCommentId[p2]
				local Copy1 = table.clone(p5.intentsByCommentId)
				
				if IntentsByCommentIdEntry ~= nil then
					if (if p3 == nil or p3.userReaction == nil then nil else p3.userReaction.emoteId) == IntentsByCommentIdEntry.desiredEmoteId then
						Copy1[p2] = nil
						Flag1 = true
					elseif IntentsByCommentIdEntry.generation <= p4 then
						local Copy2 = table.clone(IntentsByCommentIdEntry)
						local EmoteId = if p3 == nil or p3.userReaction == nil then nil else p3.userReaction.emoteId
						local DesiredEmoteId = IntentsByCommentIdEntry.desiredEmoteId
						local CountDeltas = {}
						
						if EmoteId ~= nil and EmoteId ~= DesiredEmoteId then
							CountDeltas[EmoteId] = -1
						end
						if DesiredEmoteId ~= nil and DesiredEmoteId ~= EmoteId then
							CountDeltas[DesiredEmoteId] = (CountDeltas[DesiredEmoteId] or 0) + 1
						end
						Copy2.countDeltas = CountDeltas
						
						if IntentsByCommentIdEntry.rollbackState ~= nil then
							local RollbackState = {
								desiredEmoteId = IntentsByCommentIdEntry.rollbackState.desiredEmoteId
							}
							local EmoteId1 = if p3 == nil or p3.userReaction == nil then nil else p3.userReaction.emoteId
							local DesiredEmoteId1 = IntentsByCommentIdEntry.rollbackState.desiredEmoteId
							local CountDeltas1 = {}
							
							if EmoteId1 ~= nil and EmoteId1 ~= DesiredEmoteId1 then
								CountDeltas1[EmoteId1] = -1
							end
							if DesiredEmoteId1 ~= nil and DesiredEmoteId1 ~= EmoteId1 then
								CountDeltas1[DesiredEmoteId1] = (CountDeltas1[DesiredEmoteId1] or 0) + 1
							end
							RollbackState.countDeltas = CountDeltas1
							Copy2.rollbackState = RollbackState
						end
						Copy1[p2] = Copy2
					end
				end
				return {
					intentsByCommentId = Copy1,
					globalRestriction = p5.globalRestriction,
					feedRestrictionsByFeedItemId = p5.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = Copy,
					cooldownUntilMs = p5.cooldownUntilMs
				}
			end
			
			if not Flag then
				Signal2((v62(Signal(false))))
			end
			return Flag1
		end,
		setGlobalRestriction = function(GlobalRestriction) --[[ Line: 419 ]]
			-- upvalues: Flag (ref), Signal2 (copy), Signal (copy)
			local function _(p2) --[[ Line: 420 ]]
				-- upvalues: GlobalRestriction (copy)
				return {
					intentsByCommentId = p2.intentsByCommentId,
					globalRestriction = GlobalRestriction,
					feedRestrictionsByFeedItemId = p2.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = p2.commentRestrictionsByCommentId,
					cooldownUntilMs = p2.cooldownUntilMs
				}
			end
			
			if not Flag then
				local SignalResult = Signal(false)
				Signal2({
					intentsByCommentId = SignalResult.intentsByCommentId,
					globalRestriction = GlobalRestriction,
					feedRestrictionsByFeedItemId = SignalResult.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = SignalResult.commentRestrictionsByCommentId,
					cooldownUntilMs = SignalResult.cooldownUntilMs
				})
			end
		end,
		setFeedRestriction = function(p2, p3) --[[ Line: 431 ]]
			-- upvalues: Flag (ref), Signal2 (copy), Signal (copy)
			local function v77(p4) --[[ Line: 432 ]]
				-- upvalues: p3 (copy), p2 (copy)
				local Copy = table.clone(p4.feedRestrictionsByFeedItemId)
				
				if p3 == nil then
					Copy[p2] = nil
				else
					Copy[p2] = p3
				end
				return {
					intentsByCommentId = p4.intentsByCommentId,
					globalRestriction = p4.globalRestriction,
					feedRestrictionsByFeedItemId = Copy,
					commentRestrictionsByCommentId = p4.commentRestrictionsByCommentId,
					cooldownUntilMs = p4.cooldownUntilMs
				}
			end
			
			if not Flag then
				Signal2((v77(Signal(false))))
			end
		end,
		setCommentRestriction = function(FeedItemId, p2, ErrorCode, Generation) --[[ Line: 449 ]]
			-- upvalues: Flag (ref), Signal2 (copy), Signal (copy)
			local function v79(p3) --[[ Line: 455 ]]
				-- upvalues: ErrorCode (copy), p2 (copy), FeedItemId (copy), Generation (copy)
				local Copy = table.clone(p3.commentRestrictionsByCommentId)
				
				if ErrorCode == nil then
					Copy[p2] = nil
				else
					Copy[p2] = {
						feedItemId = FeedItemId,
						errorCode = ErrorCode,
						generation = Generation
					}
				end
				return {
					intentsByCommentId = p3.intentsByCommentId,
					globalRestriction = p3.globalRestriction,
					feedRestrictionsByFeedItemId = p3.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = Copy,
					cooldownUntilMs = p3.cooldownUntilMs
				}
			end
			
			if not Flag then
				Signal2((v79(Signal(false))))
			end
		end,
		setCooldownUntilMs = function(p2: number) --[[ Line: 476 ]]
			-- upvalues: Flag (ref), Signal2 (copy), Signal (copy)
			local function _(p3) --[[ Line: 477 ]]
				-- upvalues: p2 (copy)
				return {
					intentsByCommentId = p3.intentsByCommentId,
					globalRestriction = p3.globalRestriction,
					feedRestrictionsByFeedItemId = p3.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = p3.commentRestrictionsByCommentId,
					cooldownUntilMs = math.max(0, p2)
				}
			end
			
			if not Flag then
				local SignalResult = Signal(false)
				Signal2({
					intentsByCommentId = SignalResult.intentsByCommentId,
					globalRestriction = SignalResult.globalRestriction,
					feedRestrictionsByFeedItemId = SignalResult.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = SignalResult.commentRestrictionsByCommentId,
					cooldownUntilMs = math.max(0, p2)
				})
			end
		end,
		clearComment = function(p2) --[[ Line: 488 ]]
			-- upvalues: Flag (ref), Signal2 (copy), Signal (copy)
			local function v83(p3) --[[ Line: 489 ]]
				-- upvalues: p2 (copy)
				local Copy = table.clone(p3.intentsByCommentId)
				Copy[p2] = nil
				local Copy1 = table.clone(p3.commentRestrictionsByCommentId)
				Copy1[p2] = nil
				
				return {
					intentsByCommentId = Copy,
					globalRestriction = p3.globalRestriction,
					feedRestrictionsByFeedItemId = p3.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = Copy1,
					cooldownUntilMs = p3.cooldownUntilMs
				}
			end
			
			if not Flag then
				Signal2((v83(Signal(false))))
			end
		end,
		clearFeed = function(FeedItemId) --[[ Line: 504 ]]
			-- upvalues: Flag (ref), Signal2 (copy), Signal (copy)
			local function v86(p2) --[[ Line: 505 ]]
				-- upvalues: FeedItemId (copy)
				local Copy = table.clone(p2.intentsByCommentId)
				
				for i, value in Copy do
					if value.feedItemId == FeedItemId then
						Copy[i] = nil
					end
				end
				local Copy1 = table.clone(p2.feedRestrictionsByFeedItemId)
				Copy1[FeedItemId] = nil
				local Copy2 = table.clone(p2.commentRestrictionsByCommentId)
				
				for i1, value1 in Copy2 do
					if value1.feedItemId == FeedItemId then
						Copy2[i1] = nil
					end
				end
				return {
					intentsByCommentId = Copy,
					globalRestriction = p2.globalRestriction,
					feedRestrictionsByFeedItemId = Copy1,
					commentRestrictionsByCommentId = Copy2,
					cooldownUntilMs = p2.cooldownUntilMs
				}
			end
			
			if not Flag then
				Signal2((v86(Signal(false))))
			end
		end,
		clear = clear,
		dispose = function() --[[ Line: 544 ]]
			-- upvalues: Flag (ref), clear (copy)
			if not Flag then
				clear()
				Flag = true
				
				return
			end
		end
	}
end