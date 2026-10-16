local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local _ = require(RobloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local FIntRobloxPlusTrialDiscountBaseDaysModule = require(RobloxSubscriptionPurchaseApp.Flags.FIntRobloxPlusTrialDiscountBaseDays)
local config = { week = 7, month = 30, year = 365 }

local function _(p1, p2) --[[ Line: 13 | Named "periodToDays" ]]
	-- upvalues: config (copy)
	return p1 * (config[string.lower(p2 or "")] or 30)
end

return function(p1, p2, p3) --[[ Line: 18 | Named "getTrialUnlockDays" ]]
	-- upvalues: config (copy), FIntRobloxPlusTrialDiscountBaseDaysModule (copy)
	return (if p2 == nil then FIntRobloxPlusTrialDiscountBaseDaysModule else p2 * (config[string.lower(p3 or "")] or config.month)) + (if p1 == nil then 0 else p1.Duration * (config[string.lower(p1.PeriodType or "")] or config.month))
end