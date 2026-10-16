local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetPlaytestLoadingStoreModule = require(Parent.BuildExperiencePlaytestLaunch.GetPlaytestLoadingStore)
local _ = require(Parent.BuildExperiencePlaytestLaunch.createPlaytestLoadingStore)
local PlaytestStatusIndicatorModule = require(script.Parent.PlaytestStatusIndicator)

local function getStatusForPlaceId(p1, PlaceId, PlaytestLoadingStore) --[[ Line: 20 ]]
	-- upvalues: GetPlaytestLoadingStoreModule (copy)
	return (PlaytestLoadingStore or GetPlaytestLoadingStoreModule(p1)).getStatusForPlaceId(PlaceId)(p1)
end

return function(Frame) --[[ Line: 29 | Named "PlaytestStatusIndicatorForPlace" ]]
	-- upvalues: ReactModule (copy), getStatusForPlaceId (copy), SignalsReactModule (copy), PlaytestStatusIndicatorModule (copy)
	return ReactModule.createElement(PlaytestStatusIndicatorModule, {
		LayoutOrder = Frame.LayoutOrder,
		status = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p1) --[[ Line: 30 ]]
			-- upvalues: getStatusForPlaceId (upval), Frame (copy)
			return getStatusForPlaceId(p1, Frame.placeId, Frame.playtestLoadingStore)
		end, { Frame.placeId, Frame.playtestLoadingStore })))
	})
end