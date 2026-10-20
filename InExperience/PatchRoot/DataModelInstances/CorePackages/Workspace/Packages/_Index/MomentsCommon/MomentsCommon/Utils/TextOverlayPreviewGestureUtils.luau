return {
	getTouchLineAngleDegrees = function(Entry): number?
		if #Entry < 2 then
			return nil
		else
			local EntryDelta = Entry[2] - Entry[1]
			
			return (math.deg((math.atan2(EntryDelta.Y, EntryDelta.X))))
		end
	end,
	getTouchRotationStepDegrees = function(p1, p2): number
		return (p2 - p1 + 90) % 180 - 90
	end,
	touchGestureStartsOnOverlay = function(Entry, Vector, Vector1): boolean
		if #Entry < 2 then
			return false
		else
			local EntryRatio = (Entry[1] + Entry[2]) / 2
			
			return Vector.X - 64 <= EntryRatio.X and (EntryRatio.X <= Vector.X + Vector1.X + 64 and Vector.Y - 64 <= EntryRatio.Y) and EntryRatio.Y <= Vector.Y + Vector1.Y + 64
		end
	end
}