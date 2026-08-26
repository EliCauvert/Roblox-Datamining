local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local view = foundationModule.View
local image = foundationModule.Image
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), image (ref), text (ref)
	local emphasis = useTokens().LightMode.Content.Emphasis
	
	return reactModule.createElement(view, {
		tag = "radius-circle padding-small row gap-xsmall align-y-center align-x-center auto-xy",
		LayoutOrder = p1.LayoutOrder,
		backgroundStyle = { Transparency = 0, Color3 = Color3.fromRGB(239, 215, 140) }
	}, {
		Icon = if p1.Icon then reactModule.createElement(image, {
			LayoutOrder = 1,
			tag = "size-300",
			Image = p1.Icon,
			imageStyle = emphasis
		}) else nil,
		Text = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "text-caption-small content-emphasis text-align-x-center auto-xy",
			Text = p1.Text,
			textStyle = emphasis
		})
	})
end