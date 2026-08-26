local parent = script:FindFirstAncestor("GameModels").Parent
local resultModule = require(parent.Result)
local trim = require(parent.LuauPolyfill).String.trim
local _ = require(parent.DiscoveryTypes)
local fFlagSearchOmniAutocompletePage = require(parent.SharedFlags).FFlagSearchOmniAutocompletePage
local fFlagEnableTopSongsSort = require(parent.SharedFlags).FFlagEnableTopSongsSort
local t = {
	new = function(p1, p2, p3)
		-- upvalues: trim (ref)
		return { universeId = p1, placeId = p2, name = trim(p3) }
	end,
	_fromSharedJson = function(p1, p2)
		p1.ageRecommendationDisplayName = p2.ageRecommendationDisplayName
		p1.minimumAge = p2.minimumAge
		p1.contentMaturity = p2.contentMaturity
		p1.playerCount = p2.playerCount
		p1.primaryWideAssetId = if p2.primaryMediaAsset and p2.primaryMediaAsset.wideImageAssetId then tostring(p2.primaryMediaAsset.wideImageAssetId) else nil
		p1.primaryWideListId = if p2.primaryMediaAsset and p2.primaryMediaAsset.wideImageListId then tostring(p2.primaryMediaAsset.wideImageListId) else nil
		p1.totalDownVotes = p2.totalDownVotes
		p1.totalUpVotes = p2.totalUpVotes
		p1.defaultLayoutData = p2.defaultLayoutData
		p1.layoutDataBySort = p2.layoutDataBySort
	end
}

function t.mock()
	-- upvalues: t (ref)
	local _149757 = t.new("149757", "10395446", "test")
	t._fromSharedJson(_149757, {
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

function t.fromGamesApi(p1)
	-- upvalues: resultModule (ref), t (ref)
	if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
		return resultModule.error("GameInfoModel.fromGamesApi expects universeId to be a number or a string")
	elseif type(p1.placeId) ~= "number" and type(p1.placeId) ~= "string" then
		return resultModule.error("GameInfoModel.fromGamesApi expects placeId to be a number or a string")
	elseif type(p1.creatorId) == "number" or type(p1.creatorId) == "string" then
		local var1 = t.new(tostring(p1.universeId), tostring(p1.placeId), p1.name)
		t._fromSharedJson(var1, p1)
		var1.creatorId = tostring(p1.creatorId)
		var1.creatorName = p1.creatorName
		
		return resultModule.success(var1)
	end
	return resultModule.error("GameInfoModel.fromGamesApi expects creatorId to be a number or a string")
end

function t.fromExperienceApi(p1)
	-- upvalues: resultModule (ref), t (ref)
	if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
		return resultModule.error("Game.fromJsonData expects universeId to be a number or a string")
	elseif type(p1.rootPlaceId) == "number" or type(p1.rootPlaceId) == "string" then
		local var1 = t.new(tostring(p1.universeId), tostring(p1.rootPlaceId), p1.name)
		t._fromSharedJson(var1, p1)
		
		return resultModule.success(var1)
	end
	return resultModule.error("Game.fromJsonData expects placeId to be a number or a string")
end

function t.fromOmniApi(p1)
	-- upvalues: resultModule (ref), t (ref)
	if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
		return resultModule.error("DiscoveryGame.fromJsonData expects universeId to be a number or a string")
	elseif type(p1.rootPlaceId) == "number" or type(p1.rootPlaceId) == "string" then
		local var1 = t.new(tostring(p1.universeId), tostring(p1.rootPlaceId), p1.name)
		t._fromSharedJson(var1, p1)
		var1.friendActivityTitle = p1.friendActivityTitle
		var1.friendVisitedString = p1.friendVisitedString
		var1.friendVisits = p1.friendVisits
		var1.navigationUniverseId = if p1.navigationUid then tostring(p1.navigationUid) else nil
		
		return resultModule.success(var1)
	end
	return resultModule.error("DiscoveryGame.fromJsonData expects rootPlaceId to be a number or a string")
end

if fFlagSearchOmniAutocompletePage then
	function t.fromOmniAutocompleteApi(p1)
		-- upvalues: resultModule (ref), t (ref)
		if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
			return resultModule.error("GameInfoModel.fromOmniAutocompleteApi expects universeId to be a number or a string")
		elseif type(p1.rootPlaceId) == "number" or type(p1.rootPlaceId) == "string" then
			local var1 = t.new(tostring(p1.universeId), tostring(p1.rootPlaceId), p1.name)
			t._fromSharedJson(var1, p1)
			
			return resultModule.success(var1)
		end
		return resultModule.error("GameInfoModel.fromOmniAutocompleteApi expects placeId to be a number or a string")
	end
end
function t.fromSearchApi(p1)
	-- upvalues: resultModule (ref), t (ref)
	if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
		return resultModule.error("GameInfoModel.fromSearchApi expects universeId to be a number or a string")
	elseif type(p1.rootPlaceId) ~= "number" and type(p1.rootPlaceId) ~= "string" then
		return resultModule.error("GameInfoModel.fromSearchApi expects rootPlaceId to be a number or a string")
	elseif type(p1.creatorId) == "number" or type(p1.creatorId) == "string" then
		local var1 = t.new(tostring(p1.universeId), tostring(p1.rootPlaceId), p1.name)
		t._fromSharedJson(var1, p1)
		var1.creatorId = tostring(p1.creatorId)
		var1.creatorName = p1.creatorName
		
		return resultModule.success(var1)
	end
	return resultModule.error("GameInfoModel.fromSearchApi expects creatorId to be a number or a string")
end

if fFlagEnableTopSongsSort then
	function t.fromMusicDiscoveryApi(p1)
		-- upvalues: resultModule (ref), t (ref)
		if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
			return resultModule.error("GameInfoModel.fromMusicDiscoveryApi expects universeId to be a number or a string")
		elseif type(p1.rootPlaceId) == "number" or type(p1.rootPlaceId) == "string" then
			local var1 = t.new(tostring(p1.universeId), tostring(p1.rootPlaceId), p1.name)
			var1.playerCount = p1.playerCount
			var1.totalDownVotes = p1.downVotes
			var1.totalUpVotes = p1.upVotes
			
			return resultModule.success(var1)
		end
		return resultModule.error("GameInfoModel.fromMusicDiscoveryApi expects rootPlaceId to be a number or a string")
	end
end
return t