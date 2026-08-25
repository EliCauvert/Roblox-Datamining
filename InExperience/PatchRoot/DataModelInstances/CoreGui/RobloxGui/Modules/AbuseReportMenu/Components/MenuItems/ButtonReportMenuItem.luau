local reactModule = require(game:GetService("CorePackages").Packages.React)
local reportMenuItemModule = require(script:FindFirstAncestor("AbuseReportMenu").Components.MenuItems.ReportMenuItem)

return function(p0)
	-- upvalues: reactModule (ref), reportMenuItemModule (ref)
	return reactModule.createElement(reportMenuItemModule, {
		label = p0.label,
		layoutOrder = p0.layoutOrder,
		rightComponent = p0.button,
		menuContainerWidth = p0.menuContainerWidth,
		isSmallPortraitViewport = p0.isSmallPortraitViewport
	})
end