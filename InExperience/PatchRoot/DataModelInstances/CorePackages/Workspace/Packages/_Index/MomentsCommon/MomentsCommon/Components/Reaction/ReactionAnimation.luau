return {
	getDurationSeconds = function(p0)
		return p0.frameCount / p0.fps
	end,
	getFrameIndex = function(p1, p2, p3)
		local floored = math.floor(p2 * p1.fps)
		
		return if p3 then floored % p1.frameCount + 1 else math.min(floored + 1, p1.frameCount)
	end,
	getFrameRect = function(p4, p5)
		local clampedValue = math.clamp(p5, 1, p4.frameCount)
		local var2 = clampedValue - 1
		local stride = p4.stride or (p4.cellSize or p4.frameSize + (p4.padding or 0))
		
		return {
			frameIndex = clampedValue,
			offset = Vector2.new(var2 % p4.columns * stride, math.floor(var2 / p4.columns) * stride),
			size = Vector2.new(p4.frameSize, p4.frameSize)
		}
	end,
	getFrameStride = function(p6)
		return p6.stride or (p6.cellSize or p6.frameSize + (p6.padding or 0))
	end
}