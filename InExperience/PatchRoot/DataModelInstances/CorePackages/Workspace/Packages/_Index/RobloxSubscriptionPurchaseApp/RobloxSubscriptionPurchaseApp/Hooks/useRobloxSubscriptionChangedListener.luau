local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local playersService = game:GetService("Players")
local reactModule = require(robloxSubscriptionPurchaseApp.Parent.React)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local finalizeRobloxSubscriptionUpsellFlowModule = require(robloxSubscriptionPurchaseApp.Actions.finalizeRobloxSubscriptionUpsellFlow)
local promptStateModule = require(robloxSubscriptionPurchaseApp.Enums.PromptState)

return function(p1)
	-- upvalues: robloxSubscriptionStoreModule (ref), reactModule (ref), playersService (ref), promptStateModule (ref), finalizeRobloxSubscriptionUpsellFlowModule (ref)
	local var1 = reactModule.useRef(robloxSubscriptionStoreModule.get())
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), playersService (copy)
		return p1 or function()
			-- upvalues: playersService (copy)
			return playersService.LocalPlayer
		end
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var1 (ref), promptStateModule (copy), finalizeRobloxSubscriptionUpsellFlowModule (copy)
		local var3 = var2()
		
		if var3 then
			local var4 = var3:GetPropertyChangedSignal("HasRobloxSubscription"):Connect(function()
				-- upvalues: var3 (ref), var1 (copy), promptStateModule (copy), finalizeRobloxSubscriptionUpsellFlowModule (copy)
				if var3.HasRobloxSubscription ~= true then return end
				if var1.current.getPromptState() == promptStateModule.SubscriptionStatusPolling then
					finalizeRobloxSubscriptionUpsellFlowModule(true)
				end
			end)
			
			return function()
				-- upvalues: var4 (ref)
				if var4 then
					var4:Disconnect()
				end
			end
		end
		return nil
	end, { var2 })
end