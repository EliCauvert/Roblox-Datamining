local GameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local Parent = GameDetailRodux.Parent
local ApiFetchGameIconsFunction = require(Parent.GameIconRodux).GameIcons.ApiFetchGameIcons
local Functional = require(Parent.AppCommonLib).Functional
local GamesMultigetPlaceDetailsModule = require(GameDetailRodux.GamesByPlaceId.GamesMultigetPlaceDetails)
local PlaceInfoModel = require(Parent.PlaceInfoRodux).Models.PlaceInfoModel
local ReceivedPlacesInfosFunction = require(Parent.PlaceInfoRodux).Actions.ReceivedPlacesInfos
local ConvertUniverseIdToStringFunction = require(Parent.SharedFlags).ConvertUniverseIdToString

return function(p1, p2)
	-- upvalues: GamesMultigetPlaceDetailsModule (copy), Functional (copy), PlaceInfoModel (copy), ConvertUniverseIdToStringFunction (copy), ReceivedPlacesInfosFunction (copy), ApiFetchGameIconsFunction (copy)
	return function(p3)
		-- upvalues: p2 (copy), GamesMultigetPlaceDetailsModule (upval), p1 (copy), Functional (upval), PlaceInfoModel (upval), ConvertUniverseIdToStringFunction (upval), ReceivedPlacesInfosFunction (upval), ApiFetchGameIconsFunction (upval)
		if not p2 or #p2 == 0 then return end
		return GamesMultigetPlaceDetailsModule(p1, p2):andThen(function(Result)
			-- upvalues: Functional (upval), PlaceInfoModel (upval), ConvertUniverseIdToStringFunction (upval), p3 (copy), ReceivedPlacesInfosFunction (upval), ApiFetchGameIconsFunction (upval), p1 (upval)
			local List = {}
			local MapResult = Functional.Map(Result.responseBody, function(p4)
				-- upvalues: PlaceInfoModel (upval), ConvertUniverseIdToStringFunction (upval), List (copy)
				local FromWebResult = PlaceInfoModel.fromWeb(p4)
				table.insert(List, (ConvertUniverseIdToStringFunction(FromWebResult.universeId)))
				
				return FromWebResult
			end)
			p3:dispatch(ReceivedPlacesInfosFunction(MapResult))
			
			if #List > 0 then
				p3:dispatch(ApiFetchGameIconsFunction(p1, List))
			end
			return MapResult
		end)
	end
end