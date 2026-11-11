local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local InExperienceTransferFlowModule = require(CurrencyTransfers.Flows.InExperienceTransferFlow)
local InExperienceTransferUpsellAppModule = require(CurrencyTransfers.Components.InExperienceTransferUpsellApp)
local UseInExperienceTransferListenerEffectModule = require(CurrencyTransfers.Hooks.useInExperienceTransferListenerEffect)

return function()
	-- upvalues: ReactModule (copy), UseInExperienceTransferListenerEffectModule (copy), InExperienceTransferFlowModule (copy), SharedFlagsModule (copy), InExperienceTransferUpsellAppModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(nil)
	end, {})
	UseInExperienceTransferListenerEffectModule((ReactModule.useCallback(function(p1)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p2)
			-- upvalues: p1 (copy)
			return if p2 == nil then p1 else p2
		end)
	end, {})))
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy), InExperienceTransferFlowModule (upval), UseResult (copy)
		return if UseStateResult == nil then nil else InExperienceTransferFlowModule({ initiateResponse = UseStateResult, onClose = UseResult })
	end, { UseStateResult, UseResult })
	local Element = if SharedFlagsModule.GetEngineFeatureEnablePromptRobuxTransferDedicatedUpsellEvent() then ReactModule.createElement(InExperienceTransferUpsellAppModule) else nil
	local ScreenGui = if UseMemoResult then ReactModule.createElement("ScreenGui", {
		DisplayOrder = 8,
		ScreenInsets = Enum.ScreenInsets.None,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, { InExperienceTransferFlow = UseMemoResult }) else nil
	
	return if ScreenGui or Element then if Element then ReactModule.createElement(ReactModule.Fragment, nil, { FlowScreen = ScreenGui, UpsellApp = Element }) else ScreenGui else nil
end