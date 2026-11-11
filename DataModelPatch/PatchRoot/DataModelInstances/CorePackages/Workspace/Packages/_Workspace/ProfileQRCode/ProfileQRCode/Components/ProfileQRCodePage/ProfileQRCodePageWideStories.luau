local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local ProfileQRCodePageModule = require(script.Parent.ProfileQRCodePage)
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local MockStoreModule = require(ProfileQRCode.TestHelpers.mockStore)
local MockStateModule = require(ProfileQRCode.TestHelpers.mockState)
local DashModule = require(Parent.Dash)
local ConstantsModule = require(ProfileQRCode.Common.Constants)
local CreateMockRobloxEventReceiverModule = require(ProfileQRCode.TestHelpers.createMockRobloxEventReceiver)
local FormFactorModule = require(Parent.Dev.FormFactor)

return {
	default = function(p1)
		-- upvalues: CreateMockRobloxEventReceiverModule (copy), ReactModule (copy), RoactRoduxModule (copy), MockStoreModule (copy), MockStateModule (copy), FormFactorModule (copy), ProfileQRCodePageModule (copy), DashModule (copy)
		local MockEventReceiver = CreateMockRobloxEventReceiverModule().mockEventReceiver
		
		return ReactModule.createElement(RoactRoduxModule.StoreProvider, {
			store = MockStoreModule(MockStateModule({
				LocalUserId = "156",
				FormFactor = FormFactorModule.Enums.FormFactor.WIDE
			}))
		}, {
			AvatarBackground = ReactModule.createElement("Frame", {
				Size = UDim2.new(0, 1200, 0, 800),
				BackgroundColor3 = Color3.new(1, 0, 1)
			}, {
				ProfileQRCodePage = ReactModule.createElement(ProfileQRCodePageModule, {
					profileQRCodeFriendRequestAlertsEnabled = if p1.profileQRCodeFriendRequestAlertsEnabled then p1.profileQRCodeFriendRequestAlertsEnabled else nil,
					onClose = if p1 and p1.onClose then p1.onClose else DashModule.noop,
					openQrCodeScanner = if p1 and p1.openQrCodeScanner then p1.openQrCodeScanner else DashModule.noop,
					robloxEventReceiver = if p1.robloxEventReceiver then p1.robloxEventReceiver else MockEventReceiver
				})
			})
		})
	end,
	loading = function(p1)
		-- upvalues: ReactModule (copy), RoactRoduxModule (copy), MockStoreModule (copy), MockStateModule (copy), FormFactorModule (copy), ConstantsModule (copy), ProfileQRCodePageModule (copy), DashModule (copy), CreateMockRobloxEventReceiverModule (copy)
		return ReactModule.createElement(RoactRoduxModule.StoreProvider, {
			store = MockStoreModule(MockStateModule({
				LocalUserId = "156",
				FormFactor = FormFactorModule.Enums.FormFactor.WIDE,
				[ConstantsModule.RODUX_KEY] = { Users = {}, NetworkStatus = {} }
			}))
		}, {
			AvatarBackground = ReactModule.createElement("Frame", {
				Size = UDim2.new(0, 1200, 0, 800),
				BackgroundColor3 = Color3.new(1, 0, 1)
			}, {
				ProfileQRCodePage = ReactModule.createElement(ProfileQRCodePageModule, {
					profileQRCodeFriendRequestAlertsEnabled = true,
					onClose = if p1 and p1.onClose then p1.onClose else DashModule.noop,
					openQrCodeScanner = if p1 and p1.openQrCodeScanner then p1.openQrCodeScanner else DashModule.noop,
					robloxEventReceiver = CreateMockRobloxEventReceiverModule().mockEventReceiver
				})
			})
		})
	end
}