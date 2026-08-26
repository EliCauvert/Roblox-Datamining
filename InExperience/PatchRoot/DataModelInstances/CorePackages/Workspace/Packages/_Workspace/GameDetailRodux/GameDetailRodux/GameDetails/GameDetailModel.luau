local parent = script:FindFirstAncestor("GameDetailRodux").Parent
local dateTime = require(parent.Time).DateTime
local getZendeskUrl = require(parent.DiscoveryUtils).getZendeskUrl
local fFlagLuaAppEdpNonSduiBuildAttribution = require(parent.SharedFlags).FFlagLuaAppEdpNonSduiBuildAttribution
local t = {
	new = function()
		return {}
	end
}

function t.mock(p1, p2, p3)
	-- upvalues: t (ref), dateTime (ref)
	local var1 = t.new()
	local var2 = dateTime.new()
	local var3 = dateTime.fromUnixTimestamp(var2:GetUnixTimestamp() + 60)
	var1.id = p1
	var1.rootPlaceId = "370731277"
	var1.name = p2
	var1.description = "This is MeepCity"
	var1.creator = {
		id = 123247,
		name = "alexnewtron",
		type = "User",
		isRNVAccount = false,
		hasVerifiedBadge = false
	}
	var1.price = nil
	var1.isExperimental = false
	var1.allowedGearGenres = { "TownAndCity" }
	var1.allowedGearCategories = {}
	var1.playing = 49252
	var1.visits = 2358954901
	var1.maxPlayers = p3 or 110
	var1.created = var2:GetIsoDate()
	var1.updated = var3:GetIsoDate()
	var1.studioAccessToApisAllowed = true
	var1.universeAvatarType = "MorphToR15"
	var1.genre = "Town and City"
	var1.genre_l1 = "Test Genre"
	var1.genre_l2 = "Test Subgenre"
	
	return var1
end

function t.fromJsonData(p1)
	-- upvalues: t (ref), getZendeskUrl (ref), fFlagLuaAppEdpNonSduiBuildAttribution (ref)
	local var1 = t.new()
	var1.id = tostring(p1.id)
	var1.rootPlaceId = tostring(p1.rootPlaceId)
	var1.name = p1.name
	var1.description = p1.description
	var1.creator = {
		id = p1.creator.id,
		name = p1.creator.name,
		type = p1.creator.type,
		isRNVAccount = p1.creator.isRNVAccount,
		hasVerifiedBadge = p1.creator.hasVerifiedBadge
	}
	var1.price = p1.price
	var1.isExperimental = p1.isExperimental
	var1.allowedGearGenres = p1.allowedGearGenres
	var1.allowedGearCategories = p1.allowedGearCategories
	var1.playing = p1.playing
	var1.visits = p1.visits
	var1.maxPlayers = p1.maxPlayers
	var1.created = p1.created
	var1.updated = p1.updated
	var1.studioAccessToApisAllowed = p1.studioAccessToApisAllowed
	var1.universeAvatarType = p1.universeAvatarType
	var1.genre = p1.genre
	var1.genre_l1 = p1.genre_l1
	var1.genre_l2 = p1.genre_l2
	var1.licenseDescription = p1.licenseDescription
	var1.localizedFiatPrice = p1.localizedFiatPrice
	var1.refundLink = p1.refundLink
	
	if p1.refundPolicy then
		var1.refundPolicy = {
			policyText = p1.refundPolicy.policyText,
			learnMoreUrl = getZendeskUrl(p1.refundPolicy.learnMoreBaseUrl, p1.refundPolicy.locale, p1.refundPolicy.articleId)
		}
	end
	if fFlagLuaAppEdpNonSduiBuildAttribution then
		var1.creationSource = p1.creationSource
	end
	return var1
end

return t