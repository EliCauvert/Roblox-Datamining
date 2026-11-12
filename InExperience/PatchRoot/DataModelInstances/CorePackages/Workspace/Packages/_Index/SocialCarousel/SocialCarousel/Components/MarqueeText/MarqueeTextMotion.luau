local config = { ar = true, fa = true, he = true, ur = true }

return {
	DEFAULT_SPEED = 25,
	DEFAULT_MAX_LOOPS = 2,
	GAP = 24,
	textDirectionFromLocale = function(Text: string)
		-- upvalues: config (copy)
		return if config[string.lower(string.match(Text, "^([^%-]+)") or Text)] then Enum.TextDirection.RightToLeft else Enum.TextDirection.LeftToRight
	end,
	travelDistance = function(p1: number, p2: number): number
		return if p1 <= 0 or p2 <= 0 then 0 else math.max(p1 + 24, p2)
	end,
	overflows = function(p1, p2: number): boolean
		return p2 > 0 and p2 < p1
	end,
	advance = function(p1, Amount: number, p2: number, p3: number, p4: number)
		if p1.finished or Amount <= 0 or p4 <= 0 then
			return {
				offset = 0,
				finished = true,
				loopsCompleted = p1.loopsCompleted
			}
		end
		if p2 <= 0 or p3 <= 0 then
			return p1
		end
		local NewOffset = p1.offset + p2 * p3
		local LoopsCompleted = p1.loopsCompleted
		while Amount <= NewOffset and LoopsCompleted < p4 do
			NewOffset -= Amount
			LoopsCompleted += 1
		end
		return if p4 <= LoopsCompleted then {
			offset = 0,
			finished = true,
			loopsCompleted = LoopsCompleted
		} else {
			finished = false,
			offset = NewOffset,
			loopsCompleted = LoopsCompleted
		}
	end,
	signedOffset = function(p5, TextDirection)
		return if TextDirection == Enum.TextDirection.RightToLeft then p5 else -p5
	end
}