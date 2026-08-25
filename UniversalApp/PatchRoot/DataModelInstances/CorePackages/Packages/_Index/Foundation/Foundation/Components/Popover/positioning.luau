local foundation = script:FindFirstAncestor("Foundation")
local popoverAlignModule = require(foundation.Enums.PopoverAlign)
local popoverSideModule = require(foundation.Enums.PopoverSide)

return {
	adjustForOnScreenKeyboard = function(p0, p1, p2)
		return Rect.new(p0.Min, Vector2.new(p0.Max.X, math.min(p0.Max.Y, (p1 - p2).Y)))
	end,
	isOnScreen = function(p3, p4)
		return p4.Max.X < p3.Min.X or p3.Max.X < p4.Min.X or (p4.Max.Y < p3.Min.Y or p3.Max.Y < p4.Min.Y)
	end,
	calculateSide = function(p5, p6, p7, p8)
		-- upvalues: popoverSideModule (ref)
		if p5 == popoverSideModule.Top then
			if p6.Min.Y - p8.Y < p7.Min.Y and p6.Max.Y + p8.Y < p7.Max.Y then
				return popoverSideModule.Bottom
			end
		elseif p5 == popoverSideModule.Bottom then
			if p7.Max.Y < p6.Max.Y + p8.Y and p7.Min.Y < p6.Min.Y - p8.Y then
				return popoverSideModule.Top
			end
		elseif p5 == popoverSideModule.Left then
			if p6.Min.X - p8.X < p7.Min.X and p6.Max.X + p8.X < p7.Max.X then
				return popoverSideModule.Right
			end
		else
			return if p5 == popoverSideModule.Right and p7.Max.X < p6.Max.X + p8.X and p7.Min.X < p6.Min.X - p8.X then popoverSideModule.Left else p5
		end
	end,
	calculatePositions = function(p9, p10, p11, p12, p13, p14, p15, p16)
		-- upvalues: popoverSideModule (ref), popoverAlignModule (ref)
		local t = { X = 0, Y = 0 }
		local t_1 = { X = 0, Y = 0 }
		local t_2 = { X = 0, Y = 0 }
		local var6 = if p9 ~= popoverSideModule.Top then p9 == popoverSideModule.Bottom else true
		local var7 = if p9 ~= popoverSideModule.Top then p9 == popoverSideModule.Left else true
		local var8 = "X"
		local var9 = "Y"
		local height = p13.Height
		local x = p13.Min.X
		local y = p13.Min.Y
		local y_1 = p16.Y
		local x_1 = p16.X
		local x_2 = p13.Max.X
		local y_2 = p13.Max.Y
		local y_3 = p14.Min.Y
		local y_4 = p14.Max.Y
		local x_3 = p14.Min.X
		local x_4 = p14.Max.X
		
		if var6 then
			var8 = "Y"
			var9 = "X"
			height = p13.Width
			x = p13.Min.Y
			y = p13.Min.X
			y_1 = p16.X
			x_1 = p16.Y
			x_2 = p13.Max.Y
			y_2 = p13.Max.X
			y_3 = p14.Min.X
			y_4 = p14.Max.X
			x_3 = p14.Min.Y
			x_4 = p14.Max.Y
		end
		local var10 = p10 + p15
		
		if var7 then
			t[var8] = x - var10 - x_1
			t_1[var8] = x_1
		else
			t[var8] = x_2 + var10
			t_1[var8] = 0
		end
		if p11 == popoverAlignModule.Start then
			t[var9] = y + p12
		elseif p11 == popoverAlignModule.Center then
			t[var9] = y + height / 2 - y_1 / 2 + p12
		else
			t[var9] = y_2 + -p12
			t_2[var9] = 1
		end
		local var11 = t[var9] - t_2[var9] * y_1
		local var12 = var11 + y_1
		
		if var11 < y_3 then
			t_2[var9] = 0
			t[var9] = y_3
		elseif y_4 < var12 then
			t_2[var9] = 1
			t[var9] = y_4
		end
		local var13 = t[var9] - t_2[var9] * y_1
		local var14 = var13 + y_1
		local maxValue = math.max(y, var13)
		local minValue = math.min(y_2, var14)
		t_1[var9] = (if maxValue <= minValue then (maxValue + minValue) / 2 elseif var14 < y then var14 - p15 else var13 + p15) - t[var9]
		t[var8] = math.clamp(t[var8], x_3, math.max(x_4 - x_1 - var10, 0))
		t.X -= p14.Min.X
		t.Y -= p14.Min.Y
		
		return Vector2.new(t.X, t.Y), Vector2.new(t_1.X, t_1.Y), Vector2.new(t_2.X, t_2.Y)
	end,
	calculatePopoverBounds = function(p17, p18, p19, p20, p21)
		-- upvalues: popoverSideModule (ref)
		local var17 = p21
		
		if p17 == popoverSideModule.Top or p17 == popoverSideModule.Bottom then
			var17 += Vector2.new(p19, p18 + p20)
			
			return var17
		end
		return var17 + Vector2.new(p18 + p20, p19)
	end,
	calculateAlign = function(p22, p23, p24, p25, p26)
		-- upvalues: popoverSideModule (ref), popoverAlignModule (ref)
		if if p22 ~= popoverSideModule.Top then p22 == popoverSideModule.Bottom else true then
			if p23 == popoverAlignModule.Start then
				if p25.Max.X < p24.Min.X + p26.X then
					return popoverAlignModule.End
				end
			elseif p23 == popoverAlignModule.End and p24.Max.X - p26.X < p25.Min.X then
				return popoverAlignModule.Start
			end
		elseif p23 == popoverAlignModule.Start then
			if p25.Max.Y < p24.Min.Y + p26.Y then
				return popoverAlignModule.End
			end
		else
			return if p23 == popoverAlignModule.End and p24.Max.Y - p26.Y < p25.Min.Y then popoverAlignModule.Start else p23
		end
	end
}