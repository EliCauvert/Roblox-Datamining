local parent = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local useTokens = foundationModule.Hooks.useTokens
local guiService = game:GetService("GuiService")

return function(p1)
	-- upvalues: useTokens (ref), guiService (ref), reactModule (ref), view (ref), image (ref), text (ref)
	local var1 = useTokens()
	local var2 = guiService.ViewportDisplaySize ~= Enum.DisplaySize.Small
	
	return reactModule.createElement(view, {
		tag = "col gap-xsmall size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		HeroPictogram = if p1.pictogram then reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "align-x-center size-full-0 auto-y"
		}, {
			PictogramImage = reactModule.createElement(image, {
				Image = p1.pictogram.assetId,
				imageStyle = var1.Color.Content.Emphasis,
				ScaleType = Enum.ScaleType.Fit,
				Size = UDim2.fromOffset((if var2 then 160 else 280) * var1.Config.UI.Scale, (if var2 then 90 else 158) * var1.Config.UI.Scale)
			})
		}) else nil,
		HeroTitle = reactModule.createElement(text, {
			LayoutOrder = 2,
			Text = p1.title,
			tag = {
				["size-full-0 auto-y text-heading-medium text-wrap text-align-x-left content-emphasis"] = var2,
				["size-full-0 auto-y text-heading-large text-wrap text-align-x-left content-emphasis"] = not var2
			},
			RichText = p1.titleRichText
		}),
		HeroSubtitle = if p1.subtitle then reactModule.createElement(text, {
			LayoutOrder = 3,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
			Text = p1.subtitle
		}) else nil
	})
end