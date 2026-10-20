local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local SignalsModule = require(Parent.Signals)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local FFlagMomentsOptimisticProfilePending = require(Parent.SharedFlags).FFlagMomentsOptimisticProfilePending
local CreatePendingFeedOverlayModule = require(script.Parent.createPendingFeedOverlay)
local GetDeletedMomentsStoreModule = require(Moments.Stores.GetDeletedMomentsStore)
local Analytics = MomentsCommonModule.Analytics
local MomentsSurfaceLoadManager = MomentsCommonModule.Performance.MomentsSurfaceLoadManager
local FFlagMomentsContentStatsTelemetry = MomentsCommonModule.Flags.FFlagMomentsContentStatsTelemetry
local _ = require(script.Parent.FeedTypes)
local CreatePagerStoreModule = require(Moments.Components.VerticalPager.createPagerStore)
local FFlagMomentsNonInfiniteScrollEndStateFixesModule = require(Moments.Flags.FFlagMomentsNonInfiniteScrollEndStateFixes)
local FFlagMomentsLoadMoreKeepsPositionModule = require(Moments.Flags.FFlagMomentsLoadMoreKeepsPosition)
local FFlagMomentsModeratedMomentPageModule = require(Moments.Flags.FFlagMomentsModeratedMomentPage)
local CreateSignalFunction = SignalsModule.createSignal
local config = { kind = "skeleton" }
local config1 = { kind = "endState" }

return function(p1, Callback, p2, p3)
	-- upvalues: CreatePagerStoreModule (copy), FFlagMomentsOptimisticProfilePending (copy), CreatePendingFeedOverlayModule (copy), CreateSignalFunction (copy), FFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), FFlagMomentsContentStatsTelemetry (copy), Analytics (copy), config1 (copy), SignalsExperimentalModule (copy), config (copy), MomentsSurfaceLoadManager (copy), FFlagMomentsLoadMoreKeepsPositionModule (copy), FFlagMomentsModeratedMomentPageModule (copy), SignalsModule (copy), GetDeletedMomentsStoreModule (copy)
	local PagerStoreModule = CreatePagerStoreModule()
	local PendingFeedOverlayModule = if FFlagMomentsOptimisticProfilePending and p1.getPendingItems ~= nil then CreatePendingFeedOverlayModule() else nil
	local Callback1 = nil
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Loading, Loading2 = CreateSignalFunction("Loading")
	local Status = "Loading"
	local Signal1, Signal2_1 = CreateSignalFunction(nil)
	local Signal3, Signal2_2 = CreateSignalFunction(true)
	local Signal4, Signal2_3 = CreateSignalFunction(false)
	local RecommendationSource = p1.recommendationSource or "Unknown"
	local NextCursor = nil
	local Flag = false
	local Flag1 = false
	local v1 = 0
	local Count = 0
	local t = {}
	local v2 = p3
	local Signal5, Signal2_4 = CreateSignalFunction(false)
	local GetCanLoadMoreBeyondLimit = nil
	local v3 = nil
	
	if FFlagMomentsNonInfiniteScrollEndStateFixesModule then
		GetCanLoadMoreBeyondLimit, v42 = CreateSignalFunction(false)
	end
	local Tbl = {}
	
	local function _()
		-- upvalues: PagerStoreModule (copy)
		local Items = PagerStoreModule.getItems(false)
		local Item = Items[#Items]
		
		if Item ~= nil and Item.kind == "skeleton" then
			PagerStoreModule.removeItem(#Items)
		end
	end
	
	local function dedupeAndTrack(Items)
		-- upvalues: Callback (copy), t (ref), FFlagMomentsContentStatsTelemetry (upval), Analytics (upval), RecommendationSource (copy)
		if Callback == nil then
			return Items
		end
		local List = {}
		
		for _, item in Items do
			local Success, Result = pcall(Callback, item)
			
			if not Success then
				if FFlagMomentsContentStatsTelemetry then
					Analytics.reportMomentsFeedItemFiltered("malformed", RecommendationSource)
					continue
				end
				continue
			end
			if Result == nil or Result == "" then
				table.insert(List, item)
			elseif not t[Result] then
				t[Result] = true
				table.insert(List, item)
			elseif FFlagMomentsContentStatsTelemetry then
				Analytics.reportMomentsFeedItemFiltered("duplicate", RecommendationSource)
			end
		end
		return List
	end
	
	local _ = function(List): number
		local Count = 0
		
		for _, value in List do
			if value.kind ~= "skeleton" and value.kind ~= "endState" then
				Count += 1
			end
		end
		return Count
	end
	
	local _ = function()
		-- upvalues: Status (ref), PendingFeedOverlayModule (copy), PagerStoreModule (copy), Loading2 (copy)
		local LoadingMore: string = Status
		
		if PendingFeedOverlayModule ~= nil then
			local Count = 0
			
			for _, value in PagerStoreModule.getItems(false) do
				if value.kind ~= "skeleton" and value.kind ~= "endState" then
					Count += 1
				end
			end
			if Count > 0 then
				LoadingMore = if Status == "LoadingMore" then "LoadingMore" else "Loaded"
			elseif Status == "Loaded" then
				LoadingMore = "Empty"
			end
		end
		Loading2(LoadingMore)
	end
	
	local _ = function(Value)
		-- upvalues: Status (ref), PendingFeedOverlayModule (copy), PagerStoreModule (copy), Loading2 (copy)
		Status = Value
		local LoadingMore: string = Status
		
		if PendingFeedOverlayModule ~= nil then
			local Count = 0
			
			for _, value in PagerStoreModule.getItems(false) do
				if value.kind ~= "skeleton" and value.kind ~= "endState" then
					Count += 1
				end
			end
			if Count > 0 then
				LoadingMore = if Status == "LoadingMore" then "LoadingMore" else "Loaded"
			elseif Status == "Loaded" then
				LoadingMore = "Empty"
			end
		end
		Loading2(LoadingMore)
	end
	
	local _ = function()
		-- upvalues: PagerStoreModule (copy), Tbl (copy)
		local Copy = table.clone(PagerStoreModule.getItems(false))
		
		for _, value in Tbl do
			table.insert(Copy, value)
		end
		return Copy
	end
	
	local function maybeAppendEndState()
		-- upvalues: v2 (ref), Signal5 (copy), PagerStoreModule (copy), Tbl (copy), FFlagMomentsNonInfiniteScrollEndStateFixesModule (upval), v3 (ref), Signal3 (copy), Signal2_4 (copy), config1 (upval)
		if v2 == nil or Signal5(false) then return end
		local Items = PagerStoreModule.getItems(false)
		local Count = 0
		
		for _, item in Items do
			if item.kind ~= "skeleton" and item.kind ~= "endState" then
				Count += 1
			end
		end
		if Count < v2 then return end
		local Count1 = 0
		
		for _, item1 in Items do
			if item1.kind ~= "skeleton" and item1.kind ~= "endState" then
				Count1 += 1
			end
		end
		if v2 < Count1 then
			local List = {}
			local Count2 = 0
			
			for _, item2 in Items do
				if item2.kind ~= "skeleton" and item2.kind ~= "endState" then
					if Count2 < v2 then
						Count2 += 1
						table.insert(List, item2)
					else
						table.insert(Tbl, item2)
					end
				end
			end
			PagerStoreModule.setItems(List)
		end
		if FFlagMomentsNonInfiniteScrollEndStateFixesModule then
			assert(v3, "end-state fixes require the eligibility signal")(Signal3(false) or #Tbl > 0)
		end
		Signal2_4(true)
		PagerStoreModule.addItems({ config1 })
	end
	
	local function commitItems(p4)
		-- upvalues: PendingFeedOverlayModule (copy), PagerStoreModule (copy), Tbl (copy), SignalsExperimentalModule (upval), Callback (copy), t (ref)
		if PendingFeedOverlayModule == nil then
			PagerStoreModule.setItems(p4)
			
			return
		end
		local CurrentItem = PagerStoreModule.getCurrentItem(false)
		local IdentityResult = if CurrentItem == nil then nil else PendingFeedOverlayModule.identity(CurrentItem)
		local RetireMissingFunction: (any) -> () = PendingFeedOverlayModule.retireMissing
		local Copy = table.clone(PagerStoreModule.getItems(false))
		
		for i, value in Tbl do
			table.insert(Copy, value)
		end
		RetireMissingFunction(Copy)
		local MergeResult = PendingFeedOverlayModule.merge(p4)
		SignalsExperimentalModule.batch(function()
			-- upvalues: PagerStoreModule (upval), MergeResult (copy), PendingFeedOverlayModule (upval), IdentityResult (copy)
			PagerStoreModule.setItems(MergeResult)
			
			for i, value in MergeResult do
				local IdentityResult1 = PendingFeedOverlayModule.identity(value)
				
				if IdentityResult ~= nil and IdentityResult1 == IdentityResult then
					PagerStoreModule.goToItem(i)
				end
			end
		end)
		
		if Callback ~= nil then
			for _, value1 in MergeResult do
				if value1.kind == "moment" then
					local i = Callback(value1)
					
					if i ~= nil then
						t[i] = true
					end
				end
			end
		end
	end
	
	local function findMomentIndex(InitialMomentId)
		-- upvalues: PendingFeedOverlayModule (copy), PagerStoreModule (copy)
		if InitialMomentId == nil then
			return nil
		end
		local InitialIdentityResolutionRequiresThePendingOverlay = assert(PendingFeedOverlayModule, "initial identity resolution requires the pending overlay")
		
		for i, value in PagerStoreModule.getItems(false) do
			if value.kind == "moment" and (InitialIdentityResolutionRequiresThePendingOverlay.identity(value) == InitialMomentId or value.moment.momentId == InitialMomentId) then
				return i
			elseif value.kind == "unavailableMoment" and value.targetId == InitialMomentId then
				return i
			end
		end
		return nil
	end
	
	local _ = function(p5)
		-- upvalues: findMomentIndex (copy), p1 (copy), Signal2 (copy)
		local MomentIndex = findMomentIndex(p1.initialMomentId)
		
		if MomentIndex ~= nil or p5 then
			Signal2(MomentIndex)
		end
	end
	
	local function runFetch(IsCountMatch, p5)
		-- upvalues: Flag1 (ref), Signal3 (copy), Count (ref), Flag (ref), Signal2_3 (copy), Analytics (upval), RecommendationSource (copy), Signal2_1 (copy), commitItems (copy), config (upval), PendingFeedOverlayModule (copy), findMomentIndex (copy), p1 (copy), Signal2 (copy), Status (ref), PagerStoreModule (copy), Loading2 (copy), v2 (ref), p3 (copy), Signal2_4 (copy), FFlagMomentsNonInfiniteScrollEndStateFixesModule (upval), v3 (ref), Tbl (copy), p2 (copy), MomentsSurfaceLoadManager (upval), FFlagMomentsLoadMoreKeepsPositionModule (upval), NextCursor (ref), t (ref), dedupeAndTrack (copy), v1 (ref), Signal2_2 (copy), FFlagMomentsModeratedMomentPageModule (upval), maybeAppendEndState (copy)
		if Flag1 then return end
		if not IsCountMatch and not Signal3(false) then return end
		Count += 1
		local Count1: number = Count
		Flag = true
		Signal2_3(false)
		local SessionGeneration = nil
		
		if IsCountMatch then
			Analytics.reportMomentsFeedLoadAttempt(RecommendationSource)
			Signal2_1(nil)
			commitItems({ config })
			
			if PendingFeedOverlayModule ~= nil then
				local MomentIndex = findMomentIndex(p1.initialMomentId)
				
				if MomentIndex ~= nil then
					Signal2(MomentIndex)
				end
			end
			Status = "Loading"
			local LoadingMore: string = Status
			
			if PendingFeedOverlayModule ~= nil then
				local Count2 = 0
				
				for _, value in PagerStoreModule.getItems(false) do
					if value.kind ~= "skeleton" and value.kind ~= "endState" then
						Count2 += 1
					end
				end
				if Count2 > 0 then
					LoadingMore = if Status == "LoadingMore" then "LoadingMore" else "Loaded"
				elseif Status == "Loaded" then
					LoadingMore = "Empty"
				end
			end
			Loading2(LoadingMore)
			v2 = p3
			Signal2_4(false)
			
			if FFlagMomentsNonInfiniteScrollEndStateFixesModule then
				assert(v3, "end-state fixes require the eligibility signal")(false)
			end
			table.clear(Tbl)
			
			if p2 then
				MomentsSurfaceLoadManager.start()
				MomentsSurfaceLoadManager.primaryDataStarted()
				MomentsSurfaceLoadManager.primaryDataNetworkFetch()
				SessionGeneration = MomentsSurfaceLoadManager.getSessionGeneration()
			end
		else
			Analytics.reportMomentsFeedLoadMore("attempted", RecommendationSource)
			
			if not FFlagMomentsLoadMoreKeepsPositionModule or not p5 then
				PagerStoreModule.addItems({ config })
			end
			Status = "LoadingMore"
			local LoadingMore: string = Status
			
			if PendingFeedOverlayModule ~= nil then
				local Count3 = 0
				
				for _, value1 in PagerStoreModule.getItems(false) do
					if value1.kind ~= "skeleton" and value1.kind ~= "endState" then
						Count3 += 1
					end
				end
				if Count3 > 0 then
					LoadingMore = if Status == "LoadingMore" then "LoadingMore" else "Loaded"
				elseif Status == "Loaded" then
					LoadingMore = "Empty"
				end
			end
			Loading2(LoadingMore)
		end
		local NextCursor1 = if IsCountMatch then nil else NextCursor
		task.spawn(function()
			-- upvalues: p1 (upval), NextCursor1 (copy), Flag1 (upval), Count1 (copy), Count (upval), Flag (upval), p2 (upval), IsCountMatch (copy), SessionGeneration (ref), MomentsSurfaceLoadManager (upval), t (upval), dedupeAndTrack (upval), commitItems (upval), PendingFeedOverlayModule (upval), findMomentIndex (upval), Signal2 (upval), PagerStoreModule (upval), NextCursor (upval), v1 (upval), Signal2_2 (upval), Status (upval), Loading2 (upval), Analytics (upval), RecommendationSource (upval), FFlagMomentsModeratedMomentPageModule (upval), FFlagMomentsNonInfiniteScrollEndStateFixesModule (upval), p3 (upval), maybeAppendEndState (upval), Signal2_1 (upval), Signal2_3 (upval)
			local Success, Result = pcall(p1.fetchAsync, NextCursor1)
			
			if Flag1 or Count1 ~= Count then return end
			Flag = false
			local IsSessionGenerationMatch: boolean = p2 and (IsCountMatch and (SessionGeneration ~= nil and MomentsSurfaceLoadManager.getSessionGeneration() == SessionGeneration))
			
			if IsSessionGenerationMatch then
				MomentsSurfaceLoadManager.primaryDataResponseReceived()
			end
			local Result1 = if Success and type(Result) == "table" and type(Result.items) == "table" then Result else nil
			
			if Result1 == nil then
				if IsCountMatch then
					if PendingFeedOverlayModule == nil then
						PagerStoreModule.reset()
					else
						commitItems({})
						Signal2((findMomentIndex(p1.initialMomentId)))
					end
					Signal2_1(if Success then "Malformed feed batch" else tostring(Result))
					Status = "Failed"
					local LoadingMore: string = Status
					
					if PendingFeedOverlayModule ~= nil then
						local v4 = 0
						
						for _, value2 in PagerStoreModule.getItems(false) do
							if value2.kind ~= "skeleton" and value2.kind ~= "endState" then
								v4 += 1
							end
						end
						if v4 > 0 then
							LoadingMore = if Status == "LoadingMore" then "LoadingMore" else "Loaded"
						elseif Status == "Loaded" then
							LoadingMore = "Empty"
						end
					end
					Loading2(LoadingMore)
					Analytics.reportMomentsFeedState("failed", RecommendationSource, if Success then "malformedResponse" else "requestFailed")
					
					if IsSessionGenerationMatch then
						MomentsSurfaceLoadManager.abort("failed")
						
						return
					end
				else
					local Items = PagerStoreModule.getItems(false)
					local Item = Items[#Items]
					
					if Item ~= nil and Item.kind == "skeleton" then
						PagerStoreModule.removeItem(#Items)
					end
					Signal2_3(true)
					Status = if PagerStoreModule.getCount(false) == 0 then "Empty" else "Loaded"
					local LoadingMore: string = Status
					
					if PendingFeedOverlayModule ~= nil then
						local Count = 0
						
						for _, value3 in PagerStoreModule.getItems(false) do
							if value3.kind ~= "skeleton" and value3.kind ~= "endState" then
								Count += 1
							end
						end
						if Count > 0 then
							LoadingMore = if Status == "LoadingMore" then "LoadingMore" else "Loaded"
						elseif Status == "Loaded" then
							LoadingMore = "Empty"
						end
					end
					Loading2(LoadingMore)
					Analytics.reportMomentsFeedLoadMore("failed", RecommendationSource, if Success then "malformedResponse" else "requestFailed")
				end
			else
				local v5 = nil
				if IsCountMatch then
					t = {}
					v5 = dedupeAndTrack(Result1.items)
					commitItems(v5)
					
					if PendingFeedOverlayModule ~= nil then
						Signal2((findMomentIndex(p1.initialMomentId)))
						local v6 = findMomentIndex(Result1.initialMomentId)
						
						if v6 ~= nil then
							PagerStoreModule.goToItem(v6)
						end
					end
				else
					v5 = dedupeAndTrack(Result1.items)
					local Copy = table.clone(PagerStoreModule.getItems(false))
					local Entry = Copy[#Copy]
					
					if Entry ~= nil and Entry.kind == "skeleton" then
						table.remove(Copy)
					end
					for _, value in v5 do
						table.insert(Copy, value)
					end
					commitItems(Copy)
				end
				NextCursor = Result1.nextCursor
				v1 = if IsCountMatch or #v5 ~= 0 then 0 else v1 + 1
				Signal2_2(Result1.nextCursor ~= nil and v1 < 3)
				local Empty: string = if PagerStoreModule.getCount(false) == 0 then "Empty" else "Loaded"
				Status = Empty
				local LoadingMore: string = Status
				
				if PendingFeedOverlayModule ~= nil then
					local Count = 0
					
					for _, value1 in PagerStoreModule.getItems(false) do
						if value1.kind ~= "skeleton" and value1.kind ~= "endState" then
							Count += 1
						end
					end
					if Count > 0 then
						LoadingMore = if Status == "LoadingMore" then "LoadingMore" else "Loaded"
					elseif Status == "Loaded" then
						LoadingMore = "Empty"
					end
				end
				Loading2(LoadingMore)
				
				if IsCountMatch then
					Analytics.reportMomentsFeedState(if Empty == "Loaded" then "loaded" else "empty", RecommendationSource, nil)
				end
				if IsSessionGenerationMatch then
					local CurrentItem = PagerStoreModule.getCurrentItem(false)
					
					if FFlagMomentsModeratedMomentPageModule and CurrentItem ~= nil and CurrentItem.kind == "unavailableMoment" then
						MomentsSurfaceLoadManager.abort("unavailable")
					elseif Empty == "Loaded" then
						MomentsSurfaceLoadManager.primaryDataReady()
					else
						MomentsSurfaceLoadManager.abort("empty")
					end
				end
				if Result1.onAccepted ~= nil then
					Result1.onAccepted()
				end
				if not FFlagMomentsNonInfiniteScrollEndStateFixesModule then
					maybeAppendEndState()
					
					return
				end
				if p3 ~= nil then
					maybeAppendEndState()
					
					return
				end
			end
		end)
	end
	
	local function loadInitial()
		-- upvalues: runFetch (copy)
		runFetch(true)
	end
	
	local function loadMore()
		-- upvalues: PendingFeedOverlayModule (copy), Count (ref), Signal1 (copy), FFlagMomentsNonInfiniteScrollEndStateFixesModule (upval), p3 (copy), Signal5 (copy), Flag (ref), Signal4 (copy), Flag1 (ref), Signal3 (copy), Signal2_3 (copy), Analytics (upval), RecommendationSource (copy), FFlagMomentsLoadMoreKeepsPositionModule (upval), PagerStoreModule (copy), config (upval), Status (ref), Loading2 (copy), NextCursor (ref), p1 (copy), p2 (copy), MomentsSurfaceLoadManager (upval), t (ref), dedupeAndTrack (copy), commitItems (copy), findMomentIndex (copy), Signal2 (copy), v1 (ref), Signal2_2 (copy), FFlagMomentsModeratedMomentPageModule (upval), maybeAppendEndState (copy), Signal2_1 (copy)
		if PendingFeedOverlayModule ~= nil and (Count == 0 or Signal1(false) ~= nil) then return end
		if FFlagMomentsNonInfiniteScrollEndStateFixesModule then
			if p3 ~= nil and Signal5(false) then return end
		elseif Signal5(false) then return end
		if Flag or Signal4(false) then return end
		if Flag1 then return end
		if not Signal3(false) then return end
		Count += 1
		local Count1: number = Count
		Flag = true
		Signal2_3(false)
		local v7 = nil
		Analytics.reportMomentsFeedLoadMore("attempted", RecommendationSource)
		PagerStoreModule.addItems({ config })
		Status = "LoadingMore"
		local LoadingMore: string = Status
		
		if PendingFeedOverlayModule ~= nil then
			local Count2 = 0
			
			for _, value in PagerStoreModule.getItems(false) do
				if value.kind ~= "skeleton" and value.kind ~= "endState" then
					Count2 += 1
				end
			end
			if Count2 > 0 then
				LoadingMore = if Status == "LoadingMore" then "LoadingMore" else "Loaded"
			elseif Status == "Loaded" then
				LoadingMore = "Empty"
			end
		end
		Loading2(LoadingMore)
		local NextCursor1 = NextCursor
		local v8 = false
		task.spawn(function()
			-- upvalues: p1 (upval), NextCursor1 (copy), Flag1 (upval), Count1 (copy), Count (upval), Flag (upval), p2 (upval), v8 (copy), v7 (ref), MomentsSurfaceLoadManager (upval), t (upval), dedupeAndTrack (upval), commitItems (upval), PendingFeedOverlayModule (upval), findMomentIndex (upval), Signal2 (upval), PagerStoreModule (upval), NextCursor (upval), v1 (upval), Signal2_2 (upval), Status (upval), Loading2 (upval), Analytics (upval), RecommendationSource (upval), FFlagMomentsModeratedMomentPageModule (upval), FFlagMomentsNonInfiniteScrollEndStateFixesModule (upval), p3 (upval), maybeAppendEndState (upval), Signal2_1 (upval), Signal2_3 (upval)
			local Success, Result = pcall(p1.fetchAsync, NextCursor1)
			
			if Flag1 or Count1 ~= Count then return end
			Flag = false
			local IsSessionGenerationMatch: boolean = p2 and (v8 and (v7 ~= nil and MomentsSurfaceLoadManager.getSessionGeneration() == v7))
			
			if IsSessionGenerationMatch then
				MomentsSurfaceLoadManager.primaryDataResponseReceived()
			end
			local Result1 = if Success and type(Result) == "table" and type(Result.items) == "table" then Result else nil
			
			if Result1 == nil then
				if v8 then
					if PendingFeedOverlayModule == nil then
						PagerStoreModule.reset()
					else
						commitItems({})
						Signal2((findMomentIndex(p1.initialMomentId)))
					end
					Signal2_1(if Success then "Malformed feed batch" else tostring(Result))
					Status = "Failed"
					local LoadingMore: string = Status
					
					if PendingFeedOverlayModule ~= nil then
						local v9 = 0
						
						for _, value2 in PagerStoreModule.getItems(false) do
							if value2.kind ~= "skeleton" and value2.kind ~= "endState" then
								v9 += 1
							end
						end
						if v9 > 0 then
							LoadingMore = if Status == "LoadingMore" then "LoadingMore" else "Loaded"
						elseif Status == "Loaded" then
							LoadingMore = "Empty"
						end
					end
					Loading2(LoadingMore)
					Analytics.reportMomentsFeedState("failed", RecommendationSource, if Success then "malformedResponse" else "requestFailed")
					
					if IsSessionGenerationMatch then
						MomentsSurfaceLoadManager.abort("failed")
						
						return
					end
				else
					local Items = PagerStoreModule.getItems(false)
					local Item = Items[#Items]
					
					if Item ~= nil and Item.kind == "skeleton" then
						PagerStoreModule.removeItem(#Items)
					end
					Signal2_3(true)
					Status = if PagerStoreModule.getCount(false) == 0 then "Empty" else "Loaded"
					local LoadingMore: string = Status
					
					if PendingFeedOverlayModule ~= nil then
						local Count = 0
						
						for _, value3 in PagerStoreModule.getItems(false) do
							if value3.kind ~= "skeleton" and value3.kind ~= "endState" then
								Count += 1
							end
						end
						if Count > 0 then
							LoadingMore = if Status == "LoadingMore" then "LoadingMore" else "Loaded"
						elseif Status == "Loaded" then
							LoadingMore = "Empty"
						end
					end
					Loading2(LoadingMore)
					Analytics.reportMomentsFeedLoadMore("failed", RecommendationSource, if Success then "malformedResponse" else "requestFailed")
				end
			else
				local v10 = nil
				if v8 then
					t = {}
					v10 = dedupeAndTrack(Result1.items)
					commitItems(v10)
					
					if PendingFeedOverlayModule ~= nil then
						Signal2((findMomentIndex(p1.initialMomentId)))
						local v11 = findMomentIndex(Result1.initialMomentId)
						
						if v11 ~= nil then
							PagerStoreModule.goToItem(v11)
						end
					end
				else
					v10 = dedupeAndTrack(Result1.items)
					local Copy = table.clone(PagerStoreModule.getItems(false))
					local Entry = Copy[#Copy]
					
					if Entry ~= nil and Entry.kind == "skeleton" then
						table.remove(Copy)
					end
					for _, value in v10 do
						table.insert(Copy, value)
					end
					commitItems(Copy)
				end
				NextCursor = Result1.nextCursor
				v1 = if v8 or #v10 ~= 0 then 0 else v1 + 1
				Signal2_2(Result1.nextCursor ~= nil and v1 < 3)
				local Empty: string = if PagerStoreModule.getCount(false) == 0 then "Empty" else "Loaded"
				Status = Empty
				local LoadingMore: string = Status
				
				if PendingFeedOverlayModule ~= nil then
					local Count = 0
					
					for _, value1 in PagerStoreModule.getItems(false) do
						if value1.kind ~= "skeleton" and value1.kind ~= "endState" then
							Count += 1
						end
					end
					if Count > 0 then
						LoadingMore = if Status == "LoadingMore" then "LoadingMore" else "Loaded"
					elseif Status == "Loaded" then
						LoadingMore = "Empty"
					end
				end
				Loading2(LoadingMore)
				
				if v8 then
					Analytics.reportMomentsFeedState(if Empty == "Loaded" then "loaded" else "empty", RecommendationSource, nil)
				end
				if IsSessionGenerationMatch then
					local CurrentItem = PagerStoreModule.getCurrentItem(false)
					
					if FFlagMomentsModeratedMomentPageModule and CurrentItem ~= nil and CurrentItem.kind == "unavailableMoment" then
						MomentsSurfaceLoadManager.abort("unavailable")
					elseif Empty == "Loaded" then
						MomentsSurfaceLoadManager.primaryDataReady()
					else
						MomentsSurfaceLoadManager.abort("empty")
					end
				end
				if Result1.onAccepted ~= nil then
					Result1.onAccepted()
				end
				if not FFlagMomentsNonInfiniteScrollEndStateFixesModule then
					maybeAppendEndState()
					
					return
				end
				if p3 ~= nil then
					maybeAppendEndState()
					
					return
				end
			end
		end)
	end
	
	local function loadBeyondLimit()
		-- upvalues: Flag1 (ref), p3 (copy), Signal5 (copy), Signal3 (copy), Tbl (copy), PagerStoreModule (copy), FFlagMomentsLoadMoreKeepsPositionModule (upval), v2 (ref), Signal2_4 (copy), maybeAppendEndState (copy), config (upval), Count (ref), Flag (ref), Signal2_3 (copy), Analytics (upval), RecommendationSource (copy), Status (ref), PendingFeedOverlayModule (copy), Loading2 (copy), NextCursor (ref), p1 (copy), p2 (copy), MomentsSurfaceLoadManager (upval), t (ref), dedupeAndTrack (copy), commitItems (copy), findMomentIndex (copy), Signal2 (copy), v1 (ref), Signal2_2 (copy), FFlagMomentsModeratedMomentPageModule (upval), FFlagMomentsNonInfiniteScrollEndStateFixesModule (upval), Signal2_1 (copy)
		if Flag1 or p3 == nil or not Signal5(false) then return end
		if not Signal3(false) and #Tbl == 0 then return end
		local Items = PagerStoreModule.getItems(false)
		local Copy = table.clone(Items)
		local Entry = Copy[#Copy]
		local IsEndState: boolean = Entry ~= nil and Entry.kind == "endState"
		
		if IsEndState then
			table.remove(Copy)
		end
		if FFlagMomentsLoadMoreKeepsPositionModule and IsEndState then
			PagerStoreModule.goToItem(#Items)
		end
		if not FFlagMomentsLoadMoreKeepsPositionModule and IsEndState then
			PagerStoreModule.removeItem(#Items)
		end
		local NewCount = nil
		if FFlagMomentsLoadMoreKeepsPositionModule then
			local Count1 = 0
			
			for _, value in Copy do
				if value.kind ~= "skeleton" and value.kind ~= "endState" then
					Count1 += 1
				end
			end
			NewCount = Count1 + p3
		else
			local Count2 = 0
			
			for _, value1 in PagerStoreModule.getItems(false) do
				if value1.kind ~= "skeleton" and value1.kind ~= "endState" then
					Count2 += 1
				end
			end
			NewCount = Count2 + p3
		end
		v2 = NewCount
		Signal2_4(false)
		local Flag2 = false
		
		if #Tbl > 0 then
			if not FFlagMomentsLoadMoreKeepsPositionModule then
				Copy = table.clone(PagerStoreModule.getItems(false))
			end
			for _, value2 in Tbl do
				table.insert(Copy, value2)
			end
			table.clear(Tbl)
			PagerStoreModule.setItems(Copy)
			maybeAppendEndState()
			
			if Signal5(false) then return end
		elseif FFlagMomentsLoadMoreKeepsPositionModule then
			table.insert(Copy, config)
			PagerStoreModule.setItems(Copy)
			Flag2 = true
		end
		local Flag3 = if FFlagMomentsLoadMoreKeepsPositionModule then Flag2 else nil
		
		if Flag1 then return end
		if not Signal3(false) then return end
		Count += 1
		local Count3: number = Count
		Flag = true
		Signal2_3(false)
		local SessionGeneration = nil
		Analytics.reportMomentsFeedLoadMore("attempted", RecommendationSource)
		
		if not FFlagMomentsLoadMoreKeepsPositionModule or not Flag3 then
			PagerStoreModule.addItems({ config })
		end
		Status = "LoadingMore"
		local LoadingMore: string = Status
		
		if PendingFeedOverlayModule ~= nil then
			local Count4 = 0
			
			for _, value3 in PagerStoreModule.getItems(false) do
				if value3.kind ~= "skeleton" and value3.kind ~= "endState" then
					Count4 += 1
				end
			end
			if Count4 > 0 then
				LoadingMore = if Status == "LoadingMore" then "LoadingMore" else "Loaded"
			elseif Status == "Loaded" then
				LoadingMore = "Empty"
			end
		end
		Loading2(LoadingMore)
		local NextCursor1 = NextCursor
		local v12 = false
		task.spawn(function()
			-- upvalues: p1 (upval), NextCursor1 (copy), Flag1 (upval), Count3 (copy), Count (upval), Flag (upval), p2 (upval), v12 (copy), SessionGeneration (ref), MomentsSurfaceLoadManager (upval), t (upval), dedupeAndTrack (upval), commitItems (upval), PendingFeedOverlayModule (upval), findMomentIndex (upval), Signal2 (upval), PagerStoreModule (upval), NextCursor (upval), v1 (upval), Signal2_2 (upval), Status (upval), Loading2 (upval), Analytics (upval), RecommendationSource (upval), FFlagMomentsModeratedMomentPageModule (upval), FFlagMomentsNonInfiniteScrollEndStateFixesModule (upval), p3 (upval), maybeAppendEndState (upval), Signal2_1 (upval), Signal2_3 (upval)
			local Success, Result = pcall(p1.fetchAsync, NextCursor1)
			
			if Flag1 or Count3 ~= Count then return end
			Flag = false
			local IsSessionGenerationMatch: boolean = p2 and (v12 and (SessionGeneration ~= nil and MomentsSurfaceLoadManager.getSessionGeneration() == SessionGeneration))
			
			if IsSessionGenerationMatch then
				MomentsSurfaceLoadManager.primaryDataResponseReceived()
			end
			local Result1 = if Success and type(Result) == "table" and type(Result.items) == "table" then Result else nil
			
			if Result1 == nil then
				if v12 then
					if PendingFeedOverlayModule == nil then
						PagerStoreModule.reset()
					else
						commitItems({})
						Signal2((findMomentIndex(p1.initialMomentId)))
					end
					Signal2_1(if Success then "Malformed feed batch" else tostring(Result))
					Status = "Failed"
					local LoadingMore: string = Status
					
					if PendingFeedOverlayModule ~= nil then
						local v13 = 0
						
						for _, value2 in PagerStoreModule.getItems(false) do
							if value2.kind ~= "skeleton" and value2.kind ~= "endState" then
								v13 += 1
							end
						end
						if v13 > 0 then
							LoadingMore = if Status == "LoadingMore" then "LoadingMore" else "Loaded"
						elseif Status == "Loaded" then
							LoadingMore = "Empty"
						end
					end
					Loading2(LoadingMore)
					Analytics.reportMomentsFeedState("failed", RecommendationSource, if Success then "malformedResponse" else "requestFailed")
					
					if IsSessionGenerationMatch then
						MomentsSurfaceLoadManager.abort("failed")
						
						return
					end
				else
					local Items = PagerStoreModule.getItems(false)
					local Item = Items[#Items]
					
					if Item ~= nil and Item.kind == "skeleton" then
						PagerStoreModule.removeItem(#Items)
					end
					Signal2_3(true)
					Status = if PagerStoreModule.getCount(false) == 0 then "Empty" else "Loaded"
					local LoadingMore: string = Status
					
					if PendingFeedOverlayModule ~= nil then
						local Count = 0
						
						for _, value3 in PagerStoreModule.getItems(false) do
							if value3.kind ~= "skeleton" and value3.kind ~= "endState" then
								Count += 1
							end
						end
						if Count > 0 then
							LoadingMore = if Status == "LoadingMore" then "LoadingMore" else "Loaded"
						elseif Status == "Loaded" then
							LoadingMore = "Empty"
						end
					end
					Loading2(LoadingMore)
					Analytics.reportMomentsFeedLoadMore("failed", RecommendationSource, if Success then "malformedResponse" else "requestFailed")
				end
			else
				local v14 = nil
				if v12 then
					t = {}
					v14 = dedupeAndTrack(Result1.items)
					commitItems(v14)
					
					if PendingFeedOverlayModule ~= nil then
						Signal2((findMomentIndex(p1.initialMomentId)))
						local v15 = findMomentIndex(Result1.initialMomentId)
						
						if v15 ~= nil then
							PagerStoreModule.goToItem(v15)
						end
					end
				else
					v14 = dedupeAndTrack(Result1.items)
					local Copy = table.clone(PagerStoreModule.getItems(false))
					local Entry = Copy[#Copy]
					
					if Entry ~= nil and Entry.kind == "skeleton" then
						table.remove(Copy)
					end
					for _, value in v14 do
						table.insert(Copy, value)
					end
					commitItems(Copy)
				end
				NextCursor = Result1.nextCursor
				v1 = if v12 or #v14 ~= 0 then 0 else v1 + 1
				Signal2_2(Result1.nextCursor ~= nil and v1 < 3)
				local Empty: string = if PagerStoreModule.getCount(false) == 0 then "Empty" else "Loaded"
				Status = Empty
				local LoadingMore: string = Status
				
				if PendingFeedOverlayModule ~= nil then
					local Count = 0
					
					for _, value1 in PagerStoreModule.getItems(false) do
						if value1.kind ~= "skeleton" and value1.kind ~= "endState" then
							Count += 1
						end
					end
					if Count > 0 then
						LoadingMore = if Status == "LoadingMore" then "LoadingMore" else "Loaded"
					elseif Status == "Loaded" then
						LoadingMore = "Empty"
					end
				end
				Loading2(LoadingMore)
				
				if v12 then
					Analytics.reportMomentsFeedState(if Empty == "Loaded" then "loaded" else "empty", RecommendationSource, nil)
				end
				if IsSessionGenerationMatch then
					local CurrentItem = PagerStoreModule.getCurrentItem(false)
					
					if FFlagMomentsModeratedMomentPageModule and CurrentItem ~= nil and CurrentItem.kind == "unavailableMoment" then
						MomentsSurfaceLoadManager.abort("unavailable")
					elseif Empty == "Loaded" then
						MomentsSurfaceLoadManager.primaryDataReady()
					else
						MomentsSurfaceLoadManager.abort("empty")
					end
				end
				if Result1.onAccepted ~= nil then
					Result1.onAccepted()
				end
				if not FFlagMomentsNonInfiniteScrollEndStateFixesModule then
					maybeAppendEndState()
					
					return
				end
				if p3 ~= nil then
					maybeAppendEndState()
					
					return
				end
			end
		end)
	end
	
	local function prependItem(p6)
		-- upvalues: dedupeAndTrack (copy), PagerStoreModule (copy), Loading (copy), Status (ref), PendingFeedOverlayModule (copy), Loading2 (copy)
		local DedupeAndTrackResult = dedupeAndTrack({ p6 })
		
		if #DedupeAndTrackResult == 0 then return end
		PagerStoreModule.addItemAt(1, DedupeAndTrackResult[1])
		
		if Loading(false) == "Empty" then
			Status = "Loaded"
			local LoadingMore: string = Status
			
			if PendingFeedOverlayModule ~= nil then
				local Count = 0
				
				for _, value in PagerStoreModule.getItems(false) do
					if value.kind ~= "skeleton" and value.kind ~= "endState" then
						Count += 1
					end
				end
				if Count > 0 then
					LoadingMore = if Status == "LoadingMore" then "LoadingMore" else "Loaded"
				elseif Status == "Loaded" then
					LoadingMore = "Empty"
				end
			end
			Loading2(LoadingMore)
		end
	end
	
	local function retry()
		-- upvalues: PendingFeedOverlayModule (copy), Signal1 (copy), runFetch (copy), PagerStoreModule (copy)
		if PendingFeedOverlayModule == nil or Signal1(false) == nil then
			runFetch(PagerStoreModule.getCount(false) == 0)
			
			return
		else
			runFetch(true)
		end
	end
	
	local function dispose()
		-- upvalues: Flag1 (ref), Callback1 (ref), p1 (copy), PagerStoreModule (copy)
		Flag1 = true
		
		if Callback1 ~= nil then
			Callback1()
		end
		if p1.dispose then
			p1.dispose()
		end
		PagerStoreModule.dispose()
	end
	
	if PendingFeedOverlayModule ~= nil and p1.getPendingItems ~= nil then
		if p1.initialMomentId ~= nil then
			Signal2(1e999)
		end
		local GetPendingItemsFunction = p1.getPendingItems
		Callback1 = SignalsModule.createEffect(function(p7)
			-- upvalues: PendingFeedOverlayModule (copy), GetPendingItemsFunction (copy), GetDeletedMomentsStoreModule (upval), PagerStoreModule (copy), Tbl (copy), SignalsExperimentalModule (upval), commitItems (copy), findMomentIndex (copy), p1 (copy), Signal2 (copy), Signal2_4 (copy), maybeAppendEndState (copy), Status (ref), PendingFeedOverlayModule (copy), Loading2 (copy)
			local UpdateResult = PendingFeedOverlayModule.update(GetPendingItemsFunction(p7), GetDeletedMomentsStoreModule(false).getDeletedIds(p7))
			local Copy = table.clone(PagerStoreModule.getItems(false))
			
			for _, value in Tbl do
				table.insert(Copy, value)
			end
			for i = #Copy, 1, -1 do
				if Copy[i].kind == "endState" then
					table.remove(Copy, i)
				end
			end
			SignalsExperimentalModule.batch(function()
				-- upvalues: commitItems (upval), Copy (copy), Tbl (upval), findMomentIndex (upval), p1 (upval), Signal2 (upval), Signal2_4 (upval), maybeAppendEndState (upval), Status (upval), PendingFeedOverlayModule (upval), PagerStoreModule (upval), Loading2 (upval), UpdateResult (copy)
				commitItems(Copy)
				table.clear(Tbl)
				local MomentIndex = findMomentIndex(p1.initialMomentId)
				
				if MomentIndex ~= nil then
					Signal2(MomentIndex)
				end
				Signal2_4(false)
				maybeAppendEndState()
				local LoadingMore: string = Status
				
				if PendingFeedOverlayModule ~= nil then
					local Count = 0
					
					for _, value in PagerStoreModule.getItems(false) do
						if value.kind ~= "skeleton" and value.kind ~= "endState" then
							Count += 1
						end
					end
					if Count > 0 then
						LoadingMore = if Status == "LoadingMore" then "LoadingMore" else "Loaded"
					elseif Status == "Loaded" then
						LoadingMore = "Empty"
					end
				end
				Loading2(LoadingMore)
				
				if UpdateResult and p1.recommendationSource == "Trending" then
					PagerStoreModule.goToItem(1)
				end
			end)
		end)
	end
	return {
		getInitialIndex = Signal,
		observabilityFeedType = RecommendationSource,
		pager = PagerStoreModule,
		getStatus = Loading,
		getError = Signal1,
		getHasMore = Signal3,
		getLoadMoreFailed = Signal4,
		getAtScrollLimit = Signal5,
		getCanLoadMoreBeyondLimit = GetCanLoadMoreBeyondLimit,
		loadInitial = loadInitial,
		loadMore = loadMore,
		loadBeyondLimit = loadBeyondLimit,
		prependItem = prependItem,
		refresh = loadInitial,
		retry = retry,
		dispose = dispose
	}
end