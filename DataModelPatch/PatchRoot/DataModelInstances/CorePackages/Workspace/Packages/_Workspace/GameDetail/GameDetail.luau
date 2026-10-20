return {
	OpenGameDetails = require(script.OpenGameDetails),
	PeekView = require(script.PeekView),
	ExperienceDetailsPeekView = require(script.ExperienceDetailsPage.ExperienceDetailsPeekView),
	ExperienceDetailsBottomSheet = require(script.ExperienceDetailsPage.ExperienceDetailsBottomSheet),
	ExperienceDetailsFullPage = require(script.ExperienceDetailsPage.ExperienceDetailsFullPage),
	ExperienceDetailsPageUtils = require(script.ExperienceDetailsPage.ExperienceDetailsPageUtils),
	fetchExperienceDetailsPage = require(script.ExperienceDetailsPage.fetchExperienceDetailsPage),
	getExperienceDetailsPageKey = require(script.ExperienceDetailsPage.getExperienceDetailsPageKey),
	useExperienceBannerImage = require(script.ExperienceDetailsPage.useExperienceBannerImage),
	AgeCheckUpsellDismissedData = require(script.Signals.AgeCheckUpsellDismissedData),
	AgeCheckUpsellRenderedData = require(script.Signals.AgeCheckUpsellRenderedData),
	["jest.config"] = script["jest.config"]
}