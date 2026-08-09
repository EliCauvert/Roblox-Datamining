local gameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local parent = gameDetailRodux.Parent
local apiFetchGameIcons = require(parent.GameIconRodux).GameIcons.ApiFetchGameIcons
local functional = require(parent.AppCommonLib).Functional
local gamesMultigetPlaceDetailsModule = require(gameDetailRodux.GamesByPlaceId.GamesMultigetPlaceDetails)
local placeInfoModel = require(parent.PlaceInfoRodux).Models.PlaceInfoModel
local receivedPlacesInfos = require(parent.PlaceInfoRodux).Actions.ReceivedPlacesInfos
local convertUniverseIdToString = require(parent.SharedFlags).ConvertUniverseIdToString

return function(p0, p1) --[[ line: 12 ]]
	-- upvalues: gamesMultigetPlaceDetailsModule (ref), functional (ref), placeInfoModel (ref), convertUniverseIdToString (ref), receivedPlacesInfos (ref), apiFetchGameIcons (ref)
	return function(p2) --[[ line: 13 ]]
		-- upvalues: p1 (ref), gamesMultigetPlaceDetailsModule (copy), p0 (ref), functional (copy), placeInfoModel (copy), convertUniverseIdToString (copy), receivedPlacesInfos (copy), apiFetchGameIcons (copy)
		if p1 and #p1 ~= 0 then
			return gamesMultigetPlaceDetailsModule(p0, p1):andThen(function(p3) --[[ line: 18 ]]
				-- upvalues: functional (copy), placeInfoModel (copy), convertUniverseIdToString (copy), p2 (ref), receivedPlacesInfos (copy), apiFetchGameIcons (copy), p0 (copy)
				local t = {}
				local var3 = functional.Map(p3.responseBody, function(p4) --[[ line: 22 ]]
					-- upvalues: placeInfoModel (copy), convertUniverseIdToString (copy), t (ref)
					local var4 = placeInfoModel.fromWeb(p4)
					table.insert(t, convertUniverseIdToString(var4.universeId))
					
					return var4
				end)
				p2:dispatch(receivedPlacesInfos(var3))
				
				if #t > 0 then
					p2:dispatch(apiFetchGameIcons(p0, t))
				end
				return var3
			end)
		end
	end
end