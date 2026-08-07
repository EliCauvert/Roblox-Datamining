local fFlagLuaAppClampBannerPaddingToViewport = require(script:FindFirstAncestor("AppBlox").Parent.SharedFlags).FFlagLuaAppClampBannerPaddingToViewport

return {
	computeContentTopOffset = function(value, p0, p1) --[[ line: 16 ]]
		return if value <= 0 then 0 else math.max(0, value / p0 - p1)
	end,
	computeInitialScrollY = function(p2, p3, p4, p5) --[[ line: 32 ]]
		return math.max(0, (if p2 <= 0 then 0 else math.max(0, p2 / p3 - p4)) - p5)
	end,
	computeInitialScrollYForSize = function(p6, p7) --[[ line: 114 ]]
		-- upvalues: fFlagLuaAppClampBannerPaddingToViewport (ref)
		local maxValue
		local fullBleedAspectRatio = p7.fullBleedAspectRatio
		local headerBarHeight = p7.headerBarHeight
		local fullBleedOverlapOffset = p7.fullBleedOverlapOffset
		local hasFullBleed = p7.hasFullBleed
		local bannerBottomVisiblePercent = p7.bannerBottomVisiblePercent
		local var0 = p6.X / fullBleedAspectRatio
		local _ = nil
		
		if bannerBottomVisiblePercent == nil then
			local x = p6.X
			maxValue = math.max(0, (if x <= 0 then 0 else math.max(0, x / fullBleedAspectRatio - headerBarHeight)) - fullBleedOverlapOffset)
		else
			maxValue = math.max(0, math.floor(var0 - bannerBottomVisiblePercent * var0))
		end
		local x = p6.X
		local maxValue_1 = math.max(0, (if x <= 0 then 0 else math.max(0, x / fullBleedAspectRatio - headerBarHeight)) - (if hasFullBleed then fullBleedOverlapOffset else 0))
		
		if maxValue_1 == 0 then
			maxValue_1 = headerBarHeight
		end
		local var3 = maxValue_1
		
		if fFlagLuaAppClampBannerPaddingToViewport then
			var3 = math.min(var3, p6.Y * 0.75)
		end
		return math.min(maxValue, math.max(0, var3 - headerBarHeight))
	end,
	computeCanvasPaddingTop = function(p8, p9, p10, p11) --[[ line: 68 ]]
		local maxValue = math.max(0, p8 - (if p9 then p10 else 0))
		
		if maxValue == 0 then
			maxValue = p11
		end
		return maxValue
	end,
	getNoBannerFadeParams = function(p12) --[[ line: 46 ]]
		return math.max(60, p12 * 1.5)
	end,
	getHeaderFadeParams = function(p13, p14, p15) --[[ line: 86 ]]
		local maxValue = math.max(0, p13 - p15)
		
		return maxValue, if p14 > 0 and p14 < p13 then math.max(1, p14 - maxValue) else math.max(1, (p13 - maxValue) / 3)
	end,
	shouldShowStickyBar = function(p16, p17, p18, p19) --[[ line: 54 ]]
		return if p17 >= p16 then p18 + p19 <= p16 else true
	end
}