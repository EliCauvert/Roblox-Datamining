local corePackagesService = game:GetService("CorePackages")
local modules = game:GetService("CoreGui").RobloxGui.Modules
local roactModule = require(corePackagesService.Packages.Roact)
local roduxModule = require(corePackagesService.Packages.Rodux)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local shareGame = modules.Settings.Pages.ShareGame
local appModule = require(shareGame.Components.App)
local appReducerModule = require(shareGame.AppReducer)
local inviteStoreModule = require(shareGame.InviteStore)
local getFFlagEnableSharedInviteStoreModule = require(modules.Flags.GetFFlagEnableSharedInviteStore)

return {
	createApp = function(p1, p2)
		-- upvalues: getFFlagEnableSharedInviteStoreModule (ref), inviteStoreModule (ref), roduxModule (ref), appReducerModule (ref), roactModule (ref), roactRoduxModule (ref), appModule (ref)
		local t = {
			store = if getFFlagEnableSharedInviteStoreModule() then inviteStoreModule else roduxModule.Store.new(appReducerModule, nil, { roduxModule.thunkMiddleware })
		}
		t._instanceHandle = roactModule.mount(roactModule.createElement(roactRoduxModule.StoreProvider, { store = t.store }, {
			App = roactModule.createElement(appModule, { analytics = p2, pageTarget = p1 })
		}))
		
		return t
	end
}