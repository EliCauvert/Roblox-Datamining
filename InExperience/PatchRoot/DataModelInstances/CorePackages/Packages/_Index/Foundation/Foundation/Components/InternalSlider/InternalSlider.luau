local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ConstantsModule = require(Foundation.Constants)
local FlagsModule = require(Foundation.Utility.Flags)
local InputModeModule = require(Foundation.Utility.Input.InputMode)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseLastInputModeModule = require(Foundation.Utility.Input.useLastInputMode)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local CursorTypeModule = require(Foundation.Enums.CursorType)
local InputSizeModule = require(Foundation.Enums.InputSize)
local OrientationModule = require(Foundation.Enums.Orientation)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local VisibilityModule = require(Foundation.Enums.Visibility)
local CursorComponentModule = require(Foundation.Providers.Cursor.CursorComponent)
local PresentationContextModule = require(Foundation.Providers.Style.PresentationContext)
local GetKnobSizeModule = require(Foundation.Components.Knob.getKnobSize)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local SizeAnchorModule = require(Foundation.Components.Slider.SizeAnchor)
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
	size = InputSizeModule.Medium,
	width = UDim.new(1, 0),
	orientation = OrientationModule.Horizontal,
	knobVisibility = VisibilityModule.Auto
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
local _Vector2 = Vector2.new(0.5, 0.5)

local function noop() end

local function getFullBounds()
	return 0, 1
end

return ReactModule.forwardRef(function(p1, p2)
	-- upvalues: WithDefaultsModule (copy), config (copy), OrientationModule (copy), UseTokensModule (copy), PresentationContextModule (copy), UseLastInputModeModule (copy), ReactModule (copy), GetKnobSizeModule (copy), UseSliderThumbsModule (copy), UseSliderCaptureModule (copy), UseSliderPointerDragModule (copy), InputModeModule (copy), GetKnobVisibilityModule (copy), ViewModule (copy), StateLayerAffordanceModule (copy), CursorTypeModule (copy), FlagsModule (copy), SizeAnchorModule (copy), _Vector2 (copy), SelectionGroup (copy), noop (copy), CursorComponentModule (copy), SliderThumbModule (copy), getFullBounds (copy), WithCommonPropsModule (copy), ConstantsModule (copy), config1 (copy)
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
	local UseRefResult1 = ReactModule.useRef(Vector2.new(KnobSizeModule.X.Offset, KnobSizeModule.Y.Offset))
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		local Current = UseRefResult.current
		
		return if Current and Current.AbsoluteSize.X > 0 and Current.AbsoluteSize.Y > 0 then UseRefResult1.current / Current.AbsoluteSize else Vector2.zero
	end, {})
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.zero)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseBindingResult2 (copy), UseResult (copy)
		UseBindingResult2(UseResult())
	end, { UseResult })
	local UseResult2 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseRefResult1 (copy), UseResult1 (copy)
		UseRefResult1.current = Frame.AbsoluteSize
		UseResult1()
	end, { UseResult1 })
	local UseResult3 = ReactModule.useCallback(function(p3)
		-- upvalues: UseResult1 (copy), WithDefaultsModuleResult (copy)
		UseResult1()
		
		if WithDefaultsModuleResult.onAbsoluteSizeChanged then
			WithDefaultsModuleResult.onAbsoluteSizeChanged(p3)
		end
	end, {
		UseResult1,
		WithDefaultsModuleResult.onAbsoluteSizeChanged
	})
	local UseSliderThumbsModuleResult = UseSliderThumbsModule({
		thumbs = WithDefaultsModuleResult.thumbs,
		range = WithDefaultsModuleResult.range,
		step = WithDefaultsModuleResult.step,
		onValueChanged = WithDefaultsModuleResult.onValueChanged,
		knobScale = UseBindingResult,
		getKnobScale = UseResult,
		isVertical = IsOrientationMatch,
		isContained = WithDefaultsModuleResult.isContained
	})
	local UseSliderCaptureModuleResult = UseSliderCaptureModule({
		thumbs = WithDefaultsModuleResult.thumbs,
		rootRef = UseRefResult,
		range = WithDefaultsModuleResult.range,
		step = WithDefaultsModuleResult.step,
		isVertical = IsOrientationMatch,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		lastInputMode = UseLastInputModeModuleResult,
		updateThumbValue = UseSliderThumbsModuleResult.updateThumbValue,
		clampToNeighbors = UseSliderThumbsModuleResult.clampToNeighbors,
		onCaptureStarted = WithDefaultsModuleResult.onDragStarted,
		onCaptureEnded = WithDefaultsModuleResult.onDragEnded
	})
	local UseSliderPointerDragModuleResult = UseSliderPointerDragModule({
		thumbs = WithDefaultsModuleResult.thumbs,
		rootRef = UseRefResult,
		isVertical = IsOrientationMatch,
		getThumbTrackFraction = UseSliderThumbsModuleResult.getThumbTrackFraction,
		seekThumbToTrackFraction = UseSliderThumbsModuleResult.seekThumbToTrackFraction,
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
			}),
			SizeAnchor = if FlagsModule.FoundationSliderAutoSizeFix then ReactModule.createElement(SizeAnchorModule) else nil
		}),
		Track = ReactModule.createElement(ReactModule.Fragment, nil, if WithDefaultsModuleResult.renderTrack then WithDefaultsModuleResult.renderTrack(UseSliderThumbsModuleResult.span) else WithDefaultsModuleResult.children),
		SelectionCursor = if UseSliderCaptureModuleResult.isCaptured then ReactModule.createElement(ViewModule, {
			ZIndex = 3,
			Size = UseBindingResult:map(function(Vector): UDim2
				return UDim2.fromScale(Vector.X, Vector.Y)
			end),
			AnchorPoint = _Vector2,
			Position = UseSliderThumbsModuleResult.positions[UseSliderCaptureModuleResult.activeThumbIndex],
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
			fraction = UseSliderThumbsModuleResult.trackFractions[i],
			isVertical = IsOrientationMatch,
			AnchorPoint = _Vector2,
			Position = UseSliderThumbsModuleResult.positions[i],
			Visible = KnobVisibilityModule,
			isDisabled = WithDefaultsModuleResult.isDisabled,
			isDragEnabled = IsNotUseLastInputModeModuleResultMatch,
			knob = WithDefaultsModuleResult.renderThumb(i, {
				isVisible = KnobVisibilityModule,
				isDragging = UseSliderPointerDragModuleResult.draggedIndex == i
			}),
			onSeek = function(p3)
				-- upvalues: UseSliderThumbsModuleResult (copy), i (copy)
				UseSliderThumbsModuleResult.seekThumbToTrackFraction(i, p3)
			end,
			getBounds = getFullBounds,
			onDragStarted = function()
				-- upvalues: UseSliderPointerDragModuleResult (copy), i (copy)
				UseSliderPointerDragModuleResult.onThumbDragStarted(i)
			end,
			onDragEnded = UseSliderPointerDragModuleResult.onThumbDragEnded,
			onAbsoluteSizeChanged = UseResult2,
			testId = thumb.testId
		})
	end
	local WithCommonPropsModuleResult = WithCommonPropsModule(WithDefaultsModuleResult, {
		Size = _UDim2,
		GroupTransparency = if WithDefaultsModuleResult.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else nil,
		selectionGroup = if UseSliderCaptureModuleResult.isCaptured then SelectionGroup else config1,
		ref = UseRefResult
	})
	WithCommonPropsModuleResult.onAbsoluteSizeChanged = UseResult3
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModuleResult, config2)
end)