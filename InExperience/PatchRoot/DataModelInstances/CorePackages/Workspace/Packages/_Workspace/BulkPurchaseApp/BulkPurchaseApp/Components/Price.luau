local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local numberLocalization = require(parent.Localization).NumberLocalization
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local getIconRichText = foundationModule.Utility.getIconRichText
local iconName = foundationModule.Enums.IconName

return function(p0)
	-- upvalues: numberLocalization (ref), localizationService (ref), getIconRichText (ref), iconName (ref), reactModule (ref), text (ref), view (ref)
	local var3 = reactModule.createElement(text, {
		RichText = true,
		tag = "auto-xy text-align-x-right",
		Text = `{getIconRichText(iconName.Robux)} {numberLocalization.localize(p0.amount, localizationService.RobloxLocaleId)}`,
		fontStyle = p0.fontStyle,
		textStyle = p0.textStyle
	})
	
	return if p0.strikethrough then reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = p0.LayoutOrder }, {
		Content = var3,
		Strikethrough = reactModule.createElement(view, {
			tag = "position-center-center anchor-center-center size-full-50",
			backgroundStyle = p0.textStyle
		})
	}) else reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = p0.LayoutOrder }, { Content = var3 })
end