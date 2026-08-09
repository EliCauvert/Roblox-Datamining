return {
	computeContentTopOffset = function(value, p0, p1) --[[ line: 10 ]]
		return if value <= 0 then 0 else math.max(0, value / p0 - p1)
	end,
	computeInitialScrollY = function(p2, p3, p4, p5) --[[ line: 26 ]]
		return math.max(0, (if p2 <= 0 then 0 else math.max(0, p2 / p3 - p4)) - p5)
	end,
	computeCanvasPaddingTop = function(p6, p7, p8, p9) --[[ line: 62 ]]
		local maxValue = math.max(0, p6 - (if p7 then p8 else 0))
		
		if maxValue == 0 then
			maxValue = p9
		end
		return maxValue
	end,
	getNoBannerFadeParams = function(p10) --[[ line: 40 ]]
		return math.max(60, p10 * 1.5)
	end,
	getHeaderFadeParams = function(p11, p12, p13) --[[ line: 80 ]]
		local maxValue = math.max(0, p11 - p13)
		
		return maxValue, if p12 > 0 and p12 < p11 then math.max(1, p12 - maxValue) else math.max(1, (p11 - maxValue) / 3)
	end,
	shouldShowStickyBar = function(p14, p15, p16, p17) --[[ line: 48 ]]
		return if p15 >= p14 then p16 + p17 <= p14 else true
	end
}