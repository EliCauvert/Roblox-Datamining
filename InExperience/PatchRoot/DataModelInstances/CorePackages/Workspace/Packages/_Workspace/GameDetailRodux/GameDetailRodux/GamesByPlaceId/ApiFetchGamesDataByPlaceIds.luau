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

return function(p1, p2)
	-- upvalues: gamesMultigetPlaceDetailsModule (ref), functional (ref), placeInfoModel (ref), convertUniverseIdToString (ref), receivedPlacesInfos (ref), fFlagMigrateGameIconsToStore (ref), dataHydrationModule (ref), apiFetchGameIcons (ref)
	return function(p3)
		-- upvalues: p2 (ref), gamesMultigetPlaceDetailsModule (copy), p1 (ref), functional (copy), placeInfoModel (copy), convertUniverseIdToString (copy), receivedPlacesInfos (copy), fFlagMigrateGameIconsToStore (copy), dataHydrationModule (copy), apiFetchGameIcons (copy)
		if p2 and #p2 ~= 0 then
			return gamesMultigetPlaceDetailsModule(p1, p2):andThen(function(p4)
				-- upvalues: functional (copy), placeInfoModel (copy), convertUniverseIdToString (copy), p3 (ref), receivedPlacesInfos (copy), fFlagMigrateGameIconsToStore (copy), dataHydrationModule (copy), apiFetchGameIcons (copy), p1 (copy)
				local t = {}
				local var1 = functional.Map(p4.responseBody, function(p5)
					-- upvalues: placeInfoModel (copy), convertUniverseIdToString (copy), t (ref)
					local var2 = placeInfoModel.fromWeb(p5)
					table.insert(t, convertUniverseIdToString(var2.universeId))
					
					return var2
				end)
				p3:dispatch(receivedPlacesInfos(var1))
				
				if #t > 0 then
					if fFlagMigrateGameIconsToStore then
						dataHydrationModule.Game.getGameIconStore(false).getAndFetchGameIcons(t)
						
						return var1
					end
					p3:dispatch(apiFetchGameIcons(p1, t))
				end
				return var1
			end)
		end
	end
end