local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization

return function() --[[ line: 16 | named "RobuxUpsellModalFooter" ]]
	-- upvalues: useLocalization (ref), useTokens (ref), reactModule (ref), text (ref)
	local var2 = useLocalization({
		DisclosurePayment = "IAPExperience.RobuxUpsell.Text.DisclosurePayment",
		DisclosureTerms = "IAPExperience.RobuxUpsell.Text.DisclosureTerms"
	})
	
	return reactModule.createElement(text, {
		tag = "content-muted text-caption-small size-full align-x-center padding-top-small",
		Text = var2.DisclosurePayment .. " " .. var2.DisclosureTerms
	}, {
		UITextSizeConstraint = reactModule.createElement("UITextSizeConstraint", {
			MaxTextSize = useTokens().Typography.CaptionSmall.FontSize
		})
	})
end