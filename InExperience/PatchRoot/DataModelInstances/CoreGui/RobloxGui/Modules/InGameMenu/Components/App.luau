local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local parent = script.Parent.Parent
local inGameMenuPolicyModule = require(parent.InGameMenuPolicy)
local viewportOverlayModule = require(script.Parent.ViewportOverlay)
local sideNavigationModule = require(script.Parent.SideNavigation)
local leaveGameDialogModule = require(script.Parent.LeaveGameDialog)
local pageContainerModule = require(script.Parent.PageContainer)
local respawnDialogModule = require(script.Parent.RespawnDialog)
local reportDialogModule = require(script.Parent.ReportPage.ReportDialog)
local reportSentDialogModule = require(script.Parent.ReportPage.ReportSentDialog)
local controlLayoutSetterModule = require(script.Parent.ControlsPage.ControlLayoutSetter)
local connectionModule = require(script.Parent.Connection)
local educationalPopupModule = require(script.Parent.EducationalPopup)
local menuIconTooltipModule = require(script.Parent.MenuIconTooltip)
local fullscreenTitleBarModule = require(script.Parent.FullscreenTitleBar)
local fFlagLuaMenuPerfImprovementsModule = require(parent.Flags.FFlagLuaMenuPerfImprovements)
local constantsModule = require(parent.Resources.Constants)

return roactRodux.connect(function(p2, _) --[[ line: 82 | named "mapStateToProps" ]]
	return { isMenuOpen = p2.isMenuOpen }
end, nil)(inGameMenuPolicyModule.connect(function(p1, _) --[[ line: 75 ]]
	return {
		enableFullscreenTitleBar = p1.enableFullscreenTitleBar(),
		isEducationalPopupEnabled = p1.enableEducationalPopup()
	}
end)(function(p0) --[[ line: 32 | named "App" ]]
	-- upvalues: roact (ref), fullscreenTitleBarModule (ref), constantsModule (ref), fFlagLuaMenuPerfImprovementsModule (ref), viewportOverlayModule (ref), sideNavigationModule (ref), leaveGameDialogModule (ref), pageContainerModule (ref), respawnDialogModule (ref), reportDialogModule (ref), reportSentDialogModule (ref), controlLayoutSetterModule (ref), connectionModule (ref), educationalPopupModule (ref), menuIconTooltipModule (ref)
	local var16 = if p0.enableFullscreenTitleBar then roact.createElement(fullscreenTitleBarModule, {
		displayOrder = constantsModule.DisplayOrder.FullscreenTitleBar
	}) else nil
	
	return if fFlagLuaMenuPerfImprovementsModule then roact.createFragment({
		Content = p0.isMenuOpen and roact.createFragment({
			Overlay = roact.createElement(viewportOverlayModule),
			SideNavigation = roact.createElement(sideNavigationModule),
			LeaveGameDialog = roact.createElement(leaveGameDialogModule),
			PageContainer = roact.createElement(pageContainerModule),
			RespawnDialog = roact.createElement(respawnDialogModule),
			ReportDialog = roact.createElement(reportDialogModule),
			ReportSentDialog = roact.createElement(reportSentDialogModule),
			ControlLayoutSetter = roact.createElement(controlLayoutSetterModule)
		}) or nil,
		Connection = roact.createElement(connectionModule),
		EducationalPopup = p0.isEducationalPopupEnabled and roact.createElement(educationalPopupModule) or nil,
		MenuIconTooltip = p0.isEducationalPopupEnabled and roact.createElement(menuIconTooltipModule) or nil,
		FullscreenTitleBar = var16
	}) else roact.createFragment({
		Overlay = roact.createElement(viewportOverlayModule),
		SideNavigation = roact.createElement(sideNavigationModule),
		LeaveGameDialog = roact.createElement(leaveGameDialogModule),
		PageContainer = roact.createElement(pageContainerModule),
		RespawnDialog = roact.createElement(respawnDialogModule),
		ReportDialog = roact.createElement(reportDialogModule),
		ReportSentDialog = roact.createElement(reportSentDialogModule),
		ControlLayoutSetter = roact.createElement(controlLayoutSetterModule),
		Connection = roact.createElement(connectionModule),
		EducationalPopup = p0.isEducationalPopupEnabled and roact.createElement(educationalPopupModule) or nil,
		MenuIconTooltip = p0.isEducationalPopupEnabled and roact.createElement(menuIconTooltipModule) or nil,
		FullscreenTitleBar = var16
	})
end))