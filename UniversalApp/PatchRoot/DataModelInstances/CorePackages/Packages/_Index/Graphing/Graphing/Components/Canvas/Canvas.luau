local graphing = script:FindFirstAncestor("Graphing")
local parent = graphing.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local canvasContextModule = require(graphing.CanvasContext)
local canvasUtilModule = require(graphing.Util.CanvasUtil)
local styleUtilModule = require(graphing.Util.StyleUtil)
local _ = require(graphing.Types)
local rect = Rect.new(0, 0, 1, 1)

function Canvas(p1, p2)
	-- upvalues: reactModule (ref), rect (ref), canvasUtilModule (ref), canvasContextModule (ref), styleUtilModule (ref), dashModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = if p1.Position then p1.Position else UDim2.fromOffset(0, 0)
	local var3 = if p1.Size then p1.Size else UDim2.fromScale(1, 1)
	local uDim2 = UDim2.new(if p1.ViewportPaddingLeft then p1.ViewportPaddingLeft else UDim.new(0, 25), if p1.ViewportPaddingTop then p1.ViewportPaddingTop else UDim.new(0, 25))
	local uDim2_1 = UDim2.new(if p1.ViewportPaddingRight then p1.ViewportPaddingRight else UDim.new(0, 25), if p1.ViewportPaddingBottom then p1.ViewportPaddingBottom else UDim.new(0, 25))
	local var4 = reactModule.useRef(nil)
	
	if var4.current == nil then
		local graphRect = p1.GraphRect or rect
		local var5, var6 = canvasUtilModule.createStableContext(var1, graphRect, if p1.ViewportRect then p1.ViewportRect else graphRect, p1.XAxisScaling, p1.YAxisScaling, p1.CullingEpsilon)
		var4.current = { context = var5, update = var6 }
	end
	local current = var4.current
	local context = current.context
	local update = current.update
	local var7 = reactModule.useRef({
		graphRect = p1.GraphRect or rect,
		viewportRect = p1.ViewportRect or (p1.GraphRect or rect),
		xAxisScaling = p1.XAxisScaling,
		yAxisScaling = p1.YAxisScaling,
		cullingEpsilon = p1.CullingEpsilon
	})
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var7 (ref), update (ref)
		return {
			setViewportRect = function(value)
				-- upvalues: var7 (copy), update (copy)
				local current = var7.current
				current.viewportRect = value
				update(current.graphRect, value, current.xAxisScaling, current.yAxisScaling, current.cullingEpsilon)
			end,
			setGraphRect = function(value)
				-- upvalues: var7 (copy), update (copy)
				local current = var7.current
				current.graphRect = value
				update(value, current.viewportRect, current.xAxisScaling, current.yAxisScaling, current.cullingEpsilon)
			end,
			update = function(p3, p4, p5, p6, p7)
				-- upvalues: var7 (copy), update (copy)
				local current = var7.current
				current.graphRect = p3
				current.viewportRect = p4
				current.xAxisScaling = p5
				current.yAxisScaling = p6
				current.cullingEpsilon = p7
				update(p3, p4, p5, p6, p7)
			end
		}
	end, {})
	reactModule.useLayoutEffect(function()
		-- upvalues: p1 (ref), var7 (ref), update (ref)
		if p1.GraphRect then
			local graphRect = p1.GraphRect
			local var8 = if p1.ViewportRect then p1.ViewportRect else graphRect
			var7.current.graphRect = graphRect
			var7.current.viewportRect = var8
			var7.current.xAxisScaling = p1.XAxisScaling
			var7.current.yAxisScaling = p1.YAxisScaling
			var7.current.cullingEpsilon = p1.CullingEpsilon
			update(graphRect, var8, p1.XAxisScaling, p1.YAxisScaling, p1.CullingEpsilon)
		end
	end, {
		p1.GraphRect,
		p1.ViewportRect,
		p1.XAxisScaling,
		p1.YAxisScaling,
		p1.CullingEpsilon
	})
	
	return reactModule.createElement(canvasContextModule.Provider, { value = context }, {
		MainPanel = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = var2,
			Size = var3,
			LayoutOrder = p1.LayoutOrder,
			ZIndex = p1.ZIndex,
			BackgroundColor3 = p1.CanvasBackgroundColor3 or styleUtilModule.CANVAS_BACKGROUND_COLOR3,
			BackgroundTransparency = p1.CanvasBackgroundTransparency or styleUtilModule.CANVAS_BACKGROUND_TRANSPARENCY
		}, dashModule.join({
			Viewport = reactModule.createElement("CanvasGroup", {
				BorderSizePixel = 0,
				ZIndex = 1,
				Position = uDim2,
				Size = UDim2.fromScale(1, 1) - (uDim2 + uDim2_1),
				ref = var1,
				BackgroundColor3 = p1.ViewportBackgroundColor3 or styleUtilModule.VIEWPORT_BACKGROUND_COLOR3,
				BackgroundTransparency = p1.ViewportBackgroundTransparency or styleUtilModule.VIEWPORT_BACKGROUND_TRANSPARENCY
			}, p1.children),
			ViewportUnclipped = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Position = uDim2,
				Size = UDim2.fromScale(1, 1) - (uDim2 + uDim2_1)
			}, p1.childrenUnclipped)
		}))
	})
end

return reactModule.forwardRef(Canvas)