local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Parent.BuilderIcons)
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local Components = Foundation.Components
local ConstantsModule = require(Foundation.Constants)
local IconModule = require(Components.Icon)
local ImageModule = require(Components.Image)
local _ = require(Components.Types)
local ViewModule = require(Components.View)
local FlagsModule = require(Foundation.Utility.Flags)
local BlendTransparenciesModule = require(Foundation.Utility.blendTransparencies)
local MapBindableModule = require(Foundation.Utility.mapBindable)
local UseBindableModule = require(Foundation.Utility.useBindable)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseKnobVariantsModule = require(script.Parent.useKnobVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local UsePresentationContextFunction = require(Foundation.Providers.Style.PresentationContext).usePresentationContext
local ColorNamespaceModule = require(Foundation.Enums.ColorNamespace)
local config = {
	hasShadow = true,
	isDisabled = false,
	testId = "--foundation-knob",
	size = require(Foundation.Enums.InputSize).Medium
}

return ReactModule.memo(function(p1) --[[ Line: 50 | Named "Knob" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UsePresentationContextFunction (copy), UseKnobVariantsModule (copy), ColorNamespaceModule (copy), FlagsModule (copy), MapBindableModule (copy), ReactModule (copy), UseBindableModule (copy), ReactIsModule (copy), ViewModule (copy), WithCommonPropsModule (copy), IconModule (copy), BlendTransparenciesModule (copy), ConstantsModule (copy), DashModule (copy), ImageModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UsePresentationContextResult = UsePresentationContextFunction()
	local UseKnobVariantsModuleResult = UseKnobVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, UsePresentationContextResult and UsePresentationContextResult.colorNamespace == ColorNamespaceModule.Inverse)
	local Style = WithDefaultsModuleResult.style or UseKnobVariantsModuleResult.knob.style
	local MapBindableModuleResult = if FlagsModule.FoundationKnobRaisedShadow then MapBindableModule(Style, function(p2) --[[ Line: 61 ]]
		return p2.Transparency or 0
	end) else nil
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 66 ]]
		-- upvalues: UseTokensModuleResult (copy)
		return {
			Color3 = UseTokensModuleResult.Color.Extended.White.White_100.Color3,
			Transparency = p2.Transparency
		}
	end, { UseTokensModuleResult })
	local UseBindableModuleResult = UseBindableModule(if WithDefaultsModuleResult.stroke then WithDefaultsModuleResult.stroke.Transparency else nil)
	local UseBindableModuleResult1 = UseBindableModule(Style)
	local UseBindableModuleResult2 = UseBindableModule(UseKnobVariantsModuleResult.knob.style)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 77 ]]
		-- upvalues: UseKnobVariantsModuleResult (copy), WithDefaultsModuleResult (copy), ReactIsModule (upval)
		local Size = UseKnobVariantsModuleResult.knob.size
		
		if WithDefaultsModuleResult.stroke and WithDefaultsModuleResult.stroke.Thickness then
			if ReactIsModule.isBinding(WithDefaultsModuleResult.stroke.Thickness) then
				return WithDefaultsModuleResult.stroke.Thickness:map(function(p2: number): UDim2 --[[ Line: 81 ]]
					-- upvalues: Size (ref)
					return Size - UDim2.fromOffset(p2 * 2, p2 * 2)
				end)
			end
			local Thickness: number = WithDefaultsModuleResult.stroke.Thickness
			Size -= UDim2.fromOffset(Thickness * 2, Thickness * 2)
		end
		return Size
	end, {
		UseKnobVariantsModuleResult,
		WithDefaultsModuleResult.stroke
	})
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		Size = UseKnobVariantsModuleResult.knob.size,
		isDisabled = WithDefaultsModuleResult.isDisabled
	}), {
		Icon = if WithDefaultsModuleResult.icon then ReactModule.createElement(ViewModule, {
			ZIndex = 4,
			tag = UseKnobVariantsModuleResult.knob.tag,
			Size = UseMemoResult,
			backgroundStyle = UseKnobVariantsModuleResult.iconContainer.backgroundStyle
		}, ReactModule.createElement(IconModule, {
			name = WithDefaultsModuleResult.icon.name,
			variant = WithDefaultsModuleResult.icon.variant,
			style = if WithDefaultsModuleResult.isDisabled then UseBindableModuleResult2:map(function(p2) --[[ Line: 113 ]]
				-- upvalues: BlendTransparenciesModule (upval), ConstantsModule (upval)
				return {
					Color3 = p2.Color3,
					Transparency = BlendTransparenciesModule(p2.Transparency, ConstantsModule.DISABLED_TRANSPARENCY)
				}
			end) else UseKnobVariantsModuleResult.knob.style,
			size = UseKnobVariantsModuleResult.knob.iconSize,
			testId = `{WithDefaultsModuleResult.testId}--icon`
		})) else ReactModule.createElement(ViewModule, {
			ZIndex = 4,
			tag = UseKnobVariantsModuleResult.knob.tag,
			backgroundStyle = if WithDefaultsModuleResult.isDisabled then UseBindableModuleResult1:map(function(p2) --[[ Line: 130 ]]
				-- upvalues: BlendTransparenciesModule (upval), ConstantsModule (upval)
				return {
					Color3 = p2.Color3,
					Transparency = BlendTransparenciesModule(p2.Transparency, ConstantsModule.DISABLED_TRANSPARENCY)
				}
			end) else Style,
			Size = UseMemoResult,
			stroke = UseBindableModuleResult:map(function(p2) --[[ Line: 139 ]]
				-- upvalues: WithDefaultsModuleResult (copy), DashModule (upval), BlendTransparenciesModule (upval), ConstantsModule (upval)
				local Stroke = WithDefaultsModuleResult.stroke
				
				if WithDefaultsModuleResult.stroke and p2 ~= nil and WithDefaultsModuleResult.isDisabled then
					Stroke = DashModule.join(Stroke, {
						Transparency = BlendTransparenciesModule(p2, ConstantsModule.DISABLED_TRANSPARENCY)
					})
				end
				return Stroke
			end):getValue(),
			testId = `{WithDefaultsModuleResult.testId}--circle`
		}),
		Shadow = if WithDefaultsModuleResult.hasShadow and not WithDefaultsModuleResult.isDisabled then if FlagsModule.FoundationKnobRaisedShadow then ReactModule.createElement(ViewModule, {
			tag = "position-center-center anchor-center-center radius-circle shadow-raised-100",
			ZIndex = 3,
			GroupTransparency = MapBindableModuleResult,
			Size = UseMemoResult,
			Visible = MapBindableModule(MapBindableModuleResult, function(p2: number): boolean --[[ Line: 163 ]]
				return p2 < 1
			end),
			testId = `{WithDefaultsModuleResult.testId}--shadow`
		}) else ReactModule.createElement(ImageModule, {
			Image = "component_assets/dropshadow_28",
			ZIndex = 3,
			tag = UseKnobVariantsModuleResult.knobShadow.tag,
			imageStyle = if ReactIsModule.isBinding(Style) then Style:map(UseResult) else UseResult(Style),
			Size = UseKnobVariantsModuleResult.knobShadow.size,
			testId = `{WithDefaultsModuleResult.testId}--shadow`
		}) else nil
	})
end)