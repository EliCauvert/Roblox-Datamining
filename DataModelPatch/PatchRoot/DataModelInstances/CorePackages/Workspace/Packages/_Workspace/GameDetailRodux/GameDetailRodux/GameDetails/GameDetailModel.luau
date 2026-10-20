local Parent = script:FindFirstAncestor("GameDetailRodux").Parent
local _DateTime = require(Parent.Time).DateTime
local GetZendeskUrlFunction = require(Parent.DiscoveryUtils).getZendeskUrl
local GameDetailModelModule = {
	new = function()
		return {}
	end
}

function GameDetailModelModule.mock(Id, Name, p1)
	-- upvalues: GameDetailModelModule (copy), _DateTime (copy)
	local NewGameDetailModel = GameDetailModelModule.new()
	local NewResult = _DateTime.new()
	local FromUnixTimestampResult = _DateTime.fromUnixTimestamp(NewResult:GetUnixTimestamp() + 60)
	NewGameDetailModel.id = Id
	NewGameDetailModel.rootPlaceId = "370731277"
	NewGameDetailModel.name = Name
	NewGameDetailModel.description = "This is MeepCity"
	NewGameDetailModel.creator = {
		id = 123247,
		name = "alexnewtron",
		type = "User",
		isRNVAccount = false,
		hasVerifiedBadge = false
	}
	NewGameDetailModel.price = nil
	NewGameDetailModel.isExperimental = false
	NewGameDetailModel.allowedGearGenres = { "TownAndCity" }
	NewGameDetailModel.allowedGearCategories = {}
	NewGameDetailModel.playing = 49252
	NewGameDetailModel.visits = 2358954901
	NewGameDetailModel.maxPlayers = p1 or 110
	NewGameDetailModel.created = NewResult:GetIsoDate()
	NewGameDetailModel.updated = FromUnixTimestampResult:GetIsoDate()
	NewGameDetailModel.studioAccessToApisAllowed = true
	NewGameDetailModel.universeAvatarType = "MorphToR15"
	NewGameDetailModel.genre = "Town and City"
	NewGameDetailModel.genre_l1 = "Test Genre"
	NewGameDetailModel.genre_l2 = "Test Subgenre"
	
	return NewGameDetailModel
end

function GameDetailModelModule.fromJsonData(p1)
	-- upvalues: GameDetailModelModule (copy), GetZendeskUrlFunction (copy)
	local NewGameDetailModel = GameDetailModelModule.new()
	NewGameDetailModel.id = tostring(p1.id)
	NewGameDetailModel.rootPlaceId = tostring(p1.rootPlaceId)
	NewGameDetailModel.name = p1.name
	NewGameDetailModel.description = p1.description
	NewGameDetailModel.creator = {
		id = p1.creator.id,
		name = p1.creator.name,
		type = p1.creator.type,
		isRNVAccount = p1.creator.isRNVAccount,
		hasVerifiedBadge = p1.creator.hasVerifiedBadge
	}
	NewGameDetailModel.price = p1.price
	NewGameDetailModel.isExperimental = p1.isExperimental
	NewGameDetailModel.allowedGearGenres = p1.allowedGearGenres
	NewGameDetailModel.allowedGearCategories = p1.allowedGearCategories
	NewGameDetailModel.playing = p1.playing
	NewGameDetailModel.visits = p1.visits
	NewGameDetailModel.maxPlayers = p1.maxPlayers
	NewGameDetailModel.created = p1.created
	NewGameDetailModel.updated = p1.updated
	NewGameDetailModel.studioAccessToApisAllowed = p1.studioAccessToApisAllowed
	NewGameDetailModel.universeAvatarType = p1.universeAvatarType
	NewGameDetailModel.genre = p1.genre
	NewGameDetailModel.genre_l1 = p1.genre_l1
	NewGameDetailModel.genre_l2 = p1.genre_l2
	NewGameDetailModel.licenseDescription = p1.licenseDescription
	NewGameDetailModel.localizedFiatPrice = p1.localizedFiatPrice
	NewGameDetailModel.refundLink = p1.refundLink
	
	if p1.refundPolicy then
		NewGameDetailModel.refundPolicy = {
			policyText = p1.refundPolicy.policyText,
			learnMoreUrl = GetZendeskUrlFunction(p1.refundPolicy.learnMoreBaseUrl, p1.refundPolicy.locale, p1.refundPolicy.articleId)
		}
	end
	return NewGameDetailModel
end

return GameDetailModelModule