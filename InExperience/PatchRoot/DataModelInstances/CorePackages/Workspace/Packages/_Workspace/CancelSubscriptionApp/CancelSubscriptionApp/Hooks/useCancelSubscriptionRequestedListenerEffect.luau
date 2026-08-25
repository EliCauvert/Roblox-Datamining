local marketplaceService = game:GetService("MarketplaceService")
local cancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local parent = cancelSubscriptionApp.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local initiateCancelUserSubscriptionFlowModule = require(cancelSubscriptionApp.Store.Thunks.InitiateCancelUserSubscriptionFlow)
local useNetwork = require(parent.EconomyCommonCoreScriptHooks).useNetwork
local cancelUserSubscriptionAsyncPromptStateEnumModule = require(cancelSubscriptionApp.Enums.CancelUserSubscriptionAsyncPromptStateEnum)

return function(p0)
	-- upvalues: useDispatch (ref), useNetwork (ref), reactModule (ref), marketplaceService (ref), cancelUserSubscriptionAsyncPromptStateEnumModule (ref), initiateCancelUserSubscriptionFlowModule (ref)
	local var5 = useDispatch()
	local var6 = useNetwork()
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var6 (ref), marketplaceService (copy), p0 (ref), cancelUserSubscriptionAsyncPromptStateEnumModule (copy), initiateCancelUserSubscriptionFlowModule (copy)
		local var7 = if var5 and var6 then marketplaceService.PromptCancelSubscriptionRequested:Connect(function(p1)
			-- upvalues: p0 (copy), cancelUserSubscriptionAsyncPromptStateEnumModule (copy), var5 (copy), initiateCancelUserSubscriptionFlowModule (copy), var6 (copy)
			if p0 == cancelUserSubscriptionAsyncPromptStateEnumModule.None then
				var5(initiateCancelUserSubscriptionFlowModule(var6, p1))
			end
		end) else nil
		
		return function()
			-- upvalues: var7 (write)
			if var7 then
				var7:Disconnect()
				var7 = nil
			end
		end
	end, { var5, var6, p0 })
end