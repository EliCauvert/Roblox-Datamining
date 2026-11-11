local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local ProfileQRCodeEntryPointModule = require(script.Parent.ProfileQRCodeEntryPoint)
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local ConstantsModule = require(ProfileQRCode.Common.Constants)
local CreateMockRobloxEventReceiverModule = require(ProfileQRCode.TestHelpers.createMockRobloxEventReceiver)
local MockStateModule = require(ProfileQRCode.TestHelpers.mockState)
local MockStoreModule = require(ProfileQRCode.TestHelpers.mockStore)
local v1 = require(ProfileQRCode.TestHelpers.createMockAppStorageService)()

return {
	default = function(p1)
		-- upvalues: ReactModule (copy), RoactRoduxModule (copy), MockStoreModule (copy), MockStateModule (copy), ProfileQRCodeEntryPointModule (copy), v1 (copy), DashModule (copy), CreateMockRobloxEventReceiverModule (copy)
		return ReactModule.createElement(RoactRoduxModule.StoreProvider, {
			store = MockStoreModule(MockStateModule({ LocalUserId = "156" }))
		}, {
			ProfileQRCodeEntryPoint = ReactModule.createElement(ProfileQRCodeEntryPointModule, {
				layoutOrder = 1,
				appStorageService = p1.appStorageService or v1,
				analyticsService = if p1 and p1.analyticsService then p1.analyticsService else nil,
				onClose = if p1 and p1.onClose then p1.onClose else DashModule.noop,
				openQrCodeScanner = if p1 and p1.openQrCodeScanner then p1.openQrCodeScanner else DashModule.noop,
				robloxEventReceiver = CreateMockRobloxEventReceiverModule().mockEventReceiver
			})
		})
	end,
	loading = function(p1)
		-- upvalues: ReactModule (copy), RoactRoduxModule (copy), MockStoreModule (copy), MockStateModule (copy), ConstantsModule (copy), ProfileQRCodeEntryPointModule (copy), v1 (copy), DashModule (copy), CreateMockRobloxEventReceiverModule (copy)
		return ReactModule.createElement(RoactRoduxModule.StoreProvider, {
			store = MockStoreModule(MockStateModule({
				LocalUserId = "156",
				[ConstantsModule.RODUX_KEY] = { Users = {}, NetworkStatus = {} }
			}))
		}, {
			ProfileQRCodeEntryPoint = ReactModule.createElement(ProfileQRCodeEntryPointModule, {
				layoutOrder = 1,
				appStorageService = p1.appStorageService or v1,
				analyticsService = if p1 and p1.analyticsService then p1.analyticsService else nil,
				onClose = if p1 and p1.onClose then p1.onClose else DashModule.noop,
				openQrCodeScanner = if p1 and p1.openQrCodeScanner then p1.openQrCodeScanner else DashModule.noop,
				robloxEventReceiver = CreateMockRobloxEventReceiverModule().mockEventReceiver
			})
		})
	end
}