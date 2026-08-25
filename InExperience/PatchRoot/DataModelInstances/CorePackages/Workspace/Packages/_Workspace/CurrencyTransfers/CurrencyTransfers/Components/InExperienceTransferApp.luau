local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local inExperienceTransferFlowModule = require(currencyTransfers.Flows.InExperienceTransferFlow)
local inExperienceTransferUpsellAppModule = require(currencyTransfers.Components.InExperienceTransferUpsellApp)
local useInExperienceTransferListenerEffectModule = require(currencyTransfers.Hooks.useInExperienceTransferListenerEffect)

return function()
	-- upvalues: reactModule (ref), useInExperienceTransferListenerEffectModule (ref), inExperienceTransferFlowModule (ref), sharedFlagsModule (ref), inExperienceTransferUpsellAppModule (ref)
	local var6, var7 = reactModule.useState(nil)
	local var8 = reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		var7(nil)
	end, {})
	useInExperienceTransferListenerEffectModule(reactModule.useCallback(function(p0)
		-- upvalues: var7 (ref)
		var7(function(p1)
			-- upvalues: p0 (ref)
			return if p1 == nil then p0 else p1
		end)
	end, {}))
	local var9 = reactModule.useMemo(function()
		-- upvalues: var6 (ref), inExperienceTransferFlowModule (copy), var8 (ref)
		return if var6 == nil then nil else inExperienceTransferFlowModule({ initiateResponse = var6, onClose = var8 })
	end, { var6, var8 })
	local var10 = if sharedFlagsModule.GetEngineFeatureEnablePromptRobuxTransferDedicatedUpsellEvent() then reactModule.createElement(inExperienceTransferUpsellAppModule) else nil
	local var11 = if var9 then reactModule.createElement("ScreenGui", {
		DisplayOrder = 8,
		ScreenInsets = Enum.ScreenInsets.None,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, { InExperienceTransferFlow = var9 }) else nil
	
	return if not (not var11 and not var10) then if var10 then reactModule.createElement(reactModule.Fragment, nil, { FlowScreen = var11, UpsellApp = var10 }) else var11 else nil
end