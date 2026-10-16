local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local _ = require(Parent.Style)
local _ = require(Parent.Foundation)
local ResponsiveModule = require(Parent.Responsive)
local HasExtraPlatformInsetFunction = ResponsiveModule.HardwareSafeAreaInsets.hasExtraPlatformInset
local ArgCheckModule = require(Parent.ArgCheck)
local CalculateNumColumnsModule = require(CollectionViews.calculateNumColumns)
local CollectionItemSize = require(CollectionViews.CollectionViewTypes).CollectionItemSize
local XSmallCollectionItemMinItemCount = game:DefineFastInt("XSmallCollectionItemMinItemCount", 3)
local XSmallCollectionItemMaxItemCount = game:DefineFastInt("XSmallCollectionItemMaxItemCount", 20)
local XSmallCollectionItemMinItemWidth = game:DefineFastInt("XSmallCollectionItemMinItemWidth", 100)
local XSmallCollectionItemVerticalGap = game:DefineFastInt("XSmallCollectionItemVerticalGap", 16)
local SmallCollectionItemMinItemCount = game:DefineFastInt("SmallCollectionItemMinItemCount", 3)
local SmallCollectionItemMaxItemCount = game:DefineFastInt("SmallCollectionItemMaxItemCount", 12)
local SmallCollectionItemMinItemWidth = game:DefineFastInt("SmallCollectionItemMinItemWidth", 150)
local SmallCollectionItemVerticalGap = game:DefineFastInt("SmallCollectionItemVerticalGap", 16)
local MediumCollectionItemMinItemCount = game:DefineFastInt("MediumCollectionItemMinItemCount", 2)
local MediumCollectionItemMaxItemCount = game:DefineFastInt("MediumCollectionItemMaxItemCount", 6)
local MediumCollectionItemMinItemWidth = game:DefineFastInt("MediumCollectionItemMinItemWidth", 233)
local MediumCollectionItemVerticalGap = game:DefineFastInt("MediumCollectionItemVerticalGap", 16)
local LargeCollectionItemMinItemCount = game:DefineFastInt("LargeCollectionItemMinItemCount", 1)
local LargeCollectionItemMaxItemCount = game:DefineFastInt("LargeCollectionItemMaxItemCount", 4)
local LargeCollectionItemMinItemWidth = game:DefineFastInt("LargeCollectionItemMinItemWidth", 300)
local LargeCollectionItemVerticalGap = game:DefineFastInt("LargeCollectionItemVerticalGap", 16)
local XLargeCollectionItemMinItemCount = game:DefineFastInt("XLargeCollectionItemMinItemCount", 1)
local XLargeCollectionItemMaxItemCount = game:DefineFastInt("XLargeCollectionItemMaxItemCount", 1)
local XLargeCollectionItemMinItemWidth = game:DefineFastInt("XLargeCollectionItemMinItemWidth", 300)
local XLargeCollectionItemVerticalGap = game:DefineFastInt("XLargeCollectionItemVerticalGap", 16)
local XLargeCollectionItemFractionalPercentRatio = game:DefineFastInt("XLargeCollectionItemFractionalPercent", 10) / 100
local LargeCollectionItemFractionalPercentRatio = game:DefineFastInt("LargeCollectionItemFractionalPercent", 30) / 100
local MediumCollectionItemFractionalPercentRatio = game:DefineFastInt("MediumCollectionItemFractionalPercent", 15) / 100
local SmallCollectionItemFractionalPercentRatio = game:DefineFastInt("SmallCollectionItemFractionalPercent", 15) / 100
local XSmallCollectionItemFractionalPercentRatio = game:DefineFastInt("XSmallCollectionItemFractionalPercent", 15) / 100
local FFlagLuaAppLayoutParamsInContext = require(Parent.SharedFlags).FFlagLuaAppLayoutParamsInContext

local function _(p1, p2) --[[ Line: 58 | Named "scaleSizeForPlatform" ]]
	-- upvalues: FFlagLuaAppLayoutParamsInContext (copy)
	return p1 * (if FFlagLuaAppLayoutParamsInContext then p2.Config.UI.Scale else p2.Stroke.Standard)
end

