local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local ParentModule = require(script.Parent)
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local CreateMockRobloxEventReceiverModule = require(ProfileQRCode.TestHelpers.createMockRobloxEventReceiver)
local MockStateModule = require(ProfileQRCode.TestHelpers.mockState)
local MockStoreModule = require(ProfileQRCode.TestHelpers.mockStore)
local v1 = require(ProfileQRCode.TestHelpers.createMockAppStorageService)()

return {
	default = function(p1)
		-- upvalues: CreateMockRobloxEventReceiverModule (copy), ReactModule (copy), RoactRoduxModule (copy), MockStoreModule (copy), MockStateModule (copy), ParentModule (copy), v1 (copy), DashModule (copy)
		local MockEventReceiver = CreateMockRobloxEventReceiverModule().mockEventReceiver
		
		return ReactModule.createElement(RoactRoduxModule.StoreProvider, {
			store = MockStoreModule(MockStateModule({ LocalUserId = "156" }))
		}, {
			Wrapper = ReactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Size = UDim2.fromOffset(400, 500)
			}, {
				ProfileQRCodeTopElements = ReactModule.createElement(ParentModule, {
					appStorageService = if p1.appStorageService then p1.appStorageService else v1,
					onClose = if p1.onClose then p1.onClose else DashModule.noop,
					openQrCodeScanner = if p1.openQrCodeScanner then p1.openQrCodeScanner else DashModule.noop,
					profileQRCodeFriendRequestAlertsEnabled = if p1.profileQRCodeFriendRequestAlertsEnabled then p1.profileQRCodeFriendRequestAlertsEnabled else nil,
					robloxEventReceiver = if p1.robloxEventReceiver then p1.robloxEventReceiver else MockEventReceiver
				})
			})
		})
	end
}