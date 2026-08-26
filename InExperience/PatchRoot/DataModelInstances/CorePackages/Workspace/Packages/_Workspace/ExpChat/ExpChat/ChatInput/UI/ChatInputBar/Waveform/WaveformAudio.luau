local random = Random.new()

return {
	BAR_WIDTH = 2,
	BAR_GAP = 2,
	ITEM_WIDTH = 4,
	RENDER_INTERVAL = 0.1,
	amplitudeToDecibels = function(p1)
		return if p1 <= 0 then -1e999 else math.log10(p1) * 20
	end,
	amplitudeToNormalized = function(p1)
		local var1 = if p1 <= 0 then -1e999 else math.log10(p1) * 20
		
		return if var1 == -1e999 then 0 else math.clamp((var1 - -60) / 60, 0, 1)
	end,
	sampleVolume = function(p1, p2, p3)
		-- upvalues: random (ref)
		if not p1 then
			return random:NextNumber(0, 1)
		end
		local rmsLevel = p1.RmsLevel
		local var1 = if rmsLevel <= 0 then -1e999 else math.log10(rmsLevel) * 20
		local var2 = if var1 == -1e999 then 0 else math.clamp((var1 - -60) / 60, 0, 1)
		local maxValue = math.max(p2.current * 0.95, var2)
		p2.current = maxValue
		
		return if p3 then if maxValue > 0.01 then var2 / maxValue else var2 else var2
	end,
	useAudioAnalyzer = require(script.Parent.useAudioAnalyzer)
}