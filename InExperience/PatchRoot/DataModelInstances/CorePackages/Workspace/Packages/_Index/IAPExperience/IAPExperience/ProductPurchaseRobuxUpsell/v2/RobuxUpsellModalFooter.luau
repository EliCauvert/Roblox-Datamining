local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function() --[[ Line: 16 | Named "RobuxUpsellModalFooter" ]]
	-- upvalues: UseLocalizationFunction (copy), UseTokensFunction (copy), ReactModule (copy), Text (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		DisclosurePayment = "IAPExperience.RobuxUpsell.Text.DisclosurePayment",
		DisclosureTerms = "IAPExperience.RobuxUpsell.Text.DisclosureTerms"
	})
	
	return ReactModule.createElement(Text, {
		tag = "content-muted text-caption-small size-full align-x-center padding-top-small",
		Text = UseLocalizationResult.DisclosurePayment .. " " .. UseLocalizationResult.DisclosureTerms
	}, {
		UITextSizeConstraint = ReactModule.createElement("UITextSizeConstraint", {
			MaxTextSize = UseTokensFunction().Typography.CaptionSmall.FontSize
		})
	})
end