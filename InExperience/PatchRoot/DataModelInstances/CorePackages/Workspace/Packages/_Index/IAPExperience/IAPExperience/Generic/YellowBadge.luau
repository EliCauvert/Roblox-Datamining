local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local Image = FoundationModule.Image
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame) --[[ Line: 19 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Image (copy), Text (copy)
	local Emphasis = UseTokensFunction().LightMode.Content.Emphasis
	
	return ReactModule.createElement(View, {
		tag = "radius-circle padding-small row gap-xsmall align-y-center align-x-center auto-xy",
		LayoutOrder = Frame.LayoutOrder,
		backgroundStyle = { Transparency = 0, Color3 = Color3.fromRGB(239, 215, 140) }
	}, {
		Icon = if Frame.Icon then ReactModule.createElement(Image, {
			LayoutOrder = 1,
			tag = "size-300",
			Image = Frame.Icon,
			imageStyle = Emphasis
		}) else nil,
		Text = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "text-caption-small content-emphasis text-align-x-center auto-xy",
			Text = Frame.Text,
			textStyle = Emphasis
		})
	})
end