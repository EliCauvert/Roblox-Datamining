local foundation = script:FindFirstAncestor("Foundation")
local popoverAlignModule = require(foundation.Enums.PopoverAlign)
local popoverSideModule = require(foundation.Enums.PopoverSide)

return {
	adjustForOnScreenKeyboard = function(p1, p2, p3)
		return Rect.new(p1.Min, Vector2.new(p1.Max.X, math.min(p1.Max.Y, (p2 - p3).Y)))
	end,
	isOnScreen = function(p1, p2)
		return p2.Max.X < p1.Min.X or p1.Max.X < p2.Min.X or (p2.Max.Y < p1.Min.Y or p1.Max.Y < p2.Min.Y)
	end,
	calculateSide = function(p1, p2, p3, p4)
		-- upvalues: popoverSideModule (ref)
		if p1 == popoverSideModule.Top then
			if p2.Min.Y - p4.Y < p3.Min.Y and p2.Max.Y + p4.Y < p3.Max.Y then
				return popoverSideModule.Bottom
			end
		elseif p1 == popoverSideModule.Bottom then
			if p3.Max.Y < p2.Max.Y + p4.Y and p3.Min.Y < p2.Min.Y - p4.Y then
				return popoverSideModule.Top
			end
		elseif p1 == popoverSideModule.Left then
			if p2.Min.X - p4.X < p3.Min.X and p2.Max.X + p4.X < p3.Max.X then
				return popoverSideModule.Right
			end
		else
			return if p1 == popoverSideModule.Right and p3.Max.X < p2.Max.X + p4.X and p3.Min.X < p2.Min.X - p4.X then popoverSideModule.Left else p1
		end
	end,
	calculatePositions = function(p1, p2, p3, p4, p5, p6, p7, p8)
		-- upvalues: popoverSideModule (ref), popoverAlignModule (ref)
		local t = { X = 0, Y = 0 }
		local t_1 = { X = 0, Y = 0 }
		local t_2 = { X = 0, Y = 0 }
		local var1 = if p1 ~= popoverSideModule.Top then p1 == popoverSideModule.Bottom else true
		local var2 = if p1 ~= popoverSideModule.Top then p1 == popoverSideModule.Left else true
		local var3 = "X"
		local var4 = "Y"
		local height = p5.Height
		local x = p5.Min.X
		local y = p5.Min.Y
		local y_1 = p8.Y
		local x_1 = p8.X
		local x_2 = p5.Max.X
		local y_2 = p5.Max.Y
		local y_3 = p6.Min.Y
		local y_4 = p6.Max.Y
		local x_3 = p6.Min.X
		local x_4 = p6.Max.X
		
		if var1 then
			var3 = "Y"
			var4 = "X"
			height = p5.Width
			x = p5.Min.Y
			y = p5.Min.X
			y_1 = p8.X
			x_1 = p8.Y
			x_2 = p5.Max.Y
			y_2 = p5.Max.X
			y_3 = p6.Min.X
			y_4 = p6.Max.X
			x_3 = p6.Min.Y
			x_4 = p6.Max.Y
		end
		local var5 = p2 + p7
		
		if var2 then
			t[var3] = x - var5 - x_1
			t_1[var3] = x_1
		else
			t[var3] = x_2 + var5
			t_1[var3] = 0
		end
		if p3 == popoverAlignModule.Start then
			t[var4] = y + p4
		elseif p3 == popoverAlignModule.Center then
			t[var4] = y + height / 2 - y_1 / 2 + p4
		else
			t[var4] = y_2 + -p4
			t_2[var4] = 1
		end
		local var6 = t[var4] - t_2[var4] * y_1
		local var7 = var6 + y_1
		
		if var6 < y_3 then
			t_2[var4] = 0
			t[var4] = y_3
		elseif y_4 < var7 then
			t_2[var4] = 1
			t[var4] = y_4
		end
		local var8 = t[var4] - t_2[var4] * y_1
		local var9 = var8 + y_1
		local maxValue = math.max(y, var8)
		local minValue = math.min(y_2, var9)
		t_1[var4] = (if maxValue <= minValue then (maxValue + minValue) / 2 elseif var9 < y then var9 - p7 else var8 + p7) - t[var4]
		t[var3] = math.clamp(t[var3], x_3, math.max(x_4 - x_1 - var5, 0))
		t.X -= p6.Min.X
		t.Y -= p6.Min.Y
		
		return Vector2.new(t.X, t.Y), Vector2.new(t_1.X, t_1.Y), Vector2.new(t_2.X, t_2.Y)
	end,
	calculatePopoverBounds = function(p1, p2, p3, p4, p5)
		-- upvalues: popoverSideModule (ref)
		local var1 = p5
		
		if p1 == popoverSideModule.Top or p1 == popoverSideModule.Bottom then
			var1 += Vector2.new(p3, p2 + p4)
			
			return var1
		end
		return var1 + Vector2.new(p2 + p4, p3)
	end,
	calculateAlign = function(p1, p2, p3, p4, p5)
		-- upvalues: popoverSideModule (ref), popoverAlignModule (ref)
		if if p1 ~= popoverSideModule.Top then p1 == popoverSideModule.Bottom else true then
			if p2 == popoverAlignModule.Start then
				if p4.Max.X < p3.Min.X + p5.X then
					return popoverAlignModule.End
				end
			elseif p2 == popoverAlignModule.End and p3.Max.X - p5.X < p4.Min.X then
				return popoverAlignModule.Start
			end
		elseif p2 == popoverAlignModule.Start then
			if p4.Max.Y < p3.Min.Y + p5.Y then
				return popoverAlignModule.End
			end
		else
			return if p2 == popoverAlignModule.End and p3.Max.Y - p5.Y < p4.Min.Y then popoverAlignModule.Start else p2
		end
	end
}