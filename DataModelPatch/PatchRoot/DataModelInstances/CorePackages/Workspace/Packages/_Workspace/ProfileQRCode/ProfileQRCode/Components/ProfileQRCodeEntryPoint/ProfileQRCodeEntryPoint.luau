local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local AnalyticsServiceModule = require(ProfileQRCode.Analytics.AnalyticsService)
local AnalyticsModule = require(ProfileQRCode.Analytics)
local ReactModule = require(Parent.React)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local ProfileQRCodePageModule = require(ProfileQRCode.Components.ProfileQRCodePage.ProfileQRCodePage)

return function(p1)
	-- upvalues: AnalyticsModule (copy), AnalyticsServiceModule (copy), UseLocalUserIdFunction (copy), ReactModule (copy), ProfileQRCodePageModule (copy)
	return ReactModule.createElement(AnalyticsModule.Context.Provider, {
		value = {
			fireEvent = AnalyticsModule.setupFireEvent({
				analytics = if p1.analyticsService then p1.analyticsService else AnalyticsServiceModule,
				infoForAllEvents = { uid = UseLocalUserIdFunction(), source = p1.source }
			})
		}
	}, {
		Window = ReactModule.createElement(ProfileQRCodePageModule, {
			appStorageService = p1.appStorageService,
			robloxEventReceiver = p1.robloxEventReceiver,
			onClose = p1.onClose,
			openQrCodeScanner = p1.openQrCodeScanner
		})
	})
end