local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)

return function(Pass, UniverseId)
	-- upvalues: SetCentralOverlayModule (copy), OverlayTypeModule (copy)
	return function(p1)
		-- upvalues: SetCentralOverlayModule (upval), OverlayTypeModule (upval), Pass (copy), UniverseId (copy)
		p1:dispatch(SetCentralOverlayModule(OverlayTypeModule.PurchasePass, { pass = Pass, universeId = UniverseId }))
	end
end