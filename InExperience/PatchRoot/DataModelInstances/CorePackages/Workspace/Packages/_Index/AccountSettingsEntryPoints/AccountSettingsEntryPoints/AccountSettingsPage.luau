local Parent = script.Parent
local Url = require(Parent.Parent.Http).Url
local TranslateModule = require(Parent.translate)
local config = {
	PersonalizedRecommendations = "personalized-recommendations",
	AccountDataDeactivationAndDeletion = "privacy/AccountDataDeactivationAndDeletion"
}
local config1 = {
	PersonalizedRecommendations = "Feature.AccountSettings.Heading.Tab.PersonalizedRecommendations",
	AccountDataDeactivationAndDeletion = "Feature.AccountSettings.Heading.Tab.Privacy"
}

return {
	PersonalizedRecommendations = "PersonalizedRecommendations",
	AccountDataDeactivationAndDeletion = "AccountDataDeactivationAndDeletion",
	getUrl = function(p1): string
		-- upvalues: Url (copy), config (copy)
		return `{Url.WWW_URL}my/account#!/{config[p1]}`
	end,
	getTitle = function(p1)
		-- upvalues: TranslateModule (copy), config1 (copy)
		return TranslateModule(config1[p1])
	end
}