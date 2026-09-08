local graphing = script:FindFirstAncestor("Graphing")
local signalsModule = require(graphing.Parent.Signals)
local mathUtilModule = require(graphing.Util.MathUtil)
local typesModule = require(graphing.Types)
local t = {
	DEFAULT_XSCALING = {
		Type = typesModule.SCALING_LINEAR,
		Direction = typesModule.DIRECTION_FORWARD
	},
	DEFAULT_YSCALING = {
		Type = typesModule.SCALING_LINEAR,
		Direction = typesModule.DIRECTION_REVERSED
	}
}
local var1 = signalsModule.createSignal(Rect.new(0, 0, 1, 1))
local t_1 = { current = nil }

function t.createFunctions(p1, p2, p3, p4, p5, p6)
	-- upvalues: t (ref), typesModule (ref), mathUtilModule (ref), var1 (ref)
	p4 = p4 or t.DEFAULT_XSCALING
	p5 = p5 or t.DEFAULT_YSCALING
	assert(p4, "xAxisScaling was nil")
	assert(p5, "yAxisScaling was nil")
	p6 = p6 or 0.0001
	assert(p6, "defaultEpsilon was nil")
	
	local function scaled(p7, p8)
		-- upvalues: typesModule (copy), mathUtilModule (copy)
		if p8.Type == typesModule.SCALING_LINEAR then
			return p7
		elseif p8.Type == typesModule.SCALING_POWER then
			return mathUtilModule.signedPow(p7, p8.Power)
		elseif p8.Type == typesModule.SCALING_LOGARITHMIC then
			return mathUtilModule.log(p8.Base, p7)
		end
		assert(false, `Scaling type {p8} not supported`)
		
		return p7
	end
	
	local function unscaled(p7, p8)
		-- upvalues: typesModule (copy), mathUtilModule (copy)
		if p8.Type == typesModule.SCALING_LINEAR then
			return p7
		elseif p8.Type == typesModule.SCALING_POWER then
			return mathUtilModule.signedPow(p7, 1 / p8.Power)
		elseif p8.Type == typesModule.SCALING_LOGARITHMIC then
			return math.pow(p8.Base, p7)
		end
		assert(false, `Scaling type {p8} not supported`)
		
		return p7
	end
	
	local rect = Rect.new(scaled(p1.Min.X, p4), scaled(p1.Min.Y, p5), scaled(p1.Max.X, p4), scaled(p1.Max.Y, p5))
	local rect_1 = Rect.new(scaled(p2.Min.X, p4), scaled(p2.Min.Y, p5), scaled(p2.Max.X, p4), scaled(p2.Max.Y, p5))
	
	local function getViewport()
		-- upvalues: p3 (ref)
		return p3.current
	end
	
	local function getGraphRect()
		-- upvalues: p1 (ref)
		return p1
	end
	
	local function getViewportRect()
		-- upvalues: p2 (ref)
		return p2
	end
	
	local function getXAxisScaling()
		-- upvalues: p4 (write)
		return p4
	end
	
	local function getYAxisScaling()
		-- upvalues: p5 (write)
		return p5
	end
	
	local function plotToGraphX(p7)
		-- upvalues: mathUtilModule (copy), rect (ref), scaled (ref), p4 (write), typesModule (copy)
		local var2 = mathUtilModule.inverseLerp(rect.Min.X, rect.Max.X, scaled(p7, p4))
		
		if p4.Direction == typesModule.DIRECTION_REVERSED then
			var2 = 1 - var2
		end
		return var2
	end
	
	local function plotToGraphY(p7)
		-- upvalues: mathUtilModule (copy), rect (ref), scaled (ref), p5 (write), typesModule (copy)
		local var2 = mathUtilModule.inverseLerp(rect.Min.Y, rect.Max.Y, scaled(p7, p5))
		
		if p5.Direction ~= typesModule.DIRECTION_FORWARD then
			var2 = 1 - var2
		end
		return var2
	end
	
	local function plotToGraph(p7)
		-- upvalues: mathUtilModule (copy), rect (ref), scaled (ref), p4 (write), typesModule (copy), p5 (write)
		local new = Vector2.new
		local var2 = mathUtilModule.inverseLerp(rect.Min.X, rect.Max.X, scaled(p7.X, p4))
		
		if p4.Direction == typesModule.DIRECTION_REVERSED then
			var2 = 1 - var2
		end
		local var3 = mathUtilModule.inverseLerp(rect.Min.Y, rect.Max.Y, scaled(p7.Y, p5))
		
		if p5.Direction ~= typesModule.DIRECTION_FORWARD then
			var3 = 1 - var3
		end
		return new(var2, var3)
	end
	
	local function graphToPlotX(p7)
		-- upvalues: p4 (write), typesModule (copy), unscaled (ref), mathUtilModule (copy), rect (ref)
		if p4.Direction == typesModule.DIRECTION_REVERSED then
			p7 = 1 - p7
		end
		return unscaled(mathUtilModule.lerp(rect.Min.X, rect.Max.X, p7), p4)
	end
	
	local function graphToPlotY(p7)
		-- upvalues: p5 (write), typesModule (copy), unscaled (ref), mathUtilModule (copy), rect (ref)
		if p5.Direction ~= typesModule.DIRECTION_FORWARD then
			p7 = 1 - p7
		end
		return unscaled(mathUtilModule.lerp(rect.Min.Y, rect.Max.Y, p7), p5)
	end
	
	local function graphToPlot(p7)
		-- upvalues: p4 (write), typesModule (copy), mathUtilModule (copy), rect (ref), graphToPlotY (ref)
		local new = Vector2.new
		local x = p7.X
		
		if p4.Direction == typesModule.DIRECTION_REVERSED then
			x = 1 - x
		end
		local var2
		local var3 = mathUtilModule.lerp(rect.Min.X, rect.Max.X, x)
		
		if p4.Type == typesModule.SCALING_LINEAR then
			var2 = var3
		elseif p4.Type == typesModule.SCALING_POWER then
			var2 = mathUtilModule.signedPow(var3, 1 / p4.Power)
		elseif p4.Type == typesModule.SCALING_LOGARITHMIC then
			var2 = math.pow(p4.Base, var3)
		else
			assert(false, `Scaling type {p4} not supported`)
			var2 = var3
		end
		return new(var2, graphToPlotY(p7.Y))
	end
	
	local function plotToViewX(p7)
		-- upvalues: mathUtilModule (copy), rect_1 (ref), scaled (ref), p4 (write), typesModule (copy)
		local var2 = mathUtilModule.inverseLerp(rect_1.Min.X, rect_1.Max.X, scaled(p7, p4))
		
		if p4.Direction == typesModule.DIRECTION_REVERSED then
			var2 = 1 - var2
		end
		return var2
	end
	
	local function plotToViewY(p7)
		-- upvalues: mathUtilModule (copy), rect_1 (ref), scaled (ref), p5 (write), typesModule (copy)
		local var2 = mathUtilModule.inverseLerp(rect_1.Min.Y, rect_1.Max.Y, scaled(p7, p5))
		
		if p5.Direction ~= typesModule.DIRECTION_FORWARD then
			var2 = 1 - var2
		end
		return var2
	end
	
	local function plotToView(p7)
		-- upvalues: mathUtilModule (copy), rect_1 (ref), scaled (ref), p4 (write), typesModule (copy), p5 (write)
		local new = Vector2.new
		local var2 = mathUtilModule.inverseLerp(rect_1.Min.X, rect_1.Max.X, scaled(p7.X, p4))
		
		if p4.Direction == typesModule.DIRECTION_REVERSED then
			var2 = 1 - var2
		end
		local var3 = mathUtilModule.inverseLerp(rect_1.Min.Y, rect_1.Max.Y, scaled(p7.Y, p5))
		
		if p5.Direction ~= typesModule.DIRECTION_FORWARD then
			var3 = 1 - var3
		end
		return new(var2, var3)
	end
	
	local function viewToPlotX(p7)
		-- upvalues: p4 (write), typesModule (copy), unscaled (ref), mathUtilModule (copy), rect_1 (ref)
		if p4.Direction == typesModule.DIRECTION_REVERSED then
			p7 = 1 - p7
		end
		return unscaled(mathUtilModule.lerp(rect_1.Min.X, rect_1.Max.X, p7), p4)
	end
	
	local function viewToPlotY(p7)
		-- upvalues: p5 (write), typesModule (copy), unscaled (ref), mathUtilModule (copy), rect_1 (ref)
		if p5.Direction ~= typesModule.DIRECTION_FORWARD then
			p7 = 1 - p7
		end
		return unscaled(mathUtilModule.lerp(rect_1.Min.Y, rect_1.Max.Y, p7), p5)
	end
	
	local function viewToPlot(p7)
		-- upvalues: p4 (write), typesModule (copy), mathUtilModule (copy), rect_1 (ref), viewToPlotY (ref)
		local new = Vector2.new
		local x = p7.X
		
		if p4.Direction == typesModule.DIRECTION_REVERSED then
			x = 1 - x
		end
		local var2
		local var3 = mathUtilModule.lerp(rect_1.Min.X, rect_1.Max.X, x)
		
		if p4.Type == typesModule.SCALING_LINEAR then
			var2 = var3
		elseif p4.Type == typesModule.SCALING_POWER then
			var2 = mathUtilModule.signedPow(var3, 1 / p4.Power)
		elseif p4.Type == typesModule.SCALING_LOGARITHMIC then
			var2 = math.pow(p4.Base, var3)
		else
			assert(false, `Scaling type {p4} not supported`)
			var2 = var3
		end
		return new(var2, viewToPlotY(p7.Y))
	end
	
	local function absToView(value)
		-- upvalues: p3 (ref), p2 (ref), mathUtilModule (copy)
		local current = p3.current
		
		if current then
			local absolutePosition = current.AbsolutePosition
			local absoluteSize = current.AbsoluteSize
			
			return Vector2.new(mathUtilModule.inverseLerp(absolutePosition.X, absolutePosition.X + absoluteSize.X, value.X), mathUtilModule.inverseLerp(absolutePosition.Y, absolutePosition.Y + absoluteSize.Y, value.Y))
		end
		return p2.Min
	end
	
	local function viewToAbs(value)
		-- upvalues: p3 (ref), p2 (ref), mathUtilModule (copy)
		local current = p3.current
		
		if current then
			local absolutePosition = current.AbsolutePosition
			local absoluteSize = current.AbsoluteSize
			
			return Vector2.new(mathUtilModule.lerp(absolutePosition.X, absolutePosition.X + absoluteSize.X, value.X), mathUtilModule.lerp(absolutePosition.X, absolutePosition.X + absoluteSize.X, value.Y))
		end
		return p2.Min
	end
	
	local function mouseToView(value)
		-- upvalues: absToView (ref)
		return absToView(Vector2.new(value.X, value.Y))
	end
	
	return {
		getViewport = getViewport,
		getGraphRect = getGraphRect,
		getViewportRect = getViewportRect,
		getXAxisScaling = getXAxisScaling,
		getYAxisScaling = getYAxisScaling,
		plotToGraph = plotToGraph,
		plotToGraphX = plotToGraphX,
		plotToGraphY = plotToGraphY,
		graphToPlot = graphToPlot,
		graphToPlotX = graphToPlotX,
		graphToPlotY = graphToPlotY,
		plotToView = plotToView,
		plotToViewX = plotToViewX,
		plotToViewY = plotToViewY,
		viewToPlot = viewToPlot,
		viewToPlotX = viewToPlotX,
		viewToPlotY = viewToPlotY,
		absToView = absToView,
		viewToAbs = viewToAbs,
		absToPlot = function(value)
			-- upvalues: viewToPlot (ref), absToView (ref)
			return viewToPlot(absToView(value))
		end,
		plotToAbs = function(value)
			-- upvalues: viewToAbs (ref), plotToView (ref)
			return viewToAbs(plotToView(value))
		end,
		mouseToView = mouseToView,
		mouseToPlot = function(value)
			-- upvalues: viewToPlot (ref), mouseToView (ref)
			return viewToPlot(mouseToView(value))
		end,
		isPointInViewport = function(p7, p8)
			-- upvalues: p6 (write), p2 (ref)
			local x = p7.X
			p8 = p8 or p6
			local var2 = p2.Min.X - p8 <= x and x <= p2.Max.X + p8
			
			if var2 then
				local y = p7.Y
				local var3 = p8 or p6
				var2 = p2.Min.Y - var3 <= y and y <= p2.Max.Y + var3
			end
			return var2
		end,
		isPointInViewportX = function(p7, p8)
			-- upvalues: p6 (write), p2 (ref)
			p8 = p8 or p6
			
			return p2.Min.X - p8 <= p7 and p7 <= p2.Max.X + p8
		end,
		isPointInViewportY = function(p7, p8)
			-- upvalues: p6 (write), p2 (ref)
			p8 = p8 or p6
			
			return p2.Min.Y - p8 <= p7 and p7 <= p2.Max.Y + p8
		end,
		isRectInViewport = function(p7, p8)
			-- upvalues: p6 (write), p2 (ref)
			p8 = p8 or p6
			
			return p7.Min.X <= p2.Max.X + p8 and (p2.Min.X - p8 <= p7.Max.X and (p7.Min.Y <= p2.Max.Y + p8 and p2.Min.Y - p8 <= p7.Max.Y))
		end,
		viewportRectGetter = var1
	}
end

function t.createStableContext(p1, p2, p3, p4, p5, p6)
	-- upvalues: signalsModule (ref), t (ref)
	p2 = p2 or Rect.new(0, 0, 1, 1)
	p3 = p3 or p2
	local var2, var3 = signalsModule.createSignal(p3)
	local var4 = t.createFunctions(p2, p3, p1, p4, p5, p6)
	var4.viewportRectGetter = var2
	
	return var4, function(p7, p8, p9, p10, p11)
		-- upvalues: t (copy), p1 (ref), var4 (ref), var3 (ref)
		for i, v in t.createFunctions(p7, p8, p1, p9, p10, p11) do
			if i ~= "viewportRectGetter" then
				var4[i] = v
			end
		end
		var3(p8)
	end
end

function t.createDefaultFunctions()
	-- upvalues: t (ref), t_1 (ref)
	return t.createFunctions(Rect.new(0, 0, 1, 1), Rect.new(0, 0, 1, 1), t_1)
end

return t