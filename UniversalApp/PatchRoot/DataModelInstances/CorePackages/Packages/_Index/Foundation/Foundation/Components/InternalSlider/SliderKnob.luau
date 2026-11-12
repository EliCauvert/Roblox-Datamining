local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local KnobModule = require(Foundation.Components.Knob)
local _ = require(Foundation.Components.Types)
local BlendTransparenciesModule = require(Foundation.Utility.blendTransparencies)
local _ = require(Foundation.Enums.InputSize)
local PresentationContextModule = require(Foundation.Providers.Style.PresentationContext)
local _ = require(Foundation.Components.Slider.useSliderVariants)
local config = {
	colorNamespace = require(Foundation.Enums.ColorNamespace).Inverse
}

return function(p1)
	-- upvalues: ReactModule (copy), BlendTransparenciesModule (copy), PresentationContextModule (copy), config (copy), KnobModule (copy)
	return ReactModule.createElement(PresentationContextModule.Provider, { value = config }, {
		Knob = ReactModule.createElement(KnobModule, {
			size = p1.size,
			style = ReactModule.useMemo(function()
				-- upvalues: p1 (copy)
				return if p1.isVisible then if p1.isDragging then p1.variant.dragStyle else p1.variant.style else { Transparency = 1, Color3 = p1.variant.style.Color3 }
			end, {
				p1.variant.style,
				p1.variant.dragStyle,
				p1.isVisible,
				p1.isDragging
			}),
			stroke = ReactModule.useMemo(function()
				-- upvalues: p1 (copy), BlendTransparenciesModule (upval)
				return if p1.variant.stroke then {
					Color = p1.variant.stroke.Color,
					Thickness = p1.variant.stroke.Thickness,
					Transparency = BlendTransparenciesModule(if typeof(p1.variant.stroke.Transparency) == "number" then p1.variant.stroke.Transparency else nil, if p1.isVisible then 0 else 1)
				} else nil
			end, { p1.variant.stroke, p1.isVisible }),
			hasShadow = p1.variant.hasShadow,
			testId = p1.testId
		})
	})
end