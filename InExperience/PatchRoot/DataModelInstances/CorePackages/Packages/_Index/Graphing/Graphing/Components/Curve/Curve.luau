local Graphing = script:FindFirstAncestor("Graphing")
local Parent = Graphing.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local CanvasContextModule = require(Graphing.CanvasContext)
local StyleUtilModule = require(Graphing.Util.StyleUtil)
local _ = require(Graphing.Types)
local UseViewportVisibilityFunction = require(Graphing.Util.useViewportBinding).useViewportVisibility
local MaxControlPoints = nil

local function _()
	-- upvalues: MaxControlPoints (ref)
	if not MaxControlPoints then
		local Path2D = Instance.new("Path2D")
		MaxControlPoints = Path2D:GetMaxControlPoints()
		Path2D:Destroy()
	end
	assert(MaxControlPoints, "MAX_POINTS_PER_PATH was nil")
	
	return MaxControlPoints
end

local function curvePointsToControlPoints(UseContextResult, Points)
	local List = {}
	
	for _, point in Points do
		local PlotToViewResult = UseContextResult.plotToView(point.Position)
		local PlotToViewResultDelta = UseContextResult.plotToView(point.Position + (if point.LeftTangent then point.LeftTangent else Vector2.new(0, 0))) - PlotToViewResult
		local PlotToViewResultDelta1 = UseContextResult.plotToView(point.Position + (if point.RightTangent then point.RightTangent else Vector2.new(0, 0))) - PlotToViewResult
		table.insert(List, Path2DControlPoint.new(UDim2.fromScale(PlotToViewResult.X, PlotToViewResult.Y), UDim2.fromScale(PlotToViewResultDelta.X, PlotToViewResultDelta.Y), UDim2.fromScale(PlotToViewResultDelta1.X, PlotToViewResultDelta1.Y)))
	end
	return List
end

local function applyControlPoints(GetResult, p1, MaxControlPoints: number)
	local Total = 1
	
	for _, child in GetResult:GetChildren() do
		local List = {}
		local CountP3 = #p1
		
		for i = Total, Total + MaxControlPoints - 1 do
			if CountP3 < i then break end
			table.insert(List, p1[i])
		end
		child:SetControlPoints(List)
		Total += MaxControlPoints - 1
	end
end

function Curve(p2)
	-- upvalues: ReactModule (copy), CanvasContextModule (copy), MaxControlPoints (ref), SignalsModule (copy), curvePointsToControlPoints (copy), applyControlPoints (copy), UseViewportVisibilityFunction (copy), StyleUtilModule (copy)
	local UseContextResult = ReactModule.useContext(CanvasContextModule)
	
	if not MaxControlPoints then
		local Path2D = Instance.new("Path2D")
		MaxControlPoints = Path2D:GetMaxControlPoints()
		Path2D:Destroy()
	end
	assert(MaxControlPoints, "MAX_POINTS_PER_PATH was nil")
	local MaxControlPoints1: number = MaxControlPoints
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		local Signal, Signal2 = SignalsModule.createSignal(nil)
		UseRefResult.current = { get = Signal, set = Signal2 }
	end
	local Current = UseRefResult.current
	local PointCount = p2.PointCount or (p2.Points and #p2.Points or 0)
	ReactModule.useLayoutEffect(function()
		-- upvalues: p2 (copy), SignalsModule (upval), UseContextResult (copy), curvePointsToControlPoints (upval), Current (copy), applyControlPoints (upval), MaxControlPoints1 (copy)
		local Computed = nil
		
		if p2.ObservePoints then
			local ObservePointsFunction = p2.ObservePoints
			Computed = SignalsModule.createComputed(function(p3)
				-- upvalues: UseContextResult (upval), curvePointsToControlPoints (upval), ObservePointsFunction (copy)
				UseContextResult.viewportRectGetter(p3)
				
				return (curvePointsToControlPoints(UseContextResult, ObservePointsFunction(p3)))
			end)
		else
			local Points = p2.Points or {}
			Computed = SignalsModule.createComputed(function(p3)
				-- upvalues: UseContextResult (upval), curvePointsToControlPoints (upval), Points (copy)
				UseContextResult.viewportRectGetter(p3)
				
				return (curvePointsToControlPoints(UseContextResult, Points))
			end)
		end
		return SignalsModule.createEffect(function(p3)
			-- upvalues: Computed (ref), p2 (upval), Current (upval), applyControlPoints (upval), MaxControlPoints1 (upval)
			local ComputedResult = Computed(p3)
			local ObserveThicknessResult = if p2.ObserveThickness then p2.ObserveThickness(p3) else nil
			local GetResult = Current.get(p3)
			
			if GetResult then
				applyControlPoints(GetResult, ComputedResult, MaxControlPoints1)
				
				if ObserveThicknessResult then
					for _, child in GetResult:GetChildren() do
						child.Thickness = ObserveThicknessResult
					end
				end
			end
		end)
	end, {
		UseContextResult,
		p2.ObservePoints,
		p2.Points,
		p2.ObserveThickness
	})
	
	if not UseViewportVisibilityFunction(function(p3)
		-- upvalues: p2 (copy)
		local Points = p2.Points
		
		if not Points or #Points == 0 then
			return true
		end
		local X = 1e999
		local Y = 1e999
		local X1 = -1e999
		local Y1 = -1e999
		
		for _, point in Points do
			local List = { point.Position }
			
			if point.LeftTangent then
				table.insert(List, point.Position + point.LeftTangent)
			end
			if point.RightTangent then
				table.insert(List, point.Position + point.RightTangent)
			end
			for _, Vector in List do
				if Vector.X < X then
					X = Vector.X
				end
				if Vector.Y < Y then
					Y = Vector.Y
				end
				if X1 < Vector.X then
					X1 = Vector.X
				end
				if Y1 < Vector.Y then
					Y1 = Vector.Y
				end
			end
		end
		return p3.isRectInViewport(Rect.new(X, Y, X1, Y1))
	end, { p2.Points }) then
		return nil
	end
	local Tag = p2.Tag or ""
	local ClipContents = p2.ClipContents ~= nil and p2.ClipContents
	local Path2Ds = {}
	local Count = 1
	
	for _ = 2, PointCount, MaxControlPoints1 - 1 do
		Path2Ds[tostring(Count)] = ReactModule.createElement("Path2D", {
			Color3 = p2.Color3 or StyleUtilModule.CURVE_COLOR3,
			Thickness = p2.Thickness or StyleUtilModule.CURVE_THICKNESS,
			ZIndex = p2.ZIndex,
			[ReactModule.Tag] = Tag
		})
		Count += 1
	end
	return ReactModule.createElement(if ClipContents then "CanvasGroup" else "Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ref = Current.set,
		Size = UDim2.fromScale(1, 1),
		ZIndex = p2.ZIndex
	}, Path2Ds)
end

return Curve