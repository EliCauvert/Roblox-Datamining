local ReactModule = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.React)
local config = {
	["Feature.RobloxSubscription.Heading.TTGrant"] = "Lorem ipsum dolor sit amet",
	["Feature.RobloxSubscription.Description.TTGrant"] = "Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.",
	["Feature.RobloxSubscription.Action.TTClaim"] = "Lorem ipsum",
	["Feature.RobloxSubscription.Label.TTBenefitCustomize"] = "Lorem ipsum dolor",
	["Feature.RobloxSubscription.Label.TTBenefitDiscount"] = "Sit amet consectetur",
	["Feature.RobloxSubscription.Label.TTBenefitPrivateServer"] = "Adipiscing elit sed",
	["Feature.RobloxSubscription.Label.TTBenefitRobux"] = "Eiusmod tempor incididunt"
}

return function(p1)
	-- upvalues: ReactModule (copy), config (copy)
	return ReactModule.useMemo(function()
		-- upvalues: p1 (copy), config (upval)
		local t = {}
		
		for i, value in p1 do
			t[i] = config[value] or value
		end
		return t
	end, { p1 })
end