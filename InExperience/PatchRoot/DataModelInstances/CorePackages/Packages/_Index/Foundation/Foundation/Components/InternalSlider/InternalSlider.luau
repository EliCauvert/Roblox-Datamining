local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ConstantsModule = require(Foundation.Constants)
local InputModeModule = require(Foundation.Utility.Input.InputMode)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseLastInputModeModule = require(Foundation.Utility.Input.useLastInputMode)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local CursorTypeModule = require(Foundation.Enums.CursorType)
local OrientationModule = require(Foundation.Enums.Orientation)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local CursorComponentModule = require(Foundation.Providers.Cursor.CursorComponent)
local PresentationContextModule = require(Foundation.Providers.Style.PresentationContext)
local GetKnobSizeModule = require(Foundation.Components.Knob.getKnobSize)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local SliderThumbModule = require(Foundation.Components.Slider.SliderThumb)
local GetKnobVisibilityModule = require(script.Parent.getKnobVisibility)
local UseSliderCaptureModule = require(script.Parent.useSliderCapture)
local UseSliderPointerDragModule = require(script.Parent.useSliderPointerDrag)
local UseSliderThumbsModule = require(script.Parent.useSliderThumbs)
local config = {
	isDisabled = false,
	isContained = false,
	testId = "--foundation-internal-slider",
	range = NumberRange.new(0, 1),
	size = require(Foundation.Enums.InputSize).Medium,
	width = UDim.new(1, 0),
	orientation = OrientationModule.Horizontal,
	knobVisibility = require(Foundation.Enums.Visibility).Auto
}
local SelectionGroup = {
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop
}
local config1 = {
	SelectionBehaviorLeft = Enum.SelectionBehavior.Escape,
	SelectionBehaviorRight = Enum.SelectionBehavior.Escape,
	SelectionBehaviorUp = Enum.SelectionBehavior.Escape,
	SelectionBehaviorDown = Enum.SelectionBehavior.Escape
}

local function noop() end

local function _(XScale: number, p1): UDim2
	return if p1 then UDim2.fromScale(0.5, 1 - XScale) else UDim2.fromScale(XScale, 0.5)
end

local _ = function(X: number, p1): Vector2
	return if p1 then Vector2.new(0.5, 1 - X) else Vector2.new(X, 0.5)
end

