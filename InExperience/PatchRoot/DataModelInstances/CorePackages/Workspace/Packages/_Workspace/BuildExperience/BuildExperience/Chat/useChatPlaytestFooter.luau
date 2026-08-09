local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getPlaytestLoadingStoreModule = require(buildExperience.Stores.GetPlaytestLoadingStore)

local function getIsPlaytestLoadingForPlaceId(p0, p1) --[[ line: 21 ]]
	-- upvalues: getPlaytestLoadingStoreModule (ref)
	return if p1 == nil then false else getPlaytestLoadingStoreModule(p0).getIsPlaytestLoadingForPlaceId(p1)(p0)
end

return function(p2, p3) --[[ line: 28 | named "useChatPlaytestFooter" ]]
	-- upvalues: reactModule (ref), getIsPlaytestLoadingForPlaceId (ref), signalsReactModule (ref)
	local launchPlaytest = p2.launchPlaytest
	local var5 = signalsReactModule.useSignalState(reactModule.useCallback(function(p4) --[[ line: 30 ]]
		-- upvalues: getIsPlaytestLoadingForPlaceId (copy), p2 (ref)
		return getIsPlaytestLoadingForPlaceId(p4, p2.playtestPlaceId)
	end, { p2.playtestPlaceId }))
	
	return {
		onPlaytest = if p2.playtestPlaceId == nil or not launchPlaytest then nil else reactModule.useCallback(function() --[[ line: 35 ]]
			-- upvalues: launchPlaytest (ref), var5 (ref), p3 (ref)
			if launchPlaytest and not var5 then
				launchPlaytest(p3)
				
				return
			end
		end, { var5, launchPlaytest, p3 }),
		isPlaytestLoading = var5
	}
end