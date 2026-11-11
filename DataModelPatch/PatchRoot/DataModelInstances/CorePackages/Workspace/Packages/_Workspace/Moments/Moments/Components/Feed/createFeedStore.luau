local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local MomentsSurfaceLoadManager = require(Parent.MomentsCommon).Performance.MomentsSurfaceLoadManager
local FFlagMomentsSurfaceLoadTTI = require(Parent.SharedFlags).FFlagMomentsSurfaceLoadTTI
local _ = require(script.Parent.FeedTypes)
local CreatePagerStoreModule = require(Moments.Components.VerticalPager.createPagerStore)
local CreateSignalFunction = require(Parent.Signals).createSignal
local config = { kind = "skeleton" }

return function(p1, p2, p3)
	-- upvalues: CreatePagerStoreModule (copy), CreateSignalFunction (copy), config (copy), FFlagMomentsSurfaceLoadTTI (copy), MomentsSurfaceLoadManager (copy)
	local PagerStoreModule = CreatePagerStoreModule()
	local Loading, Loading2 = CreateSignalFunction("Loading")
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Signal1, Signal2_1 = CreateSignalFunction(true)
	local Signal3, Signal2_2 = CreateSignalFunction(false)
	local NextCursor = nil
	local Flag = false
	local Flag1 = false
	local v1 = 0
	local Count = 0
	local t = {}
	
	local function _()
		-- upvalues: PagerStoreModule (copy)
		local Items = PagerStoreModule.getItems(false)
		local Item = Items[#Items]
		
		if Item ~= nil and Item.kind == "skeleton" then
			PagerStoreModule.removeItem(#Items)
		end
	end
	
	local function dedupeAndTrack(Items)
		-- upvalues: p2 (copy), t (ref)
		if p2 == nil then
			return Items
		end
		local List = {}
		
		for _, item in Items do
			local Success, Result = pcall(p2, item)
			
			if Success then
				if Result == nil or Result == "" then
					table.insert(List, item)
				elseif not t[Result] then
					t[Result] = true
					table.insert(List, item)
				end
			end
		end
		return List
	end
	
	local function runFetch(IsCountMatch)
		-- upvalues: Flag1 (ref), Signal1 (copy), Count (ref), Flag (ref), Signal2_2 (copy), Signal2 (copy), PagerStoreModule (copy), config (upval), Loading2 (copy), FFlagMomentsSurfaceLoadTTI (upval), p3 (copy), MomentsSurfaceLoadManager (upval), NextCursor (ref), p1 (copy), t (ref), dedupeAndTrack (copy), v1 (ref), Signal2_1 (copy)
		if Flag1 then return end
		if not IsCountMatch and not Signal1(false) then return end
		Count += 1
		local Count1: number = Count
		Flag = true
		Signal2_2(false)
		local SessionGeneration = nil
		
		if IsCountMatch then
			Signal2(nil)
			PagerStoreModule.setItems({ config })
			Loading2("Loading")
			
			if FFlagMomentsSurfaceLoadTTI and p3 then
				MomentsSurfaceLoadManager.start()
				MomentsSurfaceLoadManager.primaryDataStarted()
				MomentsSurfaceLoadManager.primaryDataNetworkFetch()
				SessionGeneration = MomentsSurfaceLoadManager.getSessionGeneration()
			end
		else
			PagerStoreModule.addItems({ config })
			Loading2("LoadingMore")
		end
		local NextCursor1 = if IsCountMatch then nil else NextCursor
		task.spawn(function()
			-- upvalues: p1 (upval), NextCursor1 (copy), Flag1 (upval), Count1 (copy), Count (upval), Flag (upval), FFlagMomentsSurfaceLoadTTI (upval), p3 (upval), IsCountMatch (copy), SessionGeneration (ref), MomentsSurfaceLoadManager (upval), t (upval), dedupeAndTrack (upval), PagerStoreModule (upval), NextCursor (upval), v1 (upval), Signal2_1 (upval), Loading2 (upval), Signal2 (upval), Signal2_2 (upval)
			local Success, Result = pcall(p1.fetchAsync, NextCursor1)
			
			if Flag1 or Count1 ~= Count then return end
			Flag = false
			local IsSessionGenerationMatch: boolean = FFlagMomentsSurfaceLoadTTI and (p3 and (IsCountMatch and (SessionGeneration ~= nil and MomentsSurfaceLoadManager.getSessionGeneration() == SessionGeneration)))
			
			if IsSessionGenerationMatch then
				MomentsSurfaceLoadManager.primaryDataResponseReceived()
			end
			local Result1 = if Success and type(Result) == "table" and type(Result.items) == "table" then Result else nil
			
			if Result1 == nil then
				if IsCountMatch then
					PagerStoreModule.reset()
					Signal2(if Success then "Malformed feed batch" else tostring(Result))
					Loading2("Failed")
					
					if IsSessionGenerationMatch then
						MomentsSurfaceLoadManager.abort()
						
						return
					end
				else
					local Items = PagerStoreModule.getItems(false)
					local Item = Items[#Items]
					
					if Item ~= nil and Item.kind == "skeleton" then
						PagerStoreModule.removeItem(#Items)
					end
					Signal2_2(true)
					Loading2(if PagerStoreModule.getCount(false) == 0 then "Empty" else "Loaded")
				end
			else
				local v2 = nil
				if IsCountMatch then
					t = {}
					v2 = dedupeAndTrack(Result1.items)
					PagerStoreModule.setItems(v2)
				else
					v2 = dedupeAndTrack(Result1.items)
					local Copy = table.clone(PagerStoreModule.getItems(false))
					local Entry = Copy[#Copy]
					
					if Entry ~= nil and Entry.kind == "skeleton" then
						table.remove(Copy)
					end
					for _, value in v2 do
						table.insert(Copy, value)
					end
					PagerStoreModule.setItems(Copy)
				end
				NextCursor = Result1.nextCursor
				v1 = if IsCountMatch or #v2 ~= 0 then 0 else v1 + 1
				Signal2_1(Result1.nextCursor ~= nil and v1 < 3)
				local Empty: string = if PagerStoreModule.getCount(false) == 0 then "Empty" else "Loaded"
				Loading2(Empty)
				
				if IsSessionGenerationMatch then
					if Empty == "Loaded" then
						MomentsSurfaceLoadManager.primaryDataReady()
						
						return
					else
						MomentsSurfaceLoadManager.abort()
						
						return
					end
				end
			end
		end)
	end
	
	local function loadInitial()
		-- upvalues: runFetch (copy)
		runFetch(true)
	end
	
	return {
		pager = PagerStoreModule,
		getStatus = Loading,
		getError = Signal,
		getHasMore = Signal1,
		getLoadMoreFailed = Signal3,
		loadInitial = loadInitial,
		loadMore = function()
			-- upvalues: Flag (ref), Signal3 (copy), Flag1 (ref), Signal1 (copy), Count (ref), Signal2_2 (copy), PagerStoreModule (copy), config (upval), Loading2 (copy), NextCursor (ref), p1 (copy), FFlagMomentsSurfaceLoadTTI (upval), p3 (copy), MomentsSurfaceLoadManager (upval), t (ref), dedupeAndTrack (copy), v1 (ref), Signal2_1 (copy), Signal2 (copy)
			if Flag or Signal3(false) then return end
			if Flag1 then return end
			if Signal1(false) then
				Count += 1
				local Count1: number = Count
				Flag = true
				Signal2_2(false)
				local SessionGeneration = nil
				PagerStoreModule.addItems({ config })
				Loading2("LoadingMore")
				local NextCursor1 = NextCursor
				local v2 = false
				task.spawn(function()
					-- upvalues: p1 (upval), NextCursor1 (copy), Flag1 (upval), Count1 (copy), Count (upval), Flag (upval), FFlagMomentsSurfaceLoadTTI (upval), p3 (upval), v2 (copy), SessionGeneration (ref), MomentsSurfaceLoadManager (upval), t (upval), dedupeAndTrack (upval), PagerStoreModule (upval), NextCursor (upval), v1 (upval), Signal2_1 (upval), Loading2 (upval), Signal2 (upval), Signal2_2 (upval)
					local Success, Result = pcall(p1.fetchAsync, NextCursor1)
					
					if Flag1 or Count1 ~= Count then return end
					Flag = false
					local IsSessionGenerationMatch: boolean = FFlagMomentsSurfaceLoadTTI and (p3 and (v2 and (SessionGeneration ~= nil and MomentsSurfaceLoadManager.getSessionGeneration() == SessionGeneration)))
					
					if IsSessionGenerationMatch then
						MomentsSurfaceLoadManager.primaryDataResponseReceived()
					end
					local Result1 = if Success and type(Result) == "table" and type(Result.items) == "table" then Result else nil
					
					if Result1 == nil then
						if v2 then
							PagerStoreModule.reset()
							Signal2(if Success then "Malformed feed batch" else tostring(Result))
							Loading2("Failed")
							
							if IsSessionGenerationMatch then
								MomentsSurfaceLoadManager.abort()
								
								return
							end
						else
							local Items = PagerStoreModule.getItems(false)
							local Item = Items[#Items]
							
							if Item ~= nil and Item.kind == "skeleton" then
								PagerStoreModule.removeItem(#Items)
							end
							Signal2_2(true)
							Loading2(if PagerStoreModule.getCount(false) == 0 then "Empty" else "Loaded")
						end
					else
						local v3 = nil
						if v2 then
							t = {}
							v3 = dedupeAndTrack(Result1.items)
							PagerStoreModule.setItems(v3)
						else
							v3 = dedupeAndTrack(Result1.items)
							local Copy = table.clone(PagerStoreModule.getItems(false))
							local Entry = Copy[#Copy]
							
							if Entry ~= nil and Entry.kind == "skeleton" then
								table.remove(Copy)
							end
							for _, value in v3 do
								table.insert(Copy, value)
							end
							PagerStoreModule.setItems(Copy)
						end
						NextCursor = Result1.nextCursor
						v1 = if v2 or #v3 ~= 0 then 0 else v1 + 1
						Signal2_1(Result1.nextCursor ~= nil and v1 < 3)
						local Empty: string = if PagerStoreModule.getCount(false) == 0 then "Empty" else "Loaded"
						Loading2(Empty)
						
						if IsSessionGenerationMatch then
							if Empty == "Loaded" then
								MomentsSurfaceLoadManager.primaryDataReady()
								
								return
							else
								MomentsSurfaceLoadManager.abort()
								
								return
							end
						end
					end
				end)
				
				return
			end
		end,
		prependItem = function(p4)
			-- upvalues: dedupeAndTrack (copy), PagerStoreModule (copy), Loading (copy), Loading2 (copy)
			local DedupeAndTrackResult = dedupeAndTrack({ p4 })
			
			if #DedupeAndTrackResult == 0 then return end
			PagerStoreModule.addItemAt(1, DedupeAndTrackResult[1])
			
			if Loading(false) == "Empty" then
				Loading2("Loaded")
			end
		end,
		refresh = loadInitial,
		retry = function()
			-- upvalues: runFetch (copy), PagerStoreModule (copy)
			runFetch(PagerStoreModule.getCount(false) == 0)
		end,
		dispose = function()
			-- upvalues: Flag1 (ref), p1 (copy), PagerStoreModule (copy)
			Flag1 = true
			
			if p1.dispose then
				p1.dispose()
			end
			PagerStoreModule.dispose()
		end
	}
end