return ReactModule.forwardRef(function(p1, p2)
	-- upvalues: WithDefaultsModule (copy), config (copy), OrientationModule (copy), UseTokensModule (copy), PresentationContextModule (copy), UseLastInputModeModule (copy), ReactModule (copy), GetKnobSizeModule (copy), UseSliderThumbsModule (copy), UseSliderCaptureModule (copy), UseSliderPointerDragModule (copy), InputModeModule (copy), GetKnobVisibilityModule (copy), ViewModule (copy), StateLayerAffordanceModule (copy), CursorTypeModule (copy), SelectionGroup (copy), noop (copy), CursorComponentModule (copy), SliderThumbModule (copy), WithCommonPropsModule (copy), ConstantsModule (copy), config1 (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local IsOrientationMatch = WithDefaultsModuleResult.orientation == OrientationModule.Vertical
	local UseTokensModuleResult = UseTokensModule()
	local UsePresentationContextResult = PresentationContextModule.usePresentationContext()
	local UseLastInputModeModuleResult = UseLastInputModeModule()
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useImperativeHandle(p2, function()
		-- upvalues: UseRefResult (copy)
		return UseRefResult.current
	end, {})
	local KnobSizeModule = GetKnobSizeModule(UseTokensModuleResult, WithDefaultsModuleResult.size)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(KnobSizeModule)
	local UseResult = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(UDim2.fromOffset(Frame.AbsoluteSize.X, Frame.AbsoluteSize.Y))
	end, {})
	local UseSliderThumbsModuleResult = UseSliderThumbsModule({
		thumbs = WithDefaultsModuleResult.thumbs,
		range = WithDefaultsModuleResult.range,
		step = WithDefaultsModuleResult.step,
		onValueChanged = WithDefaultsModuleResult.onValueChanged
	})
	local UseSliderCaptureModuleResult = UseSliderCaptureModule({
		thumbs = WithDefaultsModuleResult.thumbs,
		rootRef = UseRefResult,
		range = WithDefaultsModuleResult.range,
		step = WithDefaultsModuleResult.step,
		isVertical = IsOrientationMatch,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		updateThumbValue = UseSliderThumbsModuleResult.updateThumbValue,
		clampToNeighbors = UseSliderThumbsModuleResult.clampToNeighbors
	})
	local UseSliderPointerDragModuleResult = UseSliderPointerDragModule({
		thumbs = WithDefaultsModuleResult.thumbs,
		rootRef = UseRefResult,
		isVertical = IsOrientationMatch,
		toFraction = UseSliderThumbsModuleResult.toFraction,
		seekThumb = UseSliderThumbsModuleResult.seekThumb,
		setActiveIndex = UseSliderCaptureModuleResult.setActiveIndex,
		onDragStarted = WithDefaultsModuleResult.onDragStarted,
		onDragEnded = WithDefaultsModuleResult.onDragEnded
	})
	local IsSelected = UseLastInputModeModuleResult == InputModeModule.Directional and UseSliderCaptureModuleResult.isSelected
	local IsNotUseLastInputModeModuleResultMatch = UseLastInputModeModuleResult ~= InputModeModule.Directional
	local KnobVisibilityModule = GetKnobVisibilityModule({
		knobVisibility = WithDefaultsModuleResult.knobVisibility,
		controlState = UseSliderCaptureModuleResult.controlState,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		isSelected = UseSliderCaptureModuleResult.isSelected,
		isDragging = UseSliderPointerDragModuleResult.draggedIndex ~= nil
	})
	local _UDim = UDim.new(0, KnobSizeModule.X.Offset)
	local _UDim2: UDim2 = if IsOrientationMatch then UDim2.new(_UDim, WithDefaultsModuleResult.width) else UDim2.new(WithDefaultsModuleResult.width, _UDim)
	local config2 = {
		FocusTarget = ReactModule.createElement(ViewModule, {
			ZIndex = 0,
			Size = UDim2.fromScale(1, 1),
			stateLayer = { affordance = StateLayerAffordanceModule.None },
			cursor = if UseSliderCaptureModuleResult.isCaptured then CursorTypeModule.Invisible else nil,
			onStateChanged = UseSliderCaptureModuleResult.onStateChanged,
			isDisabled = WithDefaultsModuleResult.isDisabled,
			ref = UseSliderCaptureModuleResult.focusTargetRef,
			testId = `{WithDefaultsModuleResult.testId}--focus-target`
		}, {
			DragDetector = if IsSelected then nil else ReactModule.createElement("UIDragDetector", {
				DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
				[ReactModule.Event.DragStart] = UseSliderPointerDragModuleResult.onTrackDragStarted,
				[ReactModule.Event.DragContinue] = UseSliderPointerDragModuleResult.onTrackDrag,
				[ReactModule.Event.DragEnd] = UseSliderPointerDragModuleResult.onTrackDragEnded,
				SelectionModeDragSpeed = UDim2.new(),
				Enabled = not WithDefaultsModuleResult.isDisabled
			})
		}),
		Track = ReactModule.createElement(ReactModule.Fragment, nil, WithDefaultsModuleResult.children),
		SelectionCursor = if UseSliderCaptureModuleResult.isCaptured then ReactModule.createElement(ViewModule, {
			ZIndex = 3,
			Size = UseBindingResult,
			AnchorPoint = if WithDefaultsModuleResult.isContained then UseSliderThumbsModuleResult.fractions[UseSliderCaptureModuleResult.activeThumbIndex]:map(function(X: number): Vector2
				-- upvalues: IsOrientationMatch (copy)
				return if IsOrientationMatch then Vector2.new(0.5, 1 - X) else Vector2.new(X, 0.5)
			end) else Vector2.new(0.5, 0.5),
			Position = UseSliderThumbsModuleResult.fractions[UseSliderCaptureModuleResult.activeThumbIndex]:map(function(XScale: number): UDim2
				-- upvalues: IsOrientationMatch (copy)
				return if IsOrientationMatch then UDim2.fromScale(0.5, 1 - XScale) else UDim2.fromScale(XScale, 0.5)
			end),
			selection = { Selectable = true },
			selectionGroup = SelectionGroup,
			cursor = CursorTypeModule.Invisible,
			onStateChanged = noop,
			ref = UseSliderCaptureModuleResult.captureTargetRef,
			testId = `{WithDefaultsModuleResult.testId}--selection-cursor`
		}, {
			Cursor = ReactModule.createElement(CursorComponentModule, {
				isVisible = true,
				cornerRadius = UDim.new(0.5, 0),
				offset = UseTokensModuleResult.Padding.XSmall,
				borderWidth = UseTokensModuleResult.Stroke.Thicker,
				colorNamespace = UsePresentationContextResult.colorNamespace
			})
		}) else nil
	}
	
	for i, thumb in WithDefaultsModuleResult.thumbs do
		config2[`Thumb{i}`] = ReactModule.createElement(SliderThumbModule, {
			trackRef = UseRefResult,
			fraction = UseSliderThumbsModuleResult.fractions[i],
			isVertical = IsOrientationMatch,
			Visible = KnobVisibilityModule,
			isDisabled = WithDefaultsModuleResult.isDisabled,
			isDragEnabled = IsNotUseLastInputModeModuleResultMatch,
			isContained = WithDefaultsModuleResult.isContained,
			knob = WithDefaultsModuleResult.renderThumb(i, {
				isVisible = KnobVisibilityModule,
				isDragging = UseSliderPointerDragModuleResult.draggedIndex == i
			}),
			onSeek = function(p3)
				-- upvalues: UseSliderThumbsModuleResult (copy), i (copy)
				UseSliderThumbsModuleResult.seekThumb(i, p3)
			end,
			getBounds = function()
				-- upvalues: UseSliderThumbsModuleResult (copy), i (copy)
				return UseSliderThumbsModuleResult.getThumbBounds(i)
			end,
			onDragStarted = function()
				-- upvalues: UseSliderPointerDragModuleResult (copy), i (copy)
				UseSliderPointerDragModuleResult.onThumbDragStarted(i)
			end,
			onDragEnded = UseSliderPointerDragModuleResult.onThumbDragEnded,
			onAbsoluteSizeChanged = UseResult,
			testId = thumb.testId
		})
	end
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		Size = _UDim2,
		GroupTransparency = if WithDefaultsModuleResult.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else nil,
		selectionGroup = if UseSliderCaptureModuleResult.isCaptured then SelectionGroup else config1,
		ref = UseRefResult
	}), config2)
end)