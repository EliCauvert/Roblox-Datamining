local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ScrollViewModule = require(Foundation.Components.ScrollView)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)

local function computeAutomaticSize(p1)
	return if p1.autoSize then if p1.isOverMaxHeight then Enum.AutomaticSize.X else Enum.AutomaticSize.XY elseif p1.isOverMaxHeight then Enum.AutomaticSize.None else Enum.AutomaticSize.Y
end

local function computeSize(p1): UDim2
	local _UDim: UDim = if p1.isOverMaxHeight and p1.maxHeight then UDim.new(0, p1.maxHeight) else UDim.new()
	
	return if p1.autoSize then UDim2.new(UDim.new(), _UDim) else UDim2.new(p1.width or UDim.new(), _UDim)
end

return function(p1)
	-- upvalues: ReactModule (copy), computeAutomaticSize (copy), ScrollViewModule (copy), WithCommonPropsModule (copy), computeSize (copy), ViewModule (copy)
	local UseBindingResult = ReactModule.useBinding(true)
	local UseBindingResult1 = ReactModule.useBinding(nil)
	local AutoSize = p1.autoSize or UseBindingResult
	local Width = p1.width or UseBindingResult1
	local MaxHeight = p1.maxHeight
	local UseBindingResult2, UseBindingResult21 = ReactModule.useBinding(UDim2.fromScale(0, 1))
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), UseBindingResult2 (copy), MaxHeight (copy)
		return ReactModule.joinBindings({ canvasSize = UseBindingResult2, maxHeight = MaxHeight }):map(function(p2): boolean
			return p2.maxHeight ~= nil and p2.maxHeight < p2.canvasSize.Y.Offset
		end)
	end, { MaxHeight })
	local MapResult = ReactModule.joinBindings({ autoSize = AutoSize, isOverMaxHeight = UseMemoResult }):map(computeAutomaticSize)
	
	return ReactModule.createElement(ScrollViewModule, WithCommonPropsModule(p1.scrollViewProps, {
		ref = p1.scrollViewProps.ref,
		sizeConstraint = p1.scrollViewProps.sizeConstraint,
		tag = p1.scrollViewProps.tag,
		InputSink = p1.scrollViewProps.InputSink,
		scrollingFrameRef = p1.scrollViewProps.scrollingFrameRef,
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			AutomaticSize = MapResult,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			CanvasSize = UseBindingResult2
		},
		AutomaticSize = MapResult,
		Size = ReactModule.joinBindings({
			autoSize = AutoSize,
			width = Width,
			isOverMaxHeight = UseMemoResult,
			maxHeight = MaxHeight
		}):map(computeSize)
	}), ReactModule.createElement(ViewModule, {
		tag = "col size-full-0 auto-y",
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame: Frame)
			-- upvalues: UseBindingResult21 (copy)
			return UseBindingResult21(UDim2.fromOffset(Frame.AbsoluteSize.X, Frame.AbsoluteSize.Y))
		end, { UseBindingResult21 })
	}, p1.children))
end