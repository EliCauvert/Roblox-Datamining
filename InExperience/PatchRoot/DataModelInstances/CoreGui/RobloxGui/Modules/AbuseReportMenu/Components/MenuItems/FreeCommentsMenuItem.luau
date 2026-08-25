local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local reactModule = require(game:GetService("CorePackages").Packages.React)
local reportTextEntryModule = require(abuseReportMenu.Components.ReportTextEntry)
local reportMenuItemModule = require(abuseReportMenu.Components.MenuItems.ReportMenuItem)
local constantsModule = require(abuseReportMenu.Components.Constants)

return function(p0)
	-- upvalues: reactModule (ref), reportMenuItemModule (ref), reportTextEntryModule (ref), constantsModule (ref)
	return reactModule.createElement(reportMenuItemModule, {
		label = "Abuse Description",
		isRightComponentFullWidth = true,
		layoutOrder = p0.layoutOrder,
		rightComponent = reactModule.createElement(reportTextEntryModule, {
			layoutOrder = p0.layoutOrder,
			text = p0.comment,
			placeholderText = p0.placeholderText,
			onUpdate = p0.onUpdate
		}),
		heightOverride = constantsModule.FreeCommentsMenuItemHeight,
		menuContainerWidth = p0.menuContainerWidth,
		isSmallPortraitViewport = p0.isSmallPortraitViewport
	})
end