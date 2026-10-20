local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetPlaytestLoadingStoreModule = require(Parent.BuildExperiencePlaytestLaunch.GetPlaytestLoadingStore)

local function getIsPlaytestLoadingForPlaceId(p1, PlaytestPlaceId)
	-- upvalues: GetPlaytestLoadingStoreModule (copy)
	local PlaytestLoadingStoreModule = GetPlaytestLoadingStoreModule(p1)
	
	return PlaytestPlaceId ~= nil and PlaytestLoadingStoreModule.getIsPlaytestLoadingForPlaceId(PlaytestPlaceId)(p1)
end

return function(p1, p2)
	-- upvalues: ReactModule (copy), getIsPlaytestLoadingForPlaceId (copy), SignalsReactModule (copy)
	local LaunchPlaytestFunction = p1.launchPlaytest
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p3)
		-- upvalues: getIsPlaytestLoadingForPlaceId (upval), p1 (copy)
		return getIsPlaytestLoadingForPlaceId(p3, p1.playtestPlaceId)
	end, { p1.playtestPlaceId })))
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: LaunchPlaytestFunction (copy), UseSignalStateResult (copy), p2 (copy)
		if LaunchPlaytestFunction and not UseSignalStateResult then
			LaunchPlaytestFunction(p2)
			
			return
		end
	end, { UseSignalStateResult, LaunchPlaytestFunction, p2 })
	
	return {
		onPlaytest = if p1.playtestPlaceId == nil or not LaunchPlaytestFunction then nil else UseResult,
		isPlaytestLoading = UseSignalStateResult
	}
end