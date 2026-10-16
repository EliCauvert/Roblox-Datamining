local LocalizationService = game:GetService("LocalizationService")
local Parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local ReactModule = require(Parent.React)
local NumberLocalization = require(Parent.Localization).NumberLocalization
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local IconName = FoundationModule.Enums.IconName

return function(Frame: Frame) --[[ Line: 22 | Named "Price" ]]
	-- upvalues: NumberLocalization (copy), LocalizationService (copy), GetIconRichTextFunction (copy), IconName (copy), ReactModule (copy), Text (copy), View (copy)
	local Element = ReactModule.createElement(Text, {
		RichText = true,
		tag = "auto-xy text-align-x-right",
		Text = `{GetIconRichTextFunction(IconName.Robux)} {NumberLocalization.localize(Frame.amount, LocalizationService.RobloxLocaleId)}`,
		fontStyle = Frame.fontStyle,
		textStyle = Frame.textStyle
	})
	
	return if Frame.strikethrough then ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = Frame.LayoutOrder }, {
		Content = Element,
		Strikethrough = ReactModule.createElement(View, {
			tag = "position-center-center anchor-center-center size-full-50",
			backgroundStyle = Frame.textStyle
		})
	}) else ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = Frame.LayoutOrder }, { Content = Element })
end