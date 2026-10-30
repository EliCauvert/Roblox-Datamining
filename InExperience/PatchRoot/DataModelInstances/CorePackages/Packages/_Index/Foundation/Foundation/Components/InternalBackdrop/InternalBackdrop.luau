local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local ConstantsModule = require(Foundation.Constants)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local MapBindableModule = require(Foundation.Utility.mapBindable)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	transparency = 0,
	testId = "--foundation-internal-backdrop",
	Size = UDim2.fromScale(2, 2)
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), MapBindableModule (copy), DashModule (copy), ConstantsModule (copy), StateLayerAffordanceModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		Size = WithDefaultsModuleResult.Size,
		backgroundStyle = MapBindableModule(WithDefaultsModuleResult.transparency, function(Alpha: number)
			-- upvalues: UseTokensModuleResult (copy)
			return {
				Color3 = UseTokensModuleResult.Color.Common.Backdrop.Color3,
				Transparency = math.lerp(UseTokensModuleResult.Color.Common.Backdrop.Transparency, 1, Alpha)
			}
		end),
		onActivated = WithDefaultsModuleResult.onActivated or DashModule.noop,
		selection = ConstantsModule.MODAL.DISABLE_SELECTION,
		stateLayer = { affordance = StateLayerAffordanceModule.None },
		tag = {
			["position-center-center"] = WithDefaultsModuleResult.Position == nil,
			["anchor-center-center"] = WithDefaultsModuleResult.AnchorPoint == nil
		},
		ref = Ref
	}))
end))