local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local ProfileQRCodePageModule = require(script.Parent.ProfileQRCodePage)
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
		-- upvalues: CreateMockRobloxEventReceiverModule (copy), ReactModule (copy), RoactRoduxModule (copy), MockStoreModule (copy), MockStateModule (copy), ProfileQRCodePageModule (copy), v1 (copy), DashModule (copy)
		local MockEventReceiver = CreateMockRobloxEventReceiverModule().mockEventReceiver
		
		return ReactModule.createElement(RoactRoduxModule.StoreProvider, {
			store = MockStoreModule(MockStateModule({ LocalUserId = "156", FormFactor = nil }))
		}, {
			AvatarBackground = ReactModule.createElement("Frame", {
				ZIndex = -2,
				Size = UDim2.new(0, 500, 0, 700),
				BackgroundColor3 = Color3.new(1, 0, 1)
			}, {
				AvatarImage = ReactModule.createElement("Frame", {
					ZIndex = -1,
					Size = UDim2.new(0, 500, 0, 350),
					BackgroundColor3 = Color3.new(0, 1, 1)
				}),
				ProfileQRCodePage = ReactModule.createElement(ProfileQRCodePageModule, {
					appStorageService = if p1.appStorageService then p1.appStorageService else v1,
					profileQRCodeFriendRequestAlertsEnabled = if p1.profileQRCodeFriendRequestAlertsEnabled then p1.profileQRCodeFriendRequestAlertsEnabled else nil,
					onClose = if p1 and p1.onClose then p1.onClose else DashModule.noop,
					openQrCodeScanner = if p1 and p1.openQrCodeScanner then p1.openQrCodeScanner else DashModule.noop,
					robloxEventReceiver = if p1.robloxEventReceiver then p1.robloxEventReceiver else MockEventReceiver
				})
			})
		})
	end,
	longScreen = function(p1)
		-- upvalues: ReactModule (copy), RoactRoduxModule (copy), MockStoreModule (copy), MockStateModule (copy), ProfileQRCodePageModule (copy), DashModule (copy), CreateMockRobloxEventReceiverModule (copy)
		return ReactModule.createElement(RoactRoduxModule.StoreProvider, {
			store = MockStoreModule(MockStateModule({ LocalUserId = "156", FormFactor = nil }))
		}, {
			AvatarBackground = ReactModule.createElement("Frame", {
				Size = UDim2.new(0, 500, 0, 900),
				BackgroundColor3 = Color3.new(1, 0, 1)
			}, {
				AvatarImage = ReactModule.createElement("Frame", {
					Size = UDim2.new(0, 500, 0, 450),
					BackgroundColor3 = Color3.new(0, 1, 1)
				}),
				ProfileQRCodePage = ReactModule.createElement(ProfileQRCodePageModule, {
					profileQRCodeFriendRequestAlertsEnabled = true,
					onClose = if p1 and p1.onClose then p1.onClose else DashModule.noop,
					openQrCodeScanner = if p1 and p1.openQrCodeScanner then p1.openQrCodeScanner else DashModule.noop,
					robloxEventReceiver = CreateMockRobloxEventReceiverModule().mockEventReceiver
				})
			})
		})
	end,
	loading = function(p1)
		-- upvalues: ReactModule (copy), RoactRoduxModule (copy), MockStoreModule (copy), MockStateModule (copy), ConstantsModule (copy), ProfileQRCodePageModule (copy), DashModule (copy), CreateMockRobloxEventReceiverModule (copy)
		return ReactModule.createElement(RoactRoduxModule.StoreProvider, {
			store = MockStoreModule(MockStateModule({
				LocalUserId = "156",
				FormFactor = nil,
				[ConstantsModule.RODUX_KEY] = { Users = {}, NetworkStatus = {} }
			}))
		}, {
			AvatarBackground = ReactModule.createElement("Frame", {
				Size = UDim2.new(0, 500, 0, 900),
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