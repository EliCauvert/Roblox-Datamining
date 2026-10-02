local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local momentsCommonModule = require(parent.MomentsCommon)
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local fFlagMomentsOptimisticProfilePending = require(parent.SharedFlags).FFlagMomentsOptimisticProfilePending
local createPendingFeedOverlayModule = require(script.Parent.createPendingFeedOverlay)
local getDeletedMomentsStoreModule = require(moments.Stores.GetDeletedMomentsStore)
local analytics = momentsCommonModule.Analytics
local momentsSurfaceLoadManager = momentsCommonModule.Performance.MomentsSurfaceLoadManager
local fFlagMomentsRealtimeObservability = momentsCommonModule.Flags.FFlagMomentsRealtimeObservability
local fFlagMomentsContentStatsTelemetry = momentsCommonModule.Flags.FFlagMomentsContentStatsTelemetry
local _ = require(script.Parent.FeedTypes)
local createPagerStoreModule = require(moments.Components.VerticalPager.createPagerStore)
local fFlagMomentsNonInfiniteScrollEndStateFixesModule = require(moments.Flags.FFlagMomentsNonInfiniteScrollEndStateFixes)
local createSignal = signalsModule.createSignal
local t = { kind = "skeleton" }
local t_1 = { kind = "endState" }

return function(p1, p2, p3, p4)
	-- upvalues: createPagerStoreModule (ref), fFlagMomentsOptimisticProfilePending (ref), createPendingFeedOverlayModule (ref), createSignal (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (ref), fFlagMomentsContentStatsTelemetry (ref), analytics (ref), t_1 (ref), signalsExperimentalModule (ref), fFlagMomentsRealtimeObservability (ref), t (ref), momentsSurfaceLoadManager (ref), signalsModule (ref), getDeletedMomentsStoreModule (ref)
	local var1 = createPagerStoreModule()
	local var2 = if fFlagMomentsOptimisticProfilePending and p1.getPendingItems ~= nil then createPendingFeedOverlayModule() else nil
	local var3 = nil
	local var4, var5 = createSignal(nil)
	local var6, var7 = createSignal("Loading")
	local var8 = "Loading"
	local var9, var10 = createSignal(nil)
	local var11, var12 = createSignal(true)
	local var13, var14 = createSignal(false)
	local recommendationSource = p1.recommendationSource or "Unknown"
	local var15 = nil
	local var16 = false
	local var17 = false
	local var18 = 0
	local var19 = 0
	local t_2 = {}
	local var20 = p4
	local var21, var22 = createSignal(false)
	local var23 = nil
	local var24 = nil
	
	if fFlagMomentsNonInfiniteScrollEndStateFixesModule then
		local var25, var26 = createSignal(false)
		var23 = var25
		var24 = var26
	end
	local t_3 = {}
	
	local function _()
		-- upvalues: var1 (ref)
		local items = var1.getItems(false)
		local var27 = items[#items]
		
		if var27 ~= nil and var27.kind == "skeleton" then
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
		local var27 = 0
		
		for i, v in p6 do
			if v.kind ~= "skeleton" and v.kind ~= "endState" then
				var27 += 1
			end
		end
		return var27
	end
	
	local _ = function()
		-- upvalues: var8 (write), var2 (ref), var1 (ref), var7 (ref)
		local var28 = var8
		
		if var2 ~= nil then
			local var29 = 0
			
			for i, v in var1.getItems(false) do
				if v.kind ~= "skeleton" and v.kind ~= "endState" then
					var29 += 1
				end
			end
			if var29 > 0 then
				var28 = if var8 == "LoadingMore" then "LoadingMore" else "Loaded"
			elseif var8 == "Loaded" then
				var28 = "Empty"
			end
		end
		var7(var28)
	end
	
	local _ = function(value)
		-- upvalues: var8 (write), var2 (ref), var1 (ref), var7 (ref)
		var8 = value
		local var30 = var8
		
		if var2 ~= nil then
			local var31 = 0
			
			for i, v in var1.getItems(false) do
				if v.kind ~= "skeleton" and v.kind ~= "endState" then
					var31 += 1
				end
			end
			if var31 > 0 then
				var30 = if var8 == "LoadingMore" then "LoadingMore" else "Loaded"
			elseif var8 == "Loaded" then
				var30 = "Empty"
			end
		end
		var7(var30)
	end
	
	local _ = function()
		-- upvalues: var1 (ref), t_3 (ref)
		local cloned = table.clone(var1.getItems(false))
		
		for i, v in t_3 do
			table.insert(cloned, v)
		end
		return cloned
	end
	
	local function maybeAppendEndState()
		-- upvalues: var20 (write), var21 (ref), var1 (ref), t_3 (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), var24 (write), var11 (ref), var22 (ref), t_1 (copy)
		if var20 == nil or var21(false) then return end
		local items = var1.getItems(false)
		local var32 = 0
		
		for i, v in items do
			if v.kind ~= "skeleton" and v.kind ~= "endState" then
				var32 += 1
			end
		end
		if var32 < var20 then return end
		local var33 = 0
		
		for i, v_1 in items do
			if v_1.kind ~= "skeleton" and v_1.kind ~= "endState" then
				var33 += 1
			end
		end
		if var20 < var33 then
			local t = {}
			var33 = 0
			
			for i, v_2 in items do
				if v_2.kind ~= "skeleton" and v_2.kind ~= "endState" then
					if var33 < var20 then
						var33 += 1
						table.insert(t, v_2)
					else
						table.insert(t_3, v_2)
					end
				end
			end
			var1.setItems(t)
		end
		if fFlagMomentsNonInfiniteScrollEndStateFixesModule then
			assert(var24, "end-state fixes require the eligibility signal")(var11(false) or #t_3 > 0)
		end
		var22(true)
		var1.addItems({ t_1 })
	end
	
	local function commitItems(p7)
		-- upvalues: var2 (ref), var1 (ref), t_3 (ref), signalsExperimentalModule (copy), p2 (ref), t_2 (write)
		if var2 == nil then
			var1.setItems(p7)
			
			return
		end
		local currentItem = var1.getCurrentItem(false)
		local var34 = if currentItem ~= nil then nil else var2.identity(currentItem)
		local retireMissing = var2.retireMissing
		local cloned = table.clone(var1.getItems(false))
		
		for i, v in t_3 do
			table.insert(cloned, v)
		end
		retireMissing(cloned)
		local var35 = var2.merge(p7)
		signalsExperimentalModule.batch(function()
			-- upvalues: var1 (copy), var35 (ref), var2 (copy), var34 (ref)
			var1.setItems(var35)
			
			for i, v in var35 do
				if var34 ~= nil and var2.identity(v) == var34 then
					var1.goToItem(i)
				end
			end
		end)
		
		if p2 ~= nil then
			for i_1, v_1 in var35 do
				if v_1.kind == "moment" then
					local var36 = p2(v_1)
					
					if var36 ~= nil then
						t_2[var36] = true
					end
				end
			end
		end
	end
	
	local function findMomentIndex(p8)
		-- upvalues: var2 (ref), var1 (ref)
		if p8 == nil then
			return nil
		end
		local var37 = assert(var2, "initial identity resolution requires the pending overlay")
		
		for i, v in var1.getItems(false) do
			if v.kind == "moment" and (var37.identity(v) == p8 or v.moment.momentId == p8) then
				return i
			end
		end
		return nil
	end
	
	local _ = function(p9)
		-- upvalues: findMomentIndex (ref), p1 (ref), var5 (ref)
		local var38 = findMomentIndex(p1.initialMomentId)
		
		if var38 ~= nil or p9 then
			var5(var38)
		end
	end
	
	local function runFetch(p9)
		-- upvalues: var17 (write), var11 (ref), var19 (write), var16 (write), var14 (ref), fFlagMomentsRealtimeObservability (copy), analytics (copy), recommendationSource (ref), var10 (ref), commitItems (ref), t (copy), var2 (ref), findMomentIndex (ref), p1 (ref), var5 (ref), var8 (write), var1 (ref), var7 (ref), var20 (write), p4 (ref), var22 (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), var24 (write), t_3 (ref), p3 (ref), momentsSurfaceLoadManager (copy), var15 (write), t_2 (write), dedupeAndTrack (ref), var18 (write), var12 (ref), maybeAppendEndState (ref)
		if var17 then return end
		if not p9 and not var11(false) then return end
		var19 += 1
		local var38 = var19
		var16 = true
		var14(false)
		local sessionGeneration = nil
		
		if p9 then
			if fFlagMomentsRealtimeObservability then
				analytics.reportMomentsFeedLoadAttempt(recommendationSource)
			end
			var10(nil)
			commitItems({ t })
			
			if var2 ~= nil then
				local var39 = findMomentIndex(p1.initialMomentId)
				
				if var39 ~= nil then
					var5(var39)
				end
			end
			var8 = "Loading"
			local var40 = var8
			
			if var2 ~= nil then
				local var41 = 0
				
				for i, v in var1.getItems(false) do
					if v.kind ~= "skeleton" and v.kind ~= "endState" then
						var41 += 1
					end
				end
				if var41 > 0 then
					var40 = if var8 == "LoadingMore" then "LoadingMore" else "Loaded"
				elseif var8 == "Loaded" then
					var40 = "Empty"
				end
			end
			var7(var40)
			var20 = p4
			var22(false)
			
			if fFlagMomentsNonInfiniteScrollEndStateFixesModule then
				assert(var24, "end-state fixes require the eligibility signal")(false)
			end
			table.clear(t_3)
			
			if p3 then
				momentsSurfaceLoadManager.start()
				momentsSurfaceLoadManager.primaryDataStarted()
				momentsSurfaceLoadManager.primaryDataNetworkFetch()
				sessionGeneration = momentsSurfaceLoadManager.getSessionGeneration()
			end
		elseif fFlagMomentsRealtimeObservability then
			analytics.reportMomentsFeedLoadMore("attempted", recommendationSource)
		end
		var1.addItems({ t })
		var8 = "LoadingMore"
		local var42 = var8
		
		if var2 ~= nil then
			local var43 = 0
			
			for i, v in var1.getItems(false) do
				if v.kind ~= "skeleton" and v.kind ~= "endState" then
					var43 += 1
				end
			end
			if var43 > 0 then
				var42 = if var8 == "LoadingMore" then "LoadingMore" else "Loaded"
			elseif var8 == "Loaded" then
				var42 = "Empty"
			end
		end
		var7(var42)
		local var44 = if p9 then nil else var15
		task.spawn(function()
			-- upvalues: p1 (copy), var44 (ref), var17 (copy), var38 (ref), var19 (copy), var16 (copy), p3 (copy), p9 (ref), sessionGeneration (write), momentsSurfaceLoadManager (copy), t_2 (copy), dedupeAndTrack (copy), commitItems (copy), var2 (copy), findMomentIndex (copy), var5 (copy), var1 (copy), var15 (copy), var18 (copy), var12 (copy), var8 (copy), var7 (copy), fFlagMomentsRealtimeObservability (copy), analytics (copy), recommendationSource (copy), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), p4 (copy), maybeAppendEndState (copy), var10 (copy), var14 (copy)
			local ok, status = pcall(p1.fetchAsync, var44)
			
			if var17 or var38 ~= var19 then return end
			var16 = false
			local var45 = p3 and (p9 and (sessionGeneration ~= nil and momentsSurfaceLoadManager.getSessionGeneration() == sessionGeneration))
			
			if var45 then
				momentsSurfaceLoadManager.primaryDataResponseReceived()
			end
			local var46 = if ok and type(status) == "table" and type(status.items) == "table" then status else nil
			
			if var46 ~= nil then
				local var47
				local _ = nil
				
				if p9 then
					t_2 = {}
					var47 = dedupeAndTrack(var46.items)
					commitItems(var47)
					
					if var2 ~= nil then
						var5(findMomentIndex(p1.initialMomentId))
						local var48 = findMomentIndex(var46.initialMomentId)
						
						if var48 ~= nil then
							var1.goToItem(var48)
						end
					end
				else
					var47 = dedupeAndTrack(var46.items)
					local cloned = table.clone(var1.getItems(false))
					local var49 = cloned[#cloned]
					
					if var49 ~= nil and var49.kind == "skeleton" then
						table.remove(cloned)
					end
					for i, v in var47 do
						table.insert(cloned, v)
					end
					commitItems(cloned)
				end
				var15 = var46.nextCursor
				var18 = if p9 or #var47 ~= 0 then 0 else var18 + 1
				var12(var46.nextCursor ~= nil and var18 < 3)
				local var50 = if var1.getCount(false) == 0 then "Empty" else "Loaded"
				var8 = var50
				local var51 = var8
				
				if var2 ~= nil then
					local var52 = 0
					
					for i, v in var1.getItems(false) do
						if v.kind ~= "skeleton" and v.kind ~= "endState" then
							var52 += 1
						end
					end
					if var52 > 0 then
						var51 = if var8 == "LoadingMore" then "LoadingMore" else "Loaded"
					elseif var8 == "Loaded" then
						var51 = "Empty"
					end
				end
				var7(var51)
				
				if fFlagMomentsRealtimeObservability and p9 then
					analytics.reportMomentsFeedState(if var50 == "Loaded" then "loaded" else "empty", recommendationSource, nil)
				end
				if var45 then
					if var50 == "Loaded" then
						momentsSurfaceLoadManager.primaryDataReady()
					else
						momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "empty" else nil)
					end
				end
				if var46.onAccepted ~= nil then
					var46.onAccepted()
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
			elseif p9 then
				if var2 == nil then
					var1.reset()
				else
					commitItems({})
					var5(findMomentIndex(p1.initialMomentId))
				end
				var10(if ok then "Malformed feed batch" else tostring(status))
				var8 = "Failed"
				local var53 = var8
				
				if var2 ~= nil then
					local var54 = 0
					
					for i, v in var1.getItems(false) do
						if v.kind ~= "skeleton" and v.kind ~= "endState" then
							var54 += 1
						end
					end
					if var54 > 0 then
						var53 = if var8 == "LoadingMore" then "LoadingMore" else "Loaded"
					elseif var8 == "Loaded" then
						var53 = "Empty"
					end
				end
				var7(var53)
				
				if fFlagMomentsRealtimeObservability then
					analytics.reportMomentsFeedState("failed", recommendationSource, if ok then "malformedResponse" else "requestFailed")
				end
				if var45 then
					momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "failed" else nil)
					
					return
				end
			else
				local items = var1.getItems(false)
				local var55 = items[#items]
				
				if var55 ~= nil and var55.kind == "skeleton" then
					var1.removeItem(#items)
				end
				var14(true)
				var8 = if var1.getCount(false) == 0 then "Empty" else "Loaded"
				local var56 = var8
				
				if var2 ~= nil then
					local var57 = 0
					
					for i, v in var1.getItems(false) do
						if v.kind ~= "skeleton" and v.kind ~= "endState" then
							var57 += 1
						end
					end
					if var57 > 0 then
						var56 = if var8 == "LoadingMore" then "LoadingMore" else "Loaded"
					elseif var8 == "Loaded" then
						var56 = "Empty"
					end
				end
				var7(var56)
				
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
	
	local function loadMore()
		-- upvalues: var2 (ref), var19 (write), var9 (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), p4 (ref), var21 (ref), var16 (write), var13 (ref), var17 (write), var11 (ref), var14 (ref), fFlagMomentsRealtimeObservability (copy), analytics (copy), recommendationSource (ref), var1 (ref), t (copy), var8 (write), var7 (ref), var15 (write), p1 (ref), p3 (ref), momentsSurfaceLoadManager (copy), t_2 (write), dedupeAndTrack (ref), commitItems (ref), findMomentIndex (ref), var5 (ref), var18 (write), var12 (ref), maybeAppendEndState (ref), var10 (ref)
		if var2 ~= nil and (var19 == 0 or var9(false) ~= nil) then return end
		if fFlagMomentsNonInfiniteScrollEndStateFixesModule then
			if p4 ~= nil and var21(false) then return end
		elseif var21(false) then return end
		if var16 or var13(false) then return end
		if var17 then return end
		if not var11(false) then return end
		var19 += 1
		local var58 = var19
		var16 = true
		var14(false)
		local var59 = nil
		
		if fFlagMomentsRealtimeObservability then
			analytics.reportMomentsFeedLoadMore("attempted", recommendationSource)
		end
		var1.addItems({ t })
		var8 = "LoadingMore"
		local var60 = var8
		
		if var2 ~= nil then
			local var61 = 0
			
			for i, v in var1.getItems(false) do
				if v.kind ~= "skeleton" and v.kind ~= "endState" then
					var61 += 1
				end
			end
			if var61 > 0 then
				var60 = if var8 == "LoadingMore" then "LoadingMore" else "Loaded"
			elseif var8 == "Loaded" then
				var60 = "Empty"
			end
		end
		var7(var60)
		local var62 = false
		task.spawn(function()
			-- upvalues: p1 (copy), var15 (ref), var17 (copy), var58 (ref), var19 (copy), var16 (copy), p3 (copy), var62 (ref), var59 (write), momentsSurfaceLoadManager (copy), t_2 (copy), dedupeAndTrack (copy), commitItems (copy), var2 (copy), findMomentIndex (copy), var5 (copy), var1 (copy), var15 (copy), var18 (copy), var12 (copy), var8 (copy), var7 (copy), fFlagMomentsRealtimeObservability (copy), analytics (copy), recommendationSource (copy), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), p4 (copy), maybeAppendEndState (copy), var10 (copy), var14 (copy)
			local ok, status = pcall(p1.fetchAsync, var15)
			
			if var17 or var58 ~= var19 then return end
			var16 = false
			local var63 = p3 and (var62 and (var59 ~= nil and momentsSurfaceLoadManager.getSessionGeneration() == var59))
			
			if var63 then
				momentsSurfaceLoadManager.primaryDataResponseReceived()
			end
			local var64 = if ok and type(status) == "table" and type(status.items) == "table" then status else nil
			
			if var64 ~= nil then
				local var65
				local _ = nil
				
				if var62 then
					t_2 = {}
					var65 = dedupeAndTrack(var64.items)
					commitItems(var65)
					
					if var2 ~= nil then
						var5(findMomentIndex(p1.initialMomentId))
						local var66 = findMomentIndex(var64.initialMomentId)
						
						if var66 ~= nil then
							var1.goToItem(var66)
						end
					end
				else
					var65 = dedupeAndTrack(var64.items)
					local cloned = table.clone(var1.getItems(false))
					local var67 = cloned[#cloned]
					
					if var67 ~= nil and var67.kind == "skeleton" then
						table.remove(cloned)
					end
					for i, v in var65 do
						table.insert(cloned, v)
					end
					commitItems(cloned)
				end
				var15 = var64.nextCursor
				var18 = if var62 or #var65 ~= 0 then 0 else var18 + 1
				var12(var64.nextCursor ~= nil and var18 < 3)
				local var68 = if var1.getCount(false) == 0 then "Empty" else "Loaded"
				var8 = var68
				local var69 = var8
				
				if var2 ~= nil then
					local var70 = 0
					
					for i, v in var1.getItems(false) do
						if v.kind ~= "skeleton" and v.kind ~= "endState" then
							var70 += 1
						end
					end
					if var70 > 0 then
						var69 = if var8 == "LoadingMore" then "LoadingMore" else "Loaded"
					elseif var8 == "Loaded" then
						var69 = "Empty"
					end
				end
				var7(var69)
				
				if fFlagMomentsRealtimeObservability and var62 then
					analytics.reportMomentsFeedState(if var68 == "Loaded" then "loaded" else "empty", recommendationSource, nil)
				end
				if var63 then
					if var68 == "Loaded" then
						momentsSurfaceLoadManager.primaryDataReady()
					else
						momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "empty" else nil)
					end
				end
				if var64.onAccepted ~= nil then
					var64.onAccepted()
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
			elseif var62 then
				if var2 == nil then
					var1.reset()
				else
					commitItems({})
					var5(findMomentIndex(p1.initialMomentId))
				end
				var10(if ok then "Malformed feed batch" else tostring(status))
				var8 = "Failed"
				local var71 = var8
				
				if var2 ~= nil then
					local var72 = 0
					
					for i, v in var1.getItems(false) do
						if v.kind ~= "skeleton" and v.kind ~= "endState" then
							var72 += 1
						end
					end
					if var72 > 0 then
						var71 = if var8 == "LoadingMore" then "LoadingMore" else "Loaded"
					elseif var8 == "Loaded" then
						var71 = "Empty"
					end
				end
				var7(var71)
				
				if fFlagMomentsRealtimeObservability then
					analytics.reportMomentsFeedState("failed", recommendationSource, if ok then "malformedResponse" else "requestFailed")
				end
				if var63 then
					momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "failed" else nil)
					
					return
				end
			else
				local items = var1.getItems(false)
				local var73 = items[#items]
				
				if var73 ~= nil and var73.kind == "skeleton" then
					var1.removeItem(#items)
				end
				var14(true)
				var8 = if var1.getCount(false) == 0 then "Empty" else "Loaded"
				local var74 = var8
				
				if var2 ~= nil then
					local var75 = 0
					
					for i, v in var1.getItems(false) do
						if v.kind ~= "skeleton" and v.kind ~= "endState" then
							var75 += 1
						end
					end
					if var75 > 0 then
						var74 = if var8 == "LoadingMore" then "LoadingMore" else "Loaded"
					elseif var8 == "Loaded" then
						var74 = "Empty"
					end
				end
				var7(var74)
				
				if fFlagMomentsRealtimeObservability then
					analytics.reportMomentsFeedLoadMore("failed", recommendationSource, if ok then "malformedResponse" else "requestFailed")
				end
			end
		end)
	end
	
	local function loadBeyondLimit()
		-- upvalues: var17 (write), p4 (ref), var21 (ref), var11 (ref), t_3 (ref), var1 (ref), var20 (write), var22 (ref), maybeAppendEndState (ref), var19 (write), var16 (write), var14 (ref), fFlagMomentsRealtimeObservability (copy), analytics (copy), recommendationSource (ref), t (copy), var8 (write), var2 (ref), var7 (ref), var15 (write), p1 (ref), p3 (ref), momentsSurfaceLoadManager (copy), t_2 (write), dedupeAndTrack (ref), commitItems (ref), findMomentIndex (ref), var5 (ref), var18 (write), var12 (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), var10 (ref)
		if var17 or p4 == nil or not var21(false) then return end
		if not var11(false) and #t_3 == 0 then return end
		local items = var1.getItems(false)
		local var76 = items[#items]
		
		if var76 ~= nil and var76.kind == "endState" then
			var1.removeItem(#items)
		end
		local var77 = 0
		
		for i, v in var1.getItems(false) do
			if v.kind ~= "skeleton" and v.kind ~= "endState" then
				var77 += 1
			end
		end
		var20 = var77 + p4
		var22(false)
		
		if #t_3 > 0 then
			local cloned = table.clone(var1.getItems(false))
			
			for i_1, v_1 in t_3 do
				table.insert(cloned, v_1)
			end
			table.clear(t_3)
			var1.setItems(cloned)
			maybeAppendEndState()
			
			if var21(false) then return end
		end
		if var17 then return end
		if not var11(false) then return end
		var19 += 1
		local var78 = var19
		var16 = true
		var14(false)
		local var79 = nil
		
		if fFlagMomentsRealtimeObservability then
			analytics.reportMomentsFeedLoadMore("attempted", recommendationSource)
		end
		var1.addItems({ t })
		var8 = "LoadingMore"
		local var80 = var8
		
		if var2 ~= nil then
			local var81 = 0
			
			for i_1, v_1 in var1.getItems(false) do
				if v_1.kind ~= "skeleton" and v_1.kind ~= "endState" then
					var81 += 1
				end
			end
			if var81 > 0 then
				var80 = if var8 == "LoadingMore" then "LoadingMore" else "Loaded"
			elseif var8 == "Loaded" then
				var80 = "Empty"
			end
		end
		var7(var80)
		local var82 = false
		task.spawn(function()
			-- upvalues: p1 (copy), var15 (ref), var17 (copy), var78 (ref), var19 (copy), var16 (copy), p3 (copy), var82 (ref), var79 (write), momentsSurfaceLoadManager (copy), t_2 (copy), dedupeAndTrack (copy), commitItems (copy), var2 (copy), findMomentIndex (copy), var5 (copy), var1 (copy), var15 (copy), var18 (copy), var12 (copy), var8 (copy), var7 (copy), fFlagMomentsRealtimeObservability (copy), analytics (copy), recommendationSource (copy), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), p4 (copy), maybeAppendEndState (copy), var10 (copy), var14 (copy)
			local ok, status = pcall(p1.fetchAsync, var15)
			
			if var17 or var78 ~= var19 then return end
			var16 = false
			local var83 = p3 and (var82 and (var79 ~= nil and momentsSurfaceLoadManager.getSessionGeneration() == var79))
			
			if var83 then
				momentsSurfaceLoadManager.primaryDataResponseReceived()
			end
			local var84 = if ok and type(status) == "table" and type(status.items) == "table" then status else nil
			
			if var84 ~= nil then
				local var85
				local _ = nil
				
				if var82 then
					t_2 = {}
					var85 = dedupeAndTrack(var84.items)
					commitItems(var85)
					
					if var2 ~= nil then
						var5(findMomentIndex(p1.initialMomentId))
						local var86 = findMomentIndex(var84.initialMomentId)
						
						if var86 ~= nil then
							var1.goToItem(var86)
						end
					end
				else
					var85 = dedupeAndTrack(var84.items)
					local cloned = table.clone(var1.getItems(false))
					local var87 = cloned[#cloned]
					
					if var87 ~= nil and var87.kind == "skeleton" then
						table.remove(cloned)
					end
					for i, v in var85 do
						table.insert(cloned, v)
					end
					commitItems(cloned)
				end
				var15 = var84.nextCursor
				var18 = if var82 or #var85 ~= 0 then 0 else var18 + 1
				var12(var84.nextCursor ~= nil and var18 < 3)
				local var88 = if var1.getCount(false) == 0 then "Empty" else "Loaded"
				var8 = var88
				local var89 = var8
				
				if var2 ~= nil then
					local var90 = 0
					
					for i, v in var1.getItems(false) do
						if v.kind ~= "skeleton" and v.kind ~= "endState" then
							var90 += 1
						end
					end
					if var90 > 0 then
						var89 = if var8 == "LoadingMore" then "LoadingMore" else "Loaded"
					elseif var8 == "Loaded" then
						var89 = "Empty"
					end
				end
				var7(var89)
				
				if fFlagMomentsRealtimeObservability and var82 then
					analytics.reportMomentsFeedState(if var88 == "Loaded" then "loaded" else "empty", recommendationSource, nil)
				end
				if var83 then
					if var88 == "Loaded" then
						momentsSurfaceLoadManager.primaryDataReady()
					else
						momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "empty" else nil)
					end
				end
				if var84.onAccepted ~= nil then
					var84.onAccepted()
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
			elseif var82 then
				if var2 == nil then
					var1.reset()
				else
					commitItems({})
					var5(findMomentIndex(p1.initialMomentId))
				end
				var10(if ok then "Malformed feed batch" else tostring(status))
				var8 = "Failed"
				local var91 = var8
				
				if var2 ~= nil then
					local var92 = 0
					
					for i, v in var1.getItems(false) do
						if v.kind ~= "skeleton" and v.kind ~= "endState" then
							var92 += 1
						end
					end
					if var92 > 0 then
						var91 = if var8 == "LoadingMore" then "LoadingMore" else "Loaded"
					elseif var8 == "Loaded" then
						var91 = "Empty"
					end
				end
				var7(var91)
				
				if fFlagMomentsRealtimeObservability then
					analytics.reportMomentsFeedState("failed", recommendationSource, if ok then "malformedResponse" else "requestFailed")
				end
				if var83 then
					momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "failed" else nil)
					
					return
				end
			else
				local items = var1.getItems(false)
				local var93 = items[#items]
				
				if var93 ~= nil and var93.kind == "skeleton" then
					var1.removeItem(#items)
				end
				var14(true)
				var8 = if var1.getCount(false) == 0 then "Empty" else "Loaded"
				local var94 = var8
				
				if var2 ~= nil then
					local var95 = 0
					
					for i, v in var1.getItems(false) do
						if v.kind ~= "skeleton" and v.kind ~= "endState" then
							var95 += 1
						end
					end
					if var95 > 0 then
						var94 = if var8 == "LoadingMore" then "LoadingMore" else "Loaded"
					elseif var8 == "Loaded" then
						var94 = "Empty"
					end
				end
				var7(var94)
				
				if fFlagMomentsRealtimeObservability then
					analytics.reportMomentsFeedLoadMore("failed", recommendationSource, if ok then "malformedResponse" else "requestFailed")
				end
			end
		end)
	end
	
	local function prependItem(p10)
		-- upvalues: dedupeAndTrack (ref), var1 (ref), var6 (ref), var8 (write), var2 (ref), var7 (ref)
		local var96 = dedupeAndTrack({ p10 })
		
		if #var96 == 0 then return end
		var1.addItemAt(1, var96[1])
		
		if var6(false) == "Empty" then
			var8 = "Loaded"
			local var97 = var8
			
			if var2 ~= nil then
				local var98 = 0
				
				for i, v in var1.getItems(false) do
					if v.kind ~= "skeleton" and v.kind ~= "endState" then
						var98 += 1
					end
				end
				if var98 > 0 then
					var97 = if var8 == "LoadingMore" then "LoadingMore" else "Loaded"
				elseif var8 == "Loaded" then
					var97 = "Empty"
				end
			end
			var7(var97)
		end
	end
	
	local function retry()
		-- upvalues: var2 (ref), var9 (ref), runFetch (ref), var1 (ref)
		if var2 == nil or var9(false) == nil then
			runFetch(var1.getCount(false) == 0)
			
			return
		end
		runFetch(true)
	end
	
	local function dispose()
		-- upvalues: var17 (write), var3 (write), p1 (ref), var1 (ref)
		var17 = true
		
		if var3 ~= nil then
			var3()
		end
		if p1.dispose then
			p1.dispose()
		end
		var1.dispose()
	end
	
	if var2 ~= nil and p1.getPendingItems ~= nil then
		if p1.initialMomentId ~= nil then
			var5(1e999)
		end
		local getPendingItems = p1.getPendingItems
		var3 = signalsModule.createEffect(function(p11)
			-- upvalues: var2 (ref), getPendingItems (ref), getDeletedMomentsStoreModule (copy), var1 (ref), t_3 (ref), signalsExperimentalModule (copy), commitItems (ref), findMomentIndex (ref), p1 (ref), var5 (ref), var22 (ref), maybeAppendEndState (ref), var8 (write), var2 (ref), var7 (ref)
			local var99 = var2.update(getPendingItems(p11), getDeletedMomentsStoreModule(false).getDeletedIds(p11))
			local cloned = table.clone(var1.getItems(false))
			
			for i, v in t_3 do
				table.insert(cloned, v)
			end
			for i_1 = #cloned, 1, -1 do
				if cloned[i_1].kind == "endState" then
					table.remove(cloned, i_1)
				end
			end
			signalsExperimentalModule.batch(function()
				-- upvalues: commitItems (copy), cloned (ref), t_3 (copy), findMomentIndex (copy), p1 (copy), var5 (copy), var22 (copy), maybeAppendEndState (copy), var8 (copy), var2 (copy), var1 (copy), var7 (copy), var99 (ref)
				commitItems(cloned)
				table.clear(t_3)
				local var100 = findMomentIndex(p1.initialMomentId)
				
				if var100 ~= nil then
					var5(var100)
				end
				var22(false)
				maybeAppendEndState()
				local var101 = var8
				
				if var2 ~= nil then
					local var102 = 0
					
					for i, v in var1.getItems(false) do
						if v.kind ~= "skeleton" and v.kind ~= "endState" then
							var102 += 1
						end
					end
					if var102 > 0 then
						var101 = if var8 == "LoadingMore" then "LoadingMore" else "Loaded"
					elseif var8 == "Loaded" then
						var101 = "Empty"
					end
				end
				var7(var101)
				
				if var99 and p1.recommendationSource == "Trending" then
					var1.goToItem(1)
				end
			end)
		end)
	end
	return {
		getInitialIndex = var4,
		observabilityFeedType = recommendationSource,
		pager = var1,
		getStatus = var6,
		getError = var9,
		getHasMore = var11,
		getLoadMoreFailed = var13,
		getAtScrollLimit = var21,
		getCanLoadMoreBeyondLimit = var23,
		loadInitial = loadInitial,
		loadMore = loadMore,
		loadBeyondLimit = loadBeyondLimit,
		prependItem = prependItem,
		refresh = loadInitial,
		retry = retry,
		dispose = dispose
	}
end