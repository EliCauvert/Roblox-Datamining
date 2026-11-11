local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local AppPageModule = require(Modules.LuaApp.AppPage)
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)

return function(p1, OnActivated)
	-- upvalues: ResetNavigationHistoryModule (copy), AppPageModule (copy), SetCentralOverlayModule (copy), OverlayTypeModule (copy)
	p1:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.Landing } }))
	p1:dispatch(SetCentralOverlayModule(OverlayTypeModule.AccountAuthenticationFailureOverlay, { onActivated = OnActivated }, { DisableBackButtonClose = true }))
end