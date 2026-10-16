return {
	getDurationSeconds = function(p1) --[[ Line: 22 ]]
		return p1.frameCount / p1.fps
	end,
	getFrameIndex = function(p1, p2, p3): number --[[ Line: 26 ]]
		local Floored = math.floor(p2 * p1.fps)
		
		return if p3 then Floored % p1.frameCount + 1 else math.min(Floored + 1, p1.frameCount)
	end,
	getFrameRect = function(p1, Value: number) --[[ Line: 40 ]]
		local ClampedValue = math.clamp(Value, 1, p1.frameCount)
		local ClampedValueDelta = ClampedValue - 1
		local Stride = p1.stride or (p1.cellSize or p1.frameSize + (p1.padding or 0))
		
		return {
			frameIndex = ClampedValue,
			offset = Vector2.new(ClampedValueDelta % p1.columns * Stride, math.floor(ClampedValueDelta / p1.columns) * Stride),
			size = Vector2.new(p1.frameSize, p1.frameSize)
		}
	end,
	getFrameStride = function(p1) --[[ Line: 36 ]]
		return p1.stride or (p1.cellSize or p1.frameSize + (p1.padding or 0))
	end
}