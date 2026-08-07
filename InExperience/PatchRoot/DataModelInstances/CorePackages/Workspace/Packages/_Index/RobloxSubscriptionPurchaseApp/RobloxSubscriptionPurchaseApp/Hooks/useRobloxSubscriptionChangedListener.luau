local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local playersService = game:GetService("Players")
local reactModule = require(robloxSubscriptionPurchaseApp.Parent.React)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local finalizeRobloxSubscriptionUpsellFlowModule = require(robloxSubscriptionPurchaseApp.Actions.finalizeRobloxSubscriptionUpsellFlow)
local promptStateModule = require(robloxSubscriptionPurchaseApp.Enums.PromptState)

return function(p0) --[[ line: 18 | named "useRobloxSubscriptionChangedListener" ]]
	-- upvalues: robloxSubscriptionStoreModule (ref), reactModule (ref), playersService (ref), promptStateModule (ref), finalizeRobloxSubscriptionUpsellFlowModule (ref)
	local var6 = reactModule.useRef(robloxSubscriptionStoreModule.get())
	local var7 = reactModule.useMemo(function() --[[ line: 22 ]]
		-- upvalues: p0 (ref), playersService (copy)
		return p0 or function() --[[ line: 26 ]]
			-- upvalues: playersService (copy)
			return playersService.LocalPlayer
		end
	end, { p0 })
	reactModule.useEffect(function() --[[ line: 31 ]]
		-- upvalues: var7 (ref), var6 (ref), promptStateModule (copy), finalizeRobloxSubscriptionUpsellFlowModule (copy)
		local var8 = var7()
		
		if var8 then
			local var9 = var8:GetPropertyChangedSignal("HasRobloxSubscription"):Connect(function() --[[ line: 37 | named "onHasRobloxSubscriptionChanged" ]]
				-- upvalues: var8 (ref), var6 (copy), promptStateModule (copy), finalizeRobloxSubscriptionUpsellFlowModule (copy)
				if var8.HasRobloxSubscription ~= true then return end
				if var6.current.getPromptState() == promptStateModule.SubscriptionStatusPolling then
					finalizeRobloxSubscriptionUpsellFlowModule(true)
				end
			end)
			
			return function() --[[ line: 52 ]]
				-- upvalues: var9 (ref)
				if var9 then
					var9:Disconnect()
				end
			end
		end
		return nil
	end, { var7 })
end