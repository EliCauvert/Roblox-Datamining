local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)

return function(p1)
	-- upvalues: SetCentralOverlayModule (copy), OverlayTypeModule (copy)
	return function(p2)
		-- upvalues: SetCentralOverlayModule (upval), OverlayTypeModule (upval), p1 (copy)
		p2:dispatch(SetCentralOverlayModule(OverlayTypeModule.DiscoverabilityUpsell, p1))
	end
end