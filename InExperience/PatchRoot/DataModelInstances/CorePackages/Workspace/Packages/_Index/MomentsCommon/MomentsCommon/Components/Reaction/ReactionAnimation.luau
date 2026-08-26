return {
	getDurationSeconds = function(p1)
		return p1.frameCount / p1.fps
	end,
	getFrameIndex = function(p1, p2, p3)
		local floored = math.floor(p2 * p1.fps)
		
		return if p3 then floored % p1.frameCount + 1 else math.min(floored + 1, p1.frameCount)
	end,
	getFrameRect = function(p1, p2)
		local clampedValue = math.clamp(p2, 1, p1.frameCount)
		local var1 = clampedValue - 1
		local stride = p1.stride or (p1.cellSize or p1.frameSize + (p1.padding or 0))
		
		return {
			frameIndex = clampedValue,
			offset = Vector2.new(var1 % p1.columns * stride, math.floor(var1 / p1.columns) * stride),
			size = Vector2.new(p1.frameSize, p1.frameSize)
		}
	end,
	getFrameStride = function(p1)
		return p1.stride or (p1.cellSize or p1.frameSize + (p1.padding or 0))
	end
}