local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local _ = require(CorePackages.Workspace.Packages.Style)
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local _ = require(CorePackages.Packages.ReactOtter)
local VerticalEfficiencyExperimentation = require(CorePackages.Workspace.Packages.DiscoveryUtils).VerticalEfficiencyExperimentation
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local FFlagLuaAppMoveProfileIntoTopBar = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBar
local FFlagLuaAppMoveProfileIntoTopBarIXP = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBarIXP
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagAppIaHomeSubTab = SharedFlagsModule.FFlagAppIaHomeSubTab
local FlyoutSidePanelIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP
local LuaAppSubTabTopPadding = game:DefineFastInt("LuaAppSubTabTopPadding", 0)
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole

return function(p1, p2)
	-- upvalues: FFlagAppIaHomeSubTab (copy), FlyoutSidePanelIXP (copy), LuaAppSubTabTopPadding (copy), FFlagAppIaScrollAway (copy), AppNavBarModule (copy), FFlagLuaAppMoveProfileIntoTopBar (copy), FFlagLuaAppMoveProfileIntoTopBarIXP (copy), VerticalEfficiencyExperimentation (copy), UiMode (copy), FFlagEnableLeftNavOnConsole (copy)
	local Size600 = p2.Size.Size_600
	local Size600_1 = p2.Size.Size_600
	local Size1200 = p2.Size.Size_1200
	
	if FFlagAppIaHomeSubTab and FlyoutSidePanelIXP.isHomeSubTabEnabled() then
		if LuaAppSubTabTopPadding > 0 then
			Size600_1 = LuaAppSubTabTopPadding
		end
	elseif FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then
		Size600_1 = p2.Size.Size_200
	elseif FFlagLuaAppMoveProfileIntoTopBar and (not FFlagLuaAppMoveProfileIntoTopBarIXP or VerticalEfficiencyExperimentation.getIsProfileMovedToTopBar()) then
		Size600_1 = p2.Size.Size_300
	end
	local config = { layoutPadding = 26, topMargin = 0, bottomMargin = 26 }
	local AnimationConfig = { dampingRatio = 1, frequency = 3 }
	
	if p1.uiMode == UiMode.TenFoot and not FFlagEnableLeftNavOnConsole then
		Size600 = p2.Size.Size_800
		Size600_1 = p2.Size.Size_600 + p2.Size.Size_400
		Size1200 = p2.Size.Size_800
		config.layoutPadding = Size600
		config.topMargin = Size600_1
		config.bottomMargin = Size1200
	end
	return {
		trailingWhitespace = 1000,
		scrollBarThickness = 0,
		getLayoutSpacing = function(p3)
			-- upvalues: config (copy), Size600 (ref), Size600_1 (ref), Size1200 (ref)
			return if p3 then config else {
				layoutPadding = Size600,
				topMargin = Size600_1,
				bottomMargin = Size1200
			}
		end,
		animationConfig = AnimationConfig
	}
end