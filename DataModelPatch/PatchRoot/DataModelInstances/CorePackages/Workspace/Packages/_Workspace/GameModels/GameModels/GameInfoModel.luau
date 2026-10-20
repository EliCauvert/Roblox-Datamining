local Parent = script:FindFirstAncestor("GameModels").Parent
local ResultModule = require(Parent.Result)
local TrimFunction = require(Parent.LuauPolyfill).String.trim
local _ = require(Parent.DiscoveryTypes)
local FFlagSearchOmniAutocompletePage = require(Parent.SharedFlags).FFlagSearchOmniAutocompletePage
local FFlagEnableTopSongsSort = require(Parent.SharedFlags).FFlagEnableTopSongsSort
local GameInfoModelModule = {
	new = function(UniverseId, PlaceId, Name)
		-- upvalues: TrimFunction (copy)
		return {
			universeId = UniverseId,
			placeId = PlaceId,
			name = TrimFunction(Name)
		}
	end,
	_fromSharedJson = function(NewResult, p1)
		NewResult.ageRecommendationDisplayName = p1.ageRecommendationDisplayName
		NewResult.minimumAge = p1.minimumAge
		NewResult.contentMaturity = p1.contentMaturity
		NewResult.playerCount = p1.playerCount
		NewResult.primaryWideAssetId = if p1.primaryMediaAsset and p1.primaryMediaAsset.wideImageAssetId then tostring(p1.primaryMediaAsset.wideImageAssetId) else nil
		NewResult.primaryWideListId = if p1.primaryMediaAsset and p1.primaryMediaAsset.wideImageListId then tostring(p1.primaryMediaAsset.wideImageListId) else nil
		NewResult.totalDownVotes = p1.totalDownVotes
		NewResult.totalUpVotes = p1.totalUpVotes
		NewResult.defaultLayoutData = p1.defaultLayoutData
		NewResult.layoutDataBySort = p1.layoutDataBySort
	end
}

function GameInfoModelModule.mock()
	-- upvalues: GameInfoModelModule (copy)
	local _149757 = GameInfoModelModule.new("149757", "10395446", "test")
	GameInfoModelModule._fromSharedJson(_149757, {
		ageRecommendationDisplayName = "Ages 13+",
		minimumAge = 13,
		contentMaturity = "moderate",
		playerCount = 5,
		totalDownVotes = 2564,
		totalUpVotes = 10970,
		primaryMediaAsset = { wideImageAssetId = "12046435434" }
	})
	_149757.creatorId = "22915773"
	_149757.creatorName = "Jaegerblox"
	_149757.defaultLayoutData = {}
	_149757.friendActivityTitle = "Friend Activity"
	_149757.friendVisitedString = "1 Friend visited"
	_149757.friendVisits = { { userId = "1894536079" } }
	_149757.layoutDataBySort = {}
	
	return _149757
end

function GameInfoModelModule.fromGamesApi(p1)
	-- upvalues: ResultModule (copy), GameInfoModelModule (copy)
	if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
		return ResultModule.error("GameInfoModel.fromGamesApi expects universeId to be a number or a string")
	elseif type(p1.placeId) ~= "number" and type(p1.placeId) ~= "string" then
		return ResultModule.error("GameInfoModel.fromGamesApi expects placeId to be a number or a string")
	elseif type(p1.creatorId) == "number" or type(p1.creatorId) == "string" then
		local NewGameInfoModel = GameInfoModelModule.new(tostring(p1.universeId), tostring(p1.placeId), p1.name)
		GameInfoModelModule._fromSharedJson(NewGameInfoModel, p1)
		NewGameInfoModel.creatorId = tostring(p1.creatorId)
		NewGameInfoModel.creatorName = p1.creatorName
		
		return ResultModule.success(NewGameInfoModel)
	else
		return ResultModule.error("GameInfoModel.fromGamesApi expects creatorId to be a number or a string")
	end
end

function GameInfoModelModule.fromExperienceApi(p1)
	-- upvalues: ResultModule (copy), GameInfoModelModule (copy)
	if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
		return ResultModule.error("Game.fromJsonData expects universeId to be a number or a string")
	elseif type(p1.rootPlaceId) == "number" or type(p1.rootPlaceId) == "string" then
		local NewGameInfoModel = GameInfoModelModule.new(tostring(p1.universeId), tostring(p1.rootPlaceId), p1.name)
		GameInfoModelModule._fromSharedJson(NewGameInfoModel, p1)
		
		return ResultModule.success(NewGameInfoModel)
	else
		return ResultModule.error("Game.fromJsonData expects placeId to be a number or a string")
	end
end

function GameInfoModelModule.fromOmniApi(p1)
	-- upvalues: ResultModule (copy), GameInfoModelModule (copy)
	if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
		return ResultModule.error("DiscoveryGame.fromJsonData expects universeId to be a number or a string")
	elseif type(p1.rootPlaceId) == "number" or type(p1.rootPlaceId) == "string" then
		local NewGameInfoModel = GameInfoModelModule.new(tostring(p1.universeId), tostring(p1.rootPlaceId), p1.name)
		GameInfoModelModule._fromSharedJson(NewGameInfoModel, p1)
		NewGameInfoModel.friendActivityTitle = p1.friendActivityTitle
		NewGameInfoModel.friendVisitedString = p1.friendVisitedString
		NewGameInfoModel.friendVisits = p1.friendVisits
		NewGameInfoModel.navigationUniverseId = if p1.navigationUid then tostring(p1.navigationUid) else nil
		
		return ResultModule.success(NewGameInfoModel)
	else
		return ResultModule.error("DiscoveryGame.fromJsonData expects rootPlaceId to be a number or a string")
	end
end

if FFlagSearchOmniAutocompletePage then
	function GameInfoModelModule.fromOmniAutocompleteApi(p1)
		-- upvalues: ResultModule (copy), GameInfoModelModule (copy)
		if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
			return ResultModule.error("GameInfoModel.fromOmniAutocompleteApi expects universeId to be a number or a string")
		elseif type(p1.rootPlaceId) == "number" or type(p1.rootPlaceId) == "string" then
			local NewGameInfoModel = GameInfoModelModule.new(tostring(p1.universeId), tostring(p1.rootPlaceId), p1.name)
			GameInfoModelModule._fromSharedJson(NewGameInfoModel, p1)
			
			return ResultModule.success(NewGameInfoModel)
		else
			return ResultModule.error("GameInfoModel.fromOmniAutocompleteApi expects placeId to be a number or a string")
		end
	end
end
function GameInfoModelModule.fromSearchApi(p1)
	-- upvalues: ResultModule (copy), GameInfoModelModule (copy)
	if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
		return ResultModule.error("GameInfoModel.fromSearchApi expects universeId to be a number or a string")
	elseif type(p1.rootPlaceId) ~= "number" and type(p1.rootPlaceId) ~= "string" then
		return ResultModule.error("GameInfoModel.fromSearchApi expects rootPlaceId to be a number or a string")
	elseif type(p1.creatorId) == "number" or type(p1.creatorId) == "string" then
		local NewGameInfoModel = GameInfoModelModule.new(tostring(p1.universeId), tostring(p1.rootPlaceId), p1.name)
		GameInfoModelModule._fromSharedJson(NewGameInfoModel, p1)
		NewGameInfoModel.creatorId = tostring(p1.creatorId)
		NewGameInfoModel.creatorName = p1.creatorName
		
		return ResultModule.success(NewGameInfoModel)
	else
		return ResultModule.error("GameInfoModel.fromSearchApi expects creatorId to be a number or a string")
	end
end

if FFlagEnableTopSongsSort then
	function GameInfoModelModule.fromMusicDiscoveryApi(p1)
		-- upvalues: ResultModule (copy), GameInfoModelModule (copy)
		if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
			return ResultModule.error("GameInfoModel.fromMusicDiscoveryApi expects universeId to be a number or a string")
		elseif type(p1.rootPlaceId) == "number" or type(p1.rootPlaceId) == "string" then
			local NewGameInfoModel = GameInfoModelModule.new(tostring(p1.universeId), tostring(p1.rootPlaceId), p1.name)
			NewGameInfoModel.playerCount = p1.playerCount
			NewGameInfoModel.totalDownVotes = p1.downVotes
			NewGameInfoModel.totalUpVotes = p1.upVotes
			
			return ResultModule.success(NewGameInfoModel)
		else
			return ResultModule.error("GameInfoModel.fromMusicDiscoveryApi expects rootPlaceId to be a number or a string")
		end
	end
end
return GameInfoModelModule