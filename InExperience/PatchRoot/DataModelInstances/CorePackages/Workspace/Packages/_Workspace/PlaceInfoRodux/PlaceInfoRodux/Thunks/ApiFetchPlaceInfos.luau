local placeInfoRodux = script:FindFirstAncestor("PlaceInfoRodux")
local functional = require(placeInfoRodux.Parent.AppCommonLib).Functional
local getPlaceInfos = require(placeInfoRodux.Requests).GetPlaceInfos
local placeInfoModel = require(placeInfoRodux.Models).PlaceInfoModel
local receivedMultiplePlaceInfos = require(placeInfoRodux.Actions).ReceivedMultiplePlaceInfos

return function(p0, p1) --[[ line: 10 ]]
	-- upvalues: getPlaceInfos (ref), functional (ref), placeInfoModel (ref), receivedMultiplePlaceInfos (ref)
	return function(p2) --[[ line: 11 ]]
		-- upvalues: getPlaceInfos (copy), p0 (ref), p1 (ref), functional (copy), placeInfoModel (copy), receivedMultiplePlaceInfos (copy)
		return getPlaceInfos(p0, p1):andThen(function(p4) --[[ line: 12 ]]
			-- upvalues: functional (copy), placeInfoModel (copy), p2 (ref), receivedMultiplePlaceInfos (copy)
			local var1 = functional.Map(p4.responseBody, function(p5) --[[ line: 15 ]]
				-- upvalues: placeInfoModel (copy)
				return placeInfoModel.fromWeb(p5)
			end)
			p2:dispatch(receivedMultiplePlaceInfos(var1))
			
			return var1
		end):catch(function(p3) --[[ line: 22 ]]
			warn("ApiFetchlaceInfos failed with error code " .. tostring(p3.HttpError))
		end)
	end
end