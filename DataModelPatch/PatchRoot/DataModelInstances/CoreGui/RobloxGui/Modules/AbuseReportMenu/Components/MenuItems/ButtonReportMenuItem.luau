local ReactModule = require(game:GetService("CorePackages").Packages.React)
local ReportMenuItemModule = require(script:FindFirstAncestor("AbuseReportMenu").Components.MenuItems.ReportMenuItem)

return function(p1)
	-- upvalues: ReactModule (copy), ReportMenuItemModule (copy)
	return ReactModule.createElement(ReportMenuItemModule, {
		label = p1.label,
		layoutOrder = p1.layoutOrder,
		rightComponent = p1.button,
		menuContainerWidth = p1.menuContainerWidth,
		isSmallPortraitViewport = p1.isSmallPortraitViewport
	})
end