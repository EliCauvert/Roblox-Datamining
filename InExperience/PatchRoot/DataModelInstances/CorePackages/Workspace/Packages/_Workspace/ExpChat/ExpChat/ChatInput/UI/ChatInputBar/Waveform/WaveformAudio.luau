local _Random = Random.new()

return {
	BAR_WIDTH = 2,
	BAR_GAP = 2,
	ITEM_WIDTH = 4,
	RENDER_INTERVAL = 0.1,
	amplitudeToDecibels = function(p1: number): number --[[ Line: 13 ]]
		return if p1 <= 0 then -1e999 else math.log10(p1) * 20
	end,
	amplitudeToNormalized = function(p1: number): number --[[ Line: 20 ]]
		local ScaledLog10Result: number = if p1 <= 0 then -1e999 else math.log10(p1) * 20
		
		return if ScaledLog10Result == -1e999 then 0 else math.clamp((ScaledLog10Result - -60) / 60, 0, 1)
	end,
	sampleVolume = function(p1, p2, p3) --[[ Line: 33 ]]
		-- upvalues: _Random (copy)
		if p1 then
			local RmsLevel: number = p1.RmsLevel
			local ScaledLog10Result: number = if RmsLevel <= 0 then -1e999 else math.log10(RmsLevel) * 20
			local ClampedValue: number = if ScaledLog10Result == -1e999 then 0 else math.clamp((ScaledLog10Result - -60) / 60, 0, 1)
			local Largest = math.max(p2.current * 0.95, ClampedValue)
			p2.current = Largest
			
			return if p3 and Largest > 0.01 then ClampedValue / Largest else ClampedValue
		else
			return _Random:NextNumber(0, 1)
		end
	end,
	useAudioAnalyzer = require(script.Parent.useAudioAnalyzer)
}