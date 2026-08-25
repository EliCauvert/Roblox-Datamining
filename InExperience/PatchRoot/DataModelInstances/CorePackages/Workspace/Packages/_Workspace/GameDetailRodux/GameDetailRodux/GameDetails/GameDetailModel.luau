local parent = script:FindFirstAncestor("GameDetailRodux").Parent
local dateTime = require(parent.Time).DateTime
local getZendeskUrl = require(parent.DiscoveryUtils).getZendeskUrl
local fFlagLuaAppEdpNonSduiBuildAttribution = require(parent.SharedFlags).FFlagLuaAppEdpNonSduiBuildAttribution
local t = {
	new = function()
		return {}
	end
}

function t.mock(p0, p1, p2)
	-- upvalues: t (ref), dateTime (ref)
	local var1 = t.new()
	local var2 = dateTime.new()
	local var3 = dateTime.fromUnixTimestamp(var2:GetUnixTimestamp() + 60)
	var1.id = p0
	var1.rootPlaceId = "370731277"
	var1.name = p1
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
	var1.maxPlayers = p2 or 110
	var1.created = var2:GetIsoDate()
	var1.updated = var3:GetIsoDate()
	var1.studioAccessToApisAllowed = true
	var1.universeAvatarType = "MorphToR15"
	var1.genre = "Town and City"
	var1.genre_l1 = "Test Genre"
	var1.genre_l2 = "Test Subgenre"
	
	return var1
end

function t.fromJsonData(p3)
	-- upvalues: t (ref), getZendeskUrl (ref), fFlagLuaAppEdpNonSduiBuildAttribution (ref)
	local var4 = t.new()
	var4.id = tostring(p3.id)
	var4.rootPlaceId = tostring(p3.rootPlaceId)
	var4.name = p3.name
	var4.description = p3.description
	var4.creator = {
		id = p3.creator.id,
		name = p3.creator.name,
		type = p3.creator.type,
		isRNVAccount = p3.creator.isRNVAccount,
		hasVerifiedBadge = p3.creator.hasVerifiedBadge
	}
	var4.price = p3.price
	var4.isExperimental = p3.isExperimental
	var4.allowedGearGenres = p3.allowedGearGenres
	var4.allowedGearCategories = p3.allowedGearCategories
	var4.playing = p3.playing
	var4.visits = p3.visits
	var4.maxPlayers = p3.maxPlayers
	var4.created = p3.created
	var4.updated = p3.updated
	var4.studioAccessToApisAllowed = p3.studioAccessToApisAllowed
	var4.universeAvatarType = p3.universeAvatarType
	var4.genre = p3.genre
	var4.genre_l1 = p3.genre_l1
	var4.genre_l2 = p3.genre_l2
	var4.licenseDescription = p3.licenseDescription
	var4.localizedFiatPrice = p3.localizedFiatPrice
	var4.refundLink = p3.refundLink
	
	if p3.refundPolicy then
		var4.refundPolicy = {
			policyText = p3.refundPolicy.policyText,
			learnMoreUrl = getZendeskUrl(p3.refundPolicy.learnMoreBaseUrl, p3.refundPolicy.locale, p3.refundPolicy.articleId)
		}
	end
	if fFlagLuaAppEdpNonSduiBuildAttribution then
		var4.creationSource = p3.creationSource
	end
	return var4
end

return t