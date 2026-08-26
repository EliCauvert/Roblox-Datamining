local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local reactModule = require(game:GetService("CorePackages").Packages.React)
local modalBasedSelectorModule = require(abuseReportMenu.Components.ModalBasedSelector)
local reportMenuItemModule = require(abuseReportMenu.Components.MenuItems.ReportMenuItem)

return function(p1)
	-- upvalues: reactModule (ref), reportMenuItemModule (ref), modalBasedSelectorModule (ref)
	return reactModule.createElement(reportMenuItemModule, {
		label = p1.label,
		layoutOrder = p1.layoutOrder,
		rightComponent = reactModule.createElement(modalBasedSelectorModule, p1),
		menuContainerWidth = p1.menuContainerWidth,
		isSmallPortraitViewport = p1.isSmallPortraitViewport,
		placeholderText = p1.placeholderText
	})
end