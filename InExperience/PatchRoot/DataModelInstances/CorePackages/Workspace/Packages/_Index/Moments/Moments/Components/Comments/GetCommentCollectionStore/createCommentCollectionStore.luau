local HttpService = game:GetService("HttpService")
local CommentCollectionTypesModule = require(script.Parent.CommentCollectionTypes)
local MergeCommentPageModule = require(script.Parent.mergeCommentPage)
local CreateCommentSessionFiltersStoreModule = require(script.Parent.Parent.GetCommentSessionFiltersStore.createCommentSessionFiltersStore)
local LoadStatus = CommentCollectionTypesModule.LoadStatus
local PendingSentinelFunction = CommentCollectionTypesModule.pendingSentinel
local CreateSignalFunction = require(script:FindFirstAncestor("Moments").Parent.Signals).createSignal

local function specialOrderedIds(PendingSubmission, StickyPostedCommentIds) --[[ Line: 62 ]]
	-- upvalues: PendingSentinelFunction (copy)
	local List = {}
	local t = {}
	local StickyPostedCommentIds1 = StickyPostedCommentIds or {}
	
	if PendingSubmission ~= nil then
		local PendingSentinelResult = PendingSentinelFunction(PendingSubmission.clientRequestId)
		table.insert(List, PendingSentinelResult)
		t[PendingSentinelResult] = true
	end
	for _, value in StickyPostedCommentIds1 do
		if not t[value] then
			table.insert(List, value)
			t[value] = true
		end
	end
	return List
end

local function defaultState(PendingSubmission, StickyPostedCommentIds) --[[ Line: 80 ]]
	-- upvalues: specialOrderedIds (copy), LoadStatus (copy)
	local Tbl = StickyPostedCommentIds or {}
	
	return {
		channelId = nil,
		nextCursor = nil,
		hasMore = false,
		errorCode = nil,
		submissionError = nil,
		orderedCommentIds = specialOrderedIds(PendingSubmission, Tbl),
		initialLoadStatus = LoadStatus.Idle,
		loadMoreStatus = LoadStatus.Idle,
		pendingSubmission = PendingSubmission,
		stickyPostedCommentIds = table.clone(Tbl)
	}
end

