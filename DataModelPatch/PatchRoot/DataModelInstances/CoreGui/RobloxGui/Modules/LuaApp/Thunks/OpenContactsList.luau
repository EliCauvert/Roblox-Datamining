local Modules = script:FindFirstAncestor("Modules")
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)

return function(p1)
	-- upvalues: SetCentralOverlayModule (copy), OverlayTypeModule (copy)
	return function(p2)
		-- upvalues: SetCentralOverlayModule (upval), OverlayTypeModule (upval), p1 (copy)
		p2:dispatch(SetCentralOverlayModule(OverlayTypeModule.ContactsList, p1))
	end
end