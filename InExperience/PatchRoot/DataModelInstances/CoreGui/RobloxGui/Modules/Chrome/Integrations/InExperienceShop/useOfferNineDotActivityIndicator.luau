local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local inExperienceOffersModule = require(corePackagesService.Workspace.Packages.InExperienceOffers)
local useNineDotActivityIndicatorModule = require(chrome.ChromeShared.Hooks.useNineDotActivityIndicator)
local getOffersStore = inExperienceOffersModule.getOffersStore
local notificationLocation = inExperienceOffersModule.NotificationLocation

return function()
	-- upvalues: signalsReactModule (ref), getOffersStore (ref), useNineDotActivityIndicatorModule (ref), notificationLocation (ref)
	useNineDotActivityIndicatorModule("in_experience_offers", signalsReactModule.useSignalState(getOffersStore(false).getOfferNotificationShownWithEnum) == notificationLocation.Hamburger)
end