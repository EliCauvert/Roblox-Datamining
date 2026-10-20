local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local ReactModule = require(RobloxSubscriptionPurchaseApp.Parent.React)
local GetRobloxSubscriptionProductsModule = require(RobloxSubscriptionPurchaseApp.Network.getRobloxSubscriptionProducts)
local IsRobloxPlusFreeTrialEligibleModule = require(RobloxSubscriptionPurchaseApp.Utils.isRobloxPlusFreeTrialEligible)

return function(p1)
	-- upvalues: ReactModule (copy), GetRobloxSubscriptionProductsModule (copy), IsRobloxPlusFreeTrialEligibleModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: GetRobloxSubscriptionProductsModule (upval), UseStateResult2 (copy), IsRobloxPlusFreeTrialEligibleModule (upval)
		local Flag = false
		GetRobloxSubscriptionProductsModule():andThen(function(Result)
			-- upvalues: Flag (ref), UseStateResult2 (upval), IsRobloxPlusFreeTrialEligibleModule (upval)
			if not Flag then
				UseStateResult2(IsRobloxPlusFreeTrialEligibleModule(Result))
			end
		end):catch(function()
			-- upvalues: Flag (ref), UseStateResult2 (upval)
			if not Flag then
				UseStateResult2(false)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, {})
	
	return {
		actionText = if UseStateResult then p1.freeTrialText else p1.subscribeText
	}
end