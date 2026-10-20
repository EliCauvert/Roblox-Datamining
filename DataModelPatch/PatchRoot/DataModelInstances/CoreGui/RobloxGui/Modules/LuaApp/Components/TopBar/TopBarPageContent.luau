local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local WithGridConfigDEPRECATEDFunction = require(CorePackages.Packages.UIBlox).Core.Layout.Grid.withGridConfig_DEPRECATED
local LayoutConfig = require(CorePackages.Workspace.Packages.RobloxAppEnums).LayoutConfig
local TopBarContentFrameModule = require(script.Parent.TopBarContentFrame)
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local FFlagAppIaScrollAway = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAppIaScrollAway

local function TopBarPageContentWithProviders(Tbl, _)
	-- upvalues: FFlagAppIaScrollAway (copy), AppNavBarModule (copy), ReactModule (copy), TopBarContentFrameModule (copy)
	local TopBarHeight = Tbl.topBarHeight
	local Copy = table.clone(Tbl)
	Copy.heightOffset = if FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then 0 else TopBarHeight
	Copy.topBarHeight = nil
	
	return ReactModule.createElement(TopBarContentFrameModule, Copy)
end

return (require(CorePackages.Packages.RoactRodux).connect(function(p1, _)
	return { topBarHeight = p1.TopBar.topBarHeight }
end, nil)(function(p1)
	-- upvalues: WithGridConfigDEPRECATEDFunction (copy), LayoutConfig (copy), TopBarPageContentWithProviders (copy)
	return WithGridConfigDEPRECATEDFunction({ [LayoutConfig.Keys.PaddingVertical] = 0 }, LayoutConfig.Kind)(function(p2)
		-- upvalues: TopBarPageContentWithProviders (upval), p1 (copy)
		return TopBarPageContentWithProviders(p1, p2)
	end)
end))