local function getLegacySideMargin(p1, p2) --[[ Line: 67 ]]
	-- upvalues: FFlagLuaAppLayoutParamsInContext (copy)
	return if p1 < 1024 * (if FFlagLuaAppLayoutParamsInContext then p2.Config.UI.Scale else p2.Stroke.Standard) then if FFlagLuaAppLayoutParamsInContext then p2.Padding.Medium else p2.Size.Size_300 elseif p1 < 1280 * (if FFlagLuaAppLayoutParamsInContext then p2.Config.UI.Scale else p2.Stroke.Standard) then 18 * (if FFlagLuaAppLayoutParamsInContext then p2.Config.UI.Scale else p2.Stroke.Standard) elseif p1 < 1440 * (if FFlagLuaAppLayoutParamsInContext then p2.Config.UI.Scale else p2.Stroke.Standard) then if FFlagLuaAppLayoutParamsInContext then p2.Margin.Medium else p2.Size.Size_600 elseif p1 < 1920 * (if FFlagLuaAppLayoutParamsInContext then p2.Config.UI.Scale else p2.Stroke.Standard) then 34 * (if FFlagLuaAppLayoutParamsInContext then p2.Config.UI.Scale else p2.Stroke.Standard) elseif p1 < 2260 * (if FFlagLuaAppLayoutParamsInContext then p2.Config.UI.Scale else p2.Stroke.Standard) then 38 * (if FFlagLuaAppLayoutParamsInContext then p2.Config.UI.Scale else p2.Stroke.Standard) elseif FFlagLuaAppLayoutParamsInContext then p2.Margin.Large else p2.Size.Size_1200
end

local _ = function(p1: number, p2) --[[ Line: 92 | Named "getLegacyColumnGap" ]]
	-- upvalues: FFlagLuaAppLayoutParamsInContext (copy)
	return if p1 < 1024 then if FFlagLuaAppLayoutParamsInContext then p2.Gap.Medium else p2.Size.Size_300 elseif p1 < 1280 then 18 elseif FFlagLuaAppLayoutParamsInContext then p2.Gap.XXLarge else p2.Size.Size_600
end

