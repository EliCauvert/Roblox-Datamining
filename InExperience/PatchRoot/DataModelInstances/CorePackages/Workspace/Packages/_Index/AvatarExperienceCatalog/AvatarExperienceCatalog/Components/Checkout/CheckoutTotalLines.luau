local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local getIconRichText = foundationModule.Utility.getIconRichText
local fFlagAXMISWithBlackbird = sharedFlagsModule.FFlagAXMISWithBlackbird

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), foundationModule (ref), fFlagAXMISWithBlackbird (ref), getIconRichText (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-0 auto-y col gap-small",
		LayoutOrder = if fFlagAXMISWithBlackbird then p1.LayoutOrder else nil
	}, {
		TotalLine = reactModule.createElement(foundationModule.View, {
			tag = "size-full-0 auto-y fill flex-between items-center row gap-small"
		}, {
			ItemCount = reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-title-medium content-emphasis",
				LayoutOrder = 1,
				Text = useLocalization({
					totalItemsLabel = {
						"Feature.Catalog.Label.TotalItemsParenthesis",
						itemCount = p1.itemCount
					}
				}).totalItemsLabel
			}),
			TotalPrice = reactModule.createElement(foundationModule.View, {
				tag = "auto-xy row items-center gap-small",
				LayoutOrder = 2
			}, {
				OriginalPrice = if p1.totalPrice and p1.totalOriginalPrice and p1.totalPrice < p1.totalOriginalPrice then reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-title-small content-muted",
					LayoutOrder = 1,
					RichText = true,
					Text = "<s>" .. `{getIconRichText(foundationModule.Enums.IconName.Robux)} {p1.totalOriginalPrice}` .. "</s>"
				}) else nil,
				TotalPriceText = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-title-medium content-emphasis",
					LayoutOrder = 2,
					RichText = true,
					Text = `{getIconRichText(foundationModule.Enums.IconName.Robux)} {p1.totalPrice}`
				})
			})
		})
	})
end