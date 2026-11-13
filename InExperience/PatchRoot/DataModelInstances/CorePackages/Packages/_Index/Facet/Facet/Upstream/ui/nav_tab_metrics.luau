local _ = require("./theme_types")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("../vendor/compose/core")
local SegmentMetricsModule = require("./segment_metrics")
local _ = require("./navigation_props")

return function(p1, p2, p3)
	-- upvalues: SegmentMetricsModule (copy)
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesUDim = p1.types.UDim
	local Fit = p3.fit
	local Placement = p3.placement
	local VisibleTabs = p3.visibleTabs
	local Dimensions = p3.dimensions
	local LayoutUnit = p3.layoutUnit
	local IndicatorOfFunction = p3.indicatorOf
	local HeadHeight = p3.headHeight
	local FootHeight = p3.footHeight
	local TrailingWidth = p3.trailingWidth
	local CellResult = Compose.cell({})
	local CellResult1 = Compose.cell(p1.types.Vector2.zero)
	local FormulaResult = Compose.formula(function(Callback): boolean
		-- upvalues: Fit (copy), Placement (copy), CellResult1 (copy), VisibleTabs (copy), p1 (copy), CellResult (copy)
		if not Fit or string.find(Callback(Placement), "bottom") == nil then
			return false
		end
		local X: number = Callback(CellResult1).X
		
		if X <= 0 then
			return false
		end
		local XDelta = X / math.max(1, #Callback(VisibleTabs)) - 4 - 2 * p1.controlSize(nil, "paddingX", Callback)
		local TypographyCaptionSizeRatio = p1.metric("typography.caption.size", Callback) / p1.metric("typography.control.size", Callback)
		
		for _, value in Callback(CellResult) do
			if XDelta + 0.5 < value * TypographyCaptionSizeRatio then
				return true
			end
		end
		return false
	end)
	
	local function floating(p4): boolean
		-- upvalues: ReadFunction (copy), p2 (copy), p1 (copy), Placement (copy)
		local ReadResult = ReadFunction(p2.track, p4)
		assert(ReadResult == nil or (ReadResult == "automatic" or ReadResult == "floating"), "Invalid TabView.track")
		local Source: string = p1.readSource(Placement, p4)
		
		return ReadResult == "floating" and (Source == "sidebar" or string.find(Source, "bottom") ~= nil)
	end
	
	local CellResult2 = Compose.cell({})
	
	local function iconGap(Callback)
		-- upvalues: p1 (copy), ReadFunction (copy), p2 (copy), CellResult2 (copy)
		local SpaceXs = p1.metric("space.xs", Callback)
		
		if ReadFunction(p2.indicator, Callback) == "mark" and ReadFunction(p2.indicatorPlacement, Callback) == "belowIcon" then
			SpaceXs = math.max(SpaceXs, p1.metric("controls.tabMark.height", Callback) + 2 * p1.metric("controls.tabMark.gap", Callback))
		end
		local CallbackResult = if Callback then Callback(CellResult2) else CellResult2:peek()
		for _, value in CallbackResult do
			SpaceXs = math.max(SpaceXs, value)
		end
		return SpaceXs
	end
	
	local function band(p4)
		-- upvalues: p1 (copy), floating (copy), Placement (copy), ReadFunction (copy), p2 (copy), Fit (copy), iconGap (copy)
		local TargetSizesMinimum = p1.metric("targetSizes.minimum", p4)
		
		if floating(p4) and p1.readSource(Placement, p4) ~= "sidebar" then
			TargetSizesMinimum = math.max(TargetSizesMinimum, p1.metric("controls.tabBottomTrack.height", p4))
		end
		local ReadResult = ReadFunction(p2.labelPlacement, p4)
		
		if not ReadFunction(p2.iconOnly, p4) and (string.find(p1.readSource(Placement, p4), "bottom") ~= nil and ReadResult == "belowIcon") then
			local ReadResult1 = if Fit then nil else ReadFunction(p2.textSize, p4)
			
			return (math.max(TargetSizesMinimum, p1.controlSize(p2.controlSize, "iconSize", p4) + math.ceil((if type(ReadResult1) == "number" then ReadResult1 else p1.metric("typography.control.size", p4)) * p1.metric("typography.control.lineHeight", p4)) + iconGap(p4) + math.max(0, p1.controlSize(p2.controlSize, "height", p4) - p1.controlSize(p2.controlSize, "iconSize", p4), if ReadFunction(p2.indicator, p4) == "mark" then 2 * (p1.metric("controls.tabMark.height", p4) + p1.metric("controls.tabMark.gap", p4)) else 0)))
		else
			return TargetSizesMinimum
		end
	end
	
	local Inset = SegmentMetricsModule.inset
	local CellResult3 = Compose.cell(false)
	local UIListLayoutResult = p1.Host.UIListLayout({
		FillDirection = function(Callback)
			-- upvalues: Placement (copy), TypesEnum (copy)
			return if Callback(Placement) == "sidebar" then TypesEnum.FillDirection.Vertical else TypesEnum.FillDirection.Horizontal
		end,
		SortOrder = TypesEnum.SortOrder.LayoutOrder,
		HorizontalAlignment = TypesEnum.HorizontalAlignment.Center,
		VerticalAlignment = function(Callback)
			-- upvalues: Placement (copy), TypesEnum (copy)
			return if Callback(Placement) == "sidebar" then TypesEnum.VerticalAlignment.Top else TypesEnum.VerticalAlignment.Center
		end,
		Padding = TypesUDim.new(0, 4)
	})
	
	local function railWidth(Callback)
		-- upvalues: ReadFunction (copy), p2 (copy), CellResult (copy), Dimensions (copy), LayoutUnit (copy), VisibleTabs (copy), p1 (copy), IndicatorOfFunction (copy), Inset (copy), ReadFunction (copy)
		local ReadResult = ReadFunction(p2.railWidth, Callback)
		
		if ReadResult then
			return ReadResult
		end
		local Largest = 0
		
		for _, value in Callback(CellResult) do
			Largest = math.max(Largest, value)
		end
		if Largest <= 0 then
			return (math.clamp(math.floor(Callback(Dimensions).X * 0.2), 200, 280))
		end
		local CallbackResult: number = Callback(LayoutUnit)
		local NewIconSize = 0
		
		for _, value1 in Callback(VisibleTabs) do
			if value1.icon or value1.glyph then
				NewIconSize = p1.controlSize(p2.controlSize, "iconSize", Callback) + p1.metric("space.xs", Callback)
				break
			end
		end
		local LargestRatio = Largest / (if CallbackResult > 0 then CallbackResult else 1)
		local ReadResult1 = ReadFunction(p1.config.theme, Callback)
		local Control = ReadResult1 and (ReadResult1.chrome and ReadResult1.chrome.control)
		local ContentInsets = if Control then Control.contentInsets else nil
		
		return math.ceil(LargestRatio + NewIconSize + 2 * p1.controlSize(p2.controlSize, "paddingX", Callback) + (if ContentInsets then (ContentInsets.left or 0) + (ContentInsets.right or 0) else 0)) + 16 + (if IndicatorOfFunction(Callback) == "pill" then 2 * Inset else 0)
	end
	
	return {
		wordWidths = CellResult,
		barExtent = CellResult1,
		stacked = function(p4): boolean
			-- upvalues: ReadFunction (copy), p2 (copy), p1 (copy), Placement (copy)
			local ReadResult = ReadFunction(p2.labelPlacement, p4)
			
			return not ReadFunction(p2.iconOnly, p4) and (string.find(p1.readSource(Placement, p4), "bottom") ~= nil and ReadResult == "belowIcon")
		end,
		crowded = FormulaResult,
		labelLine = function(p4): number
			-- upvalues: Fit (copy), ReadFunction (copy), p2 (copy), p1 (copy)
			local ReadResult = if Fit then nil else ReadFunction(p2.textSize, p4)
			
			return (math.ceil((if type(ReadResult) == "number" then ReadResult else p1.metric("typography.control.size", p4)) * p1.metric("typography.control.lineHeight", p4)))
		end,
		floating = floating,
		bottomInset = function(p4)
			-- upvalues: floating (copy), p1 (copy), Placement (copy)
			return if floating(p4) and p1.readSource(Placement, p4) ~= "sidebar" then p1.metric("controls.tabBottomTrack.bottomInset", p4) else 0
		end,
		contentGap = function(p4)
			-- upvalues: floating (copy), p1 (copy)
			return if floating(p4) then p1.metric("controls.tabBottomTrack.contentGap", p4) else 8
		end,
		badgeClearances = CellResult2,
		iconGap = iconGap,
		band = band,
		tabHeight = function(p4)
			-- upvalues: p2 (copy), ReadFunction (copy), p1 (copy), Placement (copy), floating (copy), band (copy)
			if p2.controlSize ~= nil then
				local ReadResult = ReadFunction(p2.labelPlacement, p4)
				
				if (ReadFunction(p2.iconOnly, p4) or (string.find(p1.readSource(Placement, p4), "bottom") == nil or ReadResult ~= "belowIcon")) and (not floating(p4) or p1.readSource(Placement, p4) == "sidebar") then
					return (p1.controlSize(p2.controlSize, "height", p4))
				end
			end
			return (band(p4))
		end,
		segmentedTop = function(Callback): boolean
			-- upvalues: Placement (copy), IndicatorOfFunction (copy)
			return Callback(Placement) == "topBar" and IndicatorOfFunction(Callback) == "pill"
		end,
		plated = function(Callback): boolean
			-- upvalues: IndicatorOfFunction (copy), Placement (copy)
			return IndicatorOfFunction(Callback) == "pill" and (Callback(Placement) == "topBar" or Callback(Placement) == "sidebar")
		end,
		inset = function(Callback)
			-- upvalues: TypesUDim (copy), IndicatorOfFunction (copy), Placement (copy), Inset (copy)
			local NewFunction = TypesUDim.new
			local IsTopBar: boolean = IndicatorOfFunction(Callback) == "pill" and (Callback(Placement) == "topBar" or Callback(Placement) == "sidebar")
			
			return NewFunction(0, if IsTopBar then Inset else 0)
		end,
		stripOverflows = CellResult3,
		stripLayout = UIListLayoutResult,
		stripContent = p1.observe.AbsoluteContentSize(UIListLayoutResult),
		railWidth = railWidth,
		floatingSize = function(Callback)
			-- upvalues: Placement (copy), TypesUDim2 (copy), railWidth (copy), p1 (copy), HeadHeight (copy), FootHeight (copy), TrailingWidth (copy), band (copy)
			return if Callback(Placement) == "sidebar" then TypesUDim2.new(0, railWidth(Callback) - 2 * p1.metric("controls.tabRailTrack.sideInset", Callback), 1, -Callback(HeadHeight) - Callback(FootHeight) - p1.metric("controls.tabRailTrack.topInset", Callback) - p1.metric("controls.tabRailTrack.bottomInset", Callback)) else TypesUDim2.new(1, -2 * p1.metric("controls.tabBottomTrack.sideInset", Callback) - Callback(TrailingWidth), 0, (band(Callback)))
		end,
		floatingPosition = function(Callback)
			-- upvalues: Placement (copy), TypesUDim2 (copy), p1 (copy), HeadHeight (copy), band (copy), floating (copy)
			return if Callback(Placement) == "sidebar" then TypesUDim2.fromOffset(p1.metric("controls.tabRailTrack.sideInset", Callback), Callback(HeadHeight) + p1.metric("controls.tabRailTrack.topInset", Callback)) else TypesUDim2.new(0, p1.metric("controls.tabBottomTrack.sideInset", Callback), 1, -band(Callback) - (if floating(Callback) and p1.readSource(Placement, Callback) ~= "sidebar" then p1.metric("controls.tabBottomTrack.bottomInset", Callback) else 0))
		end
	}
end