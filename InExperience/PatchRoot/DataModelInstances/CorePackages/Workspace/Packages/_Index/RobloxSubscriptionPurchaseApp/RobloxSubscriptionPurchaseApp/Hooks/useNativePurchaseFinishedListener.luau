local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local reactModule = require(robloxSubscriptionPurchaseApp.Parent.React)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local promptStateModule = require(robloxSubscriptionPurchaseApp.Enums.PromptState)
local completeRobloxSubscriptionUpsellFlowModule = require(robloxSubscriptionPurchaseApp.Actions.completeRobloxSubscriptionUpsellFlow)

return function(p0, p1) --[[ line: 13 | named "useNativePurchaseFinishedListener" ]]
	-- upvalues: robloxSubscriptionStoreModule (ref), reactModule (ref), promptStateModule (ref), completeRobloxSubscriptionUpsellFlowModule (ref)
	local var5 = reactModule.useRef(robloxSubscriptionStoreModule.get())
	local var6 = reactModule.useMemo(function() --[[ line: 20 ]]
		-- upvalues: p0 (ref)
		return p0 or function() --[[ line: 24 ]]
			return game:GetService("MarketplaceService").NativePurchaseFinishedWithLocalPlayer
		end
	end, { p0 })
	local var7 = reactModule.useMemo(function() --[[ line: 30 ]]
		-- upvalues: p1 (ref)
		return p1 or function() --[[ line: 34 ]]
			return game:GetService("MarketplaceService").NativePurchaseFinished
		end
	end, { p1 })
	reactModule.useEffect(function() --[[ line: 40 ]]
		-- upvalues: var6 (ref), var5 (ref), promptStateModule (copy), completeRobloxSubscriptionUpsellFlowModule (copy), var7 (ref)
		local var8 = var6():Connect(function(_, p2) --[[ line: 42 ]]
			-- upvalues: var5 (copy), promptStateModule (copy), completeRobloxSubscriptionUpsellFlowModule (copy)
			local current = var5.current
			
			if current.getPromptState() == promptStateModule.SubscriptionPurchaseInProgress then
				if p2 then
					current.setDidTryPurchasing(true)
					completeRobloxSubscriptionUpsellFlowModule()
					
					return
				end
				current.setPromptState(promptStateModule.SubscriptionPurchaseUIReady)
			end
		end)
		local var9 = var7():Connect(function(_, _, p3) --[[ line: 57 ]]
			-- upvalues: var5 (copy), promptStateModule (copy), completeRobloxSubscriptionUpsellFlowModule (copy)
			local current = var5.current
			
			if current.getPromptState() == promptStateModule.SubscriptionPurchaseInProgress then
				if p3 then
					current.setDidTryPurchasing(true)
					completeRobloxSubscriptionUpsellFlowModule()
					
					return
				end
				current.setPromptState(promptStateModule.SubscriptionPurchaseUIReady)
			end
		end)
		
		return function() --[[ line: 71 ]]
			-- upvalues: var8 (ref), var9 (ref)
			if var8 then
				var8:Disconnect()
			end
			if var9 then
				var9:Disconnect()
			end
		end
	end, { var6, var7 })
end