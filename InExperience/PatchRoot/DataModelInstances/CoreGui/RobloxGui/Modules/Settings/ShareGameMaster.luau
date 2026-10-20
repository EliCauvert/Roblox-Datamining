local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoduxModule = require(CorePackages.Packages.Rodux)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ShareGame = Modules.Settings.Pages.ShareGame
local AppModule = require(ShareGame.Components.App)
local AppReducerModule = require(ShareGame.AppReducer)
local InviteStoreModule = require(ShareGame.InviteStore)
local GetFFlagEnableSharedInviteStoreModule = require(Modules.Flags.GetFFlagEnableSharedInviteStore)

return {
	createApp = function(PageTarget, Analytics)
		-- upvalues: GetFFlagEnableSharedInviteStoreModule (copy), InviteStoreModule (copy), RoduxModule (copy), AppReducerModule (copy), RoactModule (copy), RoactRoduxModule (copy), AppModule (copy)
		local config = {
			store = if GetFFlagEnableSharedInviteStoreModule() then InviteStoreModule else RoduxModule.Store.new(AppReducerModule, nil, { RoduxModule.thunkMiddleware })
		}
		config._instanceHandle = RoactModule.mount(RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = config.store }, {
			App = RoactModule.createElement(AppModule, { analytics = Analytics, pageTarget = PageTarget })
		}))
		
		return config
	end
}