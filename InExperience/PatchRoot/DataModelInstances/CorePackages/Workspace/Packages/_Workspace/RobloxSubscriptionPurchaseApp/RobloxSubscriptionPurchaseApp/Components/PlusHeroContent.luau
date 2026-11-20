local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GuiService = game:GetService("GuiService")
local FFlagClaimSheetWaitForCampaignStringsModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagClaimSheetWaitForCampaignStrings)
local FFlagTTOnboardingSheetModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagTTOnboardingSheet)
local FFlagOnboardingSheetLayout = require(Parent.SharedFlags).FFlagOnboardingSheetLayout
local _UDim2 = UDim2.fromScale(0.344, 0.574)
local _UDim2_1 = UDim2.fromScale(0.626, 0.405)
local _Vector2 = Vector2.new(280, 158)

return function(p1)
	-- upvalues: UseTokensFunction (copy), GuiService (copy), FFlagOnboardingSheetLayout (copy), FFlagClaimSheetWaitForCampaignStringsModule (copy), FFlagTTOnboardingSheetModule (copy), _Vector2 (copy), ReactModule (copy), View (copy), _UDim2_1 (copy), Image (copy), _UDim2 (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local IsNotViewportDisplaySizeMatch = GuiService.ViewportDisplaySize ~= Enum.DisplaySize.Small
	local FFlagOnboardingSheetLayout1 = FFlagOnboardingSheetLayout or FFlagClaimSheetWaitForCampaignStringsModule and p1.omitsMissingTitle == true
	local _UDim2_2 = UDim2.fromOffset((if IsNotViewportDisplaySizeMatch then 160 else 280) * UseTokensResult.Config.UI.Scale, (if IsNotViewportDisplaySizeMatch then 90 else 158) * UseTokensResult.Config.UI.Scale)
	local AccentPictogram = if FFlagTTOnboardingSheetModule then p1.accentPictogram else nil
	local ZeroVector = Vector2.zero
	local XOffset = 0
	local _UDim2_3 = UDim2.fromOffset(0, 0)
	local _UDim = UDim.new(0, 0)
	local XScale = 0
	
	if AccentPictogram then
		ZeroVector = if FFlagOnboardingSheetLayout and p1.twoCardPictogramSize then p1.twoCardPictogramSize * UseTokensResult.Config.UI.Scale else _Vector2 * UseTokensResult.Config.UI.Scale
		XOffset = ZeroVector.Y * 0.55
		_UDim2_3 = UDim2.fromOffset(XOffset, XOffset)
		_UDim = UDim.new(0, XOffset * 0.044)
		XScale = 0.859375
	end
	return ReactModule.createElement(View, {
		tag = "col gap-xsmall size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		HeroPictogram = if p1.pictogram then ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "align-x-center size-full-0 auto-y"
		}, {
			PictogramImage = if AccentPictogram then ReactModule.createElement(View, { Size = UDim2.fromOffset(ZeroVector.X, ZeroVector.Y) }, {
				AccentCard = ReactModule.createElement(View, {
					tag = "anchor-center-center",
					Rotation = 15,
					ZIndex = 1,
					Position = _UDim2_1,
					Size = _UDim2_3,
					cornerRadius = _UDim,
					stroke = {
						Transparency = 0.835,
						Color = UseTokensResult.Color.Content.Emphasis.Color3,
						Thickness = XOffset * 0.012
					}
				}, {
					Accent = ReactModule.createElement(Image, {
						tag = "position-center-center anchor-center-center",
						Image = AccentPictogram.assetId,
						imageStyle = UseTokensResult.Color.Content.Emphasis,
						ScaleType = Enum.ScaleType.Fit,
						Size = UDim2.fromScale(0.8, 0.8)
					})
				}),
				PrimaryFill = if FFlagOnboardingSheetLayout then nil else ReactModule.createElement(View, {
					tag = "anchor-center-center bg-surface-100",
					Rotation = -15,
					ZIndex = 2,
					Position = _UDim2,
					Size = _UDim2_3,
					cornerRadius = _UDim
				}),
				Primary = if FFlagOnboardingSheetLayout then ReactModule.createElement(View, {
					tag = "anchor-center-center bg-surface-100",
					Rotation = -15,
					ZIndex = 2,
					Position = _UDim2,
					Size = _UDim2_3,
					cornerRadius = _UDim,
					stroke = {
						Transparency = 0.835,
						Color = UseTokensResult.Color.Content.Emphasis.Color3,
						Thickness = XOffset * 0.012
					}
				}, {
					Glyph = ReactModule.createElement(Image, {
						tag = "position-center-center anchor-center-center",
						Image = p1.pictogram.assetId,
						imageRect = {
							offset = Vector2.new(360, 150),
							size = Vector2.new(240, 240)
						},
						imageStyle = UseTokensResult.Color.Content.Emphasis,
						ScaleType = Enum.ScaleType.Fit,
						Size = UDim2.fromScale(0.6944444444444444, 0.6944444444444444)
					})
				}) else ReactModule.createElement(Image, {
					tag = "anchor-center-center",
					ZIndex = 3,
					Image = p1.pictogram.assetId,
					imageStyle = UseTokensResult.Color.Content.Emphasis,
					ScaleType = Enum.ScaleType.Fit,
					Position = _UDim2,
					Size = UDim2.fromScale(XScale, XScale)
				})
			}) else ReactModule.createElement(Image, {
				Image = p1.pictogram.assetId,
				imageStyle = UseTokensResult.Color.Content.Emphasis,
				ScaleType = Enum.ScaleType.Fit,
				Size = _UDim2_2
			})
		}) else nil,
		HeroTitle = if p1.title or not FFlagOnboardingSheetLayout1 then ReactModule.createElement(Text, {
			LayoutOrder = 2,
			Text = p1.title,
			tag = {
				["size-full-0 auto-y text-heading-medium text-wrap text-align-x-left content-emphasis"] = IsNotViewportDisplaySizeMatch,
				["size-full-0 auto-y text-heading-large text-wrap text-align-x-left content-emphasis"] = not IsNotViewportDisplaySizeMatch
			},
			RichText = p1.titleRichText
		}) else nil,
		HeroSubtitle = if p1.subtitle then ReactModule.createElement(Text, {
			LayoutOrder = 3,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
			Text = p1.subtitle
		}) else nil
	})
end