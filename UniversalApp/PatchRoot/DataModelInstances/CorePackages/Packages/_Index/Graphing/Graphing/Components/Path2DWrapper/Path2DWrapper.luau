local Parent = script:FindFirstAncestor("Graphing").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local MaxControlPoints = nil

local function _() --[[ Line: 42 | Named "getMaxPointsPerPath" ]]
	-- upvalues: MaxControlPoints (ref)
	if not MaxControlPoints then
		local Path2D = Instance.new("Path2D")
		MaxControlPoints = Path2D:GetMaxControlPoints()
		Path2D:Destroy()
	end
	assert(MaxControlPoints, "MAX_POINTS_PER_PATH was nil")
	
	return MaxControlPoints
end

function Path2DWrapper(p1) --[[ Line: 53 ]]
	-- upvalues: ReactModule (copy), MaxControlPoints (ref), SignalsModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	if not MaxControlPoints then
		local Path2D = Instance.new("Path2D")
		MaxControlPoints = Path2D:GetMaxControlPoints()
		Path2D:Destroy()
	end
	assert(MaxControlPoints, "MAX_POINTS_PER_PATH was nil")
	local MaxControlPoints1: number = MaxControlPoints
	local PointCount = p1.PointCount or (p1.ControlPoints and #p1.ControlPoints or 0)
	
	local function applyControlPoints(ControlPoints) --[[ Line: 59 ]]
		-- upvalues: UseRefResult (copy), MaxControlPoints1 (copy)
		local Current = UseRefResult.current
		
		if not Current then return end
		local Total = 1
		
		for _, child in Current:GetChildren() do
			local List = {}
			local CountControlPoints = #ControlPoints
			
			for i = Total, Total + MaxControlPoints1 - 1 do
				if CountControlPoints < i then break end
				table.insert(List, ControlPoints[i])
			end
			child:SetControlPoints(List)
			Total += MaxControlPoints1 - 1
		end
	end
	
	ReactModule.useLayoutEffect(function() --[[ Line: 84 ]]
		-- upvalues: p1 (copy), SignalsModule (upval), applyControlPoints (copy)
		if p1.ObserveControlPoints then
			local ObserveControlPointsFunction = p1.ObserveControlPoints
			
			return SignalsModule.createEffect(function(p2) --[[ Line: 87 ]]
				-- upvalues: applyControlPoints (upval), ObserveControlPointsFunction (copy)
				applyControlPoints(ObserveControlPointsFunction(p2))
			end)
		end
		if p1.ControlPoints then
			applyControlPoints(p1.ControlPoints)
		end
		return function() --[[ Line: 93 ]] end
	end, { p1.ObserveControlPoints, p1.ControlPoints })
	local Tag = p1.Tag or ""
	local NoClipContents = p1.ClipContents == nil or p1.ClipContents
	local Path2Ds = {}
	local Count = 1
	
	for _ = 2, PointCount, MaxControlPoints1 - 1 do
		Path2Ds[tostring(Count)] = ReactModule.createElement("Path2D", {
			Color3 = p1.Color3,
			Thickness = p1.Thickness,
			ZIndex = p1.ZIndex,
			[ReactModule.Tag] = Tag
		})
		Count += 1
	end
	return ReactModule.createElement(if NoClipContents then "CanvasGroup" else "Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ref = UseRefResult,
		Size = UDim2.fromScale(1, 1),
		ZIndex = p1.ZIndex
	}, Path2Ds)
end

return Path2DWrapper