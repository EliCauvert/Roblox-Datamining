local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local ModalBasedSelectorModule = require(AbuseReportMenu.Components.ModalBasedSelector)
local ReportMenuItemModule = require(AbuseReportMenu.Components.MenuItems.ReportMenuItem)

return function(p1)
	-- upvalues: ReactModule (copy), ReportMenuItemModule (copy), ModalBasedSelectorModule (copy)
	return ReactModule.createElement(ReportMenuItemModule, {
		label = p1.label,
		layoutOrder = p1.layoutOrder,
		rightComponent = ReactModule.createElement(ModalBasedSelectorModule, p1),
		menuContainerWidth = p1.menuContainerWidth,
		isSmallPortraitViewport = p1.isSmallPortraitViewport,
		placeholderText = p1.placeholderText
	})
end