local Graphing = script:FindFirstAncestor("Graphing")
local Parent = Graphing.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local CanvasContextModule = require(Graphing.CanvasContext)
local CanvasUtilModule = require(Graphing.Util.CanvasUtil)
local StyleUtilModule = require(Graphing.Util.StyleUtil)
local _ = require(Graphing.Types)
local _Rect = Rect.new(0, 0, 1, 1)

function Canvas(Frame, p1) --[[ Line: 56 ]]
	-- upvalues: ReactModule (copy), _Rect (copy), CanvasUtilModule (copy), CanvasContextModule (copy), StyleUtilModule (copy), DashModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local Position = if Frame.Position then Frame.Position else UDim2.fromOffset(0, 0)
	local Size = if Frame.Size then Frame.Size else UDim2.fromScale(1, 1)
	local _UDim2 = UDim2.new(if Frame.ViewportPaddingLeft then Frame.ViewportPaddingLeft else UDim.new(0, 25), if Frame.ViewportPaddingTop then Frame.ViewportPaddingTop else UDim.new(0, 25))
	local _UDim2_1 = UDim2.new(if Frame.ViewportPaddingRight then Frame.ViewportPaddingRight else UDim.new(0, 25), if Frame.ViewportPaddingBottom then Frame.ViewportPaddingBottom else UDim.new(0, 25))
	local UseRefResult1 = ReactModule.useRef(nil)
	
	if UseRefResult1.current == nil then
		local GraphRect = Frame.GraphRect or _Rect
		local StableContext, StableContext2 = CanvasUtilModule.createStableContext(UseRefResult, GraphRect, if Frame.ViewportRect then Frame.ViewportRect else GraphRect, Frame.XAxisScaling, Frame.YAxisScaling, Frame.CullingEpsilon)
		UseRefResult1.current = { context = StableContext, update = StableContext2 }
	end
	local Current = UseRefResult1.current
	local Context = Current.context
	local UpdateFunction = Current.update
	local UseRefResult2 = ReactModule.useRef({
		graphRect = Frame.GraphRect or _Rect,
		viewportRect = Frame.ViewportRect or (Frame.GraphRect or _Rect),
		xAxisScaling = Frame.XAxisScaling,
		yAxisScaling = Frame.YAxisScaling,
		cullingEpsilon = Frame.CullingEpsilon
	})
	ReactModule.useImperativeHandle(p1, function() --[[ Line: 95 ]]
		-- upvalues: UseRefResult2 (copy), UpdateFunction (copy)
		return {
			setViewportRect = function(ViewportRect) --[[ Line: 97 ]]
				-- upvalues: UseRefResult2 (upval), UpdateFunction (upval)
				local Current = UseRefResult2.current
				Current.viewportRect = ViewportRect
				UpdateFunction(Current.graphRect, ViewportRect, Current.xAxisScaling, Current.yAxisScaling, Current.cullingEpsilon)
			end,
			setGraphRect = function(GraphRect) --[[ Line: 102 ]]
				-- upvalues: UseRefResult2 (upval), UpdateFunction (upval)
				local Current = UseRefResult2.current
				Current.graphRect = GraphRect
				UpdateFunction(GraphRect, Current.viewportRect, Current.xAxisScaling, Current.yAxisScaling, Current.cullingEpsilon)
			end,
			update = function(GraphRect, ViewportRect, XAxisScaling, YAxisScaling, CullingEpsilon) --[[ Line: 107 ]]
				-- upvalues: UseRefResult2 (upval), UpdateFunction (upval)
				local Current = UseRefResult2.current
				Current.graphRect = GraphRect
				Current.viewportRect = ViewportRect
				Current.xAxisScaling = XAxisScaling
				Current.yAxisScaling = YAxisScaling
				Current.cullingEpsilon = CullingEpsilon
				UpdateFunction(GraphRect, ViewportRect, XAxisScaling, YAxisScaling, CullingEpsilon)
			end
		}
	end, {})
	ReactModule.useLayoutEffect(function() --[[ Line: 126 ]]
		-- upvalues: Frame (copy), UseRefResult2 (copy), UpdateFunction (copy)
		if Frame.GraphRect then
			local GraphRect = Frame.GraphRect
			local ViewportRect = if Frame.ViewportRect then Frame.ViewportRect else GraphRect
			UseRefResult2.current.graphRect = GraphRect
			UseRefResult2.current.viewportRect = ViewportRect
			UseRefResult2.current.xAxisScaling = Frame.XAxisScaling
			UseRefResult2.current.yAxisScaling = Frame.YAxisScaling
			UseRefResult2.current.cullingEpsilon = Frame.CullingEpsilon
			UpdateFunction(GraphRect, ViewportRect, Frame.XAxisScaling, Frame.YAxisScaling, Frame.CullingEpsilon)
		end
	end, {
		Frame.GraphRect,
		Frame.ViewportRect,
		Frame.XAxisScaling,
		Frame.YAxisScaling,
		Frame.CullingEpsilon
	})
	
	return ReactModule.createElement(CanvasContextModule.Provider, { value = Context }, {
		MainPanel = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = Position,
			Size = Size,
			LayoutOrder = Frame.LayoutOrder,
			ZIndex = Frame.ZIndex,
			BackgroundColor3 = Frame.CanvasBackgroundColor3 or StyleUtilModule.CANVAS_BACKGROUND_COLOR3,
			BackgroundTransparency = Frame.CanvasBackgroundTransparency or StyleUtilModule.CANVAS_BACKGROUND_TRANSPARENCY
		}, DashModule.join({
			Viewport = ReactModule.createElement("CanvasGroup", {
				BorderSizePixel = 0,
				ZIndex = 1,
				Position = _UDim2,
				Size = UDim2.fromScale(1, 1) - (_UDim2 + _UDim2_1),
				ref = UseRefResult,
				BackgroundColor3 = Frame.ViewportBackgroundColor3 or StyleUtilModule.VIEWPORT_BACKGROUND_COLOR3,
				BackgroundTransparency = Frame.ViewportBackgroundTransparency or StyleUtilModule.VIEWPORT_BACKGROUND_TRANSPARENCY
			}, Frame.children),
			ViewportUnclipped = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Position = _UDim2,
				Size = UDim2.fromScale(1, 1) - (_UDim2 + _UDim2_1)
			}, Frame.childrenUnclipped)
		}))
	})
end

return ReactModule.forwardRef(Canvas)