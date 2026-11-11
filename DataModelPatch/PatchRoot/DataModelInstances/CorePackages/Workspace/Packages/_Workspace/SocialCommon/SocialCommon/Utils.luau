return {
	getMutualFriendsText = require(script.getMutualFriendsText),
	getRecommendationContextualInfoDisplay = require(script.getRecommendationContextualInfoDisplay),
	getRecommendationContextualInfoType = require(script.getRecommendationContextualInfoType),
	convertLuaAppUserToSocialUser = require(script.convertLuaAppUserToSocialUser),
	convertUserPresenceTypeToString = require(script.convertUserPresenceTypeToString),
	convertToFoundationPresenceEnum = require(script.convertToFoundationPresenceEnum),
	InputUtilities = require(script.InputUtilities),
	isPresenceInGame = require(script.isPresenceInGame),
	simpleUrlDecode = require(script.simpleUrlDecode),
	buildApiSiteUrl = require(script.buildApiSiteUrl),
	userIdExists = require(script.userIdExists),
	hydrateEmptyIdsHelper = require(script.hydrateEmptyIdsHelper),
	ImpressionCacheImpl = require(script.ImpressionCacheImpl),
	getDeepValue = require(script.getDeepValue)
}