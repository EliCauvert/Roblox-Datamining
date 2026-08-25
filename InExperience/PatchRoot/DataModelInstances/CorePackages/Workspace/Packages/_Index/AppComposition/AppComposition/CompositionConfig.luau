local appComposition = script:FindFirstAncestor("AppComposition")
local parent = appComposition.Parent
local breakpoint = require(parent.Foundation).Enums.Breakpoint
local hardwareSafeAreaInsets = require(parent.Responsive).HardwareSafeAreaInsets
local _ = require(appComposition.AppCompositionTypes)
local appCompositionEnumsModule = require(appComposition.AppCompositionEnums)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableLeftNavOnConsole = sharedFlagsModule.FFlagEnableLeftNavOnConsole
local fFlagEnableSplitPane = sharedFlagsModule.FFlagEnableSplitPane
local regionName = appCompositionEnumsModule.RegionName

local function getBaseConfig(p0, p1)
	-- upvalues: breakpoint (ref), fFlagEnableLeftNavOnConsole (ref), hardwareSafeAreaInsets (ref)
	local t
	local _ = nil
	
	if p0 == breakpoint.XSmall then
		local size300 = p1.Size.Size_300
		t = {
			columns = 3,
			margin = size300,
			gutter = p1.Gutter.Small,
			carouselPeek = 2 * size300
		}
	elseif p0 == breakpoint.Small then
		local small = p1.Margin.Small
		t = {
			columns = 6,
			margin = small,
			gutter = p1.Gutter.Medium,
			carouselPeek = 2 * small
		}
	else
		t = if p0 == breakpoint.Medium then {
			columns = 12,
			carouselPeek = 0,
			margin = p1.Size.Size_800,
			gutter = p1.Gutter.Large
		} elseif p0 == breakpoint.Large then {
			columns = 12,
			carouselPeek = 0,
			margin = p1.Size.Size_800,
			gutter = p1.Gutter.Large
		} elseif p0 == breakpoint.XLarge then {
			columns = 12,
			carouselPeek = 0,
			margin = p1.Size.Size_1600,
			gutter = p1.Gutter.XLarge
		} else {
			columns = 12,
			carouselPeek = 0,
			margin = p1.Size.Size_1600,
			gutter = p1.Gutter.XLarge
		}
	end
	if not fFlagEnableLeftNavOnConsole and hardwareSafeAreaInsets.hasExtraPlatformInset() then
		t.margin = hardwareSafeAreaInsets.deviceInsets().left
	end
	return t
end

return {
	getBaseConfig = getBaseConfig,
	resolveLayout = if fFlagEnableSplitPane then function(p2, p3)
		-- upvalues: getBaseConfig (ref)
		return getBaseConfig(p2, p3)
	end else nil,
	getRegionOverrides = if fFlagEnableSplitPane then function(p4)
		-- upvalues: regionName (ref)
		return if p4 == regionName.SupportRegion then { widthScale = 0.33 } else nil
	end else nil,
	getRegionLayout = if fFlagEnableSplitPane then function(p5, p6, p7)
		-- upvalues: getBaseConfig (ref), regionName (ref)
		local var5 = getBaseConfig(p6, p7)
		local var6 = if p5 == regionName.SupportRegion then { widthScale = 0.33 } else nil
		
		if var6 then
			var5.width = var6.width
			var5.widthScale = var6.widthScale
			var5.minWidth = var6.minWidth
			var5.maxWidth = var6.maxWidth
		end
		return var5
	end else nil
}