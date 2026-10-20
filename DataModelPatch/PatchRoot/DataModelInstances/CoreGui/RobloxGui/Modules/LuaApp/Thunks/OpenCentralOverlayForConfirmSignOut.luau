local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)

return function(ContinueFunc, Theme)
	-- upvalues: SetCentralOverlayModule (copy), OverlayTypeModule (copy)
	return function(p1)
		-- upvalues: SetCentralOverlayModule (upval), OverlayTypeModule (upval), ContinueFunc (copy), Theme (copy)
		p1:dispatch(SetCentralOverlayModule(OverlayTypeModule.ConfirmSignOut, { continueFunc = ContinueFunc, theme = Theme }))
	end
end