return function(p1) --[[ Line: 96 | Named "createCommentCollectionStore" ]]
	-- upvalues: CreateCommentSessionFiltersStoreModule (copy), CreateSignalFunction (copy), defaultState (copy), PendingSentinelFunction (copy), MergeCommentPageModule (copy), LoadStatus (copy), specialOrderedIds (copy), HttpService (copy)
	local P4 = p1 or {}
	local CommentSessionFiltersStoreModule = if P4.sessionFilters == nil then CreateCommentSessionFiltersStoreModule() else P4.sessionFilters
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Signal1, Signal2_1 = CreateSignalFunction((defaultState()))
	local config = { get = Signal1, set = Signal2_1 }
	local v1 = nil
	local Flag = false
	
	local function _(p2) --[[ Line: 112 | Named "requireSelectedSlot" ]]
		-- upvalues: Flag (ref), Signal (copy), config (copy)
		assert(not Flag, "Comment collection store is disposed")
		assert(Signal(false) == p2, "Comment feed must be selected before mutation")
		
		return config
	end
	
	local _ = function(p2) --[[ Line: 156 | Named "currentFilters" ]]
		-- upvalues: CommentSessionFiltersStoreModule (copy)
		return if p2 == nil then CommentSessionFiltersStoreModule.getFilters(false) else p2
	end
	
	local _ = function(p2) --[[ Line: 163 | Named "pendingSentinelFor" ]]
		-- upvalues: PendingSentinelFunction (upval)
		local PendingSubmission = p2.pendingSubmission
		
		return if PendingSubmission == nil then nil else PendingSentinelFunction(PendingSubmission.clientRequestId)
	end
	
	local function applyMerge(p2, p3, Replace, p4) --[[ Line: 171 ]]
		-- upvalues: Flag (ref), Signal (copy), config (copy), MergeCommentPageModule (upval), CommentSessionFiltersStoreModule (copy), PendingSentinelFunction (upval), LoadStatus (upval)
		assert(not Flag, "Comment collection store is disposed")
		assert(Signal(false) == p2, "Comment feed must be selected before mutation")
		local GetResult = config.get(false)
		local VisibleIdsBeforeReconciliation = {}
		
		for _, orderedCommentId in GetResult.orderedCommentIds do
			VisibleIdsBeforeReconciliation[orderedCommentId] = true
		end
		local t = {}
		
		for _, comment in p3.comments do
			t[comment.commentId] = true
		end
		local StickyPostedCommentIds = {}
		local t1 = {}
		
		for _, stickyPostedCommentId in GetResult.stickyPostedCommentIds do
			if t[stickyPostedCommentId] then
				t1[stickyPostedCommentId] = true
			else
				table.insert(StickyPostedCommentIds, stickyPostedCommentId)
			end
		end
		local ExistingIds = {}
		
		for _, orderedCommentId1 in GetResult.orderedCommentIds do
			if not t1[orderedCommentId1] then
				table.insert(ExistingIds, orderedCommentId1)
			end
		end
		local PendingSubmission = GetResult.pendingSubmission
		local MergeCommentPageModuleResult = MergeCommentPageModule({
			existingIds = ExistingIds,
			pageComments = p3.comments,
			filters = if p4 == nil then CommentSessionFiltersStoreModule.getFilters(false) else p4,
			replace = Replace,
			pendingSentinel = if PendingSubmission == nil then nil else PendingSentinelFunction(PendingSubmission.clientRequestId),
			stickyPostedCommentIds = StickyPostedCommentIds,
			visibleIdsBeforeReconciliation = VisibleIdsBeforeReconciliation,
			hasMore = p3.hasMore
		})
		config.set({
			errorCode = nil,
			orderedCommentIds = MergeCommentPageModuleResult.orderedCommentIds,
			channelId = p3.channelId or GetResult.channelId,
			nextCursor = p3.nextCursor,
			hasMore = p3.hasMore,
			initialLoadStatus = if Replace then LoadStatus.Success else GetResult.initialLoadStatus,
			loadMoreStatus = if Replace then LoadStatus.Idle else LoadStatus.Success,
			pendingSubmission = GetResult.pendingSubmission,
			stickyPostedCommentIds = StickyPostedCommentIds,
			submissionError = GetResult.submissionError
		})
		
		return MergeCommentPageModuleResult
	end
	
	local _ = function(List, p5) --[[ Line: 317 | Named "dropId" ]]
		local List1 = {}
		
		for _, value in List do
			if value ~= p5 then
				table.insert(List1, value)
			end
		end
		return List1
	end
	
	local function replaceId(OrderedCommentIds, p6, CommentId) --[[ Line: 424 ]]
		local List = {}
		local Flag = false
		local t = {}
		
		for _, orderedCommentId in OrderedCommentIds do
			local CommentId1 = if orderedCommentId == p6 then CommentId else orderedCommentId
			
			if not t[CommentId1] then
				table.insert(List, CommentId1)
				t[CommentId1] = true
				
				if orderedCommentId == p6 then
					Flag = true
				end
			end
		end
		if not Flag and not t[CommentId] then
			table.insert(List, 1, CommentId)
		end
		return List
	end
	
	local _ = function(List, p7) --[[ Line: 444 | Named "moveToFront" ]]
		local List1 = { p7 }
		
		for _, value in List do
			if value ~= p7 then
				table.insert(List1, value)
			end
		end
		return List1
	end
	
	return {
		getState = function(p8) --[[ Line: 118 ]]
			-- upvalues: Signal (copy), defaultState (upval), config (copy)
			return function(p9) --[[ Line: 119 ]]
				-- upvalues: Signal (upval), p8 (copy), defaultState (upval), config (upval)
				return if Signal(p9) == p8 then config.get(p9) else defaultState()
			end
		end,
		selectFeed = function(p8, p9) --[[ Line: 137 ]]
			-- upvalues: Flag (ref), Signal (copy), v1 (ref), config (copy), defaultState (upval), Signal2 (copy), CommentSessionFiltersStoreModule (copy)
			assert(not Flag, "Comment collection store is disposed")
			
			if Signal(false) ~= p8 or v1 ~= p9 then
				config.set((defaultState()))
				v1 = p9
				Signal2(p8)
				CommentSessionFiltersStoreModule.reset()
				
				return
			end
		end,
		clear = function() --[[ Line: 127 ]]
			-- upvalues: Flag (ref), config (copy), defaultState (upval), v1 (ref), Signal2 (copy), CommentSessionFiltersStoreModule (copy)
			if not Flag then
				config.set((defaultState()))
				v1 = nil
				Signal2(nil)
				CommentSessionFiltersStoreModule.reset()
				
				return
			end
		end,
		dispose = function() --[[ Line: 148 ]]
			-- upvalues: Flag (ref), config (copy), defaultState (upval), v1 (ref), Signal2 (copy), CommentSessionFiltersStoreModule (copy)
			if Flag then return end
			if not Flag then
				config.set((defaultState()))
				v1 = nil
				Signal2(nil)
				CommentSessionFiltersStoreModule.reset()
			end
			Flag = true
		end,
		beginListSession = function(p8) --[[ Line: 227 ]]
			-- upvalues: Flag (ref), Signal (copy), config (copy), defaultState (upval)
			assert(not Flag, "Comment collection store is disposed")
			assert(Signal(false) == p8, "Comment feed must be selected before mutation")
			local GetResult = config.get(false)
			config.set((defaultState(GetResult.pendingSubmission, GetResult.stickyPostedCommentIds)))
		end,
		resetListSession = function(p8) --[[ Line: 233 ]]
			-- upvalues: Flag (ref), Signal (copy), config (copy), specialOrderedIds (upval), LoadStatus (upval)
			assert(not Flag, "Comment collection store is disposed")
			assert(Signal(false) == p8, "Comment feed must be selected before mutation")
			local GetResult = config.get(false)
			config.set({
				channelId = nil,
				nextCursor = nil,
				hasMore = false,
				errorCode = nil,
				orderedCommentIds = specialOrderedIds(GetResult.pendingSubmission, GetResult.stickyPostedCommentIds),
				initialLoadStatus = LoadStatus.Idle,
				loadMoreStatus = LoadStatus.Idle,
				pendingSubmission = GetResult.pendingSubmission,
				stickyPostedCommentIds = GetResult.stickyPostedCommentIds,
				submissionError = GetResult.submissionError
			})
		end,
		beginInitialLoad = function(p8) --[[ Line: 250 ]]
			-- upvalues: Flag (ref), Signal (copy), config (copy), LoadStatus (upval)
			assert(not Flag, "Comment collection store is disposed")
			assert(Signal(false) == p8, "Comment feed must be selected before mutation")
			local GetResult = config.get(false)
			config.set({
				errorCode = nil,
				orderedCommentIds = GetResult.orderedCommentIds,
				channelId = GetResult.channelId,
				nextCursor = GetResult.nextCursor,
				hasMore = GetResult.hasMore,
				initialLoadStatus = LoadStatus.Loading,
				loadMoreStatus = GetResult.loadMoreStatus,
				pendingSubmission = GetResult.pendingSubmission,
				stickyPostedCommentIds = GetResult.stickyPostedCommentIds,
				submissionError = GetResult.submissionError
			})
		end,
		completeInitialLoad = function(p8, p9, p10) --[[ Line: 267 ]]
			-- upvalues: applyMerge (copy)
			return (applyMerge(p8, p9, true, p10))
		end,
		beginLoadMore = function(p8) --[[ Line: 275 ]]
			-- upvalues: Flag (ref), Signal (copy), config (copy), LoadStatus (upval)
			assert(not Flag, "Comment collection store is disposed")
			assert(Signal(false) == p8, "Comment feed must be selected before mutation")
			local GetResult = config.get(false)
			config.set({
				orderedCommentIds = GetResult.orderedCommentIds,
				channelId = GetResult.channelId,
				nextCursor = GetResult.nextCursor,
				hasMore = GetResult.hasMore,
				initialLoadStatus = GetResult.initialLoadStatus,
				loadMoreStatus = LoadStatus.Loading,
				errorCode = GetResult.errorCode,
				pendingSubmission = GetResult.pendingSubmission,
				stickyPostedCommentIds = GetResult.stickyPostedCommentIds,
				submissionError = GetResult.submissionError
			})
		end,
		completeLoadMore = function(p8, p9, p10) --[[ Line: 292 ]]
			-- upvalues: applyMerge (copy)
			return (applyMerge(p8, p9, false, p10))
		end,
		failLoad = function(p8, p9, ErrorCode) --[[ Line: 300 ]]
			-- upvalues: Flag (ref), Signal (copy), config (copy), LoadStatus (upval)
			assert(not Flag, "Comment collection store is disposed")
			assert(Signal(false) == p8, "Comment feed must be selected before mutation")
			local GetResult = config.get(false)
			config.set({
				orderedCommentIds = GetResult.orderedCommentIds,
				channelId = GetResult.channelId,
				nextCursor = GetResult.nextCursor,
				hasMore = GetResult.hasMore,
				initialLoadStatus = if p9 == "initial" then LoadStatus.Failed else GetResult.initialLoadStatus,
				loadMoreStatus = if p9 == "more" then LoadStatus.Failed else GetResult.loadMoreStatus,
				errorCode = ErrorCode,
				pendingSubmission = GetResult.pendingSubmission,
				stickyPostedCommentIds = GetResult.stickyPostedCommentIds,
				submissionError = GetResult.submissionError
			})
		end,
		beginPendingSubmission = function(p8, Text) --[[ Line: 327 ]]
			-- upvalues: Flag (ref), Signal (copy), config (copy), HttpService (upval), PendingSentinelFunction (upval)
			assert(not Flag, "Comment collection store is disposed")
			assert(Signal(false) == p8, "Comment feed must be selected before mutation")
			local GetResult = config.get(false)
			local PendingSubmission = GetResult.pendingSubmission
			
			if PendingSubmission == nil or PendingSubmission.text ~= Text then
				local Guid = HttpService:GenerateGUID(false)
				local PendingSentinelResult = PendingSentinelFunction(Guid)
				local Copy = nil
				
				if PendingSubmission == nil then
					Copy = table.clone(GetResult.orderedCommentIds)
				else
					local OrderedCommentIds = GetResult.orderedCommentIds
					local PendingSentinelResult1 = PendingSentinelFunction(PendingSubmission.clientRequestId)
					local List = {}
					
					for _, orderedCommentId in OrderedCommentIds do
						if orderedCommentId ~= PendingSentinelResult1 then
							table.insert(List, orderedCommentId)
						end
					end
					Copy = List
				end
				table.insert(Copy, 1, PendingSentinelResult)
				config.set({
					submissionError = nil,
					orderedCommentIds = Copy,
					channelId = GetResult.channelId,
					nextCursor = GetResult.nextCursor,
					hasMore = GetResult.hasMore,
					initialLoadStatus = GetResult.initialLoadStatus,
					loadMoreStatus = GetResult.loadMoreStatus,
					errorCode = GetResult.errorCode,
					pendingSubmission = { status = "Sending", clientRequestId = Guid, text = Text },
					stickyPostedCommentIds = GetResult.stickyPostedCommentIds
				})
				
				return Guid
			else
				if GetResult.submissionError ~= nil then
					config.set({
						submissionError = nil,
						orderedCommentIds = GetResult.orderedCommentIds,
						channelId = GetResult.channelId,
						nextCursor = GetResult.nextCursor,
						hasMore = GetResult.hasMore,
						initialLoadStatus = GetResult.initialLoadStatus,
						loadMoreStatus = GetResult.loadMoreStatus,
						errorCode = GetResult.errorCode,
						pendingSubmission = PendingSubmission,
						stickyPostedCommentIds = GetResult.stickyPostedCommentIds
					})
				end
				return PendingSubmission.clientRequestId
			end
		end,
		markPendingSending = function(p9) --[[ Line: 374 ]]
			-- upvalues: Flag (ref), Signal (copy), config (copy)
			assert(not Flag, "Comment collection store is disposed")
			assert(Signal(false) == p9, "Comment feed must be selected before mutation")
			local GetResult = config.get(false)
			local PendingSubmission = GetResult.pendingSubmission
			
			if PendingSubmission ~= nil then
				config.set({
					orderedCommentIds = GetResult.orderedCommentIds,
					channelId = GetResult.channelId,
					nextCursor = GetResult.nextCursor,
					hasMore = GetResult.hasMore,
					initialLoadStatus = GetResult.initialLoadStatus,
					loadMoreStatus = GetResult.loadMoreStatus,
					errorCode = GetResult.errorCode,
					pendingSubmission = {
						status = "Sending",
						clientRequestId = PendingSubmission.clientRequestId,
						text = PendingSubmission.text
					},
					stickyPostedCommentIds = GetResult.stickyPostedCommentIds,
					submissionError = GetResult.submissionError
				})
				
				return
			end
		end,
		markPendingOutcomeUnknown = function(p9) --[[ Line: 399 ]]
			-- upvalues: Flag (ref), Signal (copy), config (copy)
			assert(not Flag, "Comment collection store is disposed")
			assert(Signal(false) == p9, "Comment feed must be selected before mutation")
			local GetResult = config.get(false)
			local PendingSubmission = GetResult.pendingSubmission
			
			if PendingSubmission ~= nil then
				config.set({
					orderedCommentIds = GetResult.orderedCommentIds,
					channelId = GetResult.channelId,
					nextCursor = GetResult.nextCursor,
					hasMore = GetResult.hasMore,
					initialLoadStatus = GetResult.initialLoadStatus,
					loadMoreStatus = GetResult.loadMoreStatus,
					errorCode = GetResult.errorCode,
					pendingSubmission = {
						status = "OutcomeUnknown",
						clientRequestId = PendingSubmission.clientRequestId,
						text = PendingSubmission.text
					},
					stickyPostedCommentIds = GetResult.stickyPostedCommentIds,
					submissionError = GetResult.submissionError
				})
				
				return
			end
		end,
		resolvePendingSubmission = function(p9, p10) --[[ Line: 454 ]]
			-- upvalues: Flag (ref), Signal (copy), config (copy), PendingSentinelFunction (upval), replaceId (copy)
			assert(not Flag, "Comment collection store is disposed")
			assert(Signal(false) == p9, "Comment feed must be selected before mutation")
			local GetResult = config.get(false)
			local PendingSubmission = GetResult.pendingSubmission
			
			if PendingSubmission == nil then return end
			local SetFunction: (any) -> () = config.set
			local config1 = {
				pendingSubmission = nil,
				submissionError = nil,
				orderedCommentIds = replaceId(GetResult.orderedCommentIds, PendingSentinelFunction(PendingSubmission.clientRequestId), p10.commentId),
				channelId = GetResult.channelId,
				nextCursor = GetResult.nextCursor,
				hasMore = GetResult.hasMore,
				initialLoadStatus = GetResult.initialLoadStatus,
				loadMoreStatus = GetResult.loadMoreStatus,
				errorCode = GetResult.errorCode
			}
			local CommentId = p10.commentId
			local StickyPostedCommentIds = { CommentId }
			
			for _, stickyPostedCommentId in GetResult.stickyPostedCommentIds do
				if stickyPostedCommentId ~= CommentId then
					table.insert(StickyPostedCommentIds, stickyPostedCommentId)
				end
			end
			config1.stickyPostedCommentIds = StickyPostedCommentIds
			SetFunction(config1)
		end,
		rejectPendingSubmission = function(p11, ErrorCode) --[[ Line: 476 ]]
			-- upvalues: Flag (ref), Signal (copy), config (copy), PendingSentinelFunction (upval)
			assert(not Flag, "Comment collection store is disposed")
			assert(Signal(false) == p11, "Comment feed must be selected before mutation")
			local GetResult = config.get(false)
			local PendingSubmission = GetResult.pendingSubmission
			
			if PendingSubmission == nil then return end
			local Config = if ErrorCode == nil then nil else { errorCode = ErrorCode, text = PendingSubmission.text }
			local SetFunction: (any) -> () = config.set
			local config1 = { pendingSubmission = nil }
			local OrderedCommentIds = GetResult.orderedCommentIds
			local PendingSentinelResult = PendingSentinelFunction(PendingSubmission.clientRequestId)
			local OrderedCommentIds1 = {}
			
			for _, orderedCommentId in OrderedCommentIds do
				if orderedCommentId ~= PendingSentinelResult then
					table.insert(OrderedCommentIds1, orderedCommentId)
				end
			end
			config1.orderedCommentIds = OrderedCommentIds1
			config1.channelId = GetResult.channelId
			config1.nextCursor = GetResult.nextCursor
			config1.hasMore = GetResult.hasMore
			config1.initialLoadStatus = GetResult.initialLoadStatus
			config1.loadMoreStatus = GetResult.loadMoreStatus
			config1.errorCode = GetResult.errorCode
			config1.stickyPostedCommentIds = GetResult.stickyPostedCommentIds
			config1.submissionError = Config
			SetFunction(config1)
		end,
		clearSubmissionError = function(p12) --[[ Line: 503 ]]
			-- upvalues: Flag (ref), Signal (copy), config (copy)
			assert(not Flag, "Comment collection store is disposed")
			assert(Signal(false) == p12, "Comment feed must be selected before mutation")
			local GetResult = config.get(false)
			
			if GetResult.submissionError ~= nil then
				config.set({
					submissionError = nil,
					orderedCommentIds = GetResult.orderedCommentIds,
					channelId = GetResult.channelId,
					nextCursor = GetResult.nextCursor,
					hasMore = GetResult.hasMore,
					initialLoadStatus = GetResult.initialLoadStatus,
					loadMoreStatus = GetResult.loadMoreStatus,
					errorCode = GetResult.errorCode,
					pendingSubmission = GetResult.pendingSubmission,
					stickyPostedCommentIds = GetResult.stickyPostedCommentIds
				})
				
				return
			end
		end,
		getPendingSubmission = function(p12) --[[ Line: 523 ]]
			-- upvalues: Signal (copy), config (copy)
			return if Signal(false) == p12 then config.get(false).pendingSubmission else nil
		end,
		removeCommentId = function(p12, p13) --[[ Line: 530 ]]
			-- upvalues: Flag (ref), Signal (copy), config (copy)
			assert(not Flag, "Comment collection store is disposed")
			assert(Signal(false) == p12, "Comment feed must be selected before mutation")
			local GetResult = config.get(false)
			local SetFunction: (any) -> () = config.set
			local t = {}
			local OrderedCommentIds = {}
			
			for _, orderedCommentId in GetResult.orderedCommentIds do
				if orderedCommentId ~= p13 then
					table.insert(OrderedCommentIds, orderedCommentId)
				end
			end
			t.orderedCommentIds = OrderedCommentIds
			t.channelId = GetResult.channelId
			t.nextCursor = GetResult.nextCursor
			t.hasMore = GetResult.hasMore
			t.initialLoadStatus = GetResult.initialLoadStatus
			t.loadMoreStatus = GetResult.loadMoreStatus
			t.errorCode = GetResult.errorCode
			t.pendingSubmission = GetResult.pendingSubmission
			local StickyPostedCommentIds = {}
			
			for _, stickyPostedCommentId in GetResult.stickyPostedCommentIds do
				if stickyPostedCommentId ~= p13 then
					table.insert(StickyPostedCommentIds, stickyPostedCommentId)
				end
			end
			t.stickyPostedCommentIds = StickyPostedCommentIds
			t.submissionError = GetResult.submissionError
			SetFunction(t)
		end,
		removeCommentIdsByAuthor = function(p14, p15, Callback) --[[ Line: 547 ]]
			-- upvalues: Flag (ref), Signal (copy), config (copy)
			assert(not Flag, "Comment collection store is disposed")
			assert(Signal(false) == p14, "Comment feed must be selected before mutation")
			local GetResult = config.get(false)
			local OrderedCommentIds = {}
			
			for _, orderedCommentId in GetResult.orderedCommentIds do
				if Callback(orderedCommentId) ~= p15 then
					table.insert(OrderedCommentIds, orderedCommentId)
				end
			end
			local StickyPostedCommentIds = {}
			
			for _, stickyPostedCommentId in GetResult.stickyPostedCommentIds do
				if Callback(stickyPostedCommentId) ~= p15 then
					table.insert(StickyPostedCommentIds, stickyPostedCommentId)
				end
			end
			config.set({
				orderedCommentIds = OrderedCommentIds,
				channelId = GetResult.channelId,
				nextCursor = GetResult.nextCursor,
				hasMore = GetResult.hasMore,
				initialLoadStatus = GetResult.initialLoadStatus,
				loadMoreStatus = GetResult.loadMoreStatus,
				errorCode = GetResult.errorCode,
				pendingSubmission = GetResult.pendingSubmission,
				stickyPostedCommentIds = StickyPostedCommentIds,
				submissionError = GetResult.submissionError
			})
		end
	}
end