local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local momentsCommonModule = require(parent.MomentsCommon)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local momentsSurfaceLoadManager = momentsCommonModule.Performance.MomentsSurfaceLoadManager
local fFlagMomentsSurfaceLoadTTI = sharedFlagsModule.FFlagMomentsSurfaceLoadTTI
local _ = require(script.Parent.FeedTypes)
local createPagerStoreModule = require(moments.Components.VerticalPager.createPagerStore)
local createSignal = signalsModule.createSignal
local t = { kind = "skeleton" }

return function(p0, p1, p2) --[[ line: 74 | named "createFeedStore" ]]
	-- upvalues: createPagerStoreModule (ref), createSignal (ref), t (ref), fFlagMomentsSurfaceLoadTTI (ref), momentsSurfaceLoadManager (ref)
	local var6 = createPagerStoreModule()
	local var7, var8 = createSignal("Loading")
	local var9, var10 = createSignal(nil)
	local var11, var12 = createSignal(true)
	local var13, var14 = createSignal(false)
	local var15 = nil
	local var16 = false
	local var17 = false
	local var18 = 0
	local var19 = 0
	local t_1 = {}
	
	local function _() --[[ line: 104 | named "stripTrailingSkeleton" ]]
		-- upvalues: var6 (ref)
		local items = var6.getItems(false)
		local var25 = items[#items]
		
		if var25 ~= nil and var25.kind == "skeleton" then
			var6.removeItem(#items)
		end
	end
	
	local function dedupeAndTrack(p3) --[[ line: 119 ]]
		-- upvalues: p1 (ref), t_1 (write)
		if p1 == nil then
			return p3
		end
		local t = {}
		
		for i, v in p3 do
			local ok, status = pcall(p1, v)
			
			if ok then
				if status == nil or status == "" then
					table.insert(t, v)
				elseif not t_1[status] then
					t_1[status] = true
					table.insert(t, v)
				end
			end
		end
		return t
	end
	
	local function runFetch(p4) --[[ line: 138 ]]
		-- upvalues: var17 (write), var11 (ref), var19 (write), var16 (write), var14 (ref), var10 (ref), var6 (ref), t (copy), var8 (ref), fFlagMomentsSurfaceLoadTTI (copy), p2 (ref), momentsSurfaceLoadManager (copy), var15 (write), p0 (ref), t_1 (write), dedupeAndTrack (ref), var18 (write), var12 (ref)
		if var17 then return end
		if not p4 and not var11(false) then return end
		var19 += 1
		local var27 = var19
		var16 = true
		var14(false)
		local sessionGeneration = nil
		
		if p4 then
			var10(nil)
			var6.setItems({ t })
			var8("Loading")
			
			if fFlagMomentsSurfaceLoadTTI and p2 then
				momentsSurfaceLoadManager.start()
				momentsSurfaceLoadManager.primaryDataStarted()
				momentsSurfaceLoadManager.primaryDataNetworkFetch()
				sessionGeneration = momentsSurfaceLoadManager.getSessionGeneration()
			end
		else
			var6.addItems({ t })
			var8("LoadingMore")
		end
		local var29 = if p4 then nil else var15
		task.spawn(function() --[[ line: 187 ]]
			-- upvalues: p0 (copy), var29 (ref), var17 (copy), var27 (ref), var19 (copy), var16 (copy), fFlagMomentsSurfaceLoadTTI (copy), p2 (copy), p4 (ref), sessionGeneration (write), momentsSurfaceLoadManager (copy), t_1 (copy), dedupeAndTrack (copy), var6 (copy), var15 (copy), var18 (copy), var12 (copy), var8 (copy), var10 (copy), var14 (copy)
			local ok, status = pcall(p0.fetchAsync, var29)
			
			if var17 or var27 ~= var19 then return end
			var16 = false
			local var30 = fFlagMomentsSurfaceLoadTTI and (p2 and (p4 and (sessionGeneration ~= nil and momentsSurfaceLoadManager.getSessionGeneration() == sessionGeneration)))
			
			if var30 then
				momentsSurfaceLoadManager.primaryDataResponseReceived()
			end
			local var31 = if ok and type(status) == "table" and type(status.items) == "table" then status else nil
			
			if var31 ~= nil then
				local var32
				local _ = nil
				
				if p4 then
					t_1 = {}
					var32 = dedupeAndTrack(var31.items)
					var6.setItems(var32)
				else
					var32 = dedupeAndTrack(var31.items)
					local cloned = table.clone(var6.getItems(false))
					local var34 = cloned[#cloned]
					
					if var34 ~= nil and var34.kind == "skeleton" then
						table.remove(cloned)
					end
					for i, v in var32 do
						table.insert(cloned, v)
					end
					var6.setItems(cloned)
				end
				var15 = var31.nextCursor
				var18 = if p4 or #var32 ~= 0 then 0 else var18 + 1
				var12(var31.nextCursor ~= nil and var18 < 3)
				local var35 = if var6.getCount(false) == 0 then "Empty" else "Loaded"
				var8(var35)
				
				if var30 then
					if var35 == "Loaded" then
						momentsSurfaceLoadManager.primaryDataReady()
					else
						momentsSurfaceLoadManager.abort()
					end
				end
				if var31.onAccepted == nil then
					return
				else
					var31.onAccepted()
					
					return
				end
			elseif p4 then
				var6.reset()
				var10(if ok then "Malformed feed batch" else tostring(status))
				var8("Failed")
				
				if var30 then
					momentsSurfaceLoadManager.abort()
					
					return
				end
			else
				local items = var6.getItems(false)
				local var37 = items[#items]
				
				if var37 ~= nil and var37.kind == "skeleton" then
					var6.removeItem(#items)
				end
				var14(true)
				var8(if var6.getCount(false) == 0 then "Empty" else "Loaded")
			end
		end)
	end
	
	local function loadInitial() --[[ line: 280 ]]
		-- upvalues: runFetch (ref)
		runFetch(true)
	end
	
	return {
		pager = var6,
		getStatus = var7,
		getError = var9,
		getHasMore = var11,
		getLoadMoreFailed = var13,
		loadInitial = loadInitial,
		loadMore = function() --[[ line: 284 ]]
			-- upvalues: var16 (write), var13 (ref), var17 (write), var11 (ref), var19 (write), var14 (ref), var6 (ref), t (copy), var8 (ref), var15 (write), p0 (ref), fFlagMomentsSurfaceLoadTTI (copy), p2 (ref), momentsSurfaceLoadManager (copy), t_1 (write), dedupeAndTrack (ref), var18 (write), var12 (ref), var10 (ref)
			if var16 or var13(false) then return end
			if var17 then return end
			if var11(false) then
				var19 += 1
				local var38 = var19
				var16 = true
				var14(false)
				local var39 = nil
				var6.addItems({ t })
				var8("LoadingMore")
				local var40 = false
				task.spawn(function() --[[ line: 187 ]]
					-- upvalues: p0 (copy), var15 (ref), var17 (copy), var38 (ref), var19 (copy), var16 (copy), fFlagMomentsSurfaceLoadTTI (copy), p2 (copy), var40 (ref), var39 (write), momentsSurfaceLoadManager (copy), t_1 (copy), dedupeAndTrack (copy), var6 (copy), var15 (copy), var18 (copy), var12 (copy), var8 (copy), var10 (copy), var14 (copy)
					local ok, status = pcall(p0.fetchAsync, var15)
					
					if var17 or var38 ~= var19 then return end
					var16 = false
					local var30 = fFlagMomentsSurfaceLoadTTI and (p2 and (var40 and (var39 ~= nil and momentsSurfaceLoadManager.getSessionGeneration() == var39)))
					
					if var30 then
						momentsSurfaceLoadManager.primaryDataResponseReceived()
					end
					local var31 = if ok and type(status) == "table" and type(status.items) == "table" then status else nil
					
					if var31 ~= nil then
						local var32
						local _ = nil
						
						if var40 then
							t_1 = {}
							var32 = dedupeAndTrack(var31.items)
							var6.setItems(var32)
						else
							var32 = dedupeAndTrack(var31.items)
							local cloned = table.clone(var6.getItems(false))
							local var34 = cloned[#cloned]
							
							if var34 ~= nil and var34.kind == "skeleton" then
								table.remove(cloned)
							end
							for i, v in var32 do
								table.insert(cloned, v)
							end
							var6.setItems(cloned)
						end
						var15 = var31.nextCursor
						var18 = if var40 or #var32 ~= 0 then 0 else var18 + 1
						var12(var31.nextCursor ~= nil and var18 < 3)
						local var35 = if var6.getCount(false) == 0 then "Empty" else "Loaded"
						var8(var35)
						
						if var30 then
							if var35 == "Loaded" then
								momentsSurfaceLoadManager.primaryDataReady()
							else
								momentsSurfaceLoadManager.abort()
							end
						end
						if var31.onAccepted == nil then
							return
						else
							var31.onAccepted()
							
							return
						end
					elseif var40 then
						var6.reset()
						var10(if ok then "Malformed feed batch" else tostring(status))
						var8("Failed")
						
						if var30 then
							momentsSurfaceLoadManager.abort()
							
							return
						end
					else
						local items = var6.getItems(false)
						local var37 = items[#items]
						
						if var37 ~= nil and var37.kind == "skeleton" then
							var6.removeItem(#items)
						end
						var14(true)
						var8(if var6.getCount(false) == 0 then "Empty" else "Loaded")
					end
				end)
				
				return
			end
		end,
		prependItem = function(p5) --[[ line: 302 ]]
			-- upvalues: dedupeAndTrack (ref), var6 (ref), var7 (ref), var8 (ref)
			local var41 = dedupeAndTrack({ p5 })
			
			if #var41 == 0 then return end
			var6.addItemAt(1, var41[1])
			
			if var7(false) == "Empty" then
				var8("Loaded")
			end
		end,
		refresh = loadInitial,
		retry = function() --[[ line: 316 ]]
			-- upvalues: runFetch (ref), var6 (ref)
			runFetch(var6.getCount(false) == 0)
		end,
		dispose = function() --[[ line: 320 ]]
			-- upvalues: var17 (write), p0 (ref), var6 (ref)
			var17 = true
			
			if p0.dispose then
				p0.dispose()
			end
			var6.dispose()
		end
	}
end