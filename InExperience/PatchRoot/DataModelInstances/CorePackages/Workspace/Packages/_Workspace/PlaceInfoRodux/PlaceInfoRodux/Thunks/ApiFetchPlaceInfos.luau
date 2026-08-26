local placeInfoRodux = script:FindFirstAncestor("PlaceInfoRodux")
local functional = require(placeInfoRodux.Parent.AppCommonLib).Functional
local getPlaceInfos = require(placeInfoRodux.Requests).GetPlaceInfos
local placeInfoModel = require(placeInfoRodux.Models).PlaceInfoModel
local receivedMultiplePlaceInfos = require(placeInfoRodux.Actions).ReceivedMultiplePlaceInfos

return function(p1, p2)
	-- upvalues: getPlaceInfos (ref), functional (ref), placeInfoModel (ref), receivedMultiplePlaceInfos (ref)
	return function(p3)
		-- upvalues: getPlaceInfos (copy), p1 (ref), p2 (ref), functional (copy), placeInfoModel (copy), receivedMultiplePlaceInfos (copy)
		return getPlaceInfos(p1, p2):andThen(function(p4)
			-- upvalues: functional (copy), placeInfoModel (copy), p3 (ref), receivedMultiplePlaceInfos (copy)
			local var1 = functional.Map(p4.responseBody, function(p5)
				-- upvalues: placeInfoModel (copy)
				return placeInfoModel.fromWeb(p5)
			end)
			p3:dispatch(receivedMultiplePlaceInfos(var1))
			
			return var1
		end):catch(function(p4)
			warn("ApiFetchlaceInfos failed with error code " .. tostring(p4.HttpError))
		end)
	end
end