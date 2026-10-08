local appComposition = script:FindFirstAncestor("AppComposition")
local parent = appComposition.Parent
local breakpoint = require(parent.Foundation).Enums.Breakpoint
local _ = require(appComposition.AppCompositionTypes)
local fFlagEnableSplitPane = require(parent.SharedFlags).FFlagEnableSplitPane
local regionName = require(appComposition.AppCompositionEnums).RegionName

local function getBaseConfig(p1, p2)
	-- upvalues: breakpoint (ref)
	local _ = nil
	
	if p1 == breakpoint.XSmall then
		local size300 = p2.Size.Size_300
		
		return {
			columns = 3,
			margin = size300,
			gutter = p2.Gutter.Small,
			carouselPeek = 2 * size300
		}
	elseif p1 == breakpoint.Small then
		local small = p2.Margin.Small
		
		return {
			columns = 6,
			margin = small,
			gutter = p2.Gutter.Medium,
			carouselPeek = 2 * small
		}
	end
	return if p1 == breakpoint.Medium then {
		columns = 12,
		carouselPeek = 0,
		margin = p2.Size.Size_800,
		gutter = p2.Gutter.Large
	} elseif p1 == breakpoint.Large then {
		columns = 12,
		carouselPeek = 0,
		margin = p2.Size.Size_800,
		gutter = p2.Gutter.Large
	} elseif p1 == breakpoint.XLarge then {
		columns = 12,
		carouselPeek = 0,
		margin = p2.Size.Size_1600,
		gutter = p2.Gutter.XLarge
	} else {
		columns = 12,
		carouselPeek = 0,
		margin = p2.Size.Size_1600,
		gutter = p2.Gutter.XLarge
	}
end

return {
	getBaseConfig = getBaseConfig,
	resolveLayout = if fFlagEnableSplitPane then function(p1, p2)
		-- upvalues: getBaseConfig (ref)
		return getBaseConfig(p1, p2)
	end else nil,
	getRegionOverrides = if fFlagEnableSplitPane then function(p1)
		-- upvalues: regionName (ref)
		return if p1 == regionName.SupportRegion then { widthScale = 0.33, minWidth = 355 } else nil
	end else nil,
	getRegionLayout = if fFlagEnableSplitPane then function(p1, p2, p3)
		-- upvalues: getBaseConfig (ref), regionName (ref)
		local var1 = getBaseConfig(p2, p3)
		local var2 = if p1 == regionName.SupportRegion then { widthScale = 0.33, minWidth = 355 } else nil
		
		if var2 then
			var1.width = var2.width
			var1.widthScale = var2.widthScale
			var1.minWidth = var2.minWidth
			var1.maxWidth = var2.maxWidth
		end
		return var1
	end else nil
}