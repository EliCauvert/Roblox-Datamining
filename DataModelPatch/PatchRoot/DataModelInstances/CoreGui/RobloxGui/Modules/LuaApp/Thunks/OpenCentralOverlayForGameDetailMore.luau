local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp

return function(UniverseId, MenuPosition, OnClose, MenuAnchorPoint, HideCloseButton, p1)
	-- upvalues: SetCentralOverlayModule (copy), OverlayTypeModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy)
	return function(p2)
		-- upvalues: SetCentralOverlayModule (upval), OverlayTypeModule (upval), UniverseId (copy), MenuPosition (copy), OnClose (copy), MenuAnchorPoint (copy), HideCloseButton (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p1 (copy)
		p2:dispatch(SetCentralOverlayModule(OverlayTypeModule.GameDetailMore, {
			universeId = UniverseId,
			menuPosition = MenuPosition,
			onClose = OnClose,
			menuAnchorPoint = MenuAnchorPoint,
			hideCloseButton = HideCloseButton,
			shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1 else nil
		}))
	end
end