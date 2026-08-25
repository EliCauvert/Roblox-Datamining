local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local parent = profileQRCode.Parent
local analyticsServiceModule = require(profileQRCode.Analytics.AnalyticsService)
local analyticsModule = require(profileQRCode.Analytics)
local reactModule = require(parent.React)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local profileQRCodePageModule = require(profileQRCode.Components.ProfileQRCodePage.ProfileQRCodePage)

return function(p0)
	-- upvalues: analyticsModule (ref), analyticsServiceModule (ref), useLocalUserId (ref), reactModule (ref), profileQRCodePageModule (ref)
	return reactModule.createElement(analyticsModule.Context.Provider, {
		value = {
			fireEvent = analyticsModule.setupFireEvent({
				analytics = if p0.analyticsService then p0.analyticsService else analyticsServiceModule,
				infoForAllEvents = { uid = useLocalUserId(), source = p0.source }
			})
		}
	}, {
		Window = reactModule.createElement(profileQRCodePageModule, {
			appStorageService = p0.appStorageService,
			robloxEventReceiver = p0.robloxEventReceiver,
			onClose = p0.onClose,
			openQrCodeScanner = p0.openQrCodeScanner
		})
	})
end