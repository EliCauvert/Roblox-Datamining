local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local AppLifecycleObserverService = nil
pcall(function()
	-- upvalues: AppLifecycleObserverService (ref)
	AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
end)
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local SignalsReactModule = require(Parent.SignalsReact)
local SharedFlagsModule = require(Parent.SharedFlags)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local MomentsGetMomentsUserStoreModule = require(Parent.DataHydration.MomentsGetMomentsUserStore)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local GetDeletedMomentsStoreModule = require(Parent.Moments.GetDeletedMomentsStore)
local FFlagMomentsRemoveDeletedFromProfile = SharedFlagsModule.FFlagMomentsRemoveDeletedFromProfile
local FFlagMomentsRefreshOwnMomentsAfterPublish = SharedFlagsModule.FFlagMomentsRefreshOwnMomentsAfterPublish
local FFlagMomentsOptimisticProfilePending = SharedFlagsModule.FFlagMomentsOptimisticProfilePending
local FFlagMomentsRefreshProfileOnPostStatus = SharedFlagsModule.FFlagMomentsRefreshProfileOnPostStatus

return function(Current, p1)
	-- upvalues: ReactModule (copy), FFlagMomentsRefreshProfileOnPostStatus (copy), FFlagMomentsOptimisticProfilePending (copy), UseLocalUserIdFunction (copy), FFlagMomentsRefreshOwnMomentsAfterPublish (copy), SignalsReactModule (copy), MomentsGetMomentsUserStoreModule (copy), AppLifecycleObserverService (ref), CryoModule (copy), FFlagMomentsRemoveDeletedFromProfile (copy), GetDeletedMomentsStoreModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseLocalUserIdResult = if FFlagMomentsRefreshProfileOnPostStatus or FFlagMomentsOptimisticProfilePending then UseLocalUserIdFunction() else nil
	local IsTextMatch: boolean = UseLocalUserIdResult ~= nil and tostring(UseLocalUserIdResult) == Current
	local UseSignalStateResult = if FFlagMomentsOptimisticProfilePending then SignalsReactModule.useSignalState(MomentsGetMomentsUserStoreModule(false).getPendingUserMoments) else {}
	ReactModule.useEffect(function()
		-- upvalues: Current (copy), MomentsGetMomentsUserStoreModule (upval), FFlagMomentsRefreshProfileOnPostStatus (upval), FFlagMomentsOptimisticProfilePending (upval), UseRefResult (copy), IsTextMatch (copy), UseStateResult2_3 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		local Number = if Current == nil then nil else tonumber(Current)
		
		if Number == nil then return end
		local MomentsGetMomentsUserStoreModuleResult = MomentsGetMomentsUserStoreModule(false)
		
		if (FFlagMomentsRefreshProfileOnPostStatus or FFlagMomentsOptimisticProfilePending) and UseRefResult.current ~= Current then
			UseRefResult.current = Current
			
			if IsTextMatch then
				MomentsGetMomentsUserStoreModuleResult.evictUserMoments(Number)
			end
		end
		local Flag = false
		MomentsGetMomentsUserStoreModuleResult.getUserMoments(Number):andThen(function(Result)
			-- upvalues: Flag (ref), UseStateResult2_3 (upval), UseStateResult2 (upval), UseStateResult2_1 (upval), UseStateResult2_2 (upval)
			if not Flag then
				UseStateResult2_3(false)
				UseStateResult2(Result.moments)
				UseStateResult2_1(Result.nextCursor)
				UseStateResult2_2(Result.nextCursor ~= nil)
			end
		end):catch(function()
			-- upvalues: Flag (ref), UseStateResult2_3 (upval)
			if not Flag then
				UseStateResult2_3(true)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, {
		Current,
		if FFlagMomentsRefreshOwnMomentsAfterPublish or FFlagMomentsRefreshProfileOnPostStatus or FFlagMomentsOptimisticProfilePending then SignalsReactModule.useSignalState(MomentsGetMomentsUserStoreModule(false).getUserMomentsVersion) else 0,
		IsTextMatch
	})
	
	if FFlagMomentsRefreshProfileOnPostStatus or FFlagMomentsOptimisticProfilePending then
		ReactModule.useEffect(function()
			-- upvalues: IsTextMatch (copy), p1 (copy), AppLifecycleObserverService (upval), Current (copy), MomentsGetMomentsUserStoreModule (upval)
			if not IsTextMatch then return end
			local P1 = p1 or AppLifecycleObserverService
			
			if P1 == nil then return end
			local OnUnhideConnection = P1.OnUnhide:Connect(function()
				-- upvalues: Current (upval), MomentsGetMomentsUserStoreModule (upval)
				local Number = if Current == nil then nil else tonumber(Current)
				
				if Number ~= nil then
					MomentsGetMomentsUserStoreModule(false).invalidateUser(Number)
				end
			end)
			
			return function()
				-- upvalues: OnUnhideConnection (copy)
				OnUnhideConnection:Disconnect()
			end
		end, { Current, p1, IsTextMatch })
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Current (copy), UseStateResult1 (copy), UseStateResult3 (copy), UseStateResult5 (copy), UseStateResult2_4 (copy), MomentsGetMomentsUserStoreModule (upval), UseStateResult2 (copy), CryoModule (upval), UseStateResult2_2 (copy), UseStateResult2_1 (copy)
		local Number = if Current == nil then nil else tonumber(Current)
		
		if Number ~= nil and UseStateResult1 ~= nil and UseStateResult3 and not UseStateResult5 then
			UseStateResult2_4(true)
			MomentsGetMomentsUserStoreModule(false).getUserMoments(Number, UseStateResult1):andThen(function(Result)
				-- upvalues: UseStateResult2 (upval), CryoModule (upval), UseStateResult2_2 (upval), UseStateResult1 (upval), UseStateResult2_1 (upval)
				UseStateResult2(function(p2)
					-- upvalues: CryoModule (upval), Result (copy)
					return CryoModule.List.join(p2, Result.moments)
				end)
				UseStateResult2_2(Result.nextCursor ~= nil and Result.nextCursor ~= UseStateResult1)
				UseStateResult2_1(Result.nextCursor)
			end):catch(function() end):finally(function()
				-- upvalues: UseStateResult2_4 (upval)
				UseStateResult2_4(false)
			end)
			
			return
		end
	end, {
		Current,
		UseStateResult1,
		UseStateResult3,
		UseStateResult5
	})
	local JoinResult = UseStateResult
	local List1 = nil
	
	if FFlagMomentsRemoveDeletedFromProfile or FFlagMomentsOptimisticProfilePending then
		List1 = SignalsReactModule.useSignalState(GetDeletedMomentsStoreModule(false).getDeletedIds)
		local List = List1
		JoinResult = ReactModule.useMemo(function()
			-- upvalues: List (copy), UseStateResult (copy)
			if #List == 0 then
				return UseStateResult
			end
			local List1 = {}
			
			for _, value in UseStateResult do
				if not table.find(List, value.momentId) then
					table.insert(List1, value)
				end
			end
			return List1
		end, { UseStateResult, List })
	end
	if FFlagMomentsOptimisticProfilePending then
		local Number = if Current == nil then nil else tonumber(Current)
		local UseStateResult6, UseStateResult2_5 = ReactModule.useState({})
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: Number (copy), UseSignalStateResult (copy), UseStateResult (copy), List1 (ref)
			local T = if Number == nil then {} else UseSignalStateResult[Number] or {}
			local t = {}
			local t1 = {}
			
			for _, value in UseStateResult do
				t1[value.momentId] = true
				local FeedItemId = value.recommendationMetadata.feedItemId
				
				if FeedItemId ~= nil and FeedItemId ~= "" then
					t1[FeedItemId] = true
				end
			end
			for _, value1 in T do
				local PublishedMoment = value1.publishedMoment
				
				if PublishedMoment ~= nil then
					local FeedItemId = PublishedMoment.recommendationMetadata.feedItemId
					
					if t1[PublishedMoment.momentId] or FeedItemId ~= nil and t1[FeedItemId] or List1 ~= nil and table.find(List1, PublishedMoment.momentId) ~= nil then
						t[value1.moment.momentId] = true
					end
				end
			end
			return t
		end, { Number, UseStateResult, UseSignalStateResult, List1 })
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult2_5 (copy), UseMemoResult (copy)
			UseStateResult2_5(function(Tbl)
				-- upvalues: UseMemoResult (upval)
				local Copy = table.clone(Tbl)
				local Flag = false
				
				for i in UseMemoResult do
					if not Copy[i] then
						Copy[i] = true
						Flag = true
					end
				end
				return if Flag then Copy else Tbl
			end)
		end, { UseMemoResult })
		local UseSignalStateResultEntry = if Number == nil then nil else UseSignalStateResult[Number]
		
		if UseSignalStateResultEntry ~= nil and #UseSignalStateResultEntry > 0 then
			local List2 = {}
			
			for _, value in UseSignalStateResultEntry do
				local Moment = value.moment
				
				if not UseMemoResult[Moment.momentId] and not UseStateResult6[Moment.momentId] then
					table.insert(List2, Moment)
				end
			end
			if #List2 > 0 then
				JoinResult = CryoModule.List.join(List2, JoinResult)
			end
		end
	end
	return {
		moments = JoinResult,
		hasMore = UseStateResult3,
		hasFailed = UseStateResult4,
		isLoadingMore = UseStateResult5,
		loadMore = UseResult
	}
end