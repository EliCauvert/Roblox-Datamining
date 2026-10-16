local AppComposition = script:FindFirstAncestor("AppComposition")
local Parent = AppComposition.Parent
local Breakpoint = require(Parent.Foundation).Enums.Breakpoint
local _ = require(AppComposition.AppCompositionTypes)
local FFlagEnableSplitPane = require(Parent.SharedFlags).FFlagEnableSplitPane
local RegionName = require(AppComposition.AppCompositionEnums).RegionName

local function getRegionOverrides(SupportRegion) --[[ Line: 24 ]]
	-- upvalues: RegionName (copy)
	return if SupportRegion == RegionName.SupportRegion then { widthScale = 0.33, minWidth = 355 } else nil
end

local function getBaseConfig(Large, p1) --[[ Line: 34 ]]
	-- upvalues: Breakpoint (copy)
	if Large == Breakpoint.XSmall then
		local Size300: number = p1.Size.Size_300
		
		return {
			columns = 3,
			margin = Size300,
			gutter = p1.Gutter.Small,
			carouselPeek = 2 * Size300
		}
	elseif Large == Breakpoint.Small then
		local Small: number = p1.Margin.Small
		
		return {
			columns = 6,
			margin = Small,
			gutter = p1.Gutter.Medium,
			carouselPeek = 2 * Small
		}
	else
		return if Large == Breakpoint.Medium then {
			columns = 12,
			carouselPeek = 0,
			margin = p1.Size.Size_800,
			gutter = p1.Gutter.Large
		} elseif Large == Breakpoint.Large then {
			columns = 12,
			carouselPeek = 0,
			margin = p1.Size.Size_800,
			gutter = p1.Gutter.Large
		} elseif Large == Breakpoint.XLarge then {
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
end

local function resolveLayout(p1, p2) --[[ Line: 89 ]]
	-- upvalues: getBaseConfig (copy)
	return (getBaseConfig(p1, p2))
end

local function getRegionLayout(SupportRegion, p1, p2) --[[ Line: 93 ]]
	-- upvalues: getBaseConfig (copy), RegionName (copy)
	local BaseConfig = getBaseConfig(p1, p2)
	local Config = if SupportRegion == RegionName.SupportRegion then { widthScale = 0.33, minWidth = 355 } else nil
	
	if Config then
		BaseConfig.width = Config.width
		BaseConfig.widthScale = Config.widthScale
		BaseConfig.minWidth = Config.minWidth
		BaseConfig.maxWidth = Config.maxWidth
	end
	return BaseConfig
end

return {
	getBaseConfig = getBaseConfig,
	resolveLayout = if FFlagEnableSplitPane then resolveLayout else nil,
	getRegionOverrides = if FFlagEnableSplitPane then getRegionOverrides else nil,
	getRegionLayout = if FFlagEnableSplitPane then getRegionLayout else nil
}