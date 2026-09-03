local parent = script:FindFirstAncestor("InExperienceShop").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local iconVariant = foundationModule.Enums.IconVariant
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance

local function _(p1)
	return p1:gsub("[&<>\"']", {
		["&"] = "&amp;",
		["<"] = "&lt;",
		[">"] = "&gt;",
		["\""] = "&quot;",
		["'"] = "&apos;"
	})
end

return function(p1)
	-- upvalues: iconName (ref), iconName (ref), reactModule (ref), view (ref), icon (ref), iconSize (ref), iconVariant (ref), text (ref), stateLayerAffordance (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-x-large padding-y-medium radius-medium bg-shift-200",
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId
	}, {
		BannerIcon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			testId = "DesktopOfferBanner_Icon",
			name = if p1.icon then iconName[p1.icon] else iconName.Tag,
			size = iconSize.Medium,
			variant = iconVariant.Filled
		}),
		Message = reactModule.createElement(text, {
			tag = "fill auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
			LayoutOrder = 2,
			testId = "DesktopOfferBanner_Text",
			Text = p1.text
		}),
		Link = if p1.link then reactModule.createElement(text, {
			RichText = true,
			tag = "auto-xy text-body-medium text-align-x-left content-emphasis",
			LayoutOrder = 3,
			testId = "DesktopOfferBanner_Link",
			Text = `<u>{p1.link.text:gsub("[&<>\"']", {
				["&"] = "&amp;",
				["<"] = "&lt;",
				[">"] = "&gt;",
				["\""] = "&quot;",
				["'"] = "&apos;"
			})}</u>`,
			stateLayer = { affordance = stateLayerAffordance.None },
			onActivated = p1.link.onActivated
		}) else nil
	})
end