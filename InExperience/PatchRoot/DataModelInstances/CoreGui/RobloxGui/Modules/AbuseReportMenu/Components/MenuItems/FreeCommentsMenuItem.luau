local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local ReportTextEntryModule = require(AbuseReportMenu.Components.ReportTextEntry)
local ReportMenuItemModule = require(AbuseReportMenu.Components.MenuItems.ReportMenuItem)
local ConstantsModule = require(AbuseReportMenu.Components.Constants)

return function(p1)
	-- upvalues: ReactModule (copy), ReportMenuItemModule (copy), ReportTextEntryModule (copy), ConstantsModule (copy)
	return ReactModule.createElement(ReportMenuItemModule, {
		label = "Abuse Description",
		isRightComponentFullWidth = true,
		layoutOrder = p1.layoutOrder,
		rightComponent = ReactModule.createElement(ReportTextEntryModule, {
			layoutOrder = p1.layoutOrder,
			text = p1.comment,
			placeholderText = p1.placeholderText,
			onUpdate = p1.onUpdate
		}),
		heightOverride = ConstantsModule.FreeCommentsMenuItemHeight,
		menuContainerWidth = p1.menuContainerWidth,
		isSmallPortraitViewport = p1.isSmallPortraitViewport
	})
end