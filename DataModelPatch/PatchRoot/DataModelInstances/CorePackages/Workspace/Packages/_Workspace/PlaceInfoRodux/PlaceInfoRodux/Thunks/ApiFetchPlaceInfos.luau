local PlaceInfoRodux = script:FindFirstAncestor("PlaceInfoRodux")
local Functional = require(PlaceInfoRodux.Parent.AppCommonLib).Functional
local GetPlaceInfosFunction = require(PlaceInfoRodux.Requests).GetPlaceInfos
local PlaceInfoModel = require(PlaceInfoRodux.Models).PlaceInfoModel
local ReceivedMultiplePlaceInfosFunction = require(PlaceInfoRodux.Actions).ReceivedMultiplePlaceInfos

return function(p1, p2)
	-- upvalues: GetPlaceInfosFunction (copy), Functional (copy), PlaceInfoModel (copy), ReceivedMultiplePlaceInfosFunction (copy)
	return function(p3)
		-- upvalues: GetPlaceInfosFunction (upval), p1 (copy), p2 (copy), Functional (upval), PlaceInfoModel (upval), ReceivedMultiplePlaceInfosFunction (upval)
		return GetPlaceInfosFunction(p1, p2):andThen(function(Result)
			-- upvalues: Functional (upval), PlaceInfoModel (upval), p3 (copy), ReceivedMultiplePlaceInfosFunction (upval)
			local MapResult = Functional.Map(Result.responseBody, function(p4)
				-- upvalues: PlaceInfoModel (upval)
				return PlaceInfoModel.fromWeb(p4)
			end)
			p3:dispatch(ReceivedMultiplePlaceInfosFunction(MapResult))
			
			return MapResult
		end):catch(function(Err)
			warn("ApiFetchlaceInfos failed with error code " .. tostring(Err.HttpError))
		end)
	end
end