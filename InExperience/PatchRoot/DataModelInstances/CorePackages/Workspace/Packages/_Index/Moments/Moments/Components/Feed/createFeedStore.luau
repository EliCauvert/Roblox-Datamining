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

return function(p0, p1, p2, p3)
	-- upvalues: createPagerStoreModule (ref), createSignal (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (ref), fFlagMomentsContentStatsTelemetry (ref), analytics (ref), t_1 (ref), fFlagMomentsRealtimeObservability (ref), t (ref), fFlagMomentsSurfaceLoadTTI (ref), momentsSurfaceLoadManager (ref)
	local var8 = createPagerStoreModule()
	local var9, var10 = createSignal("Loading")
	local var11, var12 = createSignal(nil)
	local var13, var14 = createSignal(true)
	local var15, var16 = createSignal(false)
	local recommendationSource = p0.recommendationSource or "Unknown"
	local var18 = nil
	local var19 = false
	local var20 = false
	local var21 = 0
	local var22 = 0
	local t_2 = {}
	local var24 = p3
	local var25, var26 = createSignal(false)
	local var27 = nil
	local var28 = nil
	
	if fFlagMomentsNonInfiniteScrollEndStateFixesModule then
		local var29, var30 = createSignal(false)
		var27 = var29
		var28 = var30
	end
	local t_3 = {}
	
	local function _()
		-- upvalues: var8 (ref)
		local items = var8.getItems(false)
		local var37 = items[#items]
		
		if var37 ~= nil and var37.kind == "skeleton" then
			var8.removeItem(#items)
		end
	end
	
	local function dedupeAndTrack(p4)
		-- upvalues: p1 (ref), t_2 (write), fFlagMomentsContentStatsTelemetry (copy), analytics (copy), recommendationSource (ref)
		if p1 == nil then
			return p4
		end
		local t = {}
		
		for i, v in p4 do
			local ok, status = pcall(p1, v)
			
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
	
	local _ = function(p5)
		local var39 = 0
		
		for i, v in p5 do
			if v.kind ~= "skeleton" and v.kind ~= "endState" then
				var39 += 1
			end
		end
		return var39
	end
	
	local function maybeAppendEndState()
		-- upvalues: var24 (write), var25 (ref), var8 (ref), t_3 (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), var28 (write), var13 (ref), var26 (ref), t_1 (copy)
		if var24 == nil or var25(false) then return end
		local items = var8.getItems(false)
		local var41 = 0
		
		for i, v in items do
			if v.kind ~= "skeleton" and v.kind ~= "endState" then
				var41 += 1
			end
		end
		if var41 < var24 then return end
		local var42 = 0
		
		for i, v_1 in items do
			if v_1.kind ~= "skeleton" and v_1.kind ~= "endState" then
				var42 += 1
			end
		end
		if var24 < var42 then
			local t = {}
			var42 = 0
			
			for i, v_2 in items do
				if v_2.kind ~= "skeleton" and v_2.kind ~= "endState" then
					if var42 < var24 then
						var42 += 1
						table.insert(t, v_2)
					else
						table.insert(t_3, v_2)
					end
				end
			end
			var8.setItems(t)
		end
		if fFlagMomentsNonInfiniteScrollEndStateFixesModule then
			assert(var28, "end-state fixes require the eligibility signal")(var13(false) or #t_3 > 0)
		end
		var26(true)
		var8.addItems({ t_1 })
	end
	
	local function runFetch(p6)
		-- upvalues: var20 (write), var13 (ref), var22 (write), var19 (write), var16 (ref), fFlagMomentsRealtimeObservability (copy), analytics (copy), recommendationSource (ref), var12 (ref), var8 (ref), t (copy), var10 (ref), var24 (write), p3 (ref), var26 (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), var28 (write), t_3 (ref), fFlagMomentsSurfaceLoadTTI (copy), p2 (ref), momentsSurfaceLoadManager (copy), var18 (write), p0 (ref), t_2 (write), dedupeAndTrack (ref), var21 (write), var14 (ref), maybeAppendEndState (ref)
		if var20 then return end
		if not p6 and not var13(false) then return end
		var22 += 1
		local var44 = var22
		var19 = true
		var16(false)
		local sessionGeneration = nil
		
		if p6 then
			if fFlagMomentsRealtimeObservability then
				analytics.reportMomentsFeedLoadAttempt(recommendationSource)
			end
			var12(nil)
			var8.setItems({ t })
			var10("Loading")
			var24 = p3
			var26(false)
			
			if fFlagMomentsNonInfiniteScrollEndStateFixesModule then
				assert(var28, "end-state fixes require the eligibility signal")(false)
			end
			table.clear(t_3)
			
			if fFlagMomentsSurfaceLoadTTI and p2 then
				momentsSurfaceLoadManager.start()
				momentsSurfaceLoadManager.primaryDataStarted()
				momentsSurfaceLoadManager.primaryDataNetworkFetch()
				sessionGeneration = momentsSurfaceLoadManager.getSessionGeneration()
			end
		elseif fFlagMomentsRealtimeObservability then
			analytics.reportMomentsFeedLoadMore("attempted", recommendationSource)
		end
		var8.addItems({ t })
		var10("LoadingMore")
		local var46 = if p6 then nil else var18
		task.spawn(function()
			-- upvalues: p0 (copy), var46 (ref), var20 (copy), var44 (ref), var22 (copy), var19 (copy), fFlagMomentsSurfaceLoadTTI (copy), p2 (copy), p6 (ref), sessionGeneration (write), momentsSurfaceLoadManager (copy), t_2 (copy), dedupeAndTrack (copy), var8 (copy), var18 (copy), var21 (copy), var14 (copy), var10 (copy), fFlagMomentsRealtimeObservability (copy), analytics (copy), recommendationSource (copy), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), p3 (copy), maybeAppendEndState (copy), var12 (copy), var16 (copy)
			local ok, status = pcall(p0.fetchAsync, var46)
			
			if var20 or var44 ~= var22 then return end
			var19 = false
			local var47 = fFlagMomentsSurfaceLoadTTI and (p2 and (p6 and (sessionGeneration ~= nil and momentsSurfaceLoadManager.getSessionGeneration() == sessionGeneration)))
			
			if var47 then
				momentsSurfaceLoadManager.primaryDataResponseReceived()
			end
			local var48 = if ok and type(status) == "table" and type(status.items) == "table" then status else nil
			
			if var48 ~= nil then
				local var49
				local _ = nil
				
				if p6 then
					t_2 = {}
					var49 = dedupeAndTrack(var48.items)
					var8.setItems(var49)
				else
					var49 = dedupeAndTrack(var48.items)
					local cloned = table.clone(var8.getItems(false))
					local var51 = cloned[#cloned]
					
					if var51 ~= nil and var51.kind == "skeleton" then
						table.remove(cloned)
					end
					for i, v in var49 do
						table.insert(cloned, v)
					end
					var8.setItems(cloned)
				end
				var18 = var48.nextCursor
				var21 = if p6 or #var49 ~= 0 then 0 else var21 + 1
				var14(var48.nextCursor ~= nil and var21 < 3)
				local var52 = if var8.getCount(false) == 0 then "Empty" else "Loaded"
				var10(var52)
				
				if fFlagMomentsRealtimeObservability and p6 then
					analytics.reportMomentsFeedState(if var52 == "Loaded" then "loaded" else "empty", recommendationSource, nil)
				end
				if var47 then
					if var52 == "Loaded" then
						momentsSurfaceLoadManager.primaryDataReady()
					else
						momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "empty" else nil)
					end
				end
				if var48.onAccepted ~= nil then
					var48.onAccepted()
				end
				if fFlagMomentsNonInfiniteScrollEndStateFixesModule then
					if p3 == nil then
						return
					else
						maybeAppendEndState()
						
						return
					end
				else
					maybeAppendEndState()
					
					return
				end
			elseif p6 then
				var8.reset()
				var12(if ok then "Malformed feed batch" else tostring(status))
				var10("Failed")
				
				if fFlagMomentsRealtimeObservability then
					analytics.reportMomentsFeedState("failed", recommendationSource, if ok then "malformedResponse" else "requestFailed")
				end
				if var47 then
					momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "failed" else nil)
					
					return
				end
			else
				local items = var8.getItems(false)
				local var54 = items[#items]
				
				if var54 ~= nil and var54.kind == "skeleton" then
					var8.removeItem(#items)
				end
				var16(true)
				var10(if var8.getCount(false) == 0 then "Empty" else "Loaded")
				
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
		pager = var8,
		getStatus = var9,
		getError = var11,
		getHasMore = var13,
		getLoadMoreFailed = var15,
		getAtScrollLimit = var25,
		getCanLoadMoreBeyondLimit = var27,
		loadInitial = loadInitial,
		loadMore = function()
			-- upvalues: fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), p3 (ref), var25 (ref), var19 (write), var15 (ref), var20 (write), var13 (ref), var22 (write), var16 (ref), fFlagMomentsRealtimeObservability (copy), analytics (copy), recommendationSource (ref), var8 (ref), t (copy), var10 (ref), var18 (write), p0 (ref), fFlagMomentsSurfaceLoadTTI (copy), p2 (ref), momentsSurfaceLoadManager (copy), t_2 (write), dedupeAndTrack (ref), var21 (write), var14 (ref), maybeAppendEndState (ref), var12 (ref)
			if fFlagMomentsNonInfiniteScrollEndStateFixesModule then
				if p3 ~= nil and var25(false) then return end
			elseif var25(false) then return end
			if var19 or var15(false) then return end
			if var20 then return end
			if not var13(false) then return end
			var22 += 1
			local var55 = var22
			var19 = true
			var16(false)
			local var56 = nil
			
			if fFlagMomentsRealtimeObservability then
				analytics.reportMomentsFeedLoadMore("attempted", recommendationSource)
			end
			var8.addItems({ t })
			var10("LoadingMore")
			local var57 = false
			task.spawn(function()
				-- upvalues: p0 (copy), var18 (ref), var20 (copy), var55 (ref), var22 (copy), var19 (copy), fFlagMomentsSurfaceLoadTTI (copy), p2 (copy), var57 (ref), var56 (write), momentsSurfaceLoadManager (copy), t_2 (copy), dedupeAndTrack (copy), var8 (copy), var18 (copy), var21 (copy), var14 (copy), var10 (copy), fFlagMomentsRealtimeObservability (copy), analytics (copy), recommendationSource (copy), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), p3 (copy), maybeAppendEndState (copy), var12 (copy), var16 (copy)
				local ok, status = pcall(p0.fetchAsync, var18)
				
				if var20 or var55 ~= var22 then return end
				var19 = false
				local var47 = fFlagMomentsSurfaceLoadTTI and (p2 and (var57 and (var56 ~= nil and momentsSurfaceLoadManager.getSessionGeneration() == var56)))
				
				if var47 then
					momentsSurfaceLoadManager.primaryDataResponseReceived()
				end
				local var48 = if ok and type(status) == "table" and type(status.items) == "table" then status else nil
				
				if var48 ~= nil then
					local var49
					local _ = nil
					
					if var57 then
						t_2 = {}
						var49 = dedupeAndTrack(var48.items)
						var8.setItems(var49)
					else
						var49 = dedupeAndTrack(var48.items)
						local cloned = table.clone(var8.getItems(false))
						local var51 = cloned[#cloned]
						
						if var51 ~= nil and var51.kind == "skeleton" then
							table.remove(cloned)
						end
						for i, v in var49 do
							table.insert(cloned, v)
						end
						var8.setItems(cloned)
					end
					var18 = var48.nextCursor
					var21 = if var57 or #var49 ~= 0 then 0 else var21 + 1
					var14(var48.nextCursor ~= nil and var21 < 3)
					local var52 = if var8.getCount(false) == 0 then "Empty" else "Loaded"
					var10(var52)
					
					if fFlagMomentsRealtimeObservability and var57 then
						analytics.reportMomentsFeedState(if var52 == "Loaded" then "loaded" else "empty", recommendationSource, nil)
					end
					if var47 then
						if var52 == "Loaded" then
							momentsSurfaceLoadManager.primaryDataReady()
						else
							momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "empty" else nil)
						end
					end
					if var48.onAccepted ~= nil then
						var48.onAccepted()
					end
					if fFlagMomentsNonInfiniteScrollEndStateFixesModule then
						if p3 == nil then
							return
						else
							maybeAppendEndState()
							
							return
						end
					else
						maybeAppendEndState()
						
						return
					end
				elseif var57 then
					var8.reset()
					var12(if ok then "Malformed feed batch" else tostring(status))
					var10("Failed")
					
					if fFlagMomentsRealtimeObservability then
						analytics.reportMomentsFeedState("failed", recommendationSource, if ok then "malformedResponse" else "requestFailed")
					end
					if var47 then
						momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "failed" else nil)
						
						return
					end
				else
					local items = var8.getItems(false)
					local var54 = items[#items]
					
					if var54 ~= nil and var54.kind == "skeleton" then
						var8.removeItem(#items)
					end
					var16(true)
					var10(if var8.getCount(false) == 0 then "Empty" else "Loaded")
					
					if fFlagMomentsRealtimeObservability then
						analytics.reportMomentsFeedLoadMore("failed", recommendationSource, if ok then "malformedResponse" else "requestFailed")
					end
				end
			end)
		end,
		loadBeyondLimit = function()
			-- upvalues: var20 (write), p3 (ref), var25 (ref), var13 (ref), t_3 (ref), var8 (ref), var24 (write), var26 (ref), maybeAppendEndState (ref), var22 (write), var19 (write), var16 (ref), fFlagMomentsRealtimeObservability (copy), analytics (copy), recommendationSource (ref), t (copy), var10 (ref), var18 (write), p0 (ref), fFlagMomentsSurfaceLoadTTI (copy), p2 (ref), momentsSurfaceLoadManager (copy), t_2 (write), dedupeAndTrack (ref), var21 (write), var14 (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), var12 (ref)
			if var20 or p3 == nil or not var25(false) then return end
			if not var13(false) and #t_3 == 0 then return end
			local items = var8.getItems(false)
			local var59 = items[#items]
			
			if var59 ~= nil and var59.kind == "endState" then
				var8.removeItem(#items)
			end
			local var60 = 0
			
			for i, v in var8.getItems(false) do
				if v.kind ~= "skeleton" and v.kind ~= "endState" then
					var60 += 1
				end
			end
			var24 = var60 + p3
			var26(false)
			
			if #t_3 > 0 then
				local cloned = table.clone(var8.getItems(false))
				
				for i_1, v_1 in t_3 do
					table.insert(cloned, v_1)
				end
				table.clear(t_3)
				var8.setItems(cloned)
				maybeAppendEndState()
				
				if var25(false) then return end
			end
			if var20 then return end
			if not var13(false) then return end
			var22 += 1
			local var62 = var22
			var19 = true
			var16(false)
			local var63 = nil
			
			if fFlagMomentsRealtimeObservability then
				analytics.reportMomentsFeedLoadMore("attempted", recommendationSource)
			end
			var8.addItems({ t })
			var10("LoadingMore")
			local var64 = false
			task.spawn(function()
				-- upvalues: p0 (copy), var18 (ref), var20 (copy), var62 (ref), var22 (copy), var19 (copy), fFlagMomentsSurfaceLoadTTI (copy), p2 (copy), var64 (ref), var63 (write), momentsSurfaceLoadManager (copy), t_2 (copy), dedupeAndTrack (copy), var8 (copy), var18 (copy), var21 (copy), var14 (copy), var10 (copy), fFlagMomentsRealtimeObservability (copy), analytics (copy), recommendationSource (copy), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), p3 (copy), maybeAppendEndState (copy), var12 (copy), var16 (copy)
				local ok, status = pcall(p0.fetchAsync, var18)
				
				if var20 or var62 ~= var22 then return end
				var19 = false
				local var47 = fFlagMomentsSurfaceLoadTTI and (p2 and (var64 and (var63 ~= nil and momentsSurfaceLoadManager.getSessionGeneration() == var63)))
				
				if var47 then
					momentsSurfaceLoadManager.primaryDataResponseReceived()
				end
				local var48 = if ok and type(status) == "table" and type(status.items) == "table" then status else nil
				
				if var48 ~= nil then
					local var49
					local _ = nil
					
					if var64 then
						t_2 = {}
						var49 = dedupeAndTrack(var48.items)
						var8.setItems(var49)
					else
						var49 = dedupeAndTrack(var48.items)
						local cloned = table.clone(var8.getItems(false))
						local var51 = cloned[#cloned]
						
						if var51 ~= nil and var51.kind == "skeleton" then
							table.remove(cloned)
						end
						for i, v in var49 do
							table.insert(cloned, v)
						end
						var8.setItems(cloned)
					end
					var18 = var48.nextCursor
					var21 = if var64 or #var49 ~= 0 then 0 else var21 + 1
					var14(var48.nextCursor ~= nil and var21 < 3)
					local var52 = if var8.getCount(false) == 0 then "Empty" else "Loaded"
					var10(var52)
					
					if fFlagMomentsRealtimeObservability and var64 then
						analytics.reportMomentsFeedState(if var52 == "Loaded" then "loaded" else "empty", recommendationSource, nil)
					end
					if var47 then
						if var52 == "Loaded" then
							momentsSurfaceLoadManager.primaryDataReady()
						else
							momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "empty" else nil)
						end
					end
					if var48.onAccepted ~= nil then
						var48.onAccepted()
					end
					if fFlagMomentsNonInfiniteScrollEndStateFixesModule then
						if p3 == nil then
							return
						else
							maybeAppendEndState()
							
							return
						end
					else
						maybeAppendEndState()
						
						return
					end
				elseif var64 then
					var8.reset()
					var12(if ok then "Malformed feed batch" else tostring(status))
					var10("Failed")
					
					if fFlagMomentsRealtimeObservability then
						analytics.reportMomentsFeedState("failed", recommendationSource, if ok then "malformedResponse" else "requestFailed")
					end
					if var47 then
						momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "failed" else nil)
						
						return
					end
				else
					local items = var8.getItems(false)
					local var54 = items[#items]
					
					if var54 ~= nil and var54.kind == "skeleton" then
						var8.removeItem(#items)
					end
					var16(true)
					var10(if var8.getCount(false) == 0 then "Empty" else "Loaded")
					
					if fFlagMomentsRealtimeObservability then
						analytics.reportMomentsFeedLoadMore("failed", recommendationSource, if ok then "malformedResponse" else "requestFailed")
					end
				end
			end)
		end,
		prependItem = function(p7)
			-- upvalues: dedupeAndTrack (ref), var8 (ref), var9 (ref), var10 (ref)
			local var65 = dedupeAndTrack({ p7 })
			
			if #var65 == 0 then return end
			var8.addItemAt(1, var65[1])
			
			if var9(false) == "Empty" then
				var10("Loaded")
			end
		end,
		refresh = loadInitial,
		retry = function()
			-- upvalues: runFetch (ref), var8 (ref)
			runFetch(var8.getCount(false) == 0)
		end,
		dispose = function()
			-- upvalues: var20 (write), p0 (ref), var8 (ref)
			var20 = true
			
			if p0.dispose then
				p0.dispose()
			end
			var8.dispose()
		end
	}
end