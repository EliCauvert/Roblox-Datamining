local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("Moments").Parent
local signalsModule = require(parent.Signals)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local commentCollectionTypesModule = require(script.Parent.CommentCollectionTypes)
local mergeCommentPageModule = require(script.Parent.mergeCommentPage)
local createCommentSessionFiltersStoreModule = require(script.Parent.Parent.GetCommentSessionFiltersStore.createCommentSessionFiltersStore)
local loadStatus = commentCollectionTypesModule.LoadStatus
local pendingSentinel = commentCollectionTypesModule.pendingSentinel
local createSignal = signalsModule.createSignal

local function defaultState(p1)
	-- upvalues: loadStatus (ref)
	return {
		nextCursor = nil,
		hasMore = false,
		errorCode = nil,
		orderedCommentIds = {},
		initialLoadStatus = loadStatus.Idle,
		loadMoreStatus = loadStatus.Idle,
		pendingSubmission = p1
	}
end

return function(p1)
	-- upvalues: createCommentSessionFiltersStoreModule (ref), createSignal (ref), defaultState (ref), pendingSentinel (ref), mergeCommentPageModule (ref), loadStatus (ref), httpService (ref)
	p1 = p1 or {}
	local commentsStore = p1.commentsStore
	local var1 = if p1.sessionFilters ~= nil then createCommentSessionFiltersStoreModule() else p1.sessionFilters
	local t = {}
	
	local function _(p2)
		-- upvalues: t (ref), createSignal (copy), defaultState (copy)
		local var2 = t[p2]
		
		if var2 == nil then
			local var3, var4 = createSignal(defaultState())
			local t_1 = { get = var3, set = var4 }
			t[p2] = t_1
			
			return t_1
		end
		return var2
	end
	
	local function getState(p2)
		-- upvalues: t (ref), createSignal (copy), defaultState (copy)
		local var2
		local var3 = t[p2]
		
		if var3 == nil then
			local var4, var5 = createSignal(defaultState())
			local t_1 = { get = var4, set = var5 }
			t[p2] = t_1
			var2 = t_1
		else
			var2 = var3
		end
		return var2.get
	end
	
	local _ = function(p2)
		-- upvalues: var1 (ref)
		return if p2 == nil then var1.getFilters(false) else p2
	end
	
	local _ = function(p2)
		-- upvalues: commentsStore (ref)
		if commentsStore ~= nil then
			commentsStore.upsertComments(p2.comments)
		end
	end
	
	local _ = function(p2)
		-- upvalues: pendingSentinel (copy)
		local pendingSubmission = p2.pendingSubmission
		
		return if pendingSubmission == nil then nil else pendingSentinel(pendingSubmission.clientRequestId)
	end
	
	local function applyMerge(p2, p3, p4, p5)
		-- upvalues: t (ref), createSignal (copy), defaultState (copy), commentsStore (ref), mergeCommentPageModule (copy), var1 (ref), pendingSentinel (copy), loadStatus (copy)
		local var2
		local var3 = t[p2]
		
		if var3 == nil then
			local var4, var5 = createSignal(defaultState())
			local t_1 = { get = var4, set = var5 }
			t[p2] = t_1
			var2 = t_1
		else
			var2 = var3
		end
		local var6 = var2.get(false)
		
		if commentsStore ~= nil then
			commentsStore.upsertComments(p3.comments)
		end
		local t_1 = {
			existingIds = var6.orderedCommentIds,
			pageComments = p3.comments,
			filters = if p5 ~= nil then var1.getFilters(false) else p5,
			replace = p4
		}
		local pendingSubmission = var6.pendingSubmission
		t_1.pendingSentinel = if pendingSubmission == nil then nil else pendingSentinel(pendingSubmission.clientRequestId)
		t_1.hasMore = p3.hasMore
		local var7 = mergeCommentPageModule(t_1)
		var2.set({
			errorCode = nil,
			orderedCommentIds = var7.orderedCommentIds,
			nextCursor = p3.nextCursor,
			hasMore = p3.hasMore,
			initialLoadStatus = if p4 then loadStatus.Success else var6.initialLoadStatus,
			loadMoreStatus = if p4 then loadStatus.Idle else loadStatus.Success,
			pendingSubmission = var6.pendingSubmission
		})
		
		return var7
	end
	
	local function resetListSession(value)
		-- upvalues: t (ref), createSignal (copy), defaultState (copy), loadStatus (copy)
		local var2
		local var3 = t[value]
		
		if var3 == nil then
			local var4, var5 = createSignal(defaultState())
			local t_1 = { get = var4, set = var5 }
			t[value] = t_1
			var2 = t_1
		else
			var2 = var3
		end
		var2.set({
			nextCursor = nil,
			hasMore = false,
			errorCode = nil,
			orderedCommentIds = {},
			initialLoadStatus = loadStatus.Idle,
			loadMoreStatus = loadStatus.Idle,
			pendingSubmission = var2.get(false).pendingSubmission
		})
	end
	
	local function beginInitialLoad(p2)
		-- upvalues: t (ref), createSignal (copy), defaultState (copy), loadStatus (copy)
		local var2
		local var3 = t[p2]
		
		if var3 == nil then
			local var4, var5 = createSignal(defaultState())
			local t_1 = { get = var4, set = var5 }
			t[p2] = t_1
			var2 = t_1
		else
			var2 = var3
		end
		local var6 = var2.get(false)
		var2.set({
			errorCode = nil,
			orderedCommentIds = var6.orderedCommentIds,
			nextCursor = var6.nextCursor,
			hasMore = var6.hasMore,
			initialLoadStatus = loadStatus.Loading,
			loadMoreStatus = var6.loadMoreStatus,
			pendingSubmission = var6.pendingSubmission
		})
	end
	
	local function completeInitialLoad(p2, p3, p4)
		-- upvalues: applyMerge (ref)
		return applyMerge(p2, p3, true, p4)
	end
	
	local function beginLoadMore(p2)
		-- upvalues: t (ref), createSignal (copy), defaultState (copy), loadStatus (copy)
		local var2
		local var3 = t[p2]
		
		if var3 == nil then
			local var4, var5 = createSignal(defaultState())
			local t_1 = { get = var4, set = var5 }
			t[p2] = t_1
			var2 = t_1
		else
			var2 = var3
		end
		local var6 = var2.get(false)
		var2.set({
			orderedCommentIds = var6.orderedCommentIds,
			nextCursor = var6.nextCursor,
			hasMore = var6.hasMore,
			initialLoadStatus = var6.initialLoadStatus,
			loadMoreStatus = loadStatus.Loading,
			errorCode = var6.errorCode,
			pendingSubmission = var6.pendingSubmission
		})
	end
	
	local function completeLoadMore(p2, p3, p4)
		-- upvalues: applyMerge (ref)
		return applyMerge(p2, p3, false, p4)
	end
	
	local function failLoad(p2, p3, p4)
		-- upvalues: t (ref), createSignal (copy), defaultState (copy), loadStatus (copy)
		local var2
		local var3 = t[p2]
		
		if var3 == nil then
			local var4, var5 = createSignal(defaultState())
			local t_1 = { get = var4, set = var5 }
			t[p2] = t_1
			var2 = t_1
		else
			var2 = var3
		end
		local var6 = var2.get(false)
		var2.set({
			orderedCommentIds = var6.orderedCommentIds,
			nextCursor = var6.nextCursor,
			hasMore = var6.hasMore,
			initialLoadStatus = if p3 == "initial" then loadStatus.Failed else var6.initialLoadStatus,
			loadMoreStatus = if p3 == "more" then loadStatus.Failed else var6.loadMoreStatus,
			errorCode = p4,
			pendingSubmission = var6.pendingSubmission
		})
	end
	
	local _ = function(p2, p3)
		local t = {}
		
		for i, v in p2 do
			if v ~= p3 then
				table.insert(t, v)
			end
		end
		return t
	end
	
	local function replaceId(p4, p5, p6)
		local t = {}
		local var2 = false
		local t_1 = {}
		
		for i, v in p4 do
			local var3 = if v == p5 then p6 else v
			
			if not t_1[var3] then
				table.insert(t, var3)
				t_1[var3] = true
				
				if v == p5 then
					var2 = true
				end
			end
		end
		if not var2 and not t_1[p6] then
			table.insert(t, 1, p6)
		end
		return t
	end
	
	return {
		getState = getState,
		resetListSession = resetListSession,
		beginInitialLoad = beginInitialLoad,
		completeInitialLoad = completeInitialLoad,
		beginLoadMore = beginLoadMore,
		completeLoadMore = completeLoadMore,
		failLoad = failLoad,
		beginPendingSubmission = function(p7, p8)
			-- upvalues: t (ref), createSignal (copy), defaultState (copy), httpService (copy), pendingSentinel (copy)
			local var4
			local var5 = t[p7]
			
			if var5 == nil then
				local var6, var7 = createSignal(defaultState())
				local t_1 = { get = var6, set = var7 }
				t[p7] = t_1
				var4 = t_1
			else
				var4 = var5
			end
			local var8 = var4.get(false)
			local pendingSubmission = var8.pendingSubmission
			
			if pendingSubmission ~= nil and pendingSubmission.text == p8 then
				return pendingSubmission.clientRequestId
			end
			local var9
			local var10 = httpService:GenerateGUID(false)
			local var11 = pendingSentinel(var10)
			
			if pendingSubmission == nil then
				var9 = table.clone(var8.orderedCommentIds)
			else
				local orderedCommentIds = var8.orderedCommentIds
				local var12 = pendingSentinel(pendingSubmission.clientRequestId)
				local t_1 = {}
				
				for i, v in orderedCommentIds do
					if v ~= var12 then
						table.insert(t_1, v)
					end
				end
				var9 = t_1
			end
			table.insert(var9, 1, var11)
			var4.set({
				orderedCommentIds = var9,
				nextCursor = var8.nextCursor,
				hasMore = var8.hasMore,
				initialLoadStatus = var8.initialLoadStatus,
				loadMoreStatus = var8.loadMoreStatus,
				errorCode = var8.errorCode,
				pendingSubmission = { status = "Sending", clientRequestId = var10, text = p8 }
			})
			
			return var10
		end,
		markPendingOutcomeUnknown = function(p9)
			-- upvalues: t (ref), createSignal (copy), defaultState (copy)
			local var13
			local var14 = t[p9]
			
			if var14 == nil then
				local var15, var16 = createSignal(defaultState())
				local t_1 = { get = var15, set = var16 }
				t[p9] = t_1
				var13 = t_1
			else
				var13 = var14
			end
			local var17 = var13.get(false)
			local pendingSubmission = var17.pendingSubmission
			
			if pendingSubmission == nil then
				return
			end
			var13.set({
				orderedCommentIds = var17.orderedCommentIds,
				nextCursor = var17.nextCursor,
				hasMore = var17.hasMore,
				initialLoadStatus = var17.initialLoadStatus,
				loadMoreStatus = var17.loadMoreStatus,
				errorCode = var17.errorCode,
				pendingSubmission = {
					status = "OutcomeUnknown",
					clientRequestId = pendingSubmission.clientRequestId,
					text = pendingSubmission.text
				}
			})
		end,
		resolvePendingSubmission = function(p9, p10)
			-- upvalues: t (ref), createSignal (copy), defaultState (copy), commentsStore (ref), pendingSentinel (copy), replaceId (ref)
			local var13
			local var14 = t[p9]
			
			if var14 == nil then
				local var15, var16 = createSignal(defaultState())
				local t_1 = { get = var15, set = var16 }
				t[p9] = t_1
				var13 = t_1
			else
				var13 = var14
			end
			local var17 = var13.get(false)
			local pendingSubmission = var17.pendingSubmission
			
			if pendingSubmission == nil then return end
			if commentsStore ~= nil then
				commentsStore.upsertComments({ p10 })
			end
			var13.set({
				pendingSubmission = nil,
				orderedCommentIds = replaceId(var17.orderedCommentIds, pendingSentinel(pendingSubmission.clientRequestId), p10.commentId),
				nextCursor = var17.nextCursor,
				hasMore = var17.hasMore,
				initialLoadStatus = var17.initialLoadStatus,
				loadMoreStatus = var17.loadMoreStatus,
				errorCode = var17.errorCode
			})
		end,
		rejectPendingSubmission = function(p9)
			-- upvalues: t (ref), createSignal (copy), defaultState (copy), pendingSentinel (copy)
			local var13
			local var14 = t[p9]
			
			if var14 == nil then
				local var15, var16 = createSignal(defaultState())
				local t_1 = { get = var15, set = var16 }
				t[p9] = t_1
				var13 = t_1
			else
				var13 = var14
			end
			local var17 = var13.get(false)
			local pendingSubmission = var17.pendingSubmission
			
			if pendingSubmission == nil then return end
			local set = var13.set
			local t_1 = { pendingSubmission = nil }
			local orderedCommentIds = var17.orderedCommentIds
			local var18 = pendingSentinel(pendingSubmission.clientRequestId)
			local t_2 = {}
			
			for i, v in orderedCommentIds do
				if v ~= var18 then
					table.insert(t_2, v)
				end
			end
			t_1.orderedCommentIds = t_2
			t_1.nextCursor = var17.nextCursor
			t_1.hasMore = var17.hasMore
			t_1.initialLoadStatus = var17.initialLoadStatus
			t_1.loadMoreStatus = var17.loadMoreStatus
			t_1.errorCode = var17.errorCode
			set(t_1)
		end,
		getPendingSubmission = function(p10)
			-- upvalues: t (ref), createSignal (copy), defaultState (copy)
			local var19
			local var20 = t[p10]
			
			if var20 == nil then
				local var21, var22 = createSignal(defaultState())
				local t_1 = { get = var21, set = var22 }
				t[p10] = t_1
				var19 = t_1
			else
				var19 = var20
			end
			return var19.get(false).pendingSubmission
		end,
		removeCommentId = function(p10, p11)
			-- upvalues: t (ref), createSignal (copy), defaultState (copy)
			local var19
			local var20 = t[p10]
			
			if var20 == nil then
				local var21, var22 = createSignal(defaultState())
				local t_1 = { get = var21, set = var22 }
				t[p10] = t_1
				var19 = t_1
			else
				var19 = var20
			end
			local var23 = var19.get(false)
			local set = var19.set
			local t_1 = {}
			local t_2 = {}
			
			for i, v in var23.orderedCommentIds do
				if v ~= p11 then
					table.insert(t_2, v)
				end
			end
			t_1.orderedCommentIds = t_2
			t_1.nextCursor = var23.nextCursor
			t_1.hasMore = var23.hasMore
			t_1.initialLoadStatus = var23.initialLoadStatus
			t_1.loadMoreStatus = var23.loadMoreStatus
			t_1.errorCode = var23.errorCode
			t_1.pendingSubmission = var23.pendingSubmission
			set(t_1)
		end,
		removeCommentIdsByAuthor = function(p12, p13, p14)
			-- upvalues: t (ref), createSignal (copy), defaultState (copy)
			local var24
			local var25 = t[p12]
			
			if var25 == nil then
				local var26, var27 = createSignal(defaultState())
				local t_1 = { get = var26, set = var27 }
				t[p12] = t_1
				var24 = t_1
			else
				var24 = var25
			end
			local var28 = var24.get(false)
			local t_1 = {}
			
			for i, v in var28.orderedCommentIds do
				if p14(v) ~= p13 then
					table.insert(t_1, v)
				end
			end
			var24.set({
				orderedCommentIds = t_1,
				nextCursor = var28.nextCursor,
				hasMore = var28.hasMore,
				initialLoadStatus = var28.initialLoadStatus,
				loadMoreStatus = var28.loadMoreStatus,
				errorCode = var28.errorCode,
				pendingSubmission = var28.pendingSubmission
			})
		end
	}
end