local t = { ar = true, fa = true, he = true, ur = true }

return {
	DEFAULT_SPEED = 25,
	DEFAULT_MAX_LOOPS = 2,
	GAP = 24,
	textDirectionFromLocale = function(p1)
		-- upvalues: t (ref)
		return if t[string.lower(string.match(p1, "^([^%-]+)") or p1)] then Enum.TextDirection.RightToLeft else Enum.TextDirection.LeftToRight
	end,
	travelDistance = function(p1, p2)
		return if p1 <= 0 or p2 <= 0 then 0 else math.max(p1 + 24, p2)
	end,
	overflows = function(p1, p2)
		return p2 > 0 and p2 < p1
	end,
	advance = function(p1, p2, p3, p4, p5)
		if p1.finished or p2 <= 0 or p5 <= 0 then
			return {
				offset = 0,
				finished = true,
				loopsCompleted = p1.loopsCompleted
			}
		elseif p3 <= 0 or p4 <= 0 then
			return p1
		end
		local var1 = p1.offset + p3 * p4
		local loopsCompleted = p1.loopsCompleted
		while p2 <= var1 and loopsCompleted < p5 do
			var1 -= p2
			loopsCompleted += 1
		end
		return if p5 <= loopsCompleted then {
			offset = 0,
			finished = true,
			loopsCompleted = loopsCompleted
		} else {
			finished = false,
			offset = var1,
			loopsCompleted = loopsCompleted
		}
	end,
	signedOffset = function(value, p6)
		return if p6 == Enum.TextDirection.RightToLeft then value else -value
	end
}