return {
	calculateNumColumns = function(p1, p2: number, p3, Small, p4) --[[ Line: 134 ]]
		-- upvalues: CollectionItemSize (copy), XLargeCollectionItemMinItemWidth (copy), FFlagLuaAppLayoutParamsInContext (copy), XLargeCollectionItemMinItemCount (copy), XLargeCollectionItemMaxItemCount (copy), LargeCollectionItemMinItemWidth (copy), LargeCollectionItemMinItemCount (copy), LargeCollectionItemMaxItemCount (copy), MediumCollectionItemMinItemWidth (copy), MediumCollectionItemMinItemCount (copy), MediumCollectionItemMaxItemCount (copy), ArgCheckModule (copy), SmallCollectionItemMinItemWidth (copy), SmallCollectionItemMinItemCount (copy), SmallCollectionItemMaxItemCount (copy), XSmallCollectionItemMinItemWidth (copy), XSmallCollectionItemMinItemCount (copy), XSmallCollectionItemMaxItemCount (copy), CalculateNumColumnsModule (copy)
		local ScaledXLargeCollectionItemMinItemWidth = nil
		local XLargeCollectionItemMinItemCount1 = nil
		local XLargeCollectionItemMaxItemCount1 = nil
		if Small == CollectionItemSize.XLarge then
			ScaledXLargeCollectionItemMinItemWidth = XLargeCollectionItemMinItemWidth * (if FFlagLuaAppLayoutParamsInContext then p4.Config.UI.Scale else p4.Stroke.Standard)
			XLargeCollectionItemMinItemCount1 = XLargeCollectionItemMinItemCount
			XLargeCollectionItemMaxItemCount1 = XLargeCollectionItemMaxItemCount
		elseif Small == CollectionItemSize.Large then
			ScaledXLargeCollectionItemMinItemWidth = LargeCollectionItemMinItemWidth * (if FFlagLuaAppLayoutParamsInContext then p4.Config.UI.Scale else p4.Stroke.Standard)
			XLargeCollectionItemMinItemCount1 = LargeCollectionItemMinItemCount
			XLargeCollectionItemMaxItemCount1 = LargeCollectionItemMaxItemCount
		elseif Small == CollectionItemSize.Medium then
			ScaledXLargeCollectionItemMinItemWidth = MediumCollectionItemMinItemWidth * (if FFlagLuaAppLayoutParamsInContext then p4.Config.UI.Scale else p4.Stroke.Standard)
			XLargeCollectionItemMinItemCount1 = MediumCollectionItemMinItemCount
			XLargeCollectionItemMaxItemCount1 = MediumCollectionItemMaxItemCount
		elseif Small == CollectionItemSize.Small then
			ArgCheckModule.assert(Small == CollectionItemSize.Small)
			ScaledXLargeCollectionItemMinItemWidth = SmallCollectionItemMinItemWidth * (if FFlagLuaAppLayoutParamsInContext then p4.Config.UI.Scale else p4.Stroke.Standard)
			XLargeCollectionItemMinItemCount1 = SmallCollectionItemMinItemCount
			XLargeCollectionItemMaxItemCount1 = SmallCollectionItemMaxItemCount
		else
			ArgCheckModule.assert(Small == CollectionItemSize.XSmall)
			ScaledXLargeCollectionItemMinItemWidth = XSmallCollectionItemMinItemWidth * (if FFlagLuaAppLayoutParamsInContext then p4.Config.UI.Scale else p4.Stroke.Standard)
			XLargeCollectionItemMinItemCount1 = XSmallCollectionItemMinItemCount
			XLargeCollectionItemMaxItemCount1 = XSmallCollectionItemMaxItemCount
		end
		return CalculateNumColumnsModule(ScaledXLargeCollectionItemMinItemWidth, p3, XLargeCollectionItemMinItemCount1, XLargeCollectionItemMaxItemCount1, p1 - p2 * 2)
	end,
	calculateSideMargin = function(_, p1, p2) --[[ Line: 108 ]]
		-- upvalues: HasExtraPlatformInsetFunction (copy), FFlagLuaAppLayoutParamsInContext (copy), getLegacySideMargin (copy)
		return if HasExtraPlatformInsetFunction() then if FFlagLuaAppLayoutParamsInContext then p1.Size.Size_1600 else p1.Size.Size_1600 else getLegacySideMargin(p2, p1)
	end,
	calculateColumnGap = function(_, p1, p2: number) --[[ Line: 125 ]]
		-- upvalues: FFlagLuaAppLayoutParamsInContext (copy)
		return if p2 < 1024 then if FFlagLuaAppLayoutParamsInContext then p1.Gap.Medium else p1.Size.Size_300 elseif p2 < 1280 then 18 elseif FFlagLuaAppLayoutParamsInContext then p1.Gap.XXLarge else p1.Size.Size_600
	end,
	calculateVerticalPadding = function(p1, Large) --[[ Line: 173 ]]
		-- upvalues: CollectionItemSize (copy), XLargeCollectionItemVerticalGap (copy), FFlagLuaAppLayoutParamsInContext (copy), LargeCollectionItemVerticalGap (copy), MediumCollectionItemVerticalGap (copy), SmallCollectionItemVerticalGap (copy), XSmallCollectionItemVerticalGap (copy)
		return if Large == CollectionItemSize.XLarge then XLargeCollectionItemVerticalGap * (if FFlagLuaAppLayoutParamsInContext then p1.Config.UI.Scale else p1.Stroke.Standard) elseif Large == CollectionItemSize.Large then LargeCollectionItemVerticalGap * (if FFlagLuaAppLayoutParamsInContext then p1.Config.UI.Scale else p1.Stroke.Standard) elseif Large == CollectionItemSize.Medium then MediumCollectionItemVerticalGap * (if FFlagLuaAppLayoutParamsInContext then p1.Config.UI.Scale else p1.Stroke.Standard) elseif Large == CollectionItemSize.Small then SmallCollectionItemVerticalGap * (if FFlagLuaAppLayoutParamsInContext then p1.Config.UI.Scale else p1.Stroke.Standard) else XSmallCollectionItemVerticalGap * (if FFlagLuaAppLayoutParamsInContext then p1.Config.UI.Scale else p1.Stroke.Standard)
	end,
	calculateFractionalItemAmount = function(Large, Directional) --[[ Line: 201 ]]
		-- upvalues: CollectionItemSize (copy), ResponsiveModule (copy), XLargeCollectionItemFractionalPercentRatio (copy), LargeCollectionItemFractionalPercentRatio (copy), MediumCollectionItemFractionalPercentRatio (copy), SmallCollectionItemFractionalPercentRatio (copy), XSmallCollectionItemFractionalPercentRatio (copy)
		return if Large == CollectionItemSize.XLarge then if Directional == ResponsiveModule.Input.Directional then 0 else XLargeCollectionItemFractionalPercentRatio elseif Large == CollectionItemSize.Large then if Directional == ResponsiveModule.Input.Directional then 0 else LargeCollectionItemFractionalPercentRatio elseif Large == CollectionItemSize.Medium then if Directional == ResponsiveModule.Input.Directional then 0 else MediumCollectionItemFractionalPercentRatio elseif Large == CollectionItemSize.Small then if Directional == ResponsiveModule.Input.Directional then 0 else SmallCollectionItemFractionalPercentRatio elseif Directional == ResponsiveModule.Input.Directional then 0 else XSmallCollectionItemFractionalPercentRatio
	end,
	calculateMaxTilesToShow = function(Directional) --[[ Line: 192 ]]
		-- upvalues: ResponsiveModule (copy)
		return if Directional == ResponsiveModule.Input.Directional then 20 else nil
	end,
	calculateLoadMoreThreshold = function(p1: number): number --[[ Line: 215 ]]
		return (math.max(1000, p1))
	end
}