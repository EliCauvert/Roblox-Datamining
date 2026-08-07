local parent = script:FindFirstAncestor("AdPlayer").Parent
local useLocalization = require(parent.Localization).Hooks.useLocalization
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local text = foundationModule.Text
local t = {
	eligibleDisclaimer = "CoreScripts.Ads.Label.RewardedVideoEligibleDisclaimer",
	ineligibleDisclaimer = "CoreScripts.Ads.Label.RewardedVideoIneligibleDisclaimer"
}

return function(p0) --[[ line: 18 | named "TestAdDisclaimerComponent" ]]
	-- upvalues: useLocalization (ref), t (ref), useTokens (ref), reactModule (ref), text (ref)
	local var3 = useLocalization(t)
	
	return reactModule.createElement(text, {
		tag = "bg-over-media-0 padding-medium radius-medium auto-xy text-body-large anchor-top-center",
		Position = UDim2.new(0.5, 0, 0, useTokens().Gap.XLarge),
		Text = if p0.isEligible then var3.eligibleDisclaimer else var3.ineligibleDisclaimer
	})
end