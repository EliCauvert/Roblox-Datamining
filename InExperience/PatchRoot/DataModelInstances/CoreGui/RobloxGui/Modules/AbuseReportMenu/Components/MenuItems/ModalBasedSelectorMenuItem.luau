local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local reactModule = require(game:GetService("CorePackages").Packages.React)
local modalBasedSelectorModule = require(abuseReportMenu.Components.ModalBasedSelector)
local reportMenuItemModule = require(abuseReportMenu.Components.MenuItems.ReportMenuItem)

return function(p0) --[[ line: 15 ]]
	-- upvalues: reactModule (ref), reportMenuItemModule (ref), modalBasedSelectorModule (ref)
	return reactModule.createElement(reportMenuItemModule, {
		label = p0.label,
		layoutOrder = p0.layoutOrder,
		rightComponent = reactModule.createElement(modalBasedSelectorModule, p0),
		menuContainerWidth = p0.menuContainerWidth,
		isSmallPortraitViewport = p0.isSmallPortraitViewport,
		placeholderText = p0.placeholderText
	})
end