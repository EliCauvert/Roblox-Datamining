local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize

return function(p0) --[[ line: 18 | named "BuildMaturityBanner" ]]
	-- upvalues: reactModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	return reactModule.createElement(view, {
		LayoutOrder = 2,
		tag = "col size-full-0 auto-y padding-medium radius-medium bg-shift-200",
		testId = "build-maturity-banner"
	}, {
		Content = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-small size-full-0 auto-y padding-y-xxsmall"
		}, {
			Icon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				tag = "auto-xy content-emphasis",
				testId = "build-maturity-banner-icon",
				name = iconName.ShieldCheck,
				size = iconSize.Small
			}),
			Description = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill auto-y text-body-small text-wrap text-align-x-left content-emphasis",
				Text = p0.text
			})
		})
	})
end