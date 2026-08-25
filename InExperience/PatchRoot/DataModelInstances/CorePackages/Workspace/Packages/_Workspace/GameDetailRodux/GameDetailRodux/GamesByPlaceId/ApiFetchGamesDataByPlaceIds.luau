local gameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local parent = gameDetailRodux.Parent
local apiFetchGameIcons = require(parent.GameIconRodux).GameIcons.ApiFetchGameIcons
local dataHydrationModule = require(parent.DataHydration)
local functional = require(parent.AppCommonLib).Functional
local gamesMultigetPlaceDetailsModule = require(gameDetailRodux.GamesByPlaceId.GamesMultigetPlaceDetails)
local placeInfoModel = require(parent.PlaceInfoRodux).Models.PlaceInfoModel
local receivedPlacesInfos = require(parent.PlaceInfoRodux).Actions.ReceivedPlacesInfos
local convertUniverseIdToString = require(parent.SharedFlags).ConvertUniverseIdToString
local fFlagMigrateGameIconsToStore = require(parent.SharedFlags).FFlagMigrateGameIconsToStore

return function(p0, p1)
	-- upvalues: gamesMultigetPlaceDetailsModule (ref), functional (ref), placeInfoModel (ref), convertUniverseIdToString (ref), receivedPlacesInfos (ref), fFlagMigrateGameIconsToStore (ref), dataHydrationModule (ref), apiFetchGameIcons (ref)
	return function(p2)
		-- upvalues: p1 (ref), gamesMultigetPlaceDetailsModule (copy), p0 (ref), functional (copy), placeInfoModel (copy), convertUniverseIdToString (copy), receivedPlacesInfos (copy), fFlagMigrateGameIconsToStore (copy), dataHydrationModule (copy), apiFetchGameIcons (copy)
		if p1 and #p1 ~= 0 then
			return gamesMultigetPlaceDetailsModule(p0, p1):andThen(function(p3)
				-- upvalues: functional (copy), placeInfoModel (copy), convertUniverseIdToString (copy), p2 (ref), receivedPlacesInfos (copy), fFlagMigrateGameIconsToStore (copy), dataHydrationModule (copy), apiFetchGameIcons (copy), p0 (copy)
				local t = {}
				local var4 = functional.Map(p3.responseBody, function(p4)
					-- upvalues: placeInfoModel (copy), convertUniverseIdToString (copy), t (ref)
					local var5 = placeInfoModel.fromWeb(p4)
					table.insert(t, convertUniverseIdToString(var5.universeId))
					
					return var5
				end)
				p2:dispatch(receivedPlacesInfos(var4))
				
				if #t > 0 then
					if fFlagMigrateGameIconsToStore then
						dataHydrationModule.Game.getGameIconStore(false).getAndFetchGameIcons(t)
						
						return var4
					end
					p2:dispatch(apiFetchGameIcons(p0, t))
				end
				return var4
			end)
		end
	end
end