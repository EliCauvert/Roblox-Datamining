local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local inExperienceTransferFlowModule = require(currencyTransfers.Flows.InExperienceTransferFlow)
local inExperienceTransferUpsellAppModule = require(currencyTransfers.Components.InExperienceTransferUpsellApp)
local useInExperienceTransferListenerEffectModule = require(currencyTransfers.Hooks.useInExperienceTransferListenerEffect)

return function()
	-- upvalues: reactModule (ref), useInExperienceTransferListenerEffectModule (ref), inExperienceTransferFlowModule (ref), sharedFlagsModule (ref), inExperienceTransferUpsellAppModule (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(nil)
	end, {})
	useInExperienceTransferListenerEffectModule(reactModule.useCallback(function(p1)
		-- upvalues: var2 (ref)
		var2(function(p2)
			-- upvalues: p1 (ref)
			return if p2 == nil then p1 else p2
		end)
	end, {}))
	local var4 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), inExperienceTransferFlowModule (copy), var3 (ref)
		return if var1 == nil then nil else inExperienceTransferFlowModule({ initiateResponse = var1, onClose = var3 })
	end, { var1, var3 })
	local var5 = if sharedFlagsModule.GetEngineFeatureEnablePromptRobuxTransferDedicatedUpsellEvent() then reactModule.createElement(inExperienceTransferUpsellAppModule) else nil
	local var6 = if var4 then reactModule.createElement("ScreenGui", {
		DisplayOrder = 8,
		ScreenInsets = Enum.ScreenInsets.None,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, { InExperienceTransferFlow = var4 }) else nil
	
	return if not (not var6 and not var5) then if var5 then reactModule.createElement(reactModule.Fragment, nil, { FlowScreen = var6, UpsellApp = var5 }) else var6 else nil
end