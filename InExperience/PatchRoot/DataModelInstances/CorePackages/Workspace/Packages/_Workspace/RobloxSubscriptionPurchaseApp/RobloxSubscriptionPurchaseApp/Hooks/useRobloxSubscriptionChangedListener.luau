local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Players = game:GetService("Players")
local ReactModule = require(RobloxSubscriptionPurchaseApp.Parent.React)
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local FinalizeRobloxSubscriptionUpsellFlowModule = require(RobloxSubscriptionPurchaseApp.Actions.finalizeRobloxSubscriptionUpsellFlow)
local PromptStateModule = require(RobloxSubscriptionPurchaseApp.Enums.PromptState)

return function(p1)
	-- upvalues: RobloxSubscriptionStoreModule (copy), ReactModule (copy), Players (copy), PromptStateModule (copy), FinalizeRobloxSubscriptionUpsellFlowModule (copy)
	local UseRefResult = ReactModule.useRef((RobloxSubscriptionStoreModule.get()))
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), Players (upval)
		return if p1 then p1 else function()
			-- upvalues: Players (upval)
			return Players.LocalPlayer
		end
	end, { p1 })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), UseRefResult (copy), PromptStateModule (upval), FinalizeRobloxSubscriptionUpsellFlowModule (upval)
		local UseMemoResultResult = UseMemoResult()
		
		if UseMemoResultResult then
			local Connection = UseMemoResultResult:GetPropertyChangedSignal("HasRobloxSubscription"):Connect(function()
				-- upvalues: UseMemoResultResult (copy), UseRefResult (upval), PromptStateModule (upval), FinalizeRobloxSubscriptionUpsellFlowModule (upval)
				if UseMemoResultResult.HasRobloxSubscription ~= true then return end
				if UseRefResult.current.getPromptState() == PromptStateModule.SubscriptionStatusPolling then
					FinalizeRobloxSubscriptionUpsellFlowModule(true)
				end
			end)
			
			return function()
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