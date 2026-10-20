local Parent = script:FindFirstAncestor("AvatarExperienceGifting").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local InfoTooltip = require(Parent.Gifting).Components.InfoTooltip
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function _(p1): string
	-- upvalues: GetIconRichTextFunction (copy), IconName (copy)
	return `{GetIconRichTextFunction(IconName.Robux)} {p1}`
end

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Image (copy), Text (copy), GetIconRichTextFunction (copy), IconName (copy), InfoTooltip (copy)
	local UseTokensResult = UseTokensFunction()
	local PriceText = Frame.priceText
	local OriginalPriceText = Frame.originalPriceText
	local PricingNote = Frame.pricingNote
	local ThumbnailSize = Frame.thumbnailSize or UseTokensResult.Size.Size_1600
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center gap-small size-full-0 auto-y padding-large radius-large bg-shift-100",
		testId = "AvatarGiftInfoPanelView",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Thumbnail = ReactModule.createElement(Image, {
			tag = "aspect-1-1",
			testId = "avatar-gift-info-panel-thumbnail",
			LayoutOrder = 1,
			Image = Frame.thumbnailUrl,
			Size = UDim2.fromOffset(ThumbnailSize, ThumbnailSize)
		}),
		Details = ReactModule.createElement(View, {
			tag = "col align-x-center gap-xsmall size-full-0 auto-y",
			LayoutOrder = 2
		}, {
			Title = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-center content-emphasis",
				testId = "avatar-gift-info-panel-title",
				LayoutOrder = 1,
				Text = Frame.itemName
			}),
			Price = if PriceText then ReactModule.createElement(View, {
				tag = "row align-x-center align-y-center gap-small auto-xy",
				LayoutOrder = 2
			}, {
				Current = ReactModule.createElement(Text, {
					tag = "auto-xy text-title-large text-no-wrap content-emphasis",
					RichText = true,
					testId = "avatar-gift-info-panel-price",
					LayoutOrder = 1,
					Text = `{GetIconRichTextFunction(IconName.Robux)} {PriceText}`
				}),
				Original = if OriginalPriceText then ReactModule.createElement(Text, {
					tag = "auto-xy text-body-medium text-no-wrap content-muted",
					RichText = true,
					testId = "avatar-gift-info-panel-original-price",
					LayoutOrder = 2,
					Text = `<s>{`{GetIconRichTextFunction(IconName.Robux)} {OriginalPriceText}`}</s>`
				}) else nil
			}) else nil,
			PricingNote = if PricingNote then ReactModule.createElement(InfoTooltip, {
				testId = "avatar-gift-info-panel-pricing",
				LayoutOrder = 3,
				text = PricingNote.text,
				tooltipTitle = PricingNote.tooltipTitle,
				tooltipText = PricingNote.tooltipText
			}) else nil,
			Caption = if Frame.captionText then ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-center content-default",
				testId = "avatar-gift-info-panel-caption",
				LayoutOrder = 4,
				Text = Frame.captionText
			}) else nil
		})
	})
end)