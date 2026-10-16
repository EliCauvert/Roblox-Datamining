local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Players = game:GetService("Players")
local ReactModule = require(RobloxSubscriptionPurchaseApp.Parent.React)
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local FinalizeRobloxSubscriptionUpsellFlowModule = require(RobloxSubscriptionPurchaseApp.Actions.finalizeRobloxSubscriptionUpsellFlow)
local PromptStateModule = require(RobloxSubscriptionPurchaseApp.Enums.PromptState)

return function(p1) --[[ Line: 18 | Named "useRobloxSubscriptionChangedListener" ]]
	-- upvalues: RobloxSubscriptionStoreModule (copy), ReactModule (copy), Players (copy), PromptStateModule (copy), FinalizeRobloxSubscriptionUpsellFlowModule (copy)
	local UseRefResult = ReactModule.useRef((RobloxSubscriptionStoreModule.get()))
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 22 ]]
		-- upvalues: p1 (copy), Players (upval)
		return if p1 then p1 else function() --[[ Line: 26 ]]
			-- upvalues: Players (upval)
			return Players.LocalPlayer
		end
	end, { p1 })
	ReactModule.useEffect(function() --[[ Line: 31 ]]
		-- upvalues: UseMemoResult (copy), UseRefResult (copy), PromptStateModule (upval), FinalizeRobloxSubscriptionUpsellFlowModule (upval)
		local UseMemoResultResult = UseMemoResult()
		
		if UseMemoResultResult then
			local Connection = UseMemoResultResult:GetPropertyChangedSignal("HasRobloxSubscription"):Connect(function() --[[ Line: 37 | Named "onHasRobloxSubscriptionChanged" ]]
				-- upvalues: UseMemoResultResult (copy), UseRefResult (upval), PromptStateModule (upval), FinalizeRobloxSubscriptionUpsellFlowModule (upval)
				if UseMemoResultResult.HasRobloxSubscription ~= true then return end
				if UseRefResult.current.getPromptState() == PromptStateModule.SubscriptionStatusPolling then
					FinalizeRobloxSubscriptionUpsellFlowModule(true)
				end
			end)
			
			return function() --[[ Line: 52 ]]
				-- upvalues: Connection (copy)
				if Connection then
					Connection:Disconnect()
				end
			end
		else
			return nil
		end
	end, { UseMemoResult })
end