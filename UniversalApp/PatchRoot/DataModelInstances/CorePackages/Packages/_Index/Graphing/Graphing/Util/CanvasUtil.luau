local Graphing = script:FindFirstAncestor("Graphing")
local SignalsModule = require(Graphing.Parent.Signals)
local MathUtilModule = require(Graphing.Util.MathUtil)
local TypesModule = require(Graphing.Types)
local Signal = SignalsModule.createSignal(Rect.new(0, 0, 1, 1))
local config = { current = nil }
local CanvasUtil = {
	DEFAULT_XSCALING = {
		Type = TypesModule.SCALING_LINEAR,
		Direction = TypesModule.DIRECTION_FORWARD
	},
	DEFAULT_YSCALING = {
		Type = TypesModule.SCALING_LINEAR,
		Direction = TypesModule.DIRECTION_REVERSED
	}
}

function CanvasUtil.createFunctions(p1, p2, p3, p4, p5, p6)
	-- upvalues: CanvasUtil (copy), TypesModule (copy), MathUtilModule (copy), Signal (copy)
	local P3 = p4 or CanvasUtil.DEFAULT_XSCALING
	local P4 = p5 or CanvasUtil.DEFAULT_YSCALING
	assert(P3, "xAxisScaling was nil")
	assert(P4, "yAxisScaling was nil")
	local P5 = p6 or 0.0001
	assert(P5, "defaultEpsilon was nil")
	
	local function scaled(X, p7)
		-- upvalues: TypesModule (upval), MathUtilModule (upval)
		if p7.Type == TypesModule.SCALING_LINEAR then
			return X
		elseif p7.Type == TypesModule.SCALING_POWER then
			return MathUtilModule.signedPow(X, p7.Power)
		elseif p7.Type == TypesModule.SCALING_LOGARITHMIC then
			return MathUtilModule.log(p7.Base, X)
		else
			assert(false, `Scaling type {p7} not supported`)
			
			return X
		end
	end
	
	local function unscaled(LerpResult: number, p7)
		-- upvalues: TypesModule (upval), MathUtilModule (upval)
		if p7.Type == TypesModule.SCALING_LINEAR then
			return LerpResult
		elseif p7.Type == TypesModule.SCALING_POWER then
			return MathUtilModule.signedPow(LerpResult, 1 / p7.Power)
		elseif p7.Type == TypesModule.SCALING_LOGARITHMIC then
			return (math.pow(p7.Base, LerpResult))
		else
			assert(false, `Scaling type {p7} not supported`)
			
			return LerpResult
		end
	end
	
	local _Rect = Rect.new(scaled(p1.Min.X, P3), scaled(p1.Min.Y, P4), scaled(p1.Max.X, P3), scaled(p1.Max.Y, P4))
	local _Rect1 = Rect.new(scaled(p2.Min.X, P3), scaled(p2.Min.Y, P4), scaled(p2.Max.X, P3), scaled(p2.Max.Y, P4))
	
	local function graphToPlotY(Y: number)
		-- upvalues: P4 (ref), TypesModule (upval), unscaled (copy), MathUtilModule (upval), _Rect (copy)
		if P4.Direction ~= TypesModule.DIRECTION_FORWARD then
			Y = 1 - Y
		end
		return unscaled(MathUtilModule.lerp(_Rect.Min.Y, _Rect.Max.Y, Y), P4)
	end
	
	local function plotToView(Vector)
		-- upvalues: MathUtilModule (upval), _Rect1 (copy), scaled (copy), P3 (ref), TypesModule (upval), P4 (ref)
		local NewFunction = Vector2.new
		local InverseLerpResult = MathUtilModule.inverseLerp(_Rect1.Min.X, _Rect1.Max.X, scaled(Vector.X, P3))
		
		if P3.Direction == TypesModule.DIRECTION_REVERSED then
			InverseLerpResult = 1 - InverseLerpResult
		end
		local InverseLerpResult1: number = InverseLerpResult
		local InverseLerpResult2 = MathUtilModule.inverseLerp(_Rect1.Min.Y, _Rect1.Max.Y, scaled(Vector.Y, P4))
		
		if P4.Direction ~= TypesModule.DIRECTION_FORWARD then
			InverseLerpResult2 = 1 - InverseLerpResult2
		end
		return NewFunction(InverseLerpResult1, InverseLerpResult2)
	end
	
	local function viewToPlotY(Y: number)
		-- upvalues: P4 (ref), TypesModule (upval), unscaled (copy), MathUtilModule (upval), _Rect1 (copy)
		if P4.Direction ~= TypesModule.DIRECTION_FORWARD then
			Y = 1 - Y
		end
		return unscaled(MathUtilModule.lerp(_Rect1.Min.Y, _Rect1.Max.Y, Y), P4)
	end
	
	local function viewToPlot(Vector)
		-- upvalues: P3 (ref), TypesModule (upval), MathUtilModule (upval), _Rect1 (copy), viewToPlotY (copy)
		local NewFunction = Vector2.new
		local X = Vector.X
		
		if P3.Direction == TypesModule.DIRECTION_REVERSED then
			X = 1 - X
		end
		local LerpResult: number = MathUtilModule.lerp(_Rect1.Min.X, _Rect1.Max.X, X)
		local P = P3
		local Powered = nil
		
		if P.Type == TypesModule.SCALING_LINEAR then
			Powered = LerpResult
		elseif P.Type == TypesModule.SCALING_POWER then
			Powered = MathUtilModule.signedPow(LerpResult, 1 / P.Power)
		elseif P.Type == TypesModule.SCALING_LOGARITHMIC then
			Powered = math.pow(P.Base, LerpResult)
		else
			assert(false, `Scaling type {P} not supported`)
			Powered = LerpResult
		end
		return NewFunction(Powered, viewToPlotY(Vector.Y))
	end
	
	local function absToView(Vector)
		-- upvalues: p3 (copy), p2 (copy), MathUtilModule (upval)
		local Current = p3.current
		
		if Current then
			local AbsolutePosition = Current.AbsolutePosition
			local AbsoluteSize = Current.AbsoluteSize
			
			return Vector2.new(MathUtilModule.inverseLerp(AbsolutePosition.X, AbsolutePosition.X + AbsoluteSize.X, Vector.X), (MathUtilModule.inverseLerp(AbsolutePosition.Y, AbsolutePosition.Y + AbsoluteSize.Y, Vector.Y)))
		else
			return p2.Min
		end
	end
	
	local function viewToAbs(Vector)
		-- upvalues: p3 (copy), p2 (copy), MathUtilModule (upval)
		local Current = p3.current
		
		if Current then
			local AbsolutePosition = Current.AbsolutePosition
			local AbsoluteSize = Current.AbsoluteSize
			
			return Vector2.new(MathUtilModule.lerp(AbsolutePosition.X, AbsolutePosition.X + AbsoluteSize.X, Vector.X), (MathUtilModule.lerp(AbsolutePosition.X, AbsolutePosition.X + AbsoluteSize.X, Vector.Y)))
		else
			return p2.Min
		end
	end
	
	local function mouseToView(Vector)
		-- upvalues: absToView (copy)
		return absToView(Vector2.new(Vector.X, Vector.Y))
	end
	
	return {
		getViewport = function()
			-- upvalues: p3 (copy)
			return p3.current
		end,
		getGraphRect = function()
			-- upvalues: p1 (copy)
			return p1
		end,
		getViewportRect = function()
			-- upvalues: p2 (copy)
			return p2
		end,
		getXAxisScaling = function()
			-- upvalues: P3 (ref)
			return P3
		end,
		getYAxisScaling = function()
			-- upvalues: P4 (ref)
			return P4
		end,
		plotToGraph = function(Vector)
			-- upvalues: MathUtilModule (upval), _Rect (copy), scaled (copy), P3 (ref), TypesModule (upval), P4 (ref)
			local NewFunction = Vector2.new
			local InverseLerpResult = MathUtilModule.inverseLerp(_Rect.Min.X, _Rect.Max.X, scaled(Vector.X, P3))
			
			if P3.Direction == TypesModule.DIRECTION_REVERSED then
				InverseLerpResult = 1 - InverseLerpResult
			end
			local InverseLerpResult1: number = InverseLerpResult
			local InverseLerpResult2 = MathUtilModule.inverseLerp(_Rect.Min.Y, _Rect.Max.Y, scaled(Vector.Y, P4))
			
			if P4.Direction ~= TypesModule.DIRECTION_FORWARD then
				InverseLerpResult2 = 1 - InverseLerpResult2
			end
			return NewFunction(InverseLerpResult1, InverseLerpResult2)
		end,
		plotToGraphX = function(p7)
			-- upvalues: MathUtilModule (upval), _Rect (copy), scaled (copy), P3 (ref), TypesModule (upval)
			local InverseLerpResult = MathUtilModule.inverseLerp(_Rect.Min.X, _Rect.Max.X, scaled(p7, P3))
			
			if P3.Direction == TypesModule.DIRECTION_REVERSED then
				InverseLerpResult = 1 - InverseLerpResult
			end
			return InverseLerpResult
		end,
		plotToGraphY = function(p7)
			-- upvalues: MathUtilModule (upval), _Rect (copy), scaled (copy), P4 (ref), TypesModule (upval)
			local InverseLerpResult = MathUtilModule.inverseLerp(_Rect.Min.Y, _Rect.Max.Y, scaled(p7, P4))
			
			if P4.Direction ~= TypesModule.DIRECTION_FORWARD then
				InverseLerpResult = 1 - InverseLerpResult
			end
			return InverseLerpResult
		end,
		graphToPlot = function(Vector)
			-- upvalues: P3 (ref), TypesModule (upval), MathUtilModule (upval), _Rect (copy), graphToPlotY (copy)
			local NewFunction = Vector2.new
			local X = Vector.X
			
			if P3.Direction == TypesModule.DIRECTION_REVERSED then
				X = 1 - X
			end
			local LerpResult: number = MathUtilModule.lerp(_Rect.Min.X, _Rect.Max.X, X)
			local P = P3
			local Powered = nil
			
			if P.Type == TypesModule.SCALING_LINEAR then
				Powered = LerpResult
			elseif P.Type == TypesModule.SCALING_POWER then
				Powered = MathUtilModule.signedPow(LerpResult, 1 / P.Power)
			elseif P.Type == TypesModule.SCALING_LOGARITHMIC then
				Powered = math.pow(P.Base, LerpResult)
			else
				assert(false, `Scaling type {P} not supported`)
				Powered = LerpResult
			end
			return NewFunction(Powered, graphToPlotY(Vector.Y))
		end,
		graphToPlotX = function(p7: number)
			-- upvalues: P3 (ref), TypesModule (upval), unscaled (copy), MathUtilModule (upval), _Rect (copy)
			if P3.Direction == TypesModule.DIRECTION_REVERSED then
				p7 = 1 - p7
			end
			return unscaled(MathUtilModule.lerp(_Rect.Min.X, _Rect.Max.X, p7), P3)
		end,
		graphToPlotY = graphToPlotY,
		plotToView = plotToView,
		plotToViewX = function(p7)
			-- upvalues: MathUtilModule (upval), _Rect1 (copy), scaled (copy), P3 (ref), TypesModule (upval)
			local InverseLerpResult = MathUtilModule.inverseLerp(_Rect1.Min.X, _Rect1.Max.X, scaled(p7, P3))
			
			if P3.Direction == TypesModule.DIRECTION_REVERSED then
				InverseLerpResult = 1 - InverseLerpResult
			end
			return InverseLerpResult
		end,
		plotToViewY = function(p7)
			-- upvalues: MathUtilModule (upval), _Rect1 (copy), scaled (copy), P4 (ref), TypesModule (upval)
			local InverseLerpResult = MathUtilModule.inverseLerp(_Rect1.Min.Y, _Rect1.Max.Y, scaled(p7, P4))
			
			if P4.Direction ~= TypesModule.DIRECTION_FORWARD then
				InverseLerpResult = 1 - InverseLerpResult
			end
			return InverseLerpResult
		end,
		viewToPlot = viewToPlot,
		viewToPlotX = function(p7: number)
			-- upvalues: P3 (ref), TypesModule (upval), unscaled (copy), MathUtilModule (upval), _Rect1 (copy)
			if P3.Direction == TypesModule.DIRECTION_REVERSED then
				p7 = 1 - p7
			end
			return unscaled(MathUtilModule.lerp(_Rect1.Min.X, _Rect1.Max.X, p7), P3)
		end,
		viewToPlotY = viewToPlotY,
		absToView = absToView,
		viewToAbs = viewToAbs,
		absToPlot = function(p7)
			-- upvalues: viewToPlot (copy), absToView (copy)
			return viewToPlot(absToView(p7))
		end,
		plotToAbs = function(p7)
			-- upvalues: viewToAbs (copy), plotToView (copy)
			return viewToAbs(plotToView(p7))
		end,
		mouseToView = mouseToView,
		mouseToPlot = function(p7)
			-- upvalues: viewToPlot (copy), mouseToView (copy)
			return viewToPlot(mouseToView(p7))
		end,
		isPointInViewport = function(Vector, p7): boolean
			-- upvalues: P5 (ref), p2 (copy)
			local X = Vector.X
			local P33 = p7 or P5
			local IsXBelow: boolean = p2.Min.X - P33 <= X and X <= p2.Max.X + P33
			
			if IsXBelow then
				local Y = Vector.Y
				local P331 = p7 or P5
				IsXBelow = p2.Min.Y - P331 <= Y and Y <= p2.Max.Y + P331
			end
			return IsXBelow
		end,
		isPointInViewportX = function(p7, p8): boolean
			-- upvalues: P5 (ref), p2 (copy)
			local P29 = p8 or P5
			
			return p2.Min.X - P29 <= p7 and p7 <= p2.Max.X + P29
		end,
		isPointInViewportY = function(p7, p8): boolean
			-- upvalues: P5 (ref), p2 (copy)
			local P31 = p8 or P5
			
			return p2.Min.Y - P31 <= p7 and p7 <= p2.Max.Y + P31
		end,
		isRectInViewport = function(p7, p8): boolean
			-- upvalues: P5 (ref), p2 (copy)
			local P35 = p8 or P5
			
			return p7.Min.X <= p2.Max.X + P35 and (p2.Min.X - P35 <= p7.Max.X and p7.Min.Y <= p2.Max.Y + P35) and p2.Min.Y - P35 <= p7.Max.Y
		end,
		viewportRectGetter = Signal
	}
end

function CanvasUtil.createStableContext(p1, p2, p3, p4, p5, p6)
	-- upvalues: SignalsModule (copy), CanvasUtil (copy)
	local P37 = p2 or Rect.new(0, 0, 1, 1)
	local P38 = p3 or P37
	local Signal, Signal2 = SignalsModule.createSignal(P38)
	local Functions = CanvasUtil.createFunctions(P37, P38, p1, p4, p5, p6)
	Functions.viewportRectGetter = Signal
	
	return Functions, function(p7, p8, p9, p10, p11)
		-- upvalues: CanvasUtil (upval), p1 (copy), Functions (copy), Signal2 (copy)
		for i, value in CanvasUtil.createFunctions(p7, p8, p1, p9, p10, p11) do
			if i ~= "viewportRectGetter" then
				Functions[i] = value
			end
		end
		Signal2(p8)
	end
end

function CanvasUtil.createDefaultFunctions()
	-- upvalues: CanvasUtil (copy), config (copy)
	return CanvasUtil.createFunctions(Rect.new(0, 0, 1, 1), Rect.new(0, 0, 1, 1), config)
end

return CanvasUtil