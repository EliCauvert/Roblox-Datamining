local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getPlaytestLoadingStoreModule = require(buildExperience.Stores.GetPlaytestLoadingStore)

local function getIsPlaytestLoadingForPlaceId(p1, p2)
	-- upvalues: getPlaytestLoadingStoreModule (ref)
	return if p2 == nil then false else getPlaytestLoadingStoreModule(p1).getIsPlaytestLoadingForPlaceId(p2)(p1)
end

return function(p1, p2)
	-- upvalues: reactModule (ref), getIsPlaytestLoadingForPlaceId (ref), signalsReactModule (ref)
	local launchPlaytest = p1.launchPlaytest
	local var1 = signalsReactModule.useSignalState(reactModule.useCallback(function(p3)
		-- upvalues: getIsPlaytestLoadingForPlaceId (copy), p1 (ref)
		return getIsPlaytestLoadingForPlaceId(p3, p1.playtestPlaceId)
	end, { p1.playtestPlaceId }))
	
	return {
		onPlaytest = if p1.playtestPlaceId == nil or not launchPlaytest then nil else reactModule.useCallback(function()
			-- upvalues: launchPlaytest (ref), var1 (ref), p2 (ref)
			if launchPlaytest and not var1 then
				launchPlaytest(p2)
				
				return
			end
		end, { var1, launchPlaytest, p2 }),
		isPlaytestLoading = var1
	}
end