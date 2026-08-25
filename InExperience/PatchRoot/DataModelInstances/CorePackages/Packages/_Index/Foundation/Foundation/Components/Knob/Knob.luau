local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.BuilderIcons)
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local components = foundation.Components
local constantsModule = require(foundation.Constants)
local iconModule = require(components.Icon)
local imageModule = require(components.Image)
local _ = require(components.Types)
local viewModule = require(components.View)
local blendTransparenciesModule = require(foundation.Utility.blendTransparencies)
local useBindableModule = require(foundation.Utility.useBindable)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useKnobVariantsModule = require(script.Parent.useKnobVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local usePresentationContext = require(foundation.Providers.Style.PresentationContext).usePresentationContext
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local t = {
	hasShadow = true,
	isDisabled = false,
	testId = "--foundation-knob",
	size = require(foundation.Enums.InputSize).Medium
}

return reactModule.memo(function(p0)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), usePresentationContext (ref), useKnobVariantsModule (ref), colorNamespaceModule (ref), reactModule (ref), useBindableModule (ref), reactIsModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref), blendTransparenciesModule (ref), constantsModule (ref), dashModule (ref), imageModule (ref)
	local var16 = withDefaultsModule(p0, t)
	local var17 = useTokensModule()
	local var18 = usePresentationContext()
	local var19 = useKnobVariantsModule(var17, var16.size, var18 and var18.colorNamespace == colorNamespaceModule.Inverse)
	local style = var16.style or var19.knob.style
	local var21 = reactModule.useCallback(function(p1)
		-- upvalues: var17 (ref)
		return {
			Color3 = var17.Color.Extended.White.White_100.Color3,
			Transparency = p1.Transparency
		}
	end, { var17 })
	local var22 = reactModule.useMemo(function()
		-- upvalues: var19 (ref), var16 (ref), reactIsModule (copy)
		local size = var19.knob.size
		
		if var16.stroke and var16.stroke.Thickness then
			if reactIsModule.isBinding(var16.stroke.Thickness) then
				return var16.stroke.Thickness:map(function(p2)
					-- upvalues: size (write)
					return size - UDim2.fromOffset(p2 * 2, p2 * 2)
				end)
			end
			local thickness = var16.stroke.Thickness
			size -= UDim2.fromOffset(thickness * 2, thickness * 2)
		end
		return size
	end, { var19, var16.stroke })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var16, { Size = var19.knob.size, isDisabled = var16.isDisabled }), {
		Icon = if var16.icon then reactModule.createElement(viewModule, {
			ZIndex = 4,
			tag = var19.knob.tag,
			Size = var22,
			backgroundStyle = var19.iconContainer.backgroundStyle
		}, reactModule.createElement(iconModule, {
			name = var16.icon.name,
			variant = var16.icon.variant,
			style = if var16.isDisabled then useBindableModule(var19.knob.style):map(function(p5)
				-- upvalues: blendTransparenciesModule (copy), constantsModule (copy)
				return {
					Color3 = p5.Color3,
					Transparency = blendTransparenciesModule(p5.Transparency, constantsModule.DISABLED_TRANSPARENCY)
				}
			end) else var19.knob.style,
			size = var19.knob.iconSize,
			testId = `{var16.testId}--icon`
		})) else reactModule.createElement(viewModule, {
			ZIndex = 4,
			tag = var19.knob.tag,
			backgroundStyle = if var16.isDisabled then useBindableModule(style):map(function(p3)
				-- upvalues: blendTransparenciesModule (copy), constantsModule (copy)
				return {
					Color3 = p3.Color3,
					Transparency = blendTransparenciesModule(p3.Transparency, constantsModule.DISABLED_TRANSPARENCY)
				}
			end) else style,
			Size = var22,
			stroke = useBindableModule(if var16.stroke then var16.stroke.Transparency else nil):map(function(p4)
				-- upvalues: var16 (ref), dashModule (copy), blendTransparenciesModule (copy), constantsModule (copy)
				local stroke = var16.stroke
				
				if var16.stroke and p4 ~= nil and var16.isDisabled then
					stroke = dashModule.join(stroke, {
						Transparency = blendTransparenciesModule(p4, constantsModule.DISABLED_TRANSPARENCY)
					})
				end
				return stroke
			end):getValue(),
			testId = `{var16.testId}--circle`
		}),
		Shadow = if var16.hasShadow and not var16.isDisabled then reactModule.createElement(imageModule, {
			Image = "component_assets/dropshadow_28",
			ZIndex = 3,
			tag = var19.knobShadow.tag,
			imageStyle = if reactIsModule.isBinding(style) then style:map(var21) else var21(style),
			Size = var19.knobShadow.size,
			testId = `{var16.testId}--shadow`
		}) else nil
	})
end)