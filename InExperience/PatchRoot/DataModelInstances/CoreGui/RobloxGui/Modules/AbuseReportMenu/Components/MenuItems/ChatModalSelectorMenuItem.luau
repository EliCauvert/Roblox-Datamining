local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local reactModule = require(game:GetService("CorePackages").Packages.React)
local chatModalSelectorModule = require(abuseReportMenu.Components.ChatModalSelector)
local reportMenuItemModule = require(abuseReportMenu.Components.MenuItems.ReportMenuItem)
local _ = require(abuseReportMenu.Components.Types)

return function(p0) --[[ line: 22 ]]
	-- upvalues: reactModule (ref), reportMenuItemModule (ref), chatModalSelectorModule (ref)
	return reactModule.createElement(reportMenuItemModule, {
		label = p0.label,
		layoutOrder = p0.layoutOrder,
		rightComponent = reactModule.createElement(chatModalSelectorModule, p0),
		menuContainerWidth = p0.menuContainerWidth,
		isSmallPortraitViewport = p0.isSmallPortraitViewport,
		placeholderText = p0.placeholderText
	})
end