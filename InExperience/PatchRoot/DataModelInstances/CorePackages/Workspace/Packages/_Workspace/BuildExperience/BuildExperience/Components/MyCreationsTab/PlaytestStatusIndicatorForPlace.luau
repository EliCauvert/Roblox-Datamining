local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getPlaytestLoadingStoreModule = require(buildExperience.Stores.GetPlaytestLoadingStore)
local _ = require(buildExperience.Stores.GetPlaytestLoadingStore.createPlaytestLoadingStore)
local playtestStatusIndicatorModule = require(script.Parent.PlaytestStatusIndicator)

local function getStatusForPlaceId(p1, p2, p3)
	-- upvalues: getPlaytestLoadingStoreModule (ref)
	return (p3 or getPlaytestLoadingStoreModule(p1)).getStatusForPlaceId(p2)(p1)
end

return function(p1)
	-- upvalues: reactModule (ref), getStatusForPlaceId (ref), signalsReactModule (ref), playtestStatusIndicatorModule (ref)
	return reactModule.createElement(playtestStatusIndicatorModule, {
		LayoutOrder = p1.LayoutOrder,
		status = signalsReactModule.useSignalState(reactModule.useCallback(function(p2)
			-- upvalues: getStatusForPlaceId (copy), p1 (ref)
			return getStatusForPlaceId(p2, p1.placeId, p1.playtestLoadingStore)
		end, { p1.placeId, p1.playtestLoadingStore }))
	})
end