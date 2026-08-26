local marketplaceService = game:GetService("MarketplaceService")
local cancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local parent = cancelSubscriptionApp.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local initiateCancelUserSubscriptionFlowModule = require(cancelSubscriptionApp.Store.Thunks.InitiateCancelUserSubscriptionFlow)
local useNetwork = require(parent.EconomyCommonCoreScriptHooks).useNetwork
local cancelUserSubscriptionAsyncPromptStateEnumModule = require(cancelSubscriptionApp.Enums.CancelUserSubscriptionAsyncPromptStateEnum)

return function(p1)
	-- upvalues: useDispatch (ref), useNetwork (ref), reactModule (ref), marketplaceService (ref), cancelUserSubscriptionAsyncPromptStateEnumModule (ref), initiateCancelUserSubscriptionFlowModule (ref)
	local var1 = useDispatch()
	local var2 = useNetwork()
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), marketplaceService (copy), p1 (ref), cancelUserSubscriptionAsyncPromptStateEnumModule (copy), initiateCancelUserSubscriptionFlowModule (copy)
		local var3 = if var1 and var2 then marketplaceService.PromptCancelSubscriptionRequested:Connect(function(p2)
			-- upvalues: p1 (copy), cancelUserSubscriptionAsyncPromptStateEnumModule (copy), var1 (copy), initiateCancelUserSubscriptionFlowModule (copy), var2 (copy)
			if p1 == cancelUserSubscriptionAsyncPromptStateEnumModule.None then
				var1(initiateCancelUserSubscriptionFlowModule(var2, p2))
			end
		end) else nil
		
		return function()
			-- upvalues: var3 (write)
			if var3 then
				var3:Disconnect()
				var3 = nil
			end
		end
	end, { var1, var2, p1 })
end