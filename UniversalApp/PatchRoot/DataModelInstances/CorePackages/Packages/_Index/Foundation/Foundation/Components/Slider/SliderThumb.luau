local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Types)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local KnobModule = require(Foundation.Components.Knob)
local ViewModule = require(Foundation.Components.View)
local PresentationContextModule = require(Foundation.Providers.Style.PresentationContext)
local _ = require(Foundation.Enums.InputSize)
local CalculateSliderFractionModule = require(script.Parent.calculateSliderFraction)
local GetGuiInputPositionModule = require(script.Parent.getGuiInputPosition)
local config = {
	colorNamespace = require(Foundation.Enums.ColorNamespace).Inverse
}

return function(Frame: Frame)
	-- upvalues: ReactModule (copy), CalculateSliderFractionModule (copy), GetGuiInputPositionModule (copy), KnobModule (copy), ViewModule (copy), WithCommonPropsModule (copy), PresentationContextModule (copy), config (copy)
	local UseRefResult = ReactModule.useRef(Frame.fraction:getValue())
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), Frame (copy)
		UseRefResult.current = Frame.fraction:getValue()
		
		if Frame.onDragStarted then
			Frame.onDragStarted()
		end
	end, { Frame.fraction, Frame.onDragStarted })
	local UseResult1 = ReactModule.useCallback(function(_, p1)
		-- upvalues: Frame (copy), CalculateSliderFractionModule (upval), GetGuiInputPositionModule (upval), UseRefResult (copy)
		local Current = Frame.trackRef.current
		
		if not Current then return end
		local SliderFractionModule: number = CalculateSliderFractionModule(GetGuiInputPositionModule(p1, Current), Current, Frame.isVertical)
		local Bounds, Bounds2 = Frame.getBounds()
		local ClampedValue = math.clamp(SliderFractionModule, Bounds, Bounds2)
		
		if ClampedValue ~= UseRefResult.current then
			UseRefResult.current = ClampedValue
			Frame.onSeek(ClampedValue)
		end
	end, {
		Frame.trackRef,
		Frame.isVertical,
		Frame.getBounds,
		Frame.onSeek
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: Frame (copy)
		if Frame.onDragEnded then
			Frame.onDragEnded()
		end
	end, { Frame.onDragEnded })
	local MapResult = Frame.fraction:map(function(XScale: number): UDim2
		-- upvalues: Frame (copy)
		return if Frame.isVertical then UDim2.fromScale(0.5, 1 - XScale) else UDim2.fromScale(XScale, 0.5)
	end)
	local MapResult1 = if Frame.isContained then Frame.fraction:map(function(X: number): Vector2
		-- upvalues: Frame (copy)
		return if Frame.isVertical then Vector2.new(0.5, 1 - X) else Vector2.new(X, 0.5)
	end) else Vector2.new(0.5, 0.5)
	local Element = if Frame.knobAppearance then ReactModule.createElement(KnobModule, {
		size = Frame.knobAppearance.size,
		style = Frame.knobAppearance.style,
		stroke = Frame.knobAppearance.stroke,
		hasShadow = Frame.knobAppearance.hasShadow,
		testId = `{Frame.testId}--knob`
	}) else nil
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule({
		AnchorPoint = Frame.AnchorPoint or MapResult1,
		Position = Frame.Position or MapResult,
		ZIndex = Frame.ZIndex or 2,
		Visible = Frame.Visible,
		LayoutOrder = Frame.LayoutOrder,
		onAbsoluteSizeChanged = Frame.onAbsoluteSizeChanged,
		onAbsolutePositionChanged = Frame.onAbsolutePositionChanged,
		testId = Frame.testId
	}, { tag = "size-0-0 auto-xy" }), {
		DragTarget = ReactModule.createElement(ViewModule, {
			tag = "size-full",
			ZIndex = 2,
			testId = `{Frame.testId}--drag-target`
		}, {
			DragDetector = if Frame.isDragEnabled == false then nil else ReactModule.createElement("UIDragDetector", {
				DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
				[ReactModule.Event.DragStart] = UseResult,
				[ReactModule.Event.DragContinue] = UseResult1,
				[ReactModule.Event.DragEnd] = UseResult2,
				Enabled = not Frame.isDisabled
			})
		}),
		Knob = if Frame.knob then ReactModule.createElement(ViewModule, {
			tag = "size-0-0 auto-xy",
			testId = `{Frame.testId}--custom-knob`
		}, Frame.knob) else ReactModule.createElement(PresentationContextModule.Provider, { value = config }, { Knob = Element })
	})
end