local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local CampaignLocalizationsModule = require(RobloxSubscriptionPurchaseApp.Store.CampaignLocalizations)
local FFlagSubscriptionSheetCampaignLocalizations = require(Parent.SharedFlags).FFlagSubscriptionSheetCampaignLocalizations
local config = {
	["Feature.RobloxSubscription.Heading.TTGrant"] = "Lorem ipsum dolor sit amet",
	["Feature.RobloxSubscription.Description.TTGrant"] = "Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.",
	["Feature.RobloxSubscription.Action.TTClaim"] = "Lorem ipsum",
	["Feature.RobloxSubscription.Label.TTBenefitCustomize"] = "Lorem ipsum dolor",
	["Feature.RobloxSubscription.Label.TTBenefitDiscount"] = "Sit amet consectetur",
	["Feature.RobloxSubscription.Label.TTBenefitPrivateServer"] = "Adipiscing elit sed",
	["Feature.RobloxSubscription.Label.TTBenefitRobux"] = "Eiusmod tempor incididunt"
}
local t = {}

return function(p1)
	-- upvalues: FFlagSubscriptionSheetCampaignLocalizations (copy), SignalsReactModule (copy), CampaignLocalizationsModule (copy), t (copy), ReactModule (copy), config (copy)
	local UseSignalStateResult = if FFlagSubscriptionSheetCampaignLocalizations then SignalsReactModule.useSignalState(CampaignLocalizationsModule.getCampaignLocalizations) else t
	
	return ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseSignalStateResult (copy), FFlagSubscriptionSheetCampaignLocalizations (upval), config (upval)
		local t = {}
		
		for i, value in p1 do
			local UseSignalStateResultEntry = UseSignalStateResult[value]
			
			if FFlagSubscriptionSheetCampaignLocalizations and UseSignalStateResultEntry then
				t[i] = UseSignalStateResultEntry
			else
				t[i] = config[value] or value
			end
		end
		return t
	end, { p1, UseSignalStateResult })
end