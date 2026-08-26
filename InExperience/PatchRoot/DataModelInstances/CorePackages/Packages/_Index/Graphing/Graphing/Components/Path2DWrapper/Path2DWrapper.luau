local parent = script:FindFirstAncestor("Graphing").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
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

function Path2DWrapper(p1)
	-- upvalues: reactModule (ref), var1 (write), signalsModule (ref)
	local var2 = reactModule.useRef(nil)
	
	if not var1 then
		local path2D = Instance.new("Path2D")
		var1 = path2D:GetMaxControlPoints()
		path2D:Destroy()
	end
	assert(var1, "MAX_POINTS_PER_PATH was nil")
	local var3 = var1
	local pointCount = p1.PointCount or (if p1.ControlPoints then #p1.ControlPoints else 0)
	
	local function applyControlPoints(p2)
		-- upvalues: var2 (ref), var3 (ref)
		local current = var2.current
		
		if not current then return end
		local var4 = 1
		
		for i, v in current:GetChildren() do
			local t = {}
			local p1Count = #p2
			
			for i_1 = var4, var4 + var3 - 1 do
				if p1Count < i_1 then break end
				table.insert(t, p2[i_1])
			end
			v:SetControlPoints(t)
			var4 += var3 - 1
		end
	end
	
	reactModule.useLayoutEffect(function()
		-- upvalues: p1 (ref), signalsModule (copy), applyControlPoints (ref)
		if p1.ObserveControlPoints then
			local observeControlPoints = p1.ObserveControlPoints
			
			return signalsModule.createEffect(function(p3)
				-- upvalues: applyControlPoints (copy), observeControlPoints (ref)
				applyControlPoints(observeControlPoints(p3))
			end)
		elseif p1.ControlPoints then
			applyControlPoints(p1.ControlPoints)
		end
		return function() end
	end, { p1.ObserveControlPoints, p1.ControlPoints })
	local tag = p1.Tag or ""
	local var5 = p1.ClipContents ~= nil or p1.ClipContents
	local t = {}
	local var6 = 1
	
	for _ = 2, pointCount, var3 - 1 do
		t[tostring(var6)] = reactModule.createElement("Path2D", {
			Color3 = p1.Color3,
			Thickness = p1.Thickness,
			ZIndex = p1.ZIndex,
			[reactModule.Tag] = tag
		})
		var6 += 1
	end
	return reactModule.createElement(if var5 then "CanvasGroup" else "Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ref = var2,
		Size = UDim2.fromScale(1, 1),
		ZIndex = p1.ZIndex
	}, t)
end

return Path2DWrapper