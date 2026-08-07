local random = Random.new()

return {
	BAR_WIDTH = 2,
	BAR_GAP = 2,
	ITEM_WIDTH = 4,
	RENDER_INTERVAL = 0.1,
	amplitudeToDecibels = function(p0) --[[ line: 13 ]]
		return if p0 <= 0 then -1e999 else math.log10(p0) * 20
	end,
	amplitudeToNormalized = function(p1) --[[ line: 20 ]]
		local var1 = if p1 <= 0 then -1e999 else math.log10(p1) * 20
		
		return if var1 == -1e999 then 0 else math.clamp((var1 - -60) / 60, 0, 1)
	end,
	sampleVolume = function(p2, p3, p4) --[[ line: 33 ]]
		-- upvalues: random (ref)
		if not p2 then
			return random:NextNumber(0, 1)
		end
		local rmsLevel = p2.RmsLevel
		local var2 = if rmsLevel <= 0 then -1e999 else math.log10(rmsLevel) * 20
		local var3 = if var2 == -1e999 then 0 else math.clamp((var2 - -60) / 60, 0, 1)
		local maxValue = math.max(p3.current * 0.95, var3)
		p3.current = maxValue
		
		return if p4 then if maxValue > 0.01 then var3 / maxValue else var3 else var3
	end,
	useAudioAnalyzer = require(script.Parent.useAudioAnalyzer)
}