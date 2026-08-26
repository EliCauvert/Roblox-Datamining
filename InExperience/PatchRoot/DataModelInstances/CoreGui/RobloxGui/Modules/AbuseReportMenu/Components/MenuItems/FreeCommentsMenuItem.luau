local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local reactModule = require(game:GetService("CorePackages").Packages.React)
local reportTextEntryModule = require(abuseReportMenu.Components.ReportTextEntry)
local reportMenuItemModule = require(abuseReportMenu.Components.MenuItems.ReportMenuItem)
local constantsModule = require(abuseReportMenu.Components.Constants)

return function(p1)
	-- upvalues: reactModule (ref), reportMenuItemModule (ref), reportTextEntryModule (ref), constantsModule (ref)
	return reactModule.createElement(reportMenuItemModule, {
		label = "Abuse Description",
		isRightComponentFullWidth = true,
		layoutOrder = p1.layoutOrder,
		rightComponent = reactModule.createElement(reportTextEntryModule, {
			layoutOrder = p1.layoutOrder,
			text = p1.comment,
			placeholderText = p1.placeholderText,
			onUpdate = p1.onUpdate
		}),
		heightOverride = constantsModule.FreeCommentsMenuItemHeight,
		menuContainerWidth = p1.menuContainerWidth,
		isSmallPortraitViewport = p1.isSmallPortraitViewport
	})
end