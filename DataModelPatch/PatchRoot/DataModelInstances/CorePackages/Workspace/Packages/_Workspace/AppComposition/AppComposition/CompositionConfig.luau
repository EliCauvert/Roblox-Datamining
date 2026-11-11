local AppComposition = script:FindFirstAncestor("AppComposition")
local Parent = AppComposition.Parent
local Breakpoint = require(Parent.Foundation).Enums.Breakpoint
local HardwareSafeAreaInsets = require(Parent.Responsive).HardwareSafeAreaInsets
local _ = require(AppComposition.AppCompositionTypes)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableLeftNavOnConsole = SharedFlagsModule.FFlagEnableLeftNavOnConsole
local FFlagEnableSplitPane = SharedFlagsModule.FFlagEnableSplitPane
local RegionName = require(AppComposition.AppCompositionEnums).RegionName

local function getRegionOverrides(SupportRegion)
	-- upvalues: RegionName (copy)
	return if SupportRegion == RegionName.SupportRegion then { width = 532, minWidth = 224, maxWidth = 640 } else nil
end

local function getBaseConfig(Large, p1)
	-- upvalues: Breakpoint (copy), FFlagEnableLeftNavOnConsole (copy), HardwareSafeAreaInsets (copy)
	local config = nil
	if Large == Breakpoint.XSmall then
		local Size300: number = p1.Size.Size_300
		config = {
			columns = 3,
			margin = Size300,
			gutter = p1.Gutter.Small,
			carouselPeek = 2 * Size300
		}
	elseif Large == Breakpoint.Small then
		local Small: number = p1.Margin.Small
		config = {
			columns = 6,
			margin = Small,
			gutter = p1.Gutter.Medium,
			carouselPeek = 2 * Small
		}
	else
		config = if Large == Breakpoint.Medium then {
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
	if not FFlagEnableLeftNavOnConsole and HardwareSafeAreaInsets.hasExtraPlatformInset() then
		config.margin = HardwareSafeAreaInsets.deviceInsets().left
	end
	return config
end

local function resolveLayout(p1, p2)
	-- upvalues: getBaseConfig (copy)
	return (getBaseConfig(p1, p2))
end

local function getRegionLayout(SupportRegion, p1, p2)
	-- upvalues: getBaseConfig (copy), RegionName (copy)
	local BaseConfig = getBaseConfig(p1, p2)
	local Config = if SupportRegion == RegionName.SupportRegion then { width = 532, minWidth = 224, maxWidth = 640 } else nil
	
	if Config then
		BaseConfig.width = Config.width
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