local Parent = script:FindFirstAncestor("WechatQQAuth").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Image = FoundationModule.Image
local Text = FoundationModule.Text

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), Image (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "size-full-1200 row align-y-center radius-medium padding-medium",
		LayoutOrder = p1.layoutOrder or 1,
		onActivated = p1.onActivated,
		backgroundStyle = {
			Transparency = 0,
			Color3 = Color3.fromHex(p1.backgroundColor)
		}
	}, {
		IconContainer = ReactModule.createElement(View, {
			tag = "row align-x-right align-y-center",
			LayoutOrder = 1,
			Size = UDim2.new(0.4, 0, 1, 0)
		}, {
			ButtonIcon = ReactModule.createElement(Image, {
				tag = "gui-object-defaults size-900-900",
				Image = p1.iconImage
			})
		}),
		TextContainer = ReactModule.createElement(View, {
			tag = "row align-x-left align-y-center padding-left-small",
			LayoutOrder = 2,
			Size = UDim2.new(0.6, 0, 1, 0)
		}, {
			ButtonText = ReactModule.createElement(Text, {
				tag = "auto-xy text-align-x-left text-align-y-center text-body-large content-action-over-media",
				Text = p1.text
			})
		})
	})
end