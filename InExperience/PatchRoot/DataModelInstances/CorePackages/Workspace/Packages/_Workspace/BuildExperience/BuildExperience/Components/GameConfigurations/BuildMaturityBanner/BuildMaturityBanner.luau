local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize

return function(p1) --[[ Line: 18 | Named "BuildMaturityBanner" ]]
	-- upvalues: ReactModule (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy)
	return ReactModule.createElement(View, {
		LayoutOrder = 2,
		tag = "col size-full-0 auto-y padding-medium radius-medium bg-shift-200",
		testId = "build-maturity-banner"
	}, {
		Content = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-small size-full-0 auto-y padding-y-xxsmall"
		}, {
			Icon = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				tag = "auto-xy content-emphasis",
				testId = "build-maturity-banner-icon",
				name = IconName.ShieldCheck,
				size = IconSize.Small
			}),
			Description = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "fill auto-y text-body-small text-wrap text-align-x-left content-emphasis",
				Text = p1.text
			})
		})
	})
end