local FFlagLuaAppClampBannerPaddingToViewport = require(script:FindFirstAncestor("AppBlox").Parent.SharedFlags).FFlagLuaAppClampBannerPaddingToViewport

return {
	computeContentTopOffset = function(p1: number, p2, p3): number
		return if p1 <= 0 then 0 else math.max(0, p1 / p2 - p3)
	end,
	computeInitialScrollY = function(p1: number, p2, p3, p4): number
		return (math.max(0, (if p1 <= 0 then 0 else math.max(0, p1 / p2 - p3)) - p4))
	end,
	computeInitialScrollYForSize = function(Vector, p1): number
		-- upvalues: FFlagLuaAppClampBannerPaddingToViewport (copy)
		local FullBleedAspectRatio = p1.fullBleedAspectRatio
		local HeaderBarHeight: number = p1.headerBarHeight
		local FullBleedOverlapOffset = p1.fullBleedOverlapOffset
		local HasFullBleed = p1.hasFullBleed
		local BannerBottomVisiblePercent = p1.bannerBottomVisiblePercent
		local XRatio = Vector.X / FullBleedAspectRatio
		local Largest = nil
		
		if BannerBottomVisiblePercent == nil then
			local X: number = Vector.X
			Largest = math.max(0, (if X <= 0 then 0 else math.max(0, X / FullBleedAspectRatio - HeaderBarHeight)) - FullBleedOverlapOffset)
		else
			Largest = math.max(0, (math.floor(XRatio - BannerBottomVisiblePercent * XRatio)))
		end
		local X: number = Vector.X
		local Largest1 = math.max(0, (if X <= 0 then 0 else math.max(0, X / FullBleedAspectRatio - HeaderBarHeight)) - (if HasFullBleed then FullBleedOverlapOffset else 0))
		
		if Largest1 == 0 then
			Largest1 = HeaderBarHeight
		end
		local Smallest: number = Largest1
		
		if FFlagLuaAppClampBannerPaddingToViewport then
			Smallest = math.min(Smallest, Vector.Y * 0.75)
		end
		return (math.min(Largest, (math.max(0, Smallest - HeaderBarHeight))))
	end,
	computeCanvasPaddingTop = function(p1, p2, p3, p4): number
		local Largest = math.max(0, p1 - (if p2 then p3 else 0))
		
		if Largest == 0 then
			Largest = p4
		end
		return Largest
	end,
	getNoBannerFadeParams = function(p1: number): number
		return (math.max(60, p1 * 1.5))
	end,
	getHeaderFadeParams = function(p1: number, p2: number, p3: number)
		local Largest = math.max(0, p1 - p3)
		local v1: boolean = p2 > 0 and p2 < p1
		
		return Largest, if v1 then math.max(1, p2 - Largest) else math.max(1, (p1 - Largest) / 3)
	end,
	shouldShowStickyBar = function(p1, p2, p3, p4): boolean
		return p2 < p1 or p3 + p4 <= p1
	end
}