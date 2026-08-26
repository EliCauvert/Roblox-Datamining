local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local parent = profileQRCode.Parent
local analyticsServiceModule = require(profileQRCode.Analytics.AnalyticsService)
local analyticsModule = require(profileQRCode.Analytics)
local reactModule = require(parent.React)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local profileQRCodePageModule = require(profileQRCode.Components.ProfileQRCodePage.ProfileQRCodePage)

return function(p1)
	-- upvalues: analyticsModule (ref), analyticsServiceModule (ref), useLocalUserId (ref), reactModule (ref), profileQRCodePageModule (ref)
	return reactModule.createElement(analyticsModule.Context.Provider, {
		value = {
			fireEvent = analyticsModule.setupFireEvent({
				analytics = if p1.analyticsService then p1.analyticsService else analyticsServiceModule,
				infoForAllEvents = { uid = useLocalUserId(), source = p1.source }
			})
		}
	}, {
		Window = reactModule.createElement(profileQRCodePageModule, {
			appStorageService = p1.appStorageService,
			robloxEventReceiver = p1.robloxEventReceiver,
			onClose = p1.onClose,
			openQrCodeScanner = p1.openQrCodeScanner
		})
	})
end