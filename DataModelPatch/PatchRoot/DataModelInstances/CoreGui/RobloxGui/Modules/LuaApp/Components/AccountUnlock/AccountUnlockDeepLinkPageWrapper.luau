local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local AccountUnlockDeepLinkPage = require(CorePackages.Workspace.Packages.AccountLockModal).AccountUnlockDeepLinkPage
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local ApiFetchAccessStatusModule = require(Modules.LuaApp.Thunks.Moderation.ApiFetchAccessStatus)

return function(p1)
	-- upvalues: ReactModule (copy), AccountUnlockDeepLinkPage (copy), CryoModule (copy), ResetNavigationHistoryModule (copy), ApiFetchAccessStatusModule (copy), CloseCentralOverlayModule (copy)
	return ReactModule.createElement(AccountUnlockDeepLinkPage, CryoModule.Dictionary.join(p1 or {}, {
		ResetNavigationHistory = ResetNavigationHistoryModule,
		ApiFetchAccessStatus = ApiFetchAccessStatusModule,
		closeCentralOverlayThunk = CloseCentralOverlayModule
	}))
end