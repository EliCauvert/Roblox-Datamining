local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local QRCodeViewModule = require(script.Parent.QRCodeView)
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local MockStoreModule = require(ProfileQRCode.TestHelpers.mockStore)
local MockStateModule = require(ProfileQRCode.TestHelpers.mockState)
local ConstantsModule = require(ProfileQRCode.Common.Constants)
local NetworkStatus = require(ProfileQRCode.Networking.configuredRoduxNetworking).Enum.NetworkStatus

return {
	default = function()
		-- upvalues: ReactModule (copy), RoactRoduxModule (copy), MockStoreModule (copy), MockStateModule (copy), QRCodeViewModule (copy)
		return ReactModule.createElement(RoactRoduxModule.StoreProvider, {
			store = MockStoreModule(MockStateModule({ LocalUserId = "156" }))
		}, {
			QRCodeView = ReactModule.createElement(QRCodeViewModule, { layoutOrder = 1 })
		})
	end,
	loading = function()
		-- upvalues: ReactModule (copy), RoactRoduxModule (copy), MockStoreModule (copy), MockStateModule (copy), ConstantsModule (copy), QRCodeViewModule (copy)
		return ReactModule.createElement(RoactRoduxModule.StoreProvider, {
			store = MockStoreModule(MockStateModule({
				LocalUserId = "156",
				[ConstantsModule.RODUX_KEY] = { Users = {}, NetworkStatus = {}, ShareUrl = {} }
			}))
		}, {
			QRCodeView = ReactModule.createElement(QRCodeViewModule, { layoutOrder = 1 })
		})
	end,
	failed = function()
		-- upvalues: ReactModule (copy), RoactRoduxModule (copy), MockStoreModule (copy), MockStateModule (copy), ConstantsModule (copy), NetworkStatus (copy), QRCodeViewModule (copy)
		return ReactModule.createElement(RoactRoduxModule.StoreProvider, {
			store = MockStoreModule(MockStateModule({
				LocalUserId = "156",
				[ConstantsModule.RODUX_KEY] = {
					Users = {},
					NetworkStatus = {
						["https://apis.roblox.com/sharelinks/v1/get-or-create-link"] = NetworkStatus.Failed
					},
					ShareUrl = {}
				}
			}))
		}, {
			QRCodeView = ReactModule.createElement(QRCodeViewModule, { layoutOrder = 1 })
		})
	end
}