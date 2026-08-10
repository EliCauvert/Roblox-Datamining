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
local flagsModule = require(foundation.Utility.Flags)
local t = {
	hasShadow = true,
	isDisabled = false,
	testId = "--foundation-knob",
	size = require(foundation.Enums.InputSize).Medium
}

return reactModule.memo(function(p0) --[[ line: 49 | named "Knob" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), usePresentationContext (ref), useKnobVariantsModule (ref), colorNamespaceModule (ref), reactModule (ref), useBindableModule (ref), reactIsModule (ref), viewModule (ref), withCommonPropsModule (ref), flagsModule (ref), iconModule (ref), blendTransparenciesModule (ref), constantsModule (ref), dashModule (ref), imageModule (ref)
	local var17 = withDefaultsModule(p0, t)
	local var18 = useTokensModule()
	local var19 = usePresentationContext()
	local var20 = useKnobVariantsModule(var18, var17.size, var19 and var19.colorNamespace == colorNamespaceModule.Inverse)
	local style = var17.style or var20.knob.style
	local var22 = reactModule.useCallback(function(p1) --[[ line: 60 ]]
		-- upvalues: var18 (ref)
		return {
			Color3 = var18.Color.Extended.White.White_100.Color3,
			Transparency = p1.Transparency
		}
	end, { var18 })
	local var23 = reactModule.useMemo(function() --[[ line: 71 ]]
		-- upvalues: var20 (ref), var17 (ref), reactIsModule (copy)
		local size = var20.knob.size
		
		if var17.stroke and var17.stroke.Thickness then
			if reactIsModule.isBinding(var17.stroke.Thickness) then
				return var17.stroke.Thickness:map(function(p2) --[[ line: 75 ]]
					-- upvalues: size (write)
					return size - UDim2.fromOffset(p2 * 2, p2 * 2)
				end)
			end
			local thickness = var17.stroke.Thickness
			size -= UDim2.fromOffset(thickness * 2, thickness * 2)
		end
		return size
	end, { var20, var17.stroke })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var17, {
		Size = var20.knob.size,
		isDisabled = if flagsModule.FoundationToggleVisualUpdate then var17.isDisabled else nil
	}), {
		Icon = if flagsModule.FoundationToggleVisualUpdate and var17.icon then reactModule.createElement(viewModule, {
			ZIndex = 4,
			tag = var20.knob.tag,
			Size = var23,
			backgroundStyle = var20.iconContainer.backgroundStyle
		}, reactModule.createElement(iconModule, {
			name = var17.icon.name,
			variant = var17.icon.variant,
			style = if var17.isDisabled then useBindableModule(var20.knob.style):map(function(p5) --[[ line: 107 ]]
				-- upvalues: blendTransparenciesModule (copy), constantsModule (copy)
				return {
					Color3 = p5.Color3,
					Transparency = blendTransparenciesModule(p5.Transparency, constantsModule.DISABLED_TRANSPARENCY)
				}
			end) else var20.knob.style,
			size = var20.knob.iconSize,
			testId = `{var17.testId}--icon`
		})) else reactModule.createElement(viewModule, {
			ZIndex = 4,
			tag = var20.knob.tag,
			backgroundStyle = if var17.isDisabled then useBindableModule(style):map(function(p3) --[[ line: 124 ]]
				-- upvalues: blendTransparenciesModule (copy), constantsModule (copy)
				return {
					Color3 = p3.Color3,
					Transparency = blendTransparenciesModule(p3.Transparency, constantsModule.DISABLED_TRANSPARENCY)
				}
			end) else style,
			Size = var23,
			stroke = useBindableModule(if var17.stroke then var17.stroke.Transparency else nil):map(function(p4) --[[ line: 133 ]]
				-- upvalues: var17 (ref), dashModule (copy), blendTransparenciesModule (copy), constantsModule (copy)
				local stroke = var17.stroke
				
				if var17.stroke and p4 ~= nil and var17.isDisabled then
					stroke = dashModule.join(stroke, {
						Transparency = blendTransparenciesModule(p4, constantsModule.DISABLED_TRANSPARENCY)
					})
				end
				return stroke
			end):getValue(),
			testId = `{var17.testId}--circle`
		}),
		Shadow = if var17.hasShadow and (not flagsModule.FoundationToggleVisualUpdate or not var17.isDisabled) then reactModule.createElement(imageModule, {
			Image = "component_assets/dropshadow_28",
			ZIndex = 3,
			tag = var20.knobShadow.tag,
			imageStyle = if reactIsModule.isBinding(style) then style:map(var22) else var22(style),
			Size = var20.knobShadow.size,
			testId = `{var17.testId}--shadow`
		}) else nil
	})
end)