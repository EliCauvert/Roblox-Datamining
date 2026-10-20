local Parent = script:FindFirstAncestor("InExperienceShop").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local IconVariant = FoundationModule.Enums.IconVariant
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance

local function _(Text: string): string
	return (Text:gsub("[&<>\"']", {
		["&"] = "&amp;",
		["<"] = "&lt;",
		[">"] = "&gt;",
		["\""] = "&quot;",
		["'"] = "&apos;"
	}))
end

return function(Frame)
	-- upvalues: IconName (copy), IconName (copy), ReactModule (copy), View (copy), Icon (copy), IconSize (copy), IconVariant (copy), Text (copy), StateLayerAffordance (copy)
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-x-large padding-y-medium radius-medium bg-shift-200",
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}, {
		BannerIcon = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			testId = "DesktopOfferBanner_Icon",
			name = Frame.icon and IconName[Frame.icon] or IconName.Tag,
			size = IconSize.Medium,
			variant = IconVariant.Filled
		}),
		Message = ReactModule.createElement(Text, {
			tag = "fill auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
			LayoutOrder = 2,
			testId = "DesktopOfferBanner_Text",
			Text = Frame.text
		}),
		Link = if Frame.link then ReactModule.createElement(Text, {
			RichText = true,
			tag = "auto-xy text-body-medium text-align-x-left content-emphasis",
			LayoutOrder = 3,
			testId = "DesktopOfferBanner_Link",
			Text = `<u>{Frame.link.text:gsub("[&<>\"']", {
				["&"] = "&amp;",
				["<"] = "&lt;",
				[">"] = "&gt;",
				["\""] = "&quot;",
				["'"] = "&apos;"
			})}</u>`,
			stateLayer = { affordance = StateLayerAffordance.None },
			onActivated = Frame.link.onActivated
		}) else nil
	})
end