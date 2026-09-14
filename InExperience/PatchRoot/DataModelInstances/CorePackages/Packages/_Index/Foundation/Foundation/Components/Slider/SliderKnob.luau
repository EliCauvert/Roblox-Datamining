local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local knobModule = require(foundation.Components.Knob)
local viewModule = require(foundation.Components.View)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local presentationContextModule = require(foundation.Providers.Style.PresentationContext)
local _ = require(foundation.Enums.InputSize)
local calculateSliderFractionModule = require(script.Parent.calculateSliderFraction)
local getGuiInputPositionModule = require(script.Parent.getGuiInputPosition)
local t = { colorNamespace = colorNamespaceModule.Inverse }

return function(p1)
	-- upvalues: reactModule (ref), calculateSliderFractionModule (ref), getGuiInputPositionModule (ref), knobModule (ref), viewModule (ref), withCommonPropsModule (ref), presentationContextModule (ref), t (ref)
	local var1 = reactModule.useRef(p1.fraction:getValue())
	
	return reactModule.createElement(viewModule, withCommonPropsModule({
		AnchorPoint = p1.AnchorPoint or (if p1.isContained then p1.fraction:map(function(p2)
			-- upvalues: p1 (ref)
			return if p1.isVertical then Vector2.new(0.5, 1 - p2) else Vector2.new(p2, 0.5)
		end) else Vector2.new(0.5, 0.5)),
		Position = p1.Position or p1.fraction:map(function(p2)
			-- upvalues: p1 (ref)
			return if p1.isVertical then UDim2.fromScale(0.5, 1 - p2) else UDim2.fromScale(p2, 0.5)
		end),
		ZIndex = p1.ZIndex or 2,
		Visible = p1.Visible,
		LayoutOrder = p1.LayoutOrder,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
		onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
		testId = p1.testId
	}, { tag = "size-0-0 auto-xy" }), {
		DragTarget = reactModule.createElement(viewModule, {
			tag = "size-full",
			ZIndex = 2,
			testId = `{p1.testId}--drag-target`
		}, {
			DragDetector = reactModule.createElement("UIDragDetector", {
				DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
				[reactModule.Event.DragStart] = reactModule.useCallback(function()
					-- upvalues: var1 (ref), p1 (ref)
					var1.current = p1.fraction:getValue()
					
					if p1.onDragStarted then
						p1.onDragStarted()
					end
				end, { p1.fraction, p1.onDragStarted }),
				[reactModule.Event.DragContinue] = reactModule.useCallback(function(_, p2)
					-- upvalues: p1 (ref), calculateSliderFractionModule (copy), getGuiInputPositionModule (copy), var1 (ref)
					local current = p1.trackRef.current
					
					if not current then return end
					local var2 = calculateSliderFractionModule(getGuiInputPositionModule(p2, current), current, p1.isVertical)
					local bounds, bounds_1 = p1.getBounds()
					local clampedValue = math.clamp(var2, bounds, bounds_1)
					
					if clampedValue ~= var1.current then
						var1.current = clampedValue
						p1.onSeek(clampedValue)
					end
				end, { p1.trackRef, p1.isVertical, p1.getBounds, p1.onSeek }),
				[reactModule.Event.DragEnd] = reactModule.useCallback(function()
					-- upvalues: p1 (ref)
					if p1.onDragEnded then
						p1.onDragEnded()
					end
				end, { p1.onDragEnded }),
				Enabled = not p1.isDisabled
			})
		}),
		Knob = if p1.knob then reactModule.createElement(viewModule, {
			tag = "size-0-0 auto-xy",
			testId = `{p1.testId}--custom-knob`
		}, p1.knob) else reactModule.createElement(presentationContextModule.Provider, { value = t }, {
			Knob = reactModule.createElement(knobModule, {
				size = p1.knobAppearance.size,
				style = p1.knobAppearance.style,
				stroke = p1.knobAppearance.stroke,
				hasShadow = p1.knobAppearance.hasShadow,
				testId = `{p1.testId}--knob`
			})
		})
	})
end