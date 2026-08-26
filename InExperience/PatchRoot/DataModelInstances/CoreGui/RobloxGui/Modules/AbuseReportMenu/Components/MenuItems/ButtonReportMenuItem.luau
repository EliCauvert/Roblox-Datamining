local reactModule = require(game:GetService("CorePackages").Packages.React)
local reportMenuItemModule = require(script:FindFirstAncestor("AbuseReportMenu").Components.MenuItems.ReportMenuItem)

return function(p1)
	-- upvalues: reactModule (ref), reportMenuItemModule (ref)
	return reactModule.createElement(reportMenuItemModule, {
		label = p1.label,
		layoutOrder = p1.layoutOrder,
		rightComponent = p1.button,
		menuContainerWidth = p1.menuContainerWidth,
		isSmallPortraitViewport = p1.isSmallPortraitViewport
	})
end