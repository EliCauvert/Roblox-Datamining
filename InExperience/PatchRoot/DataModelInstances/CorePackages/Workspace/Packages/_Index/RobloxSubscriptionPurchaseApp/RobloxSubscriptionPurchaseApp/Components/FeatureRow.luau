local Parent = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), Icon (copy), IconSize (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "row align-x-left align-y-center gap-medium size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		Icon = ReactModule.createElement(Icon, { name = p1.iconName, size = IconSize.Medium }),
		FeatureText = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-body-medium text-align-x-left content-default",
			Text = p1.text
		})
	})
end