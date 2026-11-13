local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local SignalsModule = require(Parent.Signals)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local FFlagMomentsOptimisticProfilePending = require(Parent.SharedFlags).FFlagMomentsOptimisticProfilePending
local CreatePendingFeedOverlayModule = require(script.Parent.createPendingFeedOverlay)
local GetDeletedMomentsStoreModule = require(Moments.Stores.GetDeletedMomentsStore)
local FFlagMomentsParentTimeLimit = MomentsCommonModule.Flags.FFlagMomentsParentTimeLimit
local Analytics = MomentsCommonModule.Analytics
local MomentsSurfaceLoadManager = MomentsCommonModule.Performance.MomentsSurfaceLoadManager
local _ = require(script.Parent.FeedTypes)
local CreatePagerStoreModule = require(Moments.Components.VerticalPager.createPagerStore)
local FFlagMomentsLoadMoreKeepsPositionModule = require(Moments.Flags.FFlagMomentsLoadMoreKeepsPosition)
local FFlagMomentsModeratedMomentPageModule = require(Moments.Flags.FFlagMomentsModeratedMomentPage)
local CreateSignalFunction = SignalsModule.createSignal
local config = { kind = "skeleton" }
local config1 = { kind = "endState" }
local config2 = { kind = "caughtUp" }

local function isTerminalPage(p1): boolean
	return p1.kind == "endState" or p1.kind == "caughtUp"
end

local function _(p1): boolean
	return p1.kind == "skeleton" or (p1.kind == "endState" or p1.kind == "caughtUp")
end

return function(p1, Callback, p2, p3, p4)
	-- upvalues: CreatePagerStoreModule (copy), FFlagMomentsOptimisticProfilePending (copy), CreatePendingFeedOverlayModule (copy), CreateSignalFunction (copy), Analytics (copy), FFlagMomentsParentTimeLimit (copy), config1 (copy), config2 (copy), SignalsExperimentalModule (copy), config (copy), MomentsSurfaceLoadManager (copy), FFlagMomentsLoadMoreKeepsPositionModule (copy), Parent (copy), FFlagMomentsModeratedMomentPageModule (copy), isTerminalPage (copy), SignalsModule (copy), GetDeletedMomentsStoreModule (copy)
	local IsEndsWithCaughtUp = p1.endsWithCaughtUp == true
	local PagerStoreModule = CreatePagerStoreModule()
	local PendingFeedOverlayModule = if FFlagMomentsOptimisticProfilePending and p1.getPendingItems ~= nil then CreatePendingFeedOverlayModule() else nil
	local Callback1 = nil
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Loading, Loading2 = CreateSignalFunction("Loading")
	local Empty = "Loading"
	local Signal1, Signal2_1 = CreateSignalFunction(nil)
	local Signal3, Signal2_2 = CreateSignalFunction(true)
	local Signal4, Signal2_3 = CreateSignalFunction(false)
	local RecommendationSource = p1.recommendationSource or "Unknown"
	local NextCursor = nil
	local Flag = false
	local Flag1 = false
	local Flag2 = false
	local Callback2 = nil
	local SessionGeneration = nil
	local v1 = 0
	local Count = 0
	local t = {}
	local v2 = p3
	local Signal5, Signal2_4 = CreateSignalFunction(false)
	local Signal2_5 = nil
	local Signal6
	Signal6, Signal2_5 = CreateSignalFunction(false)
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
		-- upvalues: Callback (copy), t (ref), Analytics (upval), RecommendationSource (copy)
		if Callback == nil then
			return Items
		end
		local List = {}
		
		for _, item in Items do
			local Success, Result = pcall(Callback, item)
			
			if not Success then
				Analytics.reportMomentsFeedItemFiltered("malformed", RecommendationSource)
				continue
			end
			if Result == nil or Result == "" then
				table.insert(List, item)
			elseif t[Result] then
				Analytics.reportMomentsFeedItemFiltered("duplicate", RecommendationSource)
			else
				t[Result] = true
				table.insert(List, item)
			end
		end
		return List
	end
	
	local _ = function(List): number
		local Count = 0
		
		for _, value in List do
			if value.kind ~= "skeleton" and (value.kind ~= "endState" and value.kind ~= "caughtUp") then
				Count += 1
			end
		end
		return Count
	end
	
	local _ = function()
		-- upvalues: Empty (ref), FFlagMomentsParentTimeLimit (upval), Flag2 (ref), PendingFeedOverlayModule (copy), PagerStoreModule (copy), Loading2 (copy)
		local LoadingMore: string = Empty
		
		if FFlagMomentsParentTimeLimit and Flag2 then
			LoadingMore = "LimitReached"
		elseif PendingFeedOverlayModule ~= nil then
			local Count = 0
			
			for _, value in PagerStoreModule.getItems(false) do
				if value.kind ~= "skeleton" and (value.kind ~= "endState" and value.kind ~= "caughtUp") then
					Count += 1
				end
			end
			if Count > 0 then
				LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
			elseif Empty == "Loaded" then
				LoadingMore = "Empty"
			end
		end
		Loading2(LoadingMore)
	end
	
	local _ = function(Value)
		-- upvalues: Empty (ref), FFlagMomentsParentTimeLimit (upval), Flag2 (ref), PendingFeedOverlayModule (copy), PagerStoreModule (copy), Loading2 (copy)
		Empty = Value
		local LoadingMore: string = Empty
		
		if FFlagMomentsParentTimeLimit and Flag2 then
			LoadingMore = "LimitReached"
		elseif PendingFeedOverlayModule ~= nil then
			local Count = 0
			
			for _, value in PagerStoreModule.getItems(false) do
				if value.kind ~= "skeleton" and (value.kind ~= "endState" and value.kind ~= "caughtUp") then
					Count += 1
				end
			end
			if Count > 0 then
				LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
			elseif Empty == "Loaded" then
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
		-- upvalues: v2 (ref), Signal5 (copy), PagerStoreModule (copy), Tbl (copy), Signal2_5 (ref), Signal3 (copy), Signal2_4 (copy), config1 (upval)
		if v2 == nil or Signal5(false) then return end
		local Items = PagerStoreModule.getItems(false)
		local Count = 0
		
		for _, item in Items do
			if item.kind ~= "skeleton" and (item.kind ~= "endState" and item.kind ~= "caughtUp") then
				Count += 1
			end
		end
		if Count < v2 then return end
		local Count1 = 0
		
		for _, item1 in Items do
			if item1.kind ~= "skeleton" and (item1.kind ~= "endState" and item1.kind ~= "caughtUp") then
				Count1 += 1
			end
		end
		if v2 < Count1 then
			local List = {}
			local Count2 = 0
			
			for _, item2 in Items do
				if item2.kind ~= "skeleton" and (item2.kind ~= "endState" and item2.kind ~= "caughtUp") then
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
		assert(Signal2_5, "end-state fixes require the eligibility signal")(Signal3(false) or #Tbl > 0)
		Signal2_4(true)
		PagerStoreModule.addItems({ config1 })
	end
	
	local function appendTerminalPage()
		-- upvalues: PagerStoreModule (copy), IsEndsWithCaughtUp (copy), Signal3 (copy), Tbl (copy), v2 (ref), config2 (upval), maybeAppendEndState (copy)
		local Items = PagerStoreModule.getItems(false)
		repeat
			if IsEndsWithCaughtUp and (not Signal3(false) and #Tbl == 0) then
				if v2 ~= nil then
					local Count = 0
					
					for _, item in Items do
						if item.kind ~= "skeleton" and (item.kind ~= "endState" and item.kind ~= "caughtUp") then
							Count += 1
						end
					end
					if Count > v2 then
						maybeAppendEndState()
						break
					end
				end
				local Item = Items[#Items]
				
				if Item == nil or (Item.kind == "skeleton" or (Item.kind == "endState" or Item.kind == "caughtUp")) then break end
				PagerStoreModule.addItems({ config2 })
			end
		until true
	end
	
	local function commitItems(p5)
		-- upvalues: PendingFeedOverlayModule (copy), PagerStoreModule (copy), Tbl (copy), SignalsExperimentalModule (upval), Callback (copy), t (ref)
		if PendingFeedOverlayModule == nil then
			PagerStoreModule.setItems(p5)
			
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
		local MergeResult = PendingFeedOverlayModule.merge(p5)
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
	
	local _ = function(p6)
		-- upvalues: findMomentIndex (copy), p1 (copy), Signal2 (copy)
		local MomentIndex = findMomentIndex(p1.initialMomentId)
		
		if MomentIndex ~= nil or p6 then
			Signal2(MomentIndex)
		end
	end
	
	local function runFetch(IsCountMatch, p6)
		-- upvalues: Flag1 (ref), Signal3 (copy), FFlagMomentsParentTimeLimit (upval), Flag2 (ref), Count (ref), Flag (ref), Signal2_3 (copy), Analytics (upval), RecommendationSource (copy), Signal2_1 (copy), commitItems (copy), config (upval), PendingFeedOverlayModule (copy), findMomentIndex (copy), p1 (copy), Signal2 (copy), Empty (ref), PagerStoreModule (copy), Loading2 (copy), v2 (ref), p3 (copy), Signal2_4 (copy), Signal2_5 (ref), Tbl (copy), p2 (copy), MomentsSurfaceLoadManager (upval), SessionGeneration (ref), FFlagMomentsLoadMoreKeepsPositionModule (upval), NextCursor (ref), p4 (copy), Parent (upval), t (ref), dedupeAndTrack (copy), v1 (ref), Signal2_2 (copy), FFlagMomentsModeratedMomentPageModule (upval), IsEndsWithCaughtUp (copy), appendTerminalPage (copy)
		if Flag1 then return end
		if not IsCountMatch and not Signal3(false) then return end
		if FFlagMomentsParentTimeLimit and Flag2 then return end
		Count += 1
		local Count1: number = Count
		Flag = true
		Signal2_3(false)
		local SessionGeneration1 = nil
		
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
			Empty = "Loading"
			local LoadingMore: string = Empty
			
			if FFlagMomentsParentTimeLimit and Flag2 then
				LoadingMore = "LimitReached"
			elseif PendingFeedOverlayModule ~= nil then
				local Count2 = 0
				
				for _, value in PagerStoreModule.getItems(false) do
					if value.kind ~= "skeleton" and (value.kind ~= "endState" and value.kind ~= "caughtUp") then
						Count2 += 1
					end
				end
				if Count2 > 0 then
					LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
				elseif Empty == "Loaded" then
					LoadingMore = "Empty"
				end
			end
			Loading2(LoadingMore)
			v2 = p3
			Signal2_4(false)
			assert(Signal2_5, "end-state fixes require the eligibility signal")(false)
			table.clear(Tbl)
			
			if p2 then
				MomentsSurfaceLoadManager.start()
				MomentsSurfaceLoadManager.primaryDataStarted()
				MomentsSurfaceLoadManager.primaryDataNetworkFetch()
				SessionGeneration1 = MomentsSurfaceLoadManager.getSessionGeneration()
				
				if FFlagMomentsParentTimeLimit then
					SessionGeneration = SessionGeneration1
				end
			end
		else
			Analytics.reportMomentsFeedLoadMore("attempted", RecommendationSource)
			
			if not FFlagMomentsLoadMoreKeepsPositionModule or not p6 then
				PagerStoreModule.addItems({ config })
			end
			Empty = "LoadingMore"
			local LoadingMore: string = Empty
			
			if FFlagMomentsParentTimeLimit and Flag2 then
				LoadingMore = "LimitReached"
			elseif PendingFeedOverlayModule ~= nil then
				local Count3 = 0
				
				for _, value1 in PagerStoreModule.getItems(false) do
					if value1.kind ~= "skeleton" and (value1.kind ~= "endState" and value1.kind ~= "caughtUp") then
						Count3 += 1
					end
				end
				if Count3 > 0 then
					LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
				elseif Empty == "Loaded" then
					LoadingMore = "Empty"
				end
			end
			Loading2(LoadingMore)
		end
		local NextCursor1 = if IsCountMatch then nil else NextCursor
		task.spawn(function()
			-- upvalues: p1 (upval), NextCursor1 (copy), Flag1 (upval), Count1 (copy), Count (upval), Flag (upval), p2 (upval), IsCountMatch (copy), SessionGeneration1 (ref), MomentsSurfaceLoadManager (upval), FFlagMomentsParentTimeLimit (upval), p4 (upval), Parent (upval), PendingFeedOverlayModule (upval), commitItems (upval), findMomentIndex (upval), Signal2 (upval), PagerStoreModule (upval), Flag2 (upval), Empty (upval), Loading2 (upval), Analytics (upval), RecommendationSource (upval), t (upval), dedupeAndTrack (upval), NextCursor (upval), v1 (upval), Signal2_2 (upval), FFlagMomentsModeratedMomentPageModule (upval), p3 (upval), IsEndsWithCaughtUp (upval), appendTerminalPage (upval), Signal2_1 (upval), Signal2_3 (upval)
			local Success, Result = pcall(p1.fetchAsync, NextCursor1)
			
			if Flag1 or Count1 ~= Count then return end
			Flag = false
			local IsSessionGenerationMatch: boolean = p2 and (IsCountMatch and (SessionGeneration1 ~= nil and MomentsSurfaceLoadManager.getSessionGeneration() == SessionGeneration1))
			
			if IsSessionGenerationMatch then
				MomentsSurfaceLoadManager.primaryDataResponseReceived()
			end
			local v3 = if FFlagMomentsParentTimeLimit and not Success and p4 ~= nil then require(Parent.DataHydration.MomentsParseMomentsLimitError)(Result) else nil
			
			if v3 == nil then
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
						Empty = "Failed"
						local LoadingMore: string = Empty
						
						if FFlagMomentsParentTimeLimit and Flag2 then
							LoadingMore = "LimitReached"
						elseif PendingFeedOverlayModule ~= nil then
							local Count = 0
							
							for _, value3 in PagerStoreModule.getItems(false) do
								if value3.kind ~= "skeleton" and (value3.kind ~= "endState" and value3.kind ~= "caughtUp") then
									Count += 1
								end
							end
							if Count > 0 then
								LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
							elseif Empty == "Loaded" then
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
						Empty = if PagerStoreModule.getCount(false) == 0 then "Empty" else "Loaded"
						local LoadingMore: string = Empty
						
						if FFlagMomentsParentTimeLimit and Flag2 then
							LoadingMore = "LimitReached"
						elseif PendingFeedOverlayModule ~= nil then
							local v4 = 0
							
							for _, value2 in PagerStoreModule.getItems(false) do
								if value2.kind ~= "skeleton" and (value2.kind ~= "endState" and value2.kind ~= "caughtUp") then
									v4 += 1
								end
							end
							if v4 > 0 then
								LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
							elseif Empty == "Loaded" then
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
						for _, value1 in v5 do
							table.insert(Copy, value1)
						end
						commitItems(Copy)
					end
					NextCursor = Result1.nextCursor
					v1 = if IsCountMatch or #v5 ~= 0 then 0 else v1 + 1
					Signal2_2(Result1.nextCursor ~= nil and v1 < 3)
					local Empty: string = if PagerStoreModule.getCount(false) == 0 then "Empty" else "Loaded"
					Empty = Empty
					local LoadingMore: string = Empty
					
					if FFlagMomentsParentTimeLimit and Flag2 then
						LoadingMore = "LimitReached"
					elseif PendingFeedOverlayModule ~= nil then
						local Count = 0
						
						for _, value4 in PagerStoreModule.getItems(false) do
							if value4.kind ~= "skeleton" and (value4.kind ~= "endState" and value4.kind ~= "caughtUp") then
								Count += 1
							end
						end
						if Count > 0 then
							LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
						elseif Empty == "Loaded" then
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
					if p3 ~= nil or IsEndsWithCaughtUp then
						appendTerminalPage()
						
						return
					end
				end
				return
			else
				if IsCountMatch and PendingFeedOverlayModule ~= nil then
					commitItems({})
					Signal2((findMomentIndex(p1.initialMomentId)))
				else
					local Items = PagerStoreModule.getItems(false)
					local Item = Items[#Items]
					
					if Item ~= nil and Item.kind == "skeleton" then
						PagerStoreModule.removeItem(#Items)
					end
				end
				Flag2 = true
				Empty = if PagerStoreModule.getCount(false) == 0 then "Empty" else "Loaded"
				local LoadingMore: string = Empty
				
				if FFlagMomentsParentTimeLimit and Flag2 then
					LoadingMore = "LimitReached"
				elseif PendingFeedOverlayModule ~= nil then
					local Count = 0
					
					for _, value in PagerStoreModule.getItems(false) do
						if value.kind ~= "skeleton" and (value.kind ~= "endState" and value.kind ~= "caughtUp") then
							Count += 1
						end
					end
					if Count > 0 then
						LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
					elseif Empty == "Loaded" then
						LoadingMore = "Empty"
					end
				end
				Loading2(LoadingMore)
				
				if IsCountMatch then
					Analytics.reportMomentsFeedState("failed", RecommendationSource, "parentalTimeLimitReached")
				else
					Analytics.reportMomentsFeedLoadMore("failed", RecommendationSource, "parentalTimeLimitReached")
				end
				if IsSessionGenerationMatch then
					MomentsSurfaceLoadManager.abort("parentalTimeLimitReached")
				end
				p4.markLimitReached(v3.limitSeconds)
			end
		end)
	end
	
	local function loadInitial()
		-- upvalues: runFetch (copy)
		runFetch(true)
	end
	
	local function loadMore()
		-- upvalues: PendingFeedOverlayModule (copy), Count (ref), Signal1 (copy), p3 (copy), Signal5 (copy), Flag (ref), Signal4 (copy), Flag1 (ref), Signal3 (copy), FFlagMomentsParentTimeLimit (upval), Flag2 (ref), Signal2_3 (copy), Analytics (upval), RecommendationSource (copy), FFlagMomentsLoadMoreKeepsPositionModule (upval), PagerStoreModule (copy), config (upval), Empty (ref), isTerminalPage (upval), Loading2 (copy), NextCursor (ref), p1 (copy), p2 (copy), MomentsSurfaceLoadManager (upval), p4 (copy), Parent (upval), commitItems (copy), findMomentIndex (copy), Signal2 (copy), t (ref), dedupeAndTrack (copy), v1 (ref), Signal2_2 (copy), FFlagMomentsModeratedMomentPageModule (upval), IsEndsWithCaughtUp (copy), appendTerminalPage (copy), Signal2_1 (copy)
		if PendingFeedOverlayModule ~= nil and (Count == 0 or Signal1(false) ~= nil) then return end
		if p3 ~= nil and Signal5(false) then return end
		if Flag or Signal4(false) then return end
		if Flag1 then return end
		if not Signal3(false) then return end
		if FFlagMomentsParentTimeLimit and Flag2 then return end
		Count += 1
		local Count1: number = Count
		Flag = true
		Signal2_3(false)
		local v7 = nil
		Analytics.reportMomentsFeedLoadMore("attempted", RecommendationSource)
		PagerStoreModule.addItems({ config })
		Empty = "LoadingMore"
		local LoadingMore: string = Empty
		
		if FFlagMomentsParentTimeLimit and Flag2 then
			LoadingMore = "LimitReached"
		elseif PendingFeedOverlayModule ~= nil then
			local Count2 = 0
			
			for _, value in PagerStoreModule.getItems(false) do
				if value.kind ~= "skeleton" and not isTerminalPage(value) then
					Count2 += 1
				end
			end
			if Count2 > 0 then
				LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
			elseif Empty == "Loaded" then
				LoadingMore = "Empty"
			end
		end
		Loading2(LoadingMore)
		local NextCursor1 = NextCursor
		local v8 = false
		task.spawn(function()
			-- upvalues: p1 (upval), NextCursor1 (copy), Flag1 (upval), Count1 (copy), Count (upval), Flag (upval), p2 (upval), v8 (copy), v7 (ref), MomentsSurfaceLoadManager (upval), FFlagMomentsParentTimeLimit (upval), p4 (upval), Parent (upval), PendingFeedOverlayModule (upval), commitItems (upval), findMomentIndex (upval), Signal2 (upval), PagerStoreModule (upval), Flag2 (upval), Empty (upval), Loading2 (upval), Analytics (upval), RecommendationSource (upval), t (upval), dedupeAndTrack (upval), NextCursor (upval), v1 (upval), Signal2_2 (upval), FFlagMomentsModeratedMomentPageModule (upval), p3 (upval), IsEndsWithCaughtUp (upval), appendTerminalPage (upval), Signal2_1 (upval), Signal2_3 (upval)
			local Success, Result = pcall(p1.fetchAsync, NextCursor1)
			
			if Flag1 or Count1 ~= Count then return end
			Flag = false
			local IsSessionGenerationMatch: boolean = p2 and (v8 and (v7 ~= nil and MomentsSurfaceLoadManager.getSessionGeneration() == v7))
			
			if IsSessionGenerationMatch then
				MomentsSurfaceLoadManager.primaryDataResponseReceived()
			end
			local v9 = if FFlagMomentsParentTimeLimit and not Success and p4 ~= nil then require(Parent.DataHydration.MomentsParseMomentsLimitError)(Result) else nil
			
			if v9 == nil then
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
						Empty = "Failed"
						local LoadingMore: string = Empty
						
						if FFlagMomentsParentTimeLimit and Flag2 then
							LoadingMore = "LimitReached"
						elseif PendingFeedOverlayModule ~= nil then
							local Count = 0
							
							for _, value3 in PagerStoreModule.getItems(false) do
								if value3.kind ~= "skeleton" and (value3.kind ~= "endState" and value3.kind ~= "caughtUp") then
									Count += 1
								end
							end
							if Count > 0 then
								LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
							elseif Empty == "Loaded" then
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
						Empty = if PagerStoreModule.getCount(false) == 0 then "Empty" else "Loaded"
						local LoadingMore: string = Empty
						
						if FFlagMomentsParentTimeLimit and Flag2 then
							LoadingMore = "LimitReached"
						elseif PendingFeedOverlayModule ~= nil then
							local v10 = 0
							
							for _, value2 in PagerStoreModule.getItems(false) do
								if value2.kind ~= "skeleton" and (value2.kind ~= "endState" and value2.kind ~= "caughtUp") then
									v10 += 1
								end
							end
							if v10 > 0 then
								LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
							elseif Empty == "Loaded" then
								LoadingMore = "Empty"
							end
						end
						Loading2(LoadingMore)
						Analytics.reportMomentsFeedLoadMore("failed", RecommendationSource, if Success then "malformedResponse" else "requestFailed")
					end
				else
					local v11 = nil
					if v8 then
						t = {}
						v11 = dedupeAndTrack(Result1.items)
						commitItems(v11)
						
						if PendingFeedOverlayModule ~= nil then
							Signal2((findMomentIndex(p1.initialMomentId)))
							local v12 = findMomentIndex(Result1.initialMomentId)
							
							if v12 ~= nil then
								PagerStoreModule.goToItem(v12)
							end
						end
					else
						v11 = dedupeAndTrack(Result1.items)
						local Copy = table.clone(PagerStoreModule.getItems(false))
						local Entry = Copy[#Copy]
						
						if Entry ~= nil and Entry.kind == "skeleton" then
							table.remove(Copy)
						end
						for _, value1 in v11 do
							table.insert(Copy, value1)
						end
						commitItems(Copy)
					end
					NextCursor = Result1.nextCursor
					v1 = if v8 or #v11 ~= 0 then 0 else v1 + 1
					Signal2_2(Result1.nextCursor ~= nil and v1 < 3)
					local Empty: string = if PagerStoreModule.getCount(false) == 0 then "Empty" else "Loaded"
					Empty = Empty
					local LoadingMore: string = Empty
					
					if FFlagMomentsParentTimeLimit and Flag2 then
						LoadingMore = "LimitReached"
					elseif PendingFeedOverlayModule ~= nil then
						local Count = 0
						
						for _, value4 in PagerStoreModule.getItems(false) do
							if value4.kind ~= "skeleton" and (value4.kind ~= "endState" and value4.kind ~= "caughtUp") then
								Count += 1
							end
						end
						if Count > 0 then
							LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
						elseif Empty == "Loaded" then
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
					if p3 ~= nil or IsEndsWithCaughtUp then
						appendTerminalPage()
						
						return
					end
				end
				return
			else
				if v8 and PendingFeedOverlayModule ~= nil then
					commitItems({})
					Signal2((findMomentIndex(p1.initialMomentId)))
				else
					local Items = PagerStoreModule.getItems(false)
					local Item = Items[#Items]
					
					if Item ~= nil and Item.kind == "skeleton" then
						PagerStoreModule.removeItem(#Items)
					end
				end
				Flag2 = true
				Empty = if PagerStoreModule.getCount(false) == 0 then "Empty" else "Loaded"
				local LoadingMore: string = Empty
				
				if FFlagMomentsParentTimeLimit and Flag2 then
					LoadingMore = "LimitReached"
				elseif PendingFeedOverlayModule ~= nil then
					local Count = 0
					
					for _, value in PagerStoreModule.getItems(false) do
						if value.kind ~= "skeleton" and (value.kind ~= "endState" and value.kind ~= "caughtUp") then
							Count += 1
						end
					end
					if Count > 0 then
						LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
					elseif Empty == "Loaded" then
						LoadingMore = "Empty"
					end
				end
				Loading2(LoadingMore)
				
				if v8 then
					Analytics.reportMomentsFeedState("failed", RecommendationSource, "parentalTimeLimitReached")
				else
					Analytics.reportMomentsFeedLoadMore("failed", RecommendationSource, "parentalTimeLimitReached")
				end
				if IsSessionGenerationMatch then
					MomentsSurfaceLoadManager.abort("parentalTimeLimitReached")
				end
				p4.markLimitReached(v9.limitSeconds)
			end
		end)
	end
	
	local function loadBeyondLimit()
		-- upvalues: Flag1 (ref), p3 (copy), Signal5 (copy), Signal3 (copy), Tbl (copy), PagerStoreModule (copy), FFlagMomentsLoadMoreKeepsPositionModule (upval), v2 (ref), Signal2_4 (copy), appendTerminalPage (copy), config (upval), FFlagMomentsParentTimeLimit (upval), Flag2 (ref), Count (ref), Flag (ref), Signal2_3 (copy), Analytics (upval), RecommendationSource (copy), Empty (ref), PendingFeedOverlayModule (copy), isTerminalPage (upval), Loading2 (copy), NextCursor (ref), p1 (copy), p2 (copy), MomentsSurfaceLoadManager (upval), p4 (copy), Parent (upval), commitItems (copy), findMomentIndex (copy), Signal2 (copy), t (ref), dedupeAndTrack (copy), v1 (ref), Signal2_2 (copy), FFlagMomentsModeratedMomentPageModule (upval), IsEndsWithCaughtUp (copy), Signal2_1 (copy)
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
				if value.kind ~= "skeleton" and (value.kind ~= "endState" and value.kind ~= "caughtUp") then
					Count1 += 1
				end
			end
			NewCount = Count1 + p3
		else
			local Count2 = 0
			
			for _, value1 in PagerStoreModule.getItems(false) do
				if value1.kind ~= "skeleton" and (value1.kind ~= "endState" and value1.kind ~= "caughtUp") then
					Count2 += 1
				end
			end
			NewCount = Count2 + p3
		end
		v2 = NewCount
		Signal2_4(false)
		local Flag3 = false
		
		if #Tbl > 0 then
			if not FFlagMomentsLoadMoreKeepsPositionModule then
				Copy = table.clone(PagerStoreModule.getItems(false))
			end
			for _, value3 in Tbl do
				table.insert(Copy, value3)
			end
			table.clear(Tbl)
			PagerStoreModule.setItems(Copy)
			appendTerminalPage()
			
			if Signal5(false) then return end
		elseif FFlagMomentsLoadMoreKeepsPositionModule then
			table.insert(Copy, config)
			PagerStoreModule.setItems(Copy)
			Flag3 = true
		end
		local Flag4 = if FFlagMomentsLoadMoreKeepsPositionModule then Flag3 else nil
		
		if Flag1 then return end
		if not Signal3(false) then return end
		if FFlagMomentsParentTimeLimit and Flag2 then return end
		Count += 1
		local Count4: number = Count
		Flag = true
		Signal2_3(false)
		local SessionGeneration = nil
		Analytics.reportMomentsFeedLoadMore("attempted", RecommendationSource)
		
		if not FFlagMomentsLoadMoreKeepsPositionModule or not Flag4 then
			PagerStoreModule.addItems({ config })
		end
		Empty = "LoadingMore"
		local LoadingMore: string = Empty
		
		if FFlagMomentsParentTimeLimit and Flag2 then
			LoadingMore = "LimitReached"
		elseif PendingFeedOverlayModule ~= nil then
			local Count3 = 0
			
			for _, value2 in PagerStoreModule.getItems(false) do
				if value2.kind ~= "skeleton" and not isTerminalPage(value2) then
					Count3 += 1
				end
			end
			if Count3 > 0 then
				LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
			elseif Empty == "Loaded" then
				LoadingMore = "Empty"
			end
		end
		Loading2(LoadingMore)
		local NextCursor1 = NextCursor
		local v13 = false
		task.spawn(function()
			-- upvalues: p1 (upval), NextCursor1 (copy), Flag1 (upval), Count4 (copy), Count (upval), Flag (upval), p2 (upval), v13 (copy), SessionGeneration (ref), MomentsSurfaceLoadManager (upval), FFlagMomentsParentTimeLimit (upval), p4 (upval), Parent (upval), PendingFeedOverlayModule (upval), commitItems (upval), findMomentIndex (upval), Signal2 (upval), PagerStoreModule (upval), Flag2 (upval), Empty (upval), Loading2 (upval), Analytics (upval), RecommendationSource (upval), t (upval), dedupeAndTrack (upval), NextCursor (upval), v1 (upval), Signal2_2 (upval), FFlagMomentsModeratedMomentPageModule (upval), p3 (upval), IsEndsWithCaughtUp (upval), appendTerminalPage (upval), Signal2_1 (upval), Signal2_3 (upval)
			local Success, Result = pcall(p1.fetchAsync, NextCursor1)
			
			if Flag1 or Count4 ~= Count then return end
			Flag = false
			local IsSessionGenerationMatch: boolean = p2 and (v13 and (SessionGeneration ~= nil and MomentsSurfaceLoadManager.getSessionGeneration() == SessionGeneration))
			
			if IsSessionGenerationMatch then
				MomentsSurfaceLoadManager.primaryDataResponseReceived()
			end
			local v14 = if FFlagMomentsParentTimeLimit and not Success and p4 ~= nil then require(Parent.DataHydration.MomentsParseMomentsLimitError)(Result) else nil
			
			if v14 == nil then
				local Result1 = if Success and type(Result) == "table" and type(Result.items) == "table" then Result else nil
				
				if Result1 == nil then
					if v13 then
						if PendingFeedOverlayModule == nil then
							PagerStoreModule.reset()
						else
							commitItems({})
							Signal2((findMomentIndex(p1.initialMomentId)))
						end
						Signal2_1(if Success then "Malformed feed batch" else tostring(Result))
						Empty = "Failed"
						local LoadingMore: string = Empty
						
						if FFlagMomentsParentTimeLimit and Flag2 then
							LoadingMore = "LimitReached"
						elseif PendingFeedOverlayModule ~= nil then
							local Count = 0
							
							for _, value3 in PagerStoreModule.getItems(false) do
								if value3.kind ~= "skeleton" and (value3.kind ~= "endState" and value3.kind ~= "caughtUp") then
									Count += 1
								end
							end
							if Count > 0 then
								LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
							elseif Empty == "Loaded" then
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
						Empty = if PagerStoreModule.getCount(false) == 0 then "Empty" else "Loaded"
						local LoadingMore: string = Empty
						
						if FFlagMomentsParentTimeLimit and Flag2 then
							LoadingMore = "LimitReached"
						elseif PendingFeedOverlayModule ~= nil then
							local v15 = 0
							
							for _, value2 in PagerStoreModule.getItems(false) do
								if value2.kind ~= "skeleton" and (value2.kind ~= "endState" and value2.kind ~= "caughtUp") then
									v15 += 1
								end
							end
							if v15 > 0 then
								LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
							elseif Empty == "Loaded" then
								LoadingMore = "Empty"
							end
						end
						Loading2(LoadingMore)
						Analytics.reportMomentsFeedLoadMore("failed", RecommendationSource, if Success then "malformedResponse" else "requestFailed")
					end
				else
					local v16 = nil
					if v13 then
						t = {}
						v16 = dedupeAndTrack(Result1.items)
						commitItems(v16)
						
						if PendingFeedOverlayModule ~= nil then
							Signal2((findMomentIndex(p1.initialMomentId)))
							local v17 = findMomentIndex(Result1.initialMomentId)
							
							if v17 ~= nil then
								PagerStoreModule.goToItem(v17)
							end
						end
					else
						v16 = dedupeAndTrack(Result1.items)
						local Copy = table.clone(PagerStoreModule.getItems(false))
						local Entry = Copy[#Copy]
						
						if Entry ~= nil and Entry.kind == "skeleton" then
							table.remove(Copy)
						end
						for _, value1 in v16 do
							table.insert(Copy, value1)
						end
						commitItems(Copy)
					end
					NextCursor = Result1.nextCursor
					v1 = if v13 or #v16 ~= 0 then 0 else v1 + 1
					Signal2_2(Result1.nextCursor ~= nil and v1 < 3)
					local Empty: string = if PagerStoreModule.getCount(false) == 0 then "Empty" else "Loaded"
					Empty = Empty
					local LoadingMore: string = Empty
					
					if FFlagMomentsParentTimeLimit and Flag2 then
						LoadingMore = "LimitReached"
					elseif PendingFeedOverlayModule ~= nil then
						local Count = 0
						
						for _, value4 in PagerStoreModule.getItems(false) do
							if value4.kind ~= "skeleton" and (value4.kind ~= "endState" and value4.kind ~= "caughtUp") then
								Count += 1
							end
						end
						if Count > 0 then
							LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
						elseif Empty == "Loaded" then
							LoadingMore = "Empty"
						end
					end
					Loading2(LoadingMore)
					
					if v13 then
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
					if p3 ~= nil or IsEndsWithCaughtUp then
						appendTerminalPage()
						
						return
					end
				end
				return
			else
				if v13 and PendingFeedOverlayModule ~= nil then
					commitItems({})
					Signal2((findMomentIndex(p1.initialMomentId)))
				else
					local Items = PagerStoreModule.getItems(false)
					local Item = Items[#Items]
					
					if Item ~= nil and Item.kind == "skeleton" then
						PagerStoreModule.removeItem(#Items)
					end
				end
				Flag2 = true
				Empty = if PagerStoreModule.getCount(false) == 0 then "Empty" else "Loaded"
				local LoadingMore: string = Empty
				
				if FFlagMomentsParentTimeLimit and Flag2 then
					LoadingMore = "LimitReached"
				elseif PendingFeedOverlayModule ~= nil then
					local Count = 0
					
					for _, value in PagerStoreModule.getItems(false) do
						if value.kind ~= "skeleton" and (value.kind ~= "endState" and value.kind ~= "caughtUp") then
							Count += 1
						end
					end
					if Count > 0 then
						LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
					elseif Empty == "Loaded" then
						LoadingMore = "Empty"
					end
				end
				Loading2(LoadingMore)
				
				if v13 then
					Analytics.reportMomentsFeedState("failed", RecommendationSource, "parentalTimeLimitReached")
				else
					Analytics.reportMomentsFeedLoadMore("failed", RecommendationSource, "parentalTimeLimitReached")
				end
				if IsSessionGenerationMatch then
					MomentsSurfaceLoadManager.abort("parentalTimeLimitReached")
				end
				p4.markLimitReached(v14.limitSeconds)
			end
		end)
	end
	
	local function prependItem(p7)
		-- upvalues: dedupeAndTrack (copy), PagerStoreModule (copy), Loading (copy), Empty (ref), FFlagMomentsParentTimeLimit (upval), Flag2 (ref), PendingFeedOverlayModule (copy), Loading2 (copy)
		local DedupeAndTrackResult = dedupeAndTrack({ p7 })
		
		if #DedupeAndTrackResult == 0 then return end
		PagerStoreModule.addItemAt(1, DedupeAndTrackResult[1])
		
		if Loading(false) == "Empty" then
			Empty = "Loaded"
			local LoadingMore: string = Empty
			
			if FFlagMomentsParentTimeLimit and Flag2 then
				LoadingMore = "LimitReached"
			elseif PendingFeedOverlayModule ~= nil then
				local Count = 0
				
				for _, value in PagerStoreModule.getItems(false) do
					if value.kind ~= "skeleton" and (value.kind ~= "endState" and value.kind ~= "caughtUp") then
						Count += 1
					end
				end
				if Count > 0 then
					LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
				elseif Empty == "Loaded" then
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
		-- upvalues: Flag1 (ref), Callback1 (ref), FFlagMomentsParentTimeLimit (upval), Callback2 (ref), p1 (copy), PagerStoreModule (copy)
		Flag1 = true
		
		if Callback1 ~= nil then
			Callback1()
		end
		if FFlagMomentsParentTimeLimit and Callback2 ~= nil then
			Callback2()
		end
		if p1.dispose then
			p1.dispose()
		end
		PagerStoreModule.dispose()
	end
	
	if FFlagMomentsParentTimeLimit and p4 ~= nil then
		local GetIsLimitReachedFunction = p4.getIsLimitReached
		Callback2 = SignalsModule.createEffect(function(p8)
			-- upvalues: GetIsLimitReachedFunction (copy), Flag2 (ref), Empty (ref), FFlagMomentsParentTimeLimit (upval), PendingFeedOverlayModule (copy), PagerStoreModule (copy), Loading2 (copy), p2 (copy), SessionGeneration (ref), MomentsSurfaceLoadManager (upval), runFetch (copy)
			local IsLimitReached = GetIsLimitReachedFunction(p8)
			
			if IsLimitReached == Flag2 then return end
			Flag2 = IsLimitReached
			
			if IsLimitReached then
				local LoadingMore: string = Empty
				
				if FFlagMomentsParentTimeLimit and Flag2 then
					LoadingMore = "LimitReached"
				elseif PendingFeedOverlayModule ~= nil then
					local Count = 0
					
					for _, value in PagerStoreModule.getItems(false) do
						if value.kind ~= "skeleton" and (value.kind ~= "endState" and value.kind ~= "caughtUp") then
							Count += 1
						end
					end
					if Count > 0 then
						LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
					elseif Empty == "Loaded" then
						LoadingMore = "Empty"
					end
				end
				Loading2(LoadingMore)
				
				if p2 and SessionGeneration == MomentsSurfaceLoadManager.getSessionGeneration() then
					MomentsSurfaceLoadManager.abort("parentalTimeLimitReached")
					
					return
				end
			else
				runFetch(true)
			end
		end)
	end
	if PendingFeedOverlayModule ~= nil and p1.getPendingItems ~= nil then
		if p1.initialMomentId ~= nil then
			Signal2(1e999)
		end
		local GetPendingItemsFunction = p1.getPendingItems
		Callback1 = SignalsModule.createEffect(function(p8)
			-- upvalues: PendingFeedOverlayModule (copy), GetPendingItemsFunction (copy), GetDeletedMomentsStoreModule (upval), PagerStoreModule (copy), Tbl (copy), SignalsExperimentalModule (upval), commitItems (copy), findMomentIndex (copy), p1 (copy), Signal2 (copy), Signal2_4 (copy), appendTerminalPage (copy), Empty (ref), FFlagMomentsParentTimeLimit (upval), Flag2 (ref), PendingFeedOverlayModule (copy), Loading2 (copy)
			local UpdateResult = PendingFeedOverlayModule.update(GetPendingItemsFunction(p8), GetDeletedMomentsStoreModule(false).getDeletedIds(p8))
			local Copy = table.clone(PagerStoreModule.getItems(false))
			
			for _, value in Tbl do
				table.insert(Copy, value)
			end
			for i = #Copy, 1, -1 do
				local Entry = Copy[i]
				
				if Entry.kind == "endState" or Entry.kind == "caughtUp" then
					table.remove(Copy, i)
				end
			end
			SignalsExperimentalModule.batch(function()
				-- upvalues: commitItems (upval), Copy (copy), Tbl (upval), findMomentIndex (upval), p1 (upval), Signal2 (upval), Signal2_4 (upval), appendTerminalPage (upval), Empty (upval), FFlagMomentsParentTimeLimit (upval), Flag2 (upval), PendingFeedOverlayModule (upval), PagerStoreModule (upval), Loading2 (upval), UpdateResult (copy)
				commitItems(Copy)
				table.clear(Tbl)
				local MomentIndex = findMomentIndex(p1.initialMomentId)
				
				if MomentIndex ~= nil then
					Signal2(MomentIndex)
				end
				Signal2_4(false)
				appendTerminalPage()
				local LoadingMore: string = Empty
				
				if FFlagMomentsParentTimeLimit and Flag2 then
					LoadingMore = "LimitReached"
				elseif PendingFeedOverlayModule ~= nil then
					local Count = 0
					
					for _, value in PagerStoreModule.getItems(false) do
						if value.kind ~= "skeleton" and (value.kind ~= "endState" and value.kind ~= "caughtUp") then
							Count += 1
						end
					end
					if Count > 0 then
						LoadingMore = if Empty == "LoadingMore" then "LoadingMore" else "Loaded"
					elseif Empty == "Loaded" then
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
		getCanLoadMoreBeyondLimit = Signal6,
		loadInitial = loadInitial,
		loadMore = loadMore,
		loadBeyondLimit = loadBeyondLimit,
		prependItem = prependItem,
		refresh = loadInitial,
		retry = retry,
		dispose = dispose
	}
end