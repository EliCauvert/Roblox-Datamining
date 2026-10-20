local Parent = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GuiService = game:GetService("GuiService")

return function(p1)
	-- upvalues: UseTokensFunction (copy), GuiService (copy), ReactModule (copy), View (copy), Image (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local IsNotViewportDisplaySizeMatch = GuiService.ViewportDisplaySize ~= Enum.DisplaySize.Small
	local v1: number = if IsNotViewportDisplaySizeMatch then 160 else 280
	local v2: number = if IsNotViewportDisplaySizeMatch then 90 else 158
	
	return ReactModule.createElement(View, {
		tag = "col gap-xsmall size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		HeroPictogram = if p1.pictogram then ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "align-x-center size-full-0 auto-y"
		}, {
			PictogramImage = ReactModule.createElement(Image, {
				Image = p1.pictogram.assetId,
				imageStyle = UseTokensResult.Color.Content.Emphasis,
				ScaleType = Enum.ScaleType.Fit,
				Size = UDim2.fromOffset(v1 * UseTokensResult.Config.UI.Scale, v2 * UseTokensResult.Config.UI.Scale)
			})
		}) else nil,
		HeroTitle = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			Text = p1.title,
			tag = {
				["size-full-0 auto-y text-heading-medium text-wrap text-align-x-left content-emphasis"] = IsNotViewportDisplaySizeMatch,
				["size-full-0 auto-y text-heading-large text-wrap text-align-x-left content-emphasis"] = not IsNotViewportDisplaySizeMatch
			},
			RichText = p1.titleRichText
		}),
		HeroSubtitle = if p1.subtitle then ReactModule.createElement(Text, {
			LayoutOrder = 3,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
			Text = p1.subtitle
		}) else nil
	})
end