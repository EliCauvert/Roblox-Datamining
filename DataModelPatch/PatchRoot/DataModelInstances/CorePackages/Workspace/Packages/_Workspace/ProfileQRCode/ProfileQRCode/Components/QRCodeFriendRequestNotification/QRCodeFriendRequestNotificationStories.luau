local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local ParentModule = require(script.Parent)
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local MockStoreModule = require(ProfileQRCode.TestHelpers.mockStore)
local MockStateModule = require(ProfileQRCode.TestHelpers.mockState)
local DashModule = require(Parent.Dash)
local DefaultTestUserIdModule = require(ProfileQRCode.TestHelpers.DefaultTestUserId)

return {
	default = function(p1)
		-- upvalues: ReactModule (copy), RoactRoduxModule (copy), MockStoreModule (copy), MockStateModule (copy), ParentModule (copy), DashModule (copy), DefaultTestUserIdModule (copy)
		return ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = MockStoreModule(MockStateModule()) }, {
			QRCodeFriendRequestNotificationElement = ReactModule.createElement(ParentModule, {
				notificationQueueSize = 1,
				onClose = if p1.onClose then p1.onClose else DashModule.noop,
				onAccept = if p1.onAccept then p1.onAccept else DashModule.noop,
				userId = if p1.userId then p1.userId else DefaultTestUserIdModule
			})
		})
	end
}