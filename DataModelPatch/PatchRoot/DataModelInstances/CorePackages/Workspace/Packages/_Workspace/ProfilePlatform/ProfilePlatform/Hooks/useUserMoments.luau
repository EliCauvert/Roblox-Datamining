local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local SignalsReactModule = require(Parent.SignalsReact)
local MomentsGetMomentsUserStoreModule = require(Parent.DataHydration.MomentsGetMomentsUserStore)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local GetDeletedMomentsStoreModule = require(Parent.Moments.GetDeletedMomentsStore)
local FFlagMomentsRemoveDeletedFromProfile = require(Parent.SharedFlags).FFlagMomentsRemoveDeletedFromProfile

return function(p1)
	-- upvalues: ReactModule (copy), MomentsGetMomentsUserStoreModule (copy), CryoModule (copy), FFlagMomentsRemoveDeletedFromProfile (copy), SignalsReactModule (copy), GetDeletedMomentsStoreModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), MomentsGetMomentsUserStoreModule (upval), UseStateResult2_3 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		local Number = if p1 == nil then nil else tonumber(p1)
		
		if Number == nil then return end
		local Flag = false
		MomentsGetMomentsUserStoreModule(false).getUserMoments(Number):andThen(function(Result)
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
	end, { p1 })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseStateResult1 (copy), UseStateResult3 (copy), UseStateResult5 (copy), UseStateResult2_4 (copy), MomentsGetMomentsUserStoreModule (upval), UseStateResult2 (copy), CryoModule (upval), UseStateResult2_2 (copy), UseStateResult2_1 (copy)
		local Number = if p1 == nil then nil else tonumber(p1)
		
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
	end, { p1, UseStateResult1, UseStateResult3, UseStateResult5 })
	local UseMemoResult = UseStateResult
	
	if FFlagMomentsRemoveDeletedFromProfile then
		local UseSignalStateResult = SignalsReactModule.useSignalState(GetDeletedMomentsStoreModule(false).getDeletedIds)
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: UseSignalStateResult (copy), UseStateResult (copy)
			if #UseSignalStateResult == 0 then
				return UseStateResult
			end
			local List = {}
			
			for _, value in UseStateResult do
				if not table.find(UseSignalStateResult, value.momentId) then
					table.insert(List, value)
				end
			end
			return List
		end, { UseStateResult, UseSignalStateResult })
	end
	return {
		moments = UseMemoResult,
		hasMore = UseStateResult3,
		hasFailed = UseStateResult4,
		isLoadingMore = UseStateResult5,
		loadMore = UseResult
	}
end