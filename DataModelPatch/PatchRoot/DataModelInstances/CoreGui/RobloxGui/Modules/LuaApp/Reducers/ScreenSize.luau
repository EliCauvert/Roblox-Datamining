local CorePackages = game:GetService("CorePackages")
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local FFlagUseSignalsRoduxStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseSignalsRoduxStore
local SetScreenSizeModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetScreenSize)
local DebugScreenSizeUseDisplayStore = game:DefineFastFlag("DebugScreenSizeUseDisplayStore", false)

return function(p1, p2, p3)
	-- upvalues: FFlagUseSignalsRoduxStore (copy), DebugScreenSizeUseDisplayStore (copy), DisplayModule (copy), SetScreenSizeModule (copy)
	if FFlagUseSignalsRoduxStore and DebugScreenSizeUseDisplayStore then
		return DisplayModule.GetDisplayStore(false).getViewportSize(p3)
	else
		local P0 = p1 or Vector2.new(0, 0)
		assert(P0, "")
		
		return if p2.type == SetScreenSizeModule.name then p2.screenSize else P0
	end
end