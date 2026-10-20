local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)

return function()
	-- upvalues: OverlayTypeModule (copy), SetCentralOverlayModule (copy)
	return function(p1)
		-- upvalues: OverlayTypeModule (upval), SetCentralOverlayModule (upval)
		if p1:getState().CentralOverlay.OverlayType == OverlayTypeModule.ReminderOfNormsPopup then
			p1:dispatch(SetCentralOverlayModule())
		end
	end
end