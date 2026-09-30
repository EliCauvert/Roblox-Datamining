local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local _ = require(robloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local fIntRobloxPlusTrialDiscountBaseDaysModule = require(robloxSubscriptionPurchaseApp.Flags.FIntRobloxPlusTrialDiscountBaseDays)
local t = { week = 7, month = 30, year = 365 }

local function _(p1, p2)
	-- upvalues: t (ref)
	return p1 * (t[string.lower(p2 or "")] or 30)
end

return function(p1, p2, p3)
	-- upvalues: t (ref), fIntRobloxPlusTrialDiscountBaseDaysModule (ref)
	return (if p2 == nil then fIntRobloxPlusTrialDiscountBaseDaysModule else p2 * (t[string.lower(p3 or "")] or t.month)) + (if p1 == nil then 0 else p1.Duration * (if not t[string.lower(p1.PeriodType or "")] then t.month else t[string.lower(p1.PeriodType or "")]))
end