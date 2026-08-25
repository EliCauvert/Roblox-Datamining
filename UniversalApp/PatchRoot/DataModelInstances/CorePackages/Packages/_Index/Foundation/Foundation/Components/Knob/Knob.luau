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

return reactModule.memo(function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), usePresentationContext (ref), useKnobVariantsModule (ref), colorNamespaceModule (ref), reactModule (ref), useBindableModule (ref), reactIsModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref), blendTransparenciesModule (ref), constantsModule (ref), dashModule (ref), imageModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3 = usePresentationContext()
	local var4 = useKnobVariantsModule(var2, var1.size, var3 and var3.colorNamespace == colorNamespaceModule.Inverse)
	local style = var1.style or var4.knob.style
	local var5 = reactModule.useCallback(function(p1)
		-- upvalues: var2 (ref)
		return {
			Color3 = var2.Color.Extended.White.White_100.Color3,
			Transparency = p1.Transparency
		}
	end, { var2 })
	local var6 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), var1 (ref), reactIsModule (copy)
		local size = var4.knob.size
		
		if var1.stroke and var1.stroke.Thickness then
			if reactIsModule.isBinding(var1.stroke.Thickness) then
				return var1.stroke.Thickness:map(function(p1)
					-- upvalues: size (write)
					return size - UDim2.fromOffset(p1 * 2, p1 * 2)
				end)
			end
			local thickness = var1.stroke.Thickness
			size -= UDim2.fromOffset(thickness * 2, thickness * 2)
		end
		return size
	end, { var4, var1.stroke })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, { Size = var4.knob.size, isDisabled = var1.isDisabled }), {
		Icon = if var1.icon then reactModule.createElement(viewModule, {
			ZIndex = 4,
			tag = var4.knob.tag,
			Size = var6,
			backgroundStyle = var4.iconContainer.backgroundStyle
		}, reactModule.createElement(iconModule, {
			name = var1.icon.name,
			variant = var1.icon.variant,
			style = if var1.isDisabled then useBindableModule(var4.knob.style):map(function(p1)
				-- upvalues: blendTransparenciesModule (copy), constantsModule (copy)
				return {
					Color3 = p1.Color3,
					Transparency = blendTransparenciesModule(p1.Transparency, constantsModule.DISABLED_TRANSPARENCY)
				}
			end) else var4.knob.style,
			size = var4.knob.iconSize,
			testId = `{var1.testId}--icon`
		})) else reactModule.createElement(viewModule, {
			ZIndex = 4,
			tag = var4.knob.tag,
			backgroundStyle = if var1.isDisabled then useBindableModule(style):map(function(p1)
				-- upvalues: blendTransparenciesModule (copy), constantsModule (copy)
				return {
					Color3 = p1.Color3,
					Transparency = blendTransparenciesModule(p1.Transparency, constantsModule.DISABLED_TRANSPARENCY)
				}
			end) else style,
			Size = var6,
			stroke = useBindableModule(if var1.stroke then var1.stroke.Transparency else nil):map(function(p1)
				-- upvalues: var1 (ref), dashModule (copy), blendTransparenciesModule (copy), constantsModule (copy)
				local stroke = var1.stroke
				
				if var1.stroke and p1 ~= nil and var1.isDisabled then
					stroke = dashModule.join(stroke, {
						Transparency = blendTransparenciesModule(p1, constantsModule.DISABLED_TRANSPARENCY)
					})
				end
				return stroke
			end):getValue(),
			testId = `{var1.testId}--circle`
		}),
		Shadow = if var1.hasShadow and not var1.isDisabled then reactModule.createElement(imageModule, {
			Image = "component_assets/dropshadow_28",
			ZIndex = 3,
			tag = var4.knobShadow.tag,
			imageStyle = if reactIsModule.isBinding(style) then style:map(var5) else var5(style),
			Size = var4.knobShadow.size,
			testId = `{var1.testId}--shadow`
		}) else nil
	})
end)