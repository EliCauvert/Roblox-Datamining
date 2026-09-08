local graphing = script:FindFirstAncestor("Graphing")
local parent = graphing.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local canvasContextModule = require(graphing.CanvasContext)
local styleUtilModule = require(graphing.Util.StyleUtil)
local _ = require(graphing.Types)
local useViewportVisibility = require(graphing.Util.useViewportBinding).useViewportVisibility
local var1 = nil

local function _()
	-- upvalues: var1 (write)
	if not var1 then
		local path2D = Instance.new("Path2D")
		var1 = path2D:GetMaxControlPoints()
		path2D:Destroy()
	end
	assert(var1, "MAX_POINTS_PER_PATH was nil")
	
	return var1
end

local function curvePointsToControlPoints(p1, p2)
	local t = {}
	
	for i, v in p2 do
		local var2 = p1.plotToView(v.Position)
		local var3 = p1.plotToView(v.Position + (if v.LeftTangent then v.LeftTangent else Vector2.new(0, 0))) - var2
		local var4 = p1.plotToView(v.Position + (if v.RightTangent then v.RightTangent else Vector2.new(0, 0))) - var2
		table.insert(t, Path2DControlPoint.new(UDim2.fromScale(var2.X, var2.Y), UDim2.fromScale(var3.X, var3.Y), UDim2.fromScale(var4.X, var4.Y)))
	end
	return t
end

local function applyControlPoints(p3, p4, p5)
	local var5 = 1
	
	for i, v in p3:GetChildren() do
		local t = {}
		local p3Count = #p4
		
		for i_1 = var5, var5 + p5 - 1 do
			if p3Count < i_1 then break end
			table.insert(t, p4[i_1])
		end
		v:SetControlPoints(t)
		var5 += p5 - 1
	end
end

function Curve(p6)
	-- upvalues: reactModule (ref), canvasContextModule (ref), var1 (write), signalsModule (ref), curvePointsToControlPoints (ref), applyControlPoints (ref), useViewportVisibility (ref), styleUtilModule (ref)
	local var6 = reactModule.useContext(canvasContextModule)
	
	if not var1 then
		local path2D = Instance.new("Path2D")
		var1 = path2D:GetMaxControlPoints()
		path2D:Destroy()
	end
	assert(var1, "MAX_POINTS_PER_PATH was nil")
	local var7 = var1
	local var8 = reactModule.useRef(nil)
	
	if var8.current == nil then
		local var9, var10 = signalsModule.createSignal(nil)
		var8.current = { get = var9, set = var10 }
	end
	local current = var8.current
	local pointCount = p6.PointCount or (if p6.Points then #p6.Points else 0)
	reactModule.useLayoutEffect(function()
		-- upvalues: p6 (ref), signalsModule (copy), var6 (ref), curvePointsToControlPoints (copy), current (ref), applyControlPoints (copy), var7 (ref)
		local var11
		local _ = nil
		
		if p6.ObservePoints then
			local observePoints = p6.ObservePoints
			var11 = signalsModule.createComputed(function(p7)
				-- upvalues: var6 (copy), curvePointsToControlPoints (copy), observePoints (ref)
				var6.viewportRectGetter(p7)
				
				return curvePointsToControlPoints(var6, observePoints(p7))
			end)
		else
			local var12 = p6.Points or {}
			var11 = signalsModule.createComputed(function(p7)
				-- upvalues: var6 (copy), curvePointsToControlPoints (copy), var12 (ref)
				var6.viewportRectGetter(p7)
				
				return curvePointsToControlPoints(var6, var12)
			end)
		end
		return signalsModule.createEffect(function(p7)
			-- upvalues: var11 (write), p6 (copy), current (copy), applyControlPoints (copy), var7 (copy)
			local var13 = var11(p7)
			local var14 = if p6.ObserveThickness then p6.ObserveThickness(p7) else nil
			local var15 = current.get(p7)
			
			if var15 then
				applyControlPoints(var15, var13, var7)
				
				if var14 then
					for i, v in var15:GetChildren() do
						v.Thickness = var14
					end
				end
			end
		end)
	end, { var6, p6.ObservePoints, p6.Points, p6.ObserveThickness })
	
	if not useViewportVisibility(function(p7)
		-- upvalues: p6 (ref)
		local points = p6.Points
		
		if not points or #points == 0 then
			return true
		end
		local var13 = 1e999
		local var14 = 1e999
		local var15 = -1e999
		local var16 = -1e999
		
		for i, v in points do
			local list = { v.Position }
			
			if v.LeftTangent then
				table.insert(list, v.Position + v.LeftTangent)
			end
			if v.RightTangent then
				table.insert(list, v.Position + v.RightTangent)
			end
			for i_1, v_1 in list do
				if v_1.X < var13 then
					var13 = v_1.X
				end
				if v_1.Y < var14 then
					var14 = v_1.Y
				end
				if var15 < v_1.X then
					var15 = v_1.X
				end
				if var16 < v_1.Y then
					var16 = v_1.Y
				end
			end
		end
		return p7.isRectInViewport(Rect.new(var13, var14, var15, var16))
	end, { p6.Points }) then
		return nil
	end
	local tag = p6.Tag or ""
	local var17 = if p6.ClipContents ~= nil then false else p6.ClipContents
	local t = {}
	local var18 = 1
	
	for _ = 2, pointCount, var7 - 1 do
		t[tostring(var18)] = reactModule.createElement("Path2D", {
			Color3 = p6.Color3 or styleUtilModule.CURVE_COLOR3,
			Thickness = p6.Thickness or styleUtilModule.CURVE_THICKNESS,
			ZIndex = p6.ZIndex,
			[reactModule.Tag] = tag
		})
		var18 += 1
	end
	return reactModule.createElement(if var17 then "CanvasGroup" else "Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ref = current.set,
		Size = UDim2.fromScale(1, 1),
		ZIndex = p6.ZIndex
	}, t)
end

return Curve