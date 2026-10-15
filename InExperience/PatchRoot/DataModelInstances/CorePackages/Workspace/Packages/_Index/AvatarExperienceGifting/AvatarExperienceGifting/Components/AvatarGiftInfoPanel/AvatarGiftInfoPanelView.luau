local parent = script:FindFirstAncestor("AvatarExperienceGifting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local infoTooltip = require(parent.Gifting).Components.InfoTooltip
local image = foundationModule.Image
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local getIconRichText = foundationModule.Utility.getIconRichText
local useTokens = foundationModule.Hooks.useTokens

local function _(p1)
	-- upvalues: getIconRichText (ref), iconName (ref)
	return `{getIconRichText(iconName.Robux)} {p1}`
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), image (ref), text (ref), getIconRichText (ref), iconName (ref), infoTooltip (ref)
	local var1 = useTokens()
	local priceText = p1.priceText
	local originalPriceText = p1.originalPriceText
	local pricingNote = p1.pricingNote
	local thumbnailSize = p1.thumbnailSize or var1.Size.Size_1600
	
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-small size-full-0 auto-y padding-large radius-large bg-shift-100",
		testId = "AvatarGiftInfoPanelView",
		LayoutOrder = p1.LayoutOrder
	}, {
		Thumbnail = reactModule.createElement(image, {
			tag = "aspect-1-1",
			testId = "avatar-gift-info-panel-thumbnail",
			LayoutOrder = 1,
			Image = p1.thumbnailUrl,
			Size = UDim2.fromOffset(thumbnailSize, thumbnailSize)
		}),
		Details = reactModule.createElement(view, {
			tag = "col align-x-center gap-xsmall size-full-0 auto-y",
			LayoutOrder = 2
		}, {
			Title = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-center content-emphasis",
				testId = "avatar-gift-info-panel-title",
				LayoutOrder = 1,
				Text = p1.itemName
			}),
			Price = if priceText then reactModule.createElement(view, {
				tag = "row align-x-center align-y-center gap-small auto-xy",
				LayoutOrder = 2
			}, {
				Current = reactModule.createElement(text, {
					tag = "auto-xy text-title-large text-no-wrap content-emphasis",
					RichText = true,
					testId = "avatar-gift-info-panel-price",
					LayoutOrder = 1,
					Text = `{getIconRichText(iconName.Robux)} {priceText}`
				}),
				Original = if originalPriceText then reactModule.createElement(text, {
					tag = "auto-xy text-body-medium text-no-wrap content-muted",
					RichText = true,
					testId = "avatar-gift-info-panel-original-price",
					LayoutOrder = 2,
					Text = `<s>{`{getIconRichText(iconName.Robux)} {originalPriceText}`}</s>`
				}) else nil
			}) else nil,
			PricingNote = if pricingNote then reactModule.createElement(infoTooltip, {
				testId = "avatar-gift-info-panel-pricing",
				LayoutOrder = 3,
				text = pricingNote.text,
				tooltipTitle = pricingNote.tooltipTitle,
				tooltipText = pricingNote.tooltipText
			}) else nil,
			Caption = if p1.captionText then reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-center content-default",
				testId = "avatar-gift-info-panel-caption",
				LayoutOrder = 4,
				Text = p1.captionText
			}) else nil
		})
	})
end)