local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local momentsCommonModule = require(parent.MomentsCommon)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local analytics = momentsCommonModule.Analytics
local momentsSurfaceLoadManager = momentsCommonModule.Performance.MomentsSurfaceLoadManager
local fFlagMomentsSurfaceLoadTTI = sharedFlagsModule.FFlagMomentsSurfaceLoadTTI
local fFlagMomentsRealtimeObservability = momentsCommonModule.Flags.FFlagMomentsRealtimeObservability
local fFlagMomentsContentStatsTelemetry = momentsCommonModule.Flags.FFlagMomentsContentStatsTelemetry
local _ = require(script.Parent.FeedTypes)
local createPagerStoreModule = require(moments.Components.VerticalPager.createPagerStore)
local fFlagMomentsNonInfiniteScrollEndStateFixesModule = require(moments.Flags.FFlagMomentsNonInfiniteScrollEndStateFixes)
local createSignal = signalsModule.createSignal
local t = { kind = "skeleton" }
local t_1 = { kind = "endState" }

return function(p1, p2, p3, p4)
	-- upvalues: createPagerStoreModule (ref), createSignal (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (ref), fFlagMomentsContentStatsTelemetry (ref), analytics (ref), t_1 (ref), fFlagMomentsRealtimeObservability (ref), t (ref), fFlagMomentsSurfaceLoadTTI (ref), momentsSurfaceLoadManager (ref)
	local var1 = createPagerStoreModule()
	local var2, var3 = createSignal("Loading")
	local var4, var5 = createSignal(nil)
	local var6, var7 = createSignal(true)
	local var8, var9 = createSignal(false)
	local recommendationSource = p1.recommendationSource or "Unknown"
	local var10 = nil
	local var11 = false
	local var12 = false
	local var13 = 0
	local var14 = 0
	local t_2 = {}
	local var15 = p4
	local var16, var17 = createSignal(false)
	local var18 = nil
	local var19 = nil
	
	if fFlagMomentsNonInfiniteScrollEndStateFixesModule then
		local var20, var21 = createSignal(false)
		var18 = var20
		var19 = var21
	end
	local t_3 = {}
	
	local function _()
		-- upvalues: var1 (ref)
		local items = var1.getItems(false)
		local var22 = items[#items]
		
		if var22 ~= nil and var22.kind == "skeleton" then
			var1.removeItem(#items)
		end
	end
	
	local function dedupeAndTrack(p5)
		-- upvalues: p2 (ref), t_2 (write), fFlagMomentsContentStatsTelemetry (copy), analytics (copy), recommendationSource (ref)
		if p2 == nil then
			return p5
		end
		local t = {}
		
		for i, v in p5 do
			local ok, status = pcall(p2, v)
			
			if ok then
				if status == nil or status == "" then
					table.insert(t, v)
				elseif not t_2[status] then
					t_2[status] = true
					table.insert(t, v)
				elseif fFlagMomentsContentStatsTelemetry then
					analytics.reportMomentsFeedItemFiltered("duplicate", recommendationSource)
				end
			elseif fFlagMomentsContentStatsTelemetry then
				analytics.reportMomentsFeedItemFiltered("malformed", recommendationSource)
			end
		end
		return t
	end
	
	local _ = function(p6)
		local var22 = 0
		
		for i, v in p6 do
			if v.kind ~= "skeleton" and v.kind ~= "endState" then
				var22 += 1
			end
		end
		return var22
	end
	
	local function maybeAppendEndState()
		-- upvalues: var15 (write), var16 (ref), var1 (ref), t_3 (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), var19 (write), var6 (ref), var17 (ref), t_1 (copy)
		if var15 == nil or var16(false) then return end
		local items = var1.getItems(false)
		local var23 = 0
		
		for i, v in items do
			if v.kind ~= "skeleton" and v.kind ~= "endState" then
				var23 += 1
			end
		end
		if var23 < var15 then return end
		local var24 = 0
		
		for i, v_1 in items do
			if v_1.kind ~= "skeleton" and v_1.kind ~= "endState" then
				var24 += 1
			end
		end
		if var15 < var24 then
			local t = {}
			var24 = 0
			
			for i, v_2 in items do
				if v_2.kind ~= "skeleton" and v_2.kind ~= "endState" then
					if var24 < var15 then
						var24 += 1
						table.insert(t, v_2)
					else
						table.insert(t_3, v_2)
					end
				end
			end
			var1.setItems(t)
		end
		if fFlagMomentsNonInfiniteScrollEndStateFixesModule then
			assert(var19, "end-state fixes require the eligibility signal")(var6(false) or #t_3 > 0)
		end
		var17(true)
		var1.addItems({ t_1 })
	end
	
	local function runFetch(p7)
		-- upvalues: var12 (write), var6 (ref), var14 (write), var11 (write), var9 (ref), fFlagMomentsRealtimeObservability (copy), analytics (copy), recommendationSource (ref), var5 (ref), var1 (ref), t (copy), var3 (ref), var15 (write), p4 (ref), var17 (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), var19 (write), t_3 (ref), fFlagMomentsSurfaceLoadTTI (copy), p3 (ref), momentsSurfaceLoadManager (copy), var10 (write), p1 (ref), t_2 (write), dedupeAndTrack (ref), var13 (write), var7 (ref), maybeAppendEndState (ref)
		if var12 then return end
		if not p7 and not var6(false) then return end
		var14 += 1
		local var25 = var14
		var11 = true
		var9(false)
		local sessionGeneration = nil
		
		if p7 then
			if fFlagMomentsRealtimeObservability then
				analytics.reportMomentsFeedLoadAttempt(recommendationSource)
			end
			var5(nil)
			var1.setItems({ t })
			var3("Loading")
			var15 = p4
			var17(false)
			
			if fFlagMomentsNonInfiniteScrollEndStateFixesModule then
				assert(var19, "end-state fixes require the eligibility signal")(false)
			end
			table.clear(t_3)
			
			if fFlagMomentsSurfaceLoadTTI and p3 then
				momentsSurfaceLoadManager.start()
				momentsSurfaceLoadManager.primaryDataStarted()
				momentsSurfaceLoadManager.primaryDataNetworkFetch()
				sessionGeneration = momentsSurfaceLoadManager.getSessionGeneration()
			end
		elseif fFlagMomentsRealtimeObservability then
			analytics.reportMomentsFeedLoadMore("attempted", recommendationSource)
		end
		var1.addItems({ t })
		var3("LoadingMore")
		local var26 = if p7 then nil else var10
		task.spawn(function()
			-- upvalues: p1 (copy), var26 (ref), var12 (copy), var25 (ref), var14 (copy), var11 (copy), fFlagMomentsSurfaceLoadTTI (copy), p3 (copy), p7 (ref), sessionGeneration (write), momentsSurfaceLoadManager (copy), t_2 (copy), dedupeAndTrack (copy), var1 (copy), var10 (copy), var13 (copy), var7 (copy), var3 (copy), fFlagMomentsRealtimeObservability (copy), analytics (copy), recommendationSource (copy), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), p4 (copy), maybeAppendEndState (copy), var5 (copy), var9 (copy)
			local ok, status = pcall(p1.fetchAsync, var26)
			
			if var12 or var25 ~= var14 then return end
			var11 = false
			local var27 = fFlagMomentsSurfaceLoadTTI and (p3 and (p7 and (sessionGeneration ~= nil and momentsSurfaceLoadManager.getSessionGeneration() == sessionGeneration)))
			
			if var27 then
				momentsSurfaceLoadManager.primaryDataResponseReceived()
			end
			local var28 = if ok and type(status) == "table" and type(status.items) == "table" then status else nil
			
			if var28 ~= nil then
				local var29
				local _ = nil
				
				if p7 then
					t_2 = {}
					var29 = dedupeAndTrack(var28.items)
					var1.setItems(var29)
				else
					var29 = dedupeAndTrack(var28.items)
					local cloned = table.clone(var1.getItems(false))
					local var30 = cloned[#cloned]
					
					if var30 ~= nil and var30.kind == "skeleton" then
						table.remove(cloned)
					end
					for i, v in var29 do
						table.insert(cloned, v)
					end
					var1.setItems(cloned)
				end
				var10 = var28.nextCursor
				var13 = if p7 or #var29 ~= 0 then 0 else var13 + 1
				var7(var28.nextCursor ~= nil and var13 < 3)
				local var31 = if var1.getCount(false) == 0 then "Empty" else "Loaded"
				var3(var31)
				
				if fFlagMomentsRealtimeObservability and p7 then
					analytics.reportMomentsFeedState(if var31 == "Loaded" then "loaded" else "empty", recommendationSource, nil)
				end
				if var27 then
					if var31 == "Loaded" then
						momentsSurfaceLoadManager.primaryDataReady()
					else
						momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "empty" else nil)
					end
				end
				if var28.onAccepted ~= nil then
					var28.onAccepted()
				end
				if fFlagMomentsNonInfiniteScrollEndStateFixesModule then
					if p4 == nil then
						return
					else
						maybeAppendEndState()
						
						return
					end
				else
					maybeAppendEndState()
					
					return
				end
			elseif p7 then
				var1.reset()
				var5(if ok then "Malformed feed batch" else tostring(status))
				var3("Failed")
				
				if fFlagMomentsRealtimeObservability then
					analytics.reportMomentsFeedState("failed", recommendationSource, if ok then "malformedResponse" else "requestFailed")
				end
				if var27 then
					momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "failed" else nil)
					
					return
				end
			else
				local items = var1.getItems(false)
				local var32 = items[#items]
				
				if var32 ~= nil and var32.kind == "skeleton" then
					var1.removeItem(#items)
				end
				var9(true)
				var3(if var1.getCount(false) == 0 then "Empty" else "Loaded")
				
				if fFlagMomentsRealtimeObservability then
					analytics.reportMomentsFeedLoadMore("failed", recommendationSource, if ok then "malformedResponse" else "requestFailed")
				end
			end
		end)
	end
	
	local function loadInitial()
		-- upvalues: runFetch (ref)
		runFetch(true)
	end
	
	return {
		observabilityFeedType = recommendationSource,
		pager = var1,
		getStatus = var2,
		getError = var4,
		getHasMore = var6,
		getLoadMoreFailed = var8,
		getAtScrollLimit = var16,
		getCanLoadMoreBeyondLimit = var18,
		loadInitial = loadInitial,
		loadMore = function()
			-- upvalues: fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), p4 (ref), var16 (ref), var11 (write), var8 (ref), var12 (write), var6 (ref), var14 (write), var9 (ref), fFlagMomentsRealtimeObservability (copy), analytics (copy), recommendationSource (ref), var1 (ref), t (copy), var3 (ref), var10 (write), p1 (ref), fFlagMomentsSurfaceLoadTTI (copy), p3 (ref), momentsSurfaceLoadManager (copy), t_2 (write), dedupeAndTrack (ref), var13 (write), var7 (ref), maybeAppendEndState (ref), var5 (ref)
			if fFlagMomentsNonInfiniteScrollEndStateFixesModule then
				if p4 ~= nil and var16(false) then return end
			elseif var16(false) then return end
			if var11 or var8(false) then return end
			if var12 then return end
			if not var6(false) then return end
			var14 += 1
			local var27 = var14
			var11 = true
			var9(false)
			local var28 = nil
			
			if fFlagMomentsRealtimeObservability then
				analytics.reportMomentsFeedLoadMore("attempted", recommendationSource)
			end
			var1.addItems({ t })
			var3("LoadingMore")
			local var29 = false
			task.spawn(function()
				-- upvalues: p1 (copy), var10 (ref), var12 (copy), var27 (ref), var14 (copy), var11 (copy), fFlagMomentsSurfaceLoadTTI (copy), p3 (copy), var29 (ref), var28 (write), momentsSurfaceLoadManager (copy), t_2 (copy), dedupeAndTrack (copy), var1 (copy), var10 (copy), var13 (copy), var7 (copy), var3 (copy), fFlagMomentsRealtimeObservability (copy), analytics (copy), recommendationSource (copy), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), p4 (copy), maybeAppendEndState (copy), var5 (copy), var9 (copy)
				local ok, status = pcall(p1.fetchAsync, var10)
				
				if var12 or var27 ~= var14 then return end
				var11 = false
				local var30 = fFlagMomentsSurfaceLoadTTI and (p3 and (var29 and (var28 ~= nil and momentsSurfaceLoadManager.getSessionGeneration() == var28)))
				
				if var30 then
					momentsSurfaceLoadManager.primaryDataResponseReceived()
				end
				local var31 = if ok and type(status) == "table" and type(status.items) == "table" then status else nil
				
				if var31 ~= nil then
					local var32
					local _ = nil
					
					if var29 then
						t_2 = {}
						var32 = dedupeAndTrack(var31.items)
						var1.setItems(var32)
					else
						var32 = dedupeAndTrack(var31.items)
						local cloned = table.clone(var1.getItems(false))
						local var33 = cloned[#cloned]
						
						if var33 ~= nil and var33.kind == "skeleton" then
							table.remove(cloned)
						end
						for i, v in var32 do
							table.insert(cloned, v)
						end
						var1.setItems(cloned)
					end
					var10 = var31.nextCursor
					var13 = if var29 or #var32 ~= 0 then 0 else var13 + 1
					var7(var31.nextCursor ~= nil and var13 < 3)
					local var34 = if var1.getCount(false) == 0 then "Empty" else "Loaded"
					var3(var34)
					
					if fFlagMomentsRealtimeObservability and var29 then
						analytics.reportMomentsFeedState(if var34 == "Loaded" then "loaded" else "empty", recommendationSource, nil)
					end
					if var30 then
						if var34 == "Loaded" then
							momentsSurfaceLoadManager.primaryDataReady()
						else
							momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "empty" else nil)
						end
					end
					if var31.onAccepted ~= nil then
						var31.onAccepted()
					end
					if fFlagMomentsNonInfiniteScrollEndStateFixesModule then
						if p4 == nil then
							return
						else
							maybeAppendEndState()
							
							return
						end
					else
						maybeAppendEndState()
						
						return
					end
				elseif var29 then
					var1.reset()
					var5(if ok then "Malformed feed batch" else tostring(status))
					var3("Failed")
					
					if fFlagMomentsRealtimeObservability then
						analytics.reportMomentsFeedState("failed", recommendationSource, if ok then "malformedResponse" else "requestFailed")
					end
					if var30 then
						momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "failed" else nil)
						
						return
					end
				else
					local items = var1.getItems(false)
					local var35 = items[#items]
					
					if var35 ~= nil and var35.kind == "skeleton" then
						var1.removeItem(#items)
					end
					var9(true)
					var3(if var1.getCount(false) == 0 then "Empty" else "Loaded")
					
					if fFlagMomentsRealtimeObservability then
						analytics.reportMomentsFeedLoadMore("failed", recommendationSource, if ok then "malformedResponse" else "requestFailed")
					end
				end
			end)
		end,
		loadBeyondLimit = function()
			-- upvalues: var12 (write), p4 (ref), var16 (ref), var6 (ref), t_3 (ref), var1 (ref), var15 (write), var17 (ref), maybeAppendEndState (ref), var14 (write), var11 (write), var9 (ref), fFlagMomentsRealtimeObservability (copy), analytics (copy), recommendationSource (ref), t (copy), var3 (ref), var10 (write), p1 (ref), fFlagMomentsSurfaceLoadTTI (copy), p3 (ref), momentsSurfaceLoadManager (copy), t_2 (write), dedupeAndTrack (ref), var13 (write), var7 (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), var5 (ref)
			if var12 or p4 == nil or not var16(false) then return end
			if not var6(false) and #t_3 == 0 then return end
			local items = var1.getItems(false)
			local var30 = items[#items]
			
			if var30 ~= nil and var30.kind == "endState" then
				var1.removeItem(#items)
			end
			local var31 = 0
			
			for i, v in var1.getItems(false) do
				if v.kind ~= "skeleton" and v.kind ~= "endState" then
					var31 += 1
				end
			end
			var15 = var31 + p4
			var17(false)
			
			if #t_3 > 0 then
				local cloned = table.clone(var1.getItems(false))
				
				for i_1, v_1 in t_3 do
					table.insert(cloned, v_1)
				end
				table.clear(t_3)
				var1.setItems(cloned)
				maybeAppendEndState()
				
				if var16(false) then return end
			end
			if var12 then return end
			if not var6(false) then return end
			var14 += 1
			local var32 = var14
			var11 = true
			var9(false)
			local var33 = nil
			
			if fFlagMomentsRealtimeObservability then
				analytics.reportMomentsFeedLoadMore("attempted", recommendationSource)
			end
			var1.addItems({ t })
			var3("LoadingMore")
			local var34 = false
			task.spawn(function()
				-- upvalues: p1 (copy), var10 (ref), var12 (copy), var32 (ref), var14 (copy), var11 (copy), fFlagMomentsSurfaceLoadTTI (copy), p3 (copy), var34 (ref), var33 (write), momentsSurfaceLoadManager (copy), t_2 (copy), dedupeAndTrack (copy), var1 (copy), var10 (copy), var13 (copy), var7 (copy), var3 (copy), fFlagMomentsRealtimeObservability (copy), analytics (copy), recommendationSource (copy), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), p4 (copy), maybeAppendEndState (copy), var5 (copy), var9 (copy)
				local ok, status = pcall(p1.fetchAsync, var10)
				
				if var12 or var32 ~= var14 then return end
				var11 = false
				local var35 = fFlagMomentsSurfaceLoadTTI and (p3 and (var34 and (var33 ~= nil and momentsSurfaceLoadManager.getSessionGeneration() == var33)))
				
				if var35 then
					momentsSurfaceLoadManager.primaryDataResponseReceived()
				end
				local var36 = if ok and type(status) == "table" and type(status.items) == "table" then status else nil
				
				if var36 ~= nil then
					local var37
					local _ = nil
					
					if var34 then
						t_2 = {}
						var37 = dedupeAndTrack(var36.items)
						var1.setItems(var37)
					else
						var37 = dedupeAndTrack(var36.items)
						local cloned = table.clone(var1.getItems(false))
						local var38 = cloned[#cloned]
						
						if var38 ~= nil and var38.kind == "skeleton" then
							table.remove(cloned)
						end
						for i, v in var37 do
							table.insert(cloned, v)
						end
						var1.setItems(cloned)
					end
					var10 = var36.nextCursor
					var13 = if var34 or #var37 ~= 0 then 0 else var13 + 1
					var7(var36.nextCursor ~= nil and var13 < 3)
					local var39 = if var1.getCount(false) == 0 then "Empty" else "Loaded"
					var3(var39)
					
					if fFlagMomentsRealtimeObservability and var34 then
						analytics.reportMomentsFeedState(if var39 == "Loaded" then "loaded" else "empty", recommendationSource, nil)
					end
					if var35 then
						if var39 == "Loaded" then
							momentsSurfaceLoadManager.primaryDataReady()
						else
							momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "empty" else nil)
						end
					end
					if var36.onAccepted ~= nil then
						var36.onAccepted()
					end
					if fFlagMomentsNonInfiniteScrollEndStateFixesModule then
						if p4 == nil then
							return
						else
							maybeAppendEndState()
							
							return
						end
					else
						maybeAppendEndState()
						
						return
					end
				elseif var34 then
					var1.reset()
					var5(if ok then "Malformed feed batch" else tostring(status))
					var3("Failed")
					
					if fFlagMomentsRealtimeObservability then
						analytics.reportMomentsFeedState("failed", recommendationSource, if ok then "malformedResponse" else "requestFailed")
					end
					if var35 then
						momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "failed" else nil)
						
						return
					end
				else
					local items = var1.getItems(false)
					local var40 = items[#items]
					
					if var40 ~= nil and var40.kind == "skeleton" then
						var1.removeItem(#items)
					end
					var9(true)
					var3(if var1.getCount(false) == 0 then "Empty" else "Loaded")
					
					if fFlagMomentsRealtimeObservability then
						analytics.reportMomentsFeedLoadMore("failed", recommendationSource, if ok then "malformedResponse" else "requestFailed")
					end
				end
			end)
		end,
		prependItem = function(p8)
			-- upvalues: dedupeAndTrack (ref), var1 (ref), var2 (ref), var3 (ref)
			local var35 = dedupeAndTrack({ p8 })
			
			if #var35 == 0 then return end
			var1.addItemAt(1, var35[1])
			
			if var2(false) == "Empty" then
				var3("Loaded")
			end
		end,
		refresh = loadInitial,
		retry = function()
			-- upvalues: runFetch (ref), var1 (ref)
			runFetch(var1.getCount(false) == 0)
		end,
		dispose = function()
			-- upvalues: var12 (write), p1 (ref), var1 (ref)
			var12 = true
			
			if p1.dispose then
				p1.dispose()
			end
			var1.dispose()
		end
	}
end