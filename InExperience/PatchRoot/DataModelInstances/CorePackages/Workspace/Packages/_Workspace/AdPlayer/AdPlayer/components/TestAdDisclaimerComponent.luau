local Parent = script:FindFirstAncestor("AdPlayer").Parent
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Text = FoundationModule.Text
local config = {
	eligibleDisclaimer = "CoreScripts.Ads.Label.RewardedVideoEligibleDisclaimer",
	ineligibleDisclaimer = "CoreScripts.Ads.Label.RewardedVideoIneligibleDisclaimer"
}

return function(p1) --[[ Line: 18 | Named "TestAdDisclaimerComponent" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseTokensFunction (copy), ReactModule (copy), Text (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	
	return ReactModule.createElement(Text, {
		tag = "bg-over-media-0 padding-medium radius-medium auto-xy text-body-large anchor-top-center",
		Position = UDim2.new(0.5, 0, 0, UseTokensFunction().Gap.XLarge),
		Text = if p1.isEligible then UseLocalizationResult.eligibleDisclaimer else UseLocalizationResult.ineligibleDisclaimer
	})
end