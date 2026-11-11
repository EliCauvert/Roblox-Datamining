local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)

return function(GameName, RobuxShortfall, Theme, PageFilter)
	-- upvalues: SetCentralOverlayModule (copy), OverlayTypeModule (copy)
	return function(p1)
		-- upvalues: SetCentralOverlayModule (upval), OverlayTypeModule (upval), GameName (copy), RobuxShortfall (copy), Theme (copy), PageFilter (copy)
		p1:dispatch(SetCentralOverlayModule(OverlayTypeModule.PurchaseGameRobuxShortfall, {
			gameName = GameName,
			robuxShortfall = RobuxShortfall,
			theme = Theme,
			pageFilter = PageFilter
		}))
	end
end