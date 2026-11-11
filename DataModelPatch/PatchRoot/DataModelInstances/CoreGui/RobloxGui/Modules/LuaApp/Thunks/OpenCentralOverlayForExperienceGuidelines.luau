local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)

return function(UniverseId, HideCloseButton)
	-- upvalues: SetCentralOverlayModule (copy), OverlayTypeModule (copy)
	return function(p1)
		-- upvalues: SetCentralOverlayModule (upval), OverlayTypeModule (upval), UniverseId (copy), HideCloseButton (copy)
		p1:dispatch(SetCentralOverlayModule(OverlayTypeModule.ExperienceGuidelinesExplained, {
			universeId = UniverseId,
			hideCloseButton = HideCloseButton
		}))
	end
end