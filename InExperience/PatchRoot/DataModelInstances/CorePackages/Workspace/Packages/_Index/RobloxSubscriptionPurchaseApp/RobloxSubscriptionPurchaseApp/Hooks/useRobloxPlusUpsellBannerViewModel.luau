local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local reactModule = require(robloxSubscriptionPurchaseApp.Parent.React)
local getRobloxSubscriptionProductsModule = require(robloxSubscriptionPurchaseApp.Network.getRobloxSubscriptionProducts)
local isRobloxPlusFreeTrialEligibleModule = require(robloxSubscriptionPurchaseApp.Utils.isRobloxPlusFreeTrialEligible)

return function(p1)
	-- upvalues: reactModule (ref), getRobloxSubscriptionProductsModule (ref), isRobloxPlusFreeTrialEligibleModule (ref)
	local var1, var2 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: getRobloxSubscriptionProductsModule (copy), var2 (ref), isRobloxPlusFreeTrialEligibleModule (copy)
		local var3 = false
		getRobloxSubscriptionProductsModule():andThen(function(p2)
			-- upvalues: var3 (write), var2 (copy), isRobloxPlusFreeTrialEligibleModule (copy)
			if not var3 then
				var2(isRobloxPlusFreeTrialEligibleModule(p2))
			end
		end):catch(function()
			-- upvalues: var3 (write), var2 (copy)
			if not var3 then
				var2(false)
			end
		end)
		
		return function()
			-- upvalues: var3 (write)
			var3 = true
		end
	end, {})
	
	return {
		actionText = if var1 then p1.freeTrialText else p1.subscribeText
	}
end