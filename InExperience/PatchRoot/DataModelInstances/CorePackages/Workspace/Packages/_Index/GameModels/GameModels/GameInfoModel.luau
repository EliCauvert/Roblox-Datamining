local parent = script:FindFirstAncestor("GameModels").Parent
local resultModule = require(parent.Result)
local trim = require(parent.LuauPolyfill).String.trim
local _ = require(parent.DiscoveryTypes)
local fFlagSearchOmniAutocompletePage = require(parent.SharedFlags).FFlagSearchOmniAutocompletePage
local fFlagEnableTopSongsSort = require(parent.SharedFlags).FFlagEnableTopSongsSort
local t = {
	new = function(p0, p1, p2)
		-- upvalues: trim (ref)
		return { universeId = p0, placeId = p1, name = trim(p2) }
	end,
	_fromSharedJson = function(p3, p4)
		p3.ageRecommendationDisplayName = p4.ageRecommendationDisplayName
		p3.minimumAge = p4.minimumAge
		p3.contentMaturity = p4.contentMaturity
		p3.playerCount = p4.playerCount
		p3.primaryWideAssetId = if p4.primaryMediaAsset and p4.primaryMediaAsset.wideImageAssetId then tostring(p4.primaryMediaAsset.wideImageAssetId) else nil
		p3.primaryWideListId = if p4.primaryMediaAsset and p4.primaryMediaAsset.wideImageListId then tostring(p4.primaryMediaAsset.wideImageListId) else nil
		p3.totalDownVotes = p4.totalDownVotes
		p3.totalUpVotes = p4.totalUpVotes
		p3.defaultLayoutData = p4.defaultLayoutData
		p3.layoutDataBySort = p4.layoutDataBySort
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

function t.fromGamesApi(p5)
	-- upvalues: resultModule (ref), t (ref)
	if type(p5.universeId) ~= "number" and type(p5.universeId) ~= "string" then
		return resultModule.error("GameInfoModel.fromGamesApi expects universeId to be a number or a string")
	elseif type(p5.placeId) ~= "number" and type(p5.placeId) ~= "string" then
		return resultModule.error("GameInfoModel.fromGamesApi expects placeId to be a number or a string")
	elseif type(p5.creatorId) == "number" or type(p5.creatorId) == "string" then
		local var3 = t.new(tostring(p5.universeId), tostring(p5.placeId), p5.name)
		t._fromSharedJson(var3, p5)
		var3.creatorId = tostring(p5.creatorId)
		var3.creatorName = p5.creatorName
		
		return resultModule.success(var3)
	end
	return resultModule.error("GameInfoModel.fromGamesApi expects creatorId to be a number or a string")
end

function t.fromExperienceApi(p6)
	-- upvalues: resultModule (ref), t (ref)
	if type(p6.universeId) ~= "number" and type(p6.universeId) ~= "string" then
		return resultModule.error("Game.fromJsonData expects universeId to be a number or a string")
	elseif type(p6.rootPlaceId) == "number" or type(p6.rootPlaceId) == "string" then
		local var4 = t.new(tostring(p6.universeId), tostring(p6.rootPlaceId), p6.name)
		t._fromSharedJson(var4, p6)
		
		return resultModule.success(var4)
	end
	return resultModule.error("Game.fromJsonData expects placeId to be a number or a string")
end

function t.fromOmniApi(p7)
	-- upvalues: resultModule (ref), t (ref)
	if type(p7.universeId) ~= "number" and type(p7.universeId) ~= "string" then
		return resultModule.error("DiscoveryGame.fromJsonData expects universeId to be a number or a string")
	elseif type(p7.rootPlaceId) == "number" or type(p7.rootPlaceId) == "string" then
		local var5 = t.new(tostring(p7.universeId), tostring(p7.rootPlaceId), p7.name)
		t._fromSharedJson(var5, p7)
		var5.friendActivityTitle = p7.friendActivityTitle
		var5.friendVisitedString = p7.friendVisitedString
		var5.friendVisits = p7.friendVisits
		var5.navigationUniverseId = if p7.navigationUid then tostring(p7.navigationUid) else nil
		
		return resultModule.success(var5)
	end
	return resultModule.error("DiscoveryGame.fromJsonData expects rootPlaceId to be a number or a string")
end

if fFlagSearchOmniAutocompletePage then
	function t.fromOmniAutocompleteApi(p8)
		-- upvalues: resultModule (ref), t (ref)
		if type(p8.universeId) ~= "number" and type(p8.universeId) ~= "string" then
			return resultModule.error("GameInfoModel.fromOmniAutocompleteApi expects universeId to be a number or a string")
		elseif type(p8.rootPlaceId) == "number" or type(p8.rootPlaceId) == "string" then
			local var6 = t.new(tostring(p8.universeId), tostring(p8.rootPlaceId), p8.name)
			t._fromSharedJson(var6, p8)
			
			return resultModule.success(var6)
		end
		return resultModule.error("GameInfoModel.fromOmniAutocompleteApi expects placeId to be a number or a string")
	end
end
function t.fromSearchApi(p9)
	-- upvalues: resultModule (ref), t (ref)
	if type(p9.universeId) ~= "number" and type(p9.universeId) ~= "string" then
		return resultModule.error("GameInfoModel.fromSearchApi expects universeId to be a number or a string")
	elseif type(p9.rootPlaceId) ~= "number" and type(p9.rootPlaceId) ~= "string" then
		return resultModule.error("GameInfoModel.fromSearchApi expects rootPlaceId to be a number or a string")
	elseif type(p9.creatorId) == "number" or type(p9.creatorId) == "string" then
		local var7 = t.new(tostring(p9.universeId), tostring(p9.rootPlaceId), p9.name)
		t._fromSharedJson(var7, p9)
		var7.creatorId = tostring(p9.creatorId)
		var7.creatorName = p9.creatorName
		
		return resultModule.success(var7)
	end
	return resultModule.error("GameInfoModel.fromSearchApi expects creatorId to be a number or a string")
end

if fFlagEnableTopSongsSort then
	function t.fromMusicDiscoveryApi(p10)
		-- upvalues: resultModule (ref), t (ref)
		if type(p10.universeId) ~= "number" and type(p10.universeId) ~= "string" then
			return resultModule.error("GameInfoModel.fromMusicDiscoveryApi expects universeId to be a number or a string")
		elseif type(p10.rootPlaceId) == "number" or type(p10.rootPlaceId) == "string" then
			local var8 = t.new(tostring(p10.universeId), tostring(p10.rootPlaceId), p10.name)
			var8.playerCount = p10.playerCount
			var8.totalDownVotes = p10.downVotes
			var8.totalUpVotes = p10.upVotes
			
			return resultModule.success(var8)
		end
		return resultModule.error("GameInfoModel.fromMusicDiscoveryApi expects rootPlaceId to be a number or a string")
	end
end
return t