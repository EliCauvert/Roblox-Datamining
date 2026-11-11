local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local FFlagAXMISWithBlackbird = require(Parent.SharedFlags).FFlagAXMISWithBlackbird

return function(Frame)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), FoundationModule (copy), FFlagAXMISWithBlackbird (copy), GetIconRichTextFunction (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y col gap-small",
		LayoutOrder = if FFlagAXMISWithBlackbird then Frame.LayoutOrder else nil
	}, {
		TotalLine = ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-0 auto-y fill flex-between items-center row gap-small"
		}, {
			ItemCount = ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-xy text-title-medium content-emphasis",
				LayoutOrder = 1,
				Text = UseLocalizationFunction({
					totalItemsLabel = {
						"Feature.Catalog.Label.TotalItemsParenthesis",
						itemCount = Frame.itemCount
					}
				}).totalItemsLabel
			}),
			TotalPrice = ReactModule.createElement(FoundationModule.View, {
				tag = "auto-xy row items-center gap-small",
				LayoutOrder = 2
			}, {
				OriginalPrice = if Frame.totalPrice and Frame.totalOriginalPrice and Frame.totalPrice < Frame.totalOriginalPrice then ReactModule.createElement(FoundationModule.Text, {
					tag = "auto-xy text-title-small content-muted",
					LayoutOrder = 1,
					RichText = true,
					Text = "<s>" .. `{GetIconRichTextFunction(FoundationModule.Enums.IconName.Robux)} {Frame.totalOriginalPrice}` .. "</s>"
				}) else nil,
				TotalPriceText = ReactModule.createElement(FoundationModule.Text, {
					tag = "auto-xy text-title-medium content-emphasis",
					LayoutOrder = 2,
					RichText = true,
					Text = `{GetIconRichTextFunction(FoundationModule.Enums.IconName.Robux)} {Frame.totalPrice}`
				})
			})
		})
	})
end