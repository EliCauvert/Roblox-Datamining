local CorePackages = game:GetService("CorePackages")
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local InExperienceOffersModule = require(CorePackages.Workspace.Packages.InExperienceOffers)
local UseNineDotActivityIndicatorModule = require(script:FindFirstAncestor("Chrome").ChromeShared.Hooks.useNineDotActivityIndicator)
local GetOffersStoreFunction = InExperienceOffersModule.getOffersStore
local NotificationLocation = InExperienceOffersModule.NotificationLocation

return function()
	-- upvalues: SignalsReactModule (copy), GetOffersStoreFunction (copy), UseNineDotActivityIndicatorModule (copy), NotificationLocation (copy)
	UseNineDotActivityIndicatorModule("in_experience_offers", SignalsReactModule.useSignalState(GetOffersStoreFunction(false).getOfferNotificationShownWithEnum) == NotificationLocation.Hamburger)
end