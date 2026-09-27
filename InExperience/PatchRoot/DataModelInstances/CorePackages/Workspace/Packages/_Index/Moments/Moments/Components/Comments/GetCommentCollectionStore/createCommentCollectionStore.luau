local httpService = game:GetService("HttpService")
local signalsModule = require(script:FindFirstAncestor("Moments").Parent.Signals)
local commentCollectionTypesModule = require(script.Parent.CommentCollectionTypes)
local mergeCommentPageModule = require(script.Parent.mergeCommentPage)
local createCommentSessionFiltersStoreModule = require(script.Parent.Parent.GetCommentSessionFiltersStore.createCommentSessionFiltersStore)
local loadStatus = commentCollectionTypesModule.LoadStatus
local pendingSentinel = commentCollectionTypesModule.pendingSentinel
local createSignal = signalsModule.createSignal

local function specialOrderedIds(p1, p2)
	-- upvalues: pendingSentinel (ref)
	local t = {}
	local t_1 = {}
	p2 = p2 or {}
	
	if p1 ~= nil then
		local var1 = pendingSentinel(p1.clientRequestId)
		table.insert(t, var1)
		t_1[var1] = true
	end
	for i, v in p2 do
		if not t_1[v] then
			table.insert(t, v)
			t_1[v] = true
		end
	end
	return t
end

local function defaultState(p3, p4)
	-- upvalues: specialOrderedIds (ref), loadStatus (ref)
	p4 = p4 or {}
	
	return {
		channelId = nil,
		nextCursor = nil,
		hasMore = false,
		errorCode = nil,
		submissionError = nil,
		orderedCommentIds = specialOrderedIds(p3, p4),
		initialLoadStatus = loadStatus.Idle,
		loadMoreStatus = loadStatus.Idle,
		pendingSubmission = p3,
		stickyPostedCommentIds = table.clone(p4)
	}
end

return function(p3)
	-- upvalues: createCommentSessionFiltersStoreModule (ref), createSignal (ref), defaultState (ref), pendingSentinel (ref), mergeCommentPageModule (ref), loadStatus (ref), specialOrderedIds (ref), httpService (ref)
	p3 = p3 or {}
	local var2 = if p3.sessionFilters ~= nil then createCommentSessionFiltersStoreModule() else p3.sessionFilters
	local var3, var4 = createSignal(nil)
	local var5, var6 = createSignal(defaultState())
	local t = { get = var5, set = var6 }
	local var7 = nil
	local var8 = false
	
	local function _(p4)
		-- upvalues: var8 (write), var3 (ref), t (ref)
		assert(not var8, "Comment collection store is disposed")
		assert(var3(false) == p4, "Comment feed must be selected before mutation")
		
		return t
	end
	
	local function getState(p4)
		-- upvalues: var3 (ref), defaultState (copy), t (ref)
		return function(p5)
			-- upvalues: var3 (copy), p4 (ref), defaultState (copy), t (copy)
			return if var3(p5) == p4 then t.get(p5) else defaultState()
		end
	end
	
	local function clear()
		-- upvalues: var8 (write), t (ref), defaultState (copy), var7 (write), var4 (ref), var2 (ref)
		if var8 then
			return
		end
		t.set(defaultState())
		var7 = nil
		var4(nil)
		var2.reset()
	end
	
	local function selectFeed(p4, p5)
		-- upvalues: var8 (write), var3 (ref), var7 (write), t (ref), defaultState (copy), var4 (ref), var2 (ref)
		assert(not var8, "Comment collection store is disposed")
		
		if var3(false) == p4 and var7 == p5 then
			return
		end
		t.set(defaultState())
		var7 = p5
		var4(p4)
		var2.reset()
	end
	
	local function dispose()
		-- upvalues: var8 (write), t (ref), defaultState (copy), var7 (write), var4 (ref), var2 (ref)
		if var8 then return end
		if not var8 then
			t.set(defaultState())
			var7 = nil
			var4(nil)
			var2.reset()
		end
		var8 = true
	end
	
	local _ = function(p4)
		-- upvalues: var2 (ref)
		return if p4 == nil then var2.getFilters(false) else p4
	end
	
	local _ = function(p4)
		-- upvalues: pendingSentinel (copy)
		local pendingSubmission = p4.pendingSubmission
		
		return if pendingSubmission == nil then nil else pendingSentinel(pendingSubmission.clientRequestId)
	end
	
	local function applyMerge(p4, p5, p6, p7)
		-- upvalues: var8 (write), var3 (ref), t (ref), mergeCommentPageModule (copy), var2 (ref), pendingSentinel (copy), loadStatus (copy)
		assert(not var8, "Comment collection store is disposed")
		assert(var3(false) == p4, "Comment feed must be selected before mutation")
		local var9 = t.get(false)
		local t_1 = {}
		
		for i, v in var9.orderedCommentIds do
			t_1[v] = true
		end
		local t_2 = {}
		
		for i_1, v_1 in p5.comments do
			t_2[v_1.commentId] = true
		end
		local t_3 = {}
		local t_4 = {}
		
		for i_2, v_2 in var9.stickyPostedCommentIds do
			if t_2[v_2] then
				t_4[v_2] = true
			else
				table.insert(t_3, v_2)
			end
		end
		local t_5 = {}
		
		for i_3, v_3 in var9.orderedCommentIds do
			if not t_4[v_3] then
				table.insert(t_5, v_3)
			end
		end
		local t_6 = {
			existingIds = t_5,
			pageComments = p5.comments,
			filters = if p7 ~= nil then var2.getFilters(false) else p7,
			replace = p6
		}
		local pendingSubmission = var9.pendingSubmission
		t_6.pendingSentinel = if pendingSubmission == nil then nil else pendingSentinel(pendingSubmission.clientRequestId)
		t_6.stickyPostedCommentIds = t_3
		t_6.visibleIdsBeforeReconciliation = t_1
		t_6.hasMore = p5.hasMore
		local var10 = mergeCommentPageModule(t_6)
		t.set({
			errorCode = nil,
			orderedCommentIds = var10.orderedCommentIds,
			channelId = p5.channelId or var9.channelId,
			nextCursor = p5.nextCursor,
			hasMore = p5.hasMore,
			initialLoadStatus = if p6 then loadStatus.Success else var9.initialLoadStatus,
			loadMoreStatus = if p6 then loadStatus.Idle else loadStatus.Success,
			pendingSubmission = var9.pendingSubmission,
			stickyPostedCommentIds = t_3,
			submissionError = var9.submissionError
		})
		
		return var10
	end
	
	local function beginListSession(p8)
		-- upvalues: var8 (write), var3 (ref), t (ref), defaultState (copy)
		assert(not var8, "Comment collection store is disposed")
		assert(var3(false) == p8, "Comment feed must be selected before mutation")
		local var11 = t.get(false)
		t.set(defaultState(var11.pendingSubmission, var11.stickyPostedCommentIds))
	end
	
	local function resetListSession(value)
		-- upvalues: var8 (write), var3 (ref), t (ref), specialOrderedIds (copy), loadStatus (copy)
		assert(not var8, "Comment collection store is disposed")
		assert(var3(false) == value, "Comment feed must be selected before mutation")
		local var11 = t.get(false)
		t.set({
			channelId = nil,
			nextCursor = nil,
			hasMore = false,
			errorCode = nil,
			orderedCommentIds = specialOrderedIds(var11.pendingSubmission, var11.stickyPostedCommentIds),
			initialLoadStatus = loadStatus.Idle,
			loadMoreStatus = loadStatus.Idle,
			pendingSubmission = var11.pendingSubmission,
			stickyPostedCommentIds = var11.stickyPostedCommentIds,
			submissionError = var11.submissionError
		})
	end
	
	local function beginInitialLoad(p8)
		-- upvalues: var8 (write), var3 (ref), t (ref), loadStatus (copy)
		assert(not var8, "Comment collection store is disposed")
		assert(var3(false) == p8, "Comment feed must be selected before mutation")
		local var11 = t.get(false)
		t.set({
			errorCode = nil,
			orderedCommentIds = var11.orderedCommentIds,
			channelId = var11.channelId,
			nextCursor = var11.nextCursor,
			hasMore = var11.hasMore,
			initialLoadStatus = loadStatus.Loading,
			loadMoreStatus = var11.loadMoreStatus,
			pendingSubmission = var11.pendingSubmission,
			stickyPostedCommentIds = var11.stickyPostedCommentIds,
			submissionError = var11.submissionError
		})
	end
	
	local function completeInitialLoad(p8, p9, p10)
		-- upvalues: applyMerge (ref)
		return applyMerge(p8, p9, true, p10)
	end
	
	local function beginLoadMore(p8)
		-- upvalues: var8 (write), var3 (ref), t (ref), loadStatus (copy)
		assert(not var8, "Comment collection store is disposed")
		assert(var3(false) == p8, "Comment feed must be selected before mutation")
		local var11 = t.get(false)
		t.set({
			orderedCommentIds = var11.orderedCommentIds,
			channelId = var11.channelId,
			nextCursor = var11.nextCursor,
			hasMore = var11.hasMore,
			initialLoadStatus = var11.initialLoadStatus,
			loadMoreStatus = loadStatus.Loading,
			errorCode = var11.errorCode,
			pendingSubmission = var11.pendingSubmission,
			stickyPostedCommentIds = var11.stickyPostedCommentIds,
			submissionError = var11.submissionError
		})
	end
	
	local function completeLoadMore(p8, p9, p10)
		-- upvalues: applyMerge (ref)
		return applyMerge(p8, p9, false, p10)
	end
	
	local function failLoad(p8, p9, p10)
		-- upvalues: var8 (write), var3 (ref), t (ref), loadStatus (copy)
		assert(not var8, "Comment collection store is disposed")
		assert(var3(false) == p8, "Comment feed must be selected before mutation")
		local var11 = t.get(false)
		t.set({
			orderedCommentIds = var11.orderedCommentIds,
			channelId = var11.channelId,
			nextCursor = var11.nextCursor,
			hasMore = var11.hasMore,
			initialLoadStatus = if p9 == "initial" then loadStatus.Failed else var11.initialLoadStatus,
			loadMoreStatus = if p9 == "more" then loadStatus.Failed else var11.loadMoreStatus,
			errorCode = p10,
			pendingSubmission = var11.pendingSubmission,
			stickyPostedCommentIds = var11.stickyPostedCommentIds,
			submissionError = var11.submissionError
		})
	end
	
	local _ = function(p8, p9)
		local t = {}
		
		for i, v in p8 do
			if v ~= p9 then
				table.insert(t, v)
			end
		end
		return t
	end
	
	local function beginPendingSubmission(p10, p11)
		-- upvalues: var8 (write), var3 (ref), t (ref), httpService (copy), pendingSentinel (copy)
		assert(not var8, "Comment collection store is disposed")
		assert(var3(false) == p10, "Comment feed must be selected before mutation")
		local var11 = t.get(false)
		local pendingSubmission = var11.pendingSubmission
		
		if pendingSubmission == nil or pendingSubmission.text ~= p11 then
			local var12
			local var13 = httpService:GenerateGUID(false)
			local var14 = pendingSentinel(var13)
			
			if pendingSubmission == nil then
				var12 = table.clone(var11.orderedCommentIds)
			else
				local orderedCommentIds = var11.orderedCommentIds
				local var15 = pendingSentinel(pendingSubmission.clientRequestId)
				local t_1 = {}
				
				for i, v in orderedCommentIds do
					if v ~= var15 then
						table.insert(t_1, v)
					end
				end
				var12 = t_1
			end
			table.insert(var12, 1, var14)
			t.set({
				submissionError = nil,
				orderedCommentIds = var12,
				channelId = var11.channelId,
				nextCursor = var11.nextCursor,
				hasMore = var11.hasMore,
				initialLoadStatus = var11.initialLoadStatus,
				loadMoreStatus = var11.loadMoreStatus,
				errorCode = var11.errorCode,
				pendingSubmission = { status = "Sending", clientRequestId = var13, text = p11 },
				stickyPostedCommentIds = var11.stickyPostedCommentIds
			})
			
			return var13
		elseif var11.submissionError ~= nil then
			t.set({
				submissionError = nil,
				orderedCommentIds = var11.orderedCommentIds,
				channelId = var11.channelId,
				nextCursor = var11.nextCursor,
				hasMore = var11.hasMore,
				initialLoadStatus = var11.initialLoadStatus,
				loadMoreStatus = var11.loadMoreStatus,
				errorCode = var11.errorCode,
				pendingSubmission = pendingSubmission,
				stickyPostedCommentIds = var11.stickyPostedCommentIds
			})
		end
		return pendingSubmission.clientRequestId
	end
	
	local function markPendingSending(p12)
		-- upvalues: var8 (write), var3 (ref), t (ref)
		assert(not var8, "Comment collection store is disposed")
		assert(var3(false) == p12, "Comment feed must be selected before mutation")
		local var16 = t.get(false)
		local pendingSubmission = var16.pendingSubmission
		
		if pendingSubmission == nil then
			return
		end
		t.set({
			orderedCommentIds = var16.orderedCommentIds,
			channelId = var16.channelId,
			nextCursor = var16.nextCursor,
			hasMore = var16.hasMore,
			initialLoadStatus = var16.initialLoadStatus,
			loadMoreStatus = var16.loadMoreStatus,
			errorCode = var16.errorCode,
			pendingSubmission = {
				status = "Sending",
				clientRequestId = pendingSubmission.clientRequestId,
				text = pendingSubmission.text
			},
			stickyPostedCommentIds = var16.stickyPostedCommentIds,
			submissionError = var16.submissionError
		})
	end
	
	local function markPendingOutcomeUnknown(p12)
		-- upvalues: var8 (write), var3 (ref), t (ref)
		assert(not var8, "Comment collection store is disposed")
		assert(var3(false) == p12, "Comment feed must be selected before mutation")
		local var16 = t.get(false)
		local pendingSubmission = var16.pendingSubmission
		
		if pendingSubmission == nil then
			return
		end
		t.set({
			orderedCommentIds = var16.orderedCommentIds,
			channelId = var16.channelId,
			nextCursor = var16.nextCursor,
			hasMore = var16.hasMore,
			initialLoadStatus = var16.initialLoadStatus,
			loadMoreStatus = var16.loadMoreStatus,
			errorCode = var16.errorCode,
			pendingSubmission = {
				status = "OutcomeUnknown",
				clientRequestId = pendingSubmission.clientRequestId,
				text = pendingSubmission.text
			},
			stickyPostedCommentIds = var16.stickyPostedCommentIds,
			submissionError = var16.submissionError
		})
	end
	
	local function replaceId(p12, p13, p14)
		local t = {}
		local var16 = false
		local t_1 = {}
		
		for i, v in p12 do
			local var17 = if v == p13 then p14 else v
			
			if not t_1[var17] then
				table.insert(t, var17)
				t_1[var17] = true
				
				if v == p13 then
					var16 = true
				end
			end
		end
		if not var16 and not t_1[p14] then
			table.insert(t, 1, p14)
		end
		return t
	end
	
	local _ = function(p15, p16)
		local list = { p16 }
		
		for i, v in p15 do
			if v ~= p16 then
				table.insert(list, v)
			end
		end
		return list
	end
	
	return {
		getState = getState,
		selectFeed = selectFeed,
		clear = clear,
		dispose = dispose,
		beginListSession = beginListSession,
		resetListSession = resetListSession,
		beginInitialLoad = beginInitialLoad,
		completeInitialLoad = completeInitialLoad,
		beginLoadMore = beginLoadMore,
		completeLoadMore = completeLoadMore,
		failLoad = failLoad,
		beginPendingSubmission = beginPendingSubmission,
		markPendingSending = markPendingSending,
		markPendingOutcomeUnknown = markPendingOutcomeUnknown,
		resolvePendingSubmission = function(p17, p18)
			-- upvalues: var8 (write), var3 (ref), t (ref), pendingSentinel (copy), replaceId (ref)
			assert(not var8, "Comment collection store is disposed")
			assert(var3(false) == p17, "Comment feed must be selected before mutation")
			local var18 = t.get(false)
			local pendingSubmission = var18.pendingSubmission
			
			if pendingSubmission == nil then return end
			local set = t.set
			local t_1 = {
				pendingSubmission = nil,
				submissionError = nil,
				orderedCommentIds = replaceId(var18.orderedCommentIds, pendingSentinel(pendingSubmission.clientRequestId), p18.commentId),
				channelId = var18.channelId,
				nextCursor = var18.nextCursor,
				hasMore = var18.hasMore,
				initialLoadStatus = var18.initialLoadStatus,
				loadMoreStatus = var18.loadMoreStatus,
				errorCode = var18.errorCode
			}
			local stickyPostedCommentIds = var18.stickyPostedCommentIds
			local commentId = p18.commentId
			local list = { commentId }
			
			for i, v in stickyPostedCommentIds do
				if v ~= commentId then
					table.insert(list, v)
				end
			end
			t_1.stickyPostedCommentIds = list
			set(t_1)
		end,
		rejectPendingSubmission = function(p19, p20)
			-- upvalues: var8 (write), var3 (ref), t (ref), pendingSentinel (copy)
			assert(not var8, "Comment collection store is disposed")
			assert(var3(false) == p19, "Comment feed must be selected before mutation")
			local var19 = t.get(false)
			local pendingSubmission = var19.pendingSubmission
			
			if pendingSubmission == nil then return end
			local var20 = if p20 ~= nil then nil else { errorCode = p20, text = pendingSubmission.text }
			local set = t.set
			local t_1 = { pendingSubmission = nil }
			local orderedCommentIds = var19.orderedCommentIds
			local var21 = pendingSentinel(pendingSubmission.clientRequestId)
			local t_2 = {}
			
			for i, v in orderedCommentIds do
				if v ~= var21 then
					table.insert(t_2, v)
				end
			end
			t_1.orderedCommentIds = t_2
			t_1.channelId = var19.channelId
			t_1.nextCursor = var19.nextCursor
			t_1.hasMore = var19.hasMore
			t_1.initialLoadStatus = var19.initialLoadStatus
			t_1.loadMoreStatus = var19.loadMoreStatus
			t_1.errorCode = var19.errorCode
			t_1.stickyPostedCommentIds = var19.stickyPostedCommentIds
			t_1.submissionError = var20
			set(t_1)
		end,
		clearSubmissionError = function(p21)
			-- upvalues: var8 (write), var3 (ref), t (ref)
			assert(not var8, "Comment collection store is disposed")
			assert(var3(false) == p21, "Comment feed must be selected before mutation")
			local var22 = t.get(false)
			
			if var22.submissionError == nil then
				return
			end
			t.set({
				submissionError = nil,
				orderedCommentIds = var22.orderedCommentIds,
				channelId = var22.channelId,
				nextCursor = var22.nextCursor,
				hasMore = var22.hasMore,
				initialLoadStatus = var22.initialLoadStatus,
				loadMoreStatus = var22.loadMoreStatus,
				errorCode = var22.errorCode,
				pendingSubmission = var22.pendingSubmission,
				stickyPostedCommentIds = var22.stickyPostedCommentIds
			})
		end,
		getPendingSubmission = function(p21)
			-- upvalues: var3 (ref), t (ref)
			return if var3(false) == p21 then t.get(false).pendingSubmission else nil
		end,
		removeCommentId = function(p21, p22)
			-- upvalues: var8 (write), var3 (ref), t (ref)
			assert(not var8, "Comment collection store is disposed")
			assert(var3(false) == p21, "Comment feed must be selected before mutation")
			local var22 = t.get(false)
			local set = t.set
			local t_1 = {}
			local t_2 = {}
			
			for i, v in var22.orderedCommentIds do
				if v ~= p22 then
					table.insert(t_2, v)
				end
			end
			t_1.orderedCommentIds = t_2
			t_1.channelId = var22.channelId
			t_1.nextCursor = var22.nextCursor
			t_1.hasMore = var22.hasMore
			t_1.initialLoadStatus = var22.initialLoadStatus
			t_1.loadMoreStatus = var22.loadMoreStatus
			t_1.errorCode = var22.errorCode
			t_1.pendingSubmission = var22.pendingSubmission
			local t_3 = {}
			
			for i, v_1 in var22.stickyPostedCommentIds do
				if v_1 ~= p22 then
					table.insert(t_3, v_1)
				end
			end
			t_1.stickyPostedCommentIds = t_3
			t_1.submissionError = var22.submissionError
			set(t_1)
		end,
		removeCommentIdsByAuthor = function(p23, p24, p25)
			-- upvalues: var8 (write), var3 (ref), t (ref)
			assert(not var8, "Comment collection store is disposed")
			assert(var3(false) == p23, "Comment feed must be selected before mutation")
			local var23 = t.get(false)
			local t_1 = {}
			
			for i, v in var23.orderedCommentIds do
				if p25(v) ~= p24 then
					table.insert(t_1, v)
				end
			end
			local t_2 = {}
			
			for i_1, v_1 in var23.stickyPostedCommentIds do
				if p25(v_1) ~= p24 then
					table.insert(t_2, v_1)
				end
			end
			t.set({
				orderedCommentIds = t_1,
				channelId = var23.channelId,
				nextCursor = var23.nextCursor,
				hasMore = var23.hasMore,
				initialLoadStatus = var23.initialLoadStatus,
				loadMoreStatus = var23.loadMoreStatus,
				errorCode = var23.errorCode,
				pendingSubmission = var23.pendingSubmission,
				stickyPostedCommentIds = t_2,
				submissionError = var23.submissionError
			})
		end
	}
end