local fFlagLuaAppClampBannerPaddingToViewport = require(script:FindFirstAncestor("AppBlox").Parent.SharedFlags).FFlagLuaAppClampBannerPaddingToViewport

return {
	computeContentTopOffset = function(value, p1, p2)
		return if value <= 0 then 0 else math.max(0, value / p1 - p2)
	end,
	computeInitialScrollY = function(p1, p2, p3, p4)
		return math.max(0, (if p1 <= 0 then 0 else math.max(0, p1 / p2 - p3)) - p4)
	end,
	computeInitialScrollYForSize = function(p1, p2)
		-- upvalues: fFlagLuaAppClampBannerPaddingToViewport (ref)
		local maxValue
		local fullBleedAspectRatio = p2.fullBleedAspectRatio
		local headerBarHeight = p2.headerBarHeight
		local fullBleedOverlapOffset = p2.fullBleedOverlapOffset
		local hasFullBleed = p2.hasFullBleed
		local bannerBottomVisiblePercent = p2.bannerBottomVisiblePercent
		local var1 = p1.X / fullBleedAspectRatio
		local _ = nil
		
		if bannerBottomVisiblePercent == nil then
			local x = p1.X
			maxValue = math.max(0, (if x <= 0 then 0 else math.max(0, x / fullBleedAspectRatio - headerBarHeight)) - fullBleedOverlapOffset)
		else
			maxValue = math.max(0, math.floor(var1 - bannerBottomVisiblePercent * var1))
		end
		local x = p1.X
		local maxValue_1 = math.max(0, (if x <= 0 then 0 else math.max(0, x / fullBleedAspectRatio - headerBarHeight)) - (if hasFullBleed then fullBleedOverlapOffset else 0))
		
		if maxValue_1 == 0 then
			maxValue_1 = headerBarHeight
		end
		local var2 = maxValue_1
		
		if fFlagLuaAppClampBannerPaddingToViewport then
			var2 = math.min(var2, p1.Y * 0.75)
		end
		return math.min(maxValue, math.max(0, var2 - headerBarHeight))
	end,
	computeCanvasPaddingTop = function(p1, p2, p3, p4)
		local maxValue = math.max(0, p1 - (if p2 then p3 else 0))
		
		if maxValue == 0 then
			maxValue = p4
		end
		return maxValue
	end,
	getNoBannerFadeParams = function(p1)
		return math.max(60, p1 * 1.5)
	end,
	getHeaderFadeParams = function(p1, p2, p3)
		local maxValue = math.max(0, p1 - p3)
		
		return maxValue, if p2 > 0 and p2 < p1 then math.max(1, p2 - maxValue) else math.max(1, (p1 - maxValue) / 3)
	end,
	shouldShowStickyBar = function(p1, p2, p3, p4)
		return if p2 >= p1 then p3 + p4 <= p1 else true
	end
}