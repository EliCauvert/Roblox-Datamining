local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local Parent = script.Parent.Parent
local ViewportOverlayModule = require(script.Parent.ViewportOverlay)
local SideNavigationModule = require(script.Parent.SideNavigation)
local LeaveGameDialogModule = require(script.Parent.LeaveGameDialog)
local PageContainerModule = require(script.Parent.PageContainer)
local RespawnDialogModule = require(script.Parent.RespawnDialog)
local ReportDialogModule = require(script.Parent.ReportPage.ReportDialog)
local ReportSentDialogModule = require(script.Parent.ReportPage.ReportSentDialog)
local ControlLayoutSetterModule = require(script.Parent.ControlsPage.ControlLayoutSetter)
local ConnectionModule = require(script.Parent.Connection)
local EducationalPopupModule = require(script.Parent.EducationalPopup)
local MenuIconTooltipModule = require(script.Parent.MenuIconTooltip)
local FullscreenTitleBarModule = require(script.Parent.FullscreenTitleBar)
local FFlagLuaMenuPerfImprovementsModule = require(Parent.Flags.FFlagLuaMenuPerfImprovements)
local ConstantsModule = require(Parent.Resources.Constants)

return InGameMenuDependenciesModule.RoactRodux.connect(function(p1, _)
	return { isMenuOpen = p1.isMenuOpen }
end, nil)((require(Parent.InGameMenuPolicy).connect(function(p1, _)
	return {
		enableFullscreenTitleBar = p1.enableFullscreenTitleBar(),
		isEducationalPopupEnabled = p1.enableEducationalPopup()
	}
end)(function(p1)
	-- upvalues: Roact (copy), FullscreenTitleBarModule (copy), ConstantsModule (copy), FFlagLuaMenuPerfImprovementsModule (copy), ViewportOverlayModule (copy), SideNavigationModule (copy), LeaveGameDialogModule (copy), PageContainerModule (copy), RespawnDialogModule (copy), ReportDialogModule (copy), ReportSentDialogModule (copy), ControlLayoutSetterModule (copy), ConnectionModule (copy), EducationalPopupModule (copy), MenuIconTooltipModule (copy)
	local Element = if p1.enableFullscreenTitleBar then Roact.createElement(FullscreenTitleBarModule, {
		displayOrder = ConstantsModule.DisplayOrder.FullscreenTitleBar
	}) else nil
	
	return if FFlagLuaMenuPerfImprovementsModule then Roact.createFragment({
		Content = p1.isMenuOpen and Roact.createFragment({
			Overlay = Roact.createElement(ViewportOverlayModule),
			SideNavigation = Roact.createElement(SideNavigationModule),
			LeaveGameDialog = Roact.createElement(LeaveGameDialogModule),
			PageContainer = Roact.createElement(PageContainerModule),
			RespawnDialog = Roact.createElement(RespawnDialogModule),
			ReportDialog = Roact.createElement(ReportDialogModule),
			ReportSentDialog = Roact.createElement(ReportSentDialogModule),
			ControlLayoutSetter = Roact.createElement(ControlLayoutSetterModule)
		}) or nil,
		Connection = Roact.createElement(ConnectionModule),
		EducationalPopup = p1.isEducationalPopupEnabled and Roact.createElement(EducationalPopupModule) or nil,
		MenuIconTooltip = p1.isEducationalPopupEnabled and Roact.createElement(MenuIconTooltipModule) or nil,
		FullscreenTitleBar = Element
	}) else Roact.createFragment({
		Overlay = Roact.createElement(ViewportOverlayModule),
		SideNavigation = Roact.createElement(SideNavigationModule),
		LeaveGameDialog = Roact.createElement(LeaveGameDialogModule),
		PageContainer = Roact.createElement(PageContainerModule),
		RespawnDialog = Roact.createElement(RespawnDialogModule),
		ReportDialog = Roact.createElement(ReportDialogModule),
		ReportSentDialog = Roact.createElement(ReportSentDialogModule),
		ControlLayoutSetter = Roact.createElement(ControlLayoutSetterModule),
		Connection = Roact.createElement(ConnectionModule),
		EducationalPopup = p1.isEducationalPopupEnabled and Roact.createElement(EducationalPopupModule) or nil,
		MenuIconTooltip = p1.isEducationalPopupEnabled and Roact.createElement(MenuIconTooltipModule) or nil,
		FullscreenTitleBar = Element
	})
end)))