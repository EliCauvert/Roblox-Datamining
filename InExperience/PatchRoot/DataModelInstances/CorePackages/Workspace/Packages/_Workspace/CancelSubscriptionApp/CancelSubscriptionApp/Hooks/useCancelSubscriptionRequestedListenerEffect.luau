local MarketplaceService = game:GetService("MarketplaceService")
local CancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local Parent = CancelSubscriptionApp.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local InitiateCancelUserSubscriptionFlowModule = require(CancelSubscriptionApp.Store.Thunks.InitiateCancelUserSubscriptionFlow)
local UseNetworkFunction = require(Parent.EconomyCommonCoreScriptHooks).useNetwork
local CancelUserSubscriptionAsyncPromptStateEnumModule = require(CancelSubscriptionApp.Enums.CancelUserSubscriptionAsyncPromptStateEnum)

return function(None) --[[ Line: 11 | Named "useCancelSubscriptionRequestedListenerEffect" ]]
	-- upvalues: UseDispatchFunction (copy), UseNetworkFunction (copy), ReactModule (copy), MarketplaceService (copy), CancelUserSubscriptionAsyncPromptStateEnumModule (copy), InitiateCancelUserSubscriptionFlowModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNetworkResult = UseNetworkFunction()
	ReactModule.useEffect(function() --[[ Line: 14 ]]
		-- upvalues: UseDispatchResult (copy), UseNetworkResult (copy), MarketplaceService (upval), None (copy), CancelUserSubscriptionAsyncPromptStateEnumModule (upval), InitiateCancelUserSubscriptionFlowModule (upval)
		local PromptCancelSubscriptionRequestedConnection = if UseDispatchResult and UseNetworkResult then MarketplaceService.PromptCancelSubscriptionRequested:Connect(function(SubscriptionId) --[[ Line: 18 ]]
			-- upvalues: None (upval), CancelUserSubscriptionAsyncPromptStateEnumModule (upval), UseDispatchResult (upval), InitiateCancelUserSubscriptionFlowModule (upval), UseNetworkResult (upval)
			if None == CancelUserSubscriptionAsyncPromptStateEnumModule.None then
				UseDispatchResult(InitiateCancelUserSubscriptionFlowModule(UseNetworkResult, SubscriptionId))
			end
		end) else nil
		
		return function() --[[ Line: 25 ]]
			-- upvalues: PromptCancelSubscriptionRequestedConnection (ref)
			if PromptCancelSubscriptionRequestedConnection then
				PromptCancelSubscriptionRequestedConnection:Disconnect()
				PromptCancelSubscriptionRequestedConnection = nil
			end
		end
	end, { UseDispatchResult, UseNetworkResult, None })
end