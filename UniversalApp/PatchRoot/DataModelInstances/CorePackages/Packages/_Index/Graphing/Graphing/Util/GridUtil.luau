local graphing = script:FindFirstAncestor("Graphing")
local mathUtilModule = require(graphing.Util.MathUtil)
local typesModule = require(graphing.Types)
local t = {
	getUniformValues = function(p1, p2, p3, p4)
		if p3 < p2 then
			local var1 = p2
			p2 = p3
			p3 = var1
		end
		local unit = p1.Unit
		local offset = p1.Offset or 0
		local t = {}
		
		for i = math.ceil((p2 - offset) / unit - unit * 0.000000001), math.floor((p3 - offset) / unit + unit * 0.000000001) do
			local var2 = offset + i * unit
			
			if not p4[var2] then
				table.insert(t, var2)
			end
		end
		return t
	end,
	getLogarithmicValues = function(p5, p6, p7, p8)
		-- upvalues: mathUtilModule (ref)
		if p7 < p6 then
			local var3 = p6
			p6 = p7
			p7 = var3
		end
		local base = p5.Base
		local subdivision = p5.Subdivision or 0
		local maxValue = math.max(p5.MinExponent or -10, mathUtilModule.log(base, p6))
		maxValue = math.max(maxValue, mathUtilModule.log(base, p7))
		local t = {}
		local var4 = 0
		
		for i_1 = math.floor(maxValue), math.ceil(maxValue) do
			for i = math.pow(base, i_1), math.pow(base, i_1 + 1), math.pow(base, i_1 + 1 - subdivision) do
				if p7 < i then break end
				if i >= p6 and i ~= var4 then
					var4 = i
					
					if not p8[i] then
						table.insert(t, i)
					end
				end
			end
		end
		return t
	end,
	getValuesValues = function(p9, p10, p11, p12)
		local t = {}
		
		for i, v in p9.Values do
			if p10 <= v and v <= p11 and not p12[v] then
				table.insert(t, v)
			end
		end
		return t
	end
}

function t.getValues(p13, p14, p15, p16)
	-- upvalues: typesModule (ref), t (ref)
	local t_1 = {}
	local t_2 = {}
	
	if p16 then
		for i, v in p16 do
			t_2[v] = true
		end
	end
	local viewportRect = p15.getViewportRect()
	local var5 = if p13 == typesModule.AXIS_X then viewportRect.Min.X else viewportRect.Min.Y
	local var6 = if p13 == typesModule.AXIS_X then viewportRect.Max.X else viewportRect.Max.Y
	
	if p14.Type == typesModule.SCALE_UNIFORM then
		t_1 = t.getUniformValues(p14, var5, var6, t_2)
		
		return t_1
	elseif p14.Type == typesModule.SCALE_LOGARITHMIC then
		t_1 = t.getLogarithmicValues(p14, var5, var6, t_2)
		
		return t_1
	elseif p14.Type == typesModule.SCALE_VALUES then
		t_1 = t.getValuesValues(p14, var5, var6, t_2)
		
		return t_1
	end
	assert(false, `Axis schema {p14.Type} not supported`)
	
	return t_1
end

function t.trimRoundingError(value)
	local var7 = string.format("%.10f", value):gsub("^0*(.-)%.?0*$", "%1")
	
	if var7 == "" or var7:sub(1, 1) == "." then
		var7 = "0" .. var19
	end
	return var7
end

function t.getAnchorPointForSide(p17)
	-- upvalues: typesModule (ref)
	if p17 == typesModule.SIDE_LEFT then
		return Vector2.new(1, 0.5)
	elseif p17 == typesModule.SIDE_RIGHT then
		return Vector2.new(0, 0.5)
	elseif p17 == typesModule.SIDE_TOP then
		return Vector2.new(0.5, 1)
	elseif p17 == typesModule.SIDE_BOTTOM then
		return Vector2.new(0.5, 0)
	end
	assert(false, `Side {p17} not supported`)
end

function t.getTextAlignmentsFromAnchorPoint(p17)
	local _ = nil
	local _ = nil
	local var7 = if p17.X == 0 then Enum.TextXAlignment.Left elseif p17.X == 1 then Enum.TextXAlignment.Right else Enum.TextXAlignment.Center
	
	if p17.Y == 0 then
		return var7, Enum.TextYAlignment.Top
	elseif p17.Y == 1 then
		return var7, Enum.TextYAlignment.Bottom
	end
	return var7, Enum.TextYAlignment.Center
end

return t