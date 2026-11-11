local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local ChatModalSelectorModule = require(AbuseReportMenu.Components.ChatModalSelector)
local ReportMenuItemModule = require(AbuseReportMenu.Components.MenuItems.ReportMenuItem)
local _ = require(AbuseReportMenu.Components.Types)

return function(p1)
	-- upvalues: ReactModule (copy), ReportMenuItemModule (copy), ChatModalSelectorModule (copy)
	return ReactModule.createElement(ReportMenuItemModule, {
		label = p1.label,
		layoutOrder = p1.layoutOrder,
		rightComponent = ReactModule.createElement(ChatModalSelectorModule, p1),
		menuContainerWidth = p1.menuContainerWidth,
		isSmallPortraitViewport = p1.isSmallPortraitViewport,
		placeholderText = p1.placeholderText
	})
end