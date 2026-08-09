local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getPlaytestLoadingStoreModule = require(buildExperience.Stores.GetPlaytestLoadingStore)
local _ = require(buildExperience.Stores.GetPlaytestLoadingStore.createPlaytestLoadingStore)
local playtestStatusIndicatorModule = require(script.Parent.PlaytestStatusIndicator)

local function getStatusForPlaceId(p0, p1, p2) --[[ line: 22 ]]
	-- upvalues: getPlaytestLoadingStoreModule (ref)
	return (p2 or getPlaytestLoadingStoreModule(p0)).getStatusForPlaceId(p1)(p0)
end

return function(p3) --[[ line: 31 | named "PlaytestStatusIndicatorForPlace" ]]
	-- upvalues: reactModule (ref), getStatusForPlaceId (ref), signalsReactModule (ref), playtestStatusIndicatorModule (ref)
	return reactModule.createElement(playtestStatusIndicatorModule, {
		LayoutOrder = p3.LayoutOrder,
		status = signalsReactModule.useSignalState(reactModule.useCallback(function(p4) --[[ line: 32 ]]
			-- upvalues: getStatusForPlaceId (copy), p3 (ref)
			return getStatusForPlaceId(p4, p3.placeId, p3.playtestLoadingStore)
		end, { p3.placeId, p3.playtestLoadingStore }))
	})
end