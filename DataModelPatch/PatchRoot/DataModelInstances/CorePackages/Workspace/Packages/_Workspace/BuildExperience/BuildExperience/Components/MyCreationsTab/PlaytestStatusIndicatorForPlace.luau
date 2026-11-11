local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetPlaytestLoadingStoreModule = require(BuildExperience.Stores.GetPlaytestLoadingStore)
local _ = require(BuildExperience.Stores.GetPlaytestLoadingStore.createPlaytestLoadingStore)
local PlaytestStatusIndicatorModule = require(script.Parent.PlaytestStatusIndicator)

local function getStatusForPlaceId(p1, PlaceId, PlaytestLoadingStore)
	-- upvalues: GetPlaytestLoadingStoreModule (copy)
	return (PlaytestLoadingStore or GetPlaytestLoadingStoreModule(p1)).getStatusForPlaceId(PlaceId)(p1)
end

return function(Frame)
	-- upvalues: ReactModule (copy), getStatusForPlaceId (copy), SignalsReactModule (copy), PlaytestStatusIndicatorModule (copy)
	return ReactModule.createElement(PlaytestStatusIndicatorModule, {
		LayoutOrder = Frame.LayoutOrder,
		status = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p1)
			-- upvalues: getStatusForPlaceId (upval), Frame (copy)
			return getStatusForPlaceId(p1, Frame.placeId, Frame.playtestLoadingStore)
		end, { Frame.placeId, Frame.playtestLoadingStore })))
	})
end