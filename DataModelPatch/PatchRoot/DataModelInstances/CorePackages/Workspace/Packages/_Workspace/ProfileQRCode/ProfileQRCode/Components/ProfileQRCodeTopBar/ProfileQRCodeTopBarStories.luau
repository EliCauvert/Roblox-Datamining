local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local ProfileQRCodeTopBarModule = require(script.Parent.ProfileQRCodeTopBar)
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local RoactRoduxModule = require(Parent.RoactRodux)
local MockStoreModule = require(ProfileQRCode.TestHelpers.mockStore)
local MockStateModule = require(ProfileQRCode.TestHelpers.mockState)
local v1 = require(ProfileQRCode.TestHelpers.createMockAppStorageService)()

return {
	default = function(p1)
		-- upvalues: ReactModule (copy), RoactRoduxModule (copy), MockStoreModule (copy), MockStateModule (copy), ProfileQRCodeTopBarModule (copy), v1 (copy), DashModule (copy)
		return ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = MockStoreModule(MockStateModule()) }, {
			ProfileQRCodeTopBar = ReactModule.createElement(ProfileQRCodeTopBarModule, {
				layoutOrder = 1,
				appStorageService = if p1.appStorageService then p1.appStorageService else v1,
				onClose = if p1.onClose then p1.onClose else DashModule.noop,
				openQrCodeScanner = if p1.openQrCodeScanner then p1.openQrCodeScanner else DashModule.noop
			})
		})
	end
}