local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local _ = require(parent.Style)
local _ = require(parent.Foundation)
local responsiveModule = require(parent.Responsive)
local hasExtraPlatformInset = responsiveModule.HardwareSafeAreaInsets.hasExtraPlatformInset
local argCheckModule = require(parent.ArgCheck)
local calculateNumColumnsModule = require(collectionViews.calculateNumColumns)
local collectionItemSize = require(collectionViews.CollectionViewTypes).CollectionItemSize
local xSmallCollectionItemMinItemCount = game:DefineFastInt("XSmallCollectionItemMinItemCount", 3)
local xSmallCollectionItemMaxItemCount = game:DefineFastInt("XSmallCollectionItemMaxItemCount", 20)
local xSmallCollectionItemMinItemWidth = game:DefineFastInt("XSmallCollectionItemMinItemWidth", 100)
local xSmallCollectionItemVerticalGap = game:DefineFastInt("XSmallCollectionItemVerticalGap", 16)
local xSmallCollectionItemFractionalPercent = game:DefineFastInt("XSmallCollectionItemFractionalPercent", 15)
local smallCollectionItemMinItemCount = game:DefineFastInt("SmallCollectionItemMinItemCount", 3)
local smallCollectionItemMaxItemCount = game:DefineFastInt("SmallCollectionItemMaxItemCount", 12)
local smallCollectionItemMinItemWidth = game:DefineFastInt("SmallCollectionItemMinItemWidth", 150)
local smallCollectionItemVerticalGap = game:DefineFastInt("SmallCollectionItemVerticalGap", 16)
local smallCollectionItemFractionalPercent = game:DefineFastInt("SmallCollectionItemFractionalPercent", 15)
local mediumCollectionItemMinItemCount = game:DefineFastInt("MediumCollectionItemMinItemCount", 2)
local mediumCollectionItemMaxItemCount = game:DefineFastInt("MediumCollectionItemMaxItemCount", 6)
local mediumCollectionItemMinItemWidth = game:DefineFastInt("MediumCollectionItemMinItemWidth", 233)
local mediumCollectionItemVerticalGap = game:DefineFastInt("MediumCollectionItemVerticalGap", 16)
local mediumCollectionItemFractionalPercent = game:DefineFastInt("MediumCollectionItemFractionalPercent", 15)
local largeCollectionItemMinItemCount = game:DefineFastInt("LargeCollectionItemMinItemCount", 1)
local largeCollectionItemMaxItemCount = game:DefineFastInt("LargeCollectionItemMaxItemCount", 4)
local largeCollectionItemMinItemWidth = game:DefineFastInt("LargeCollectionItemMinItemWidth", 300)
local largeCollectionItemVerticalGap = game:DefineFastInt("LargeCollectionItemVerticalGap", 16)
local largeCollectionItemFractionalPercent = game:DefineFastInt("LargeCollectionItemFractionalPercent", 30)
local xLargeCollectionItemMinItemCount = game:DefineFastInt("XLargeCollectionItemMinItemCount", 1)
local xLargeCollectionItemMaxItemCount = game:DefineFastInt("XLargeCollectionItemMaxItemCount", 1)
local xLargeCollectionItemMinItemWidth = game:DefineFastInt("XLargeCollectionItemMinItemWidth", 300)
local xLargeCollectionItemVerticalGap = game:DefineFastInt("XLargeCollectionItemVerticalGap", 16)
local var28 = game:DefineFastInt("XLargeCollectionItemFractionalPercent", 10) / 100
local var29 = largeCollectionItemFractionalPercent / 100
local var30 = mediumCollectionItemFractionalPercent / 100
local var31 = smallCollectionItemFractionalPercent / 100
local var32 = xSmallCollectionItemFractionalPercent / 100
local fFlagLuaAppLayoutParamsInContext = require(parent.SharedFlags).FFlagLuaAppLayoutParamsInContext

local function _(p0, p1)
	-- upvalues: fFlagLuaAppLayoutParamsInContext (ref)
	return p0 * (if fFlagLuaAppLayoutParamsInContext then p1.Config.UI.Scale else p1.Stroke.Standard)
end

local function getLegacySideMargin(p2, p3)
	-- upvalues: fFlagLuaAppLayoutParamsInContext (ref)
	return if p2 < 1024 * (if fFlagLuaAppLayoutParamsInContext then p3.Config.UI.Scale else p3.Stroke.Standard) then if fFlagLuaAppLayoutParamsInContext then p3.Padding.Medium else p3.Size.Size_300 elseif p2 < 1280 * (if fFlagLuaAppLayoutParamsInContext then p3.Config.UI.Scale else p3.Stroke.Standard) then 18 * (if fFlagLuaAppLayoutParamsInContext then p3.Config.UI.Scale else p3.Stroke.Standard) elseif p2 < 1440 * (if fFlagLuaAppLayoutParamsInContext then p3.Config.UI.Scale else p3.Stroke.Standard) then if fFlagLuaAppLayoutParamsInContext then p3.Margin.Medium else p3.Size.Size_600 elseif p2 < 1920 * (if fFlagLuaAppLayoutParamsInContext then p3.Config.UI.Scale else p3.Stroke.Standard) then 34 * (if fFlagLuaAppLayoutParamsInContext then p3.Config.UI.Scale else p3.Stroke.Standard) elseif p2 < 2260 * (if fFlagLuaAppLayoutParamsInContext then p3.Config.UI.Scale else p3.Stroke.Standard) then 38 * (if fFlagLuaAppLayoutParamsInContext then p3.Config.UI.Scale else p3.Stroke.Standard) elseif fFlagLuaAppLayoutParamsInContext then p3.Margin.Large else p3.Size.Size_1200
end

local _ = function(p4, p5)
	-- upvalues: fFlagLuaAppLayoutParamsInContext (ref)
	return if p4 < 1024 then if fFlagLuaAppLayoutParamsInContext then p5.Gap.Medium else p5.Size.Size_300 elseif p4 < 1280 then 18 elseif fFlagLuaAppLayoutParamsInContext then p5.Gap.XXLarge else p5.Size.Size_600
end

return {
	calculateNumColumns = function(p6, p7, p8, p9, p10)
		-- upvalues: collectionItemSize (ref), xLargeCollectionItemMinItemWidth (ref), fFlagLuaAppLayoutParamsInContext (ref), xLargeCollectionItemMinItemCount (ref), xLargeCollectionItemMaxItemCount (ref), largeCollectionItemMinItemWidth (ref), largeCollectionItemMinItemCount (ref), largeCollectionItemMaxItemCount (ref), mediumCollectionItemMinItemWidth (ref), mediumCollectionItemMinItemCount (ref), mediumCollectionItemMaxItemCount (ref), argCheckModule (ref), smallCollectionItemMinItemWidth (ref), smallCollectionItemMinItemCount (ref), smallCollectionItemMaxItemCount (ref), xSmallCollectionItemMinItemWidth (ref), xSmallCollectionItemMinItemCount (ref), xSmallCollectionItemMaxItemCount (ref), calculateNumColumnsModule (ref)
		local var34, var35, var36
		local _ = nil
		local _ = nil
		local _ = nil
		
		if p9 == collectionItemSize.XLarge then
			var34 = xLargeCollectionItemMinItemWidth * (if fFlagLuaAppLayoutParamsInContext then p10.Config.UI.Scale else p10.Stroke.Standard)
			var35 = xLargeCollectionItemMinItemCount
			var36 = xLargeCollectionItemMaxItemCount
		elseif p9 == collectionItemSize.Large then
			var34 = largeCollectionItemMinItemWidth * (if fFlagLuaAppLayoutParamsInContext then p10.Config.UI.Scale else p10.Stroke.Standard)
			var35 = largeCollectionItemMinItemCount
			var36 = largeCollectionItemMaxItemCount
		elseif p9 == collectionItemSize.Medium then
			var34 = mediumCollectionItemMinItemWidth * (if fFlagLuaAppLayoutParamsInContext then p10.Config.UI.Scale else p10.Stroke.Standard)
			var35 = mediumCollectionItemMinItemCount
			var36 = mediumCollectionItemMaxItemCount
		elseif p9 == collectionItemSize.Small then
			argCheckModule.assert(p9 == collectionItemSize.Small)
			var34 = smallCollectionItemMinItemWidth * (if fFlagLuaAppLayoutParamsInContext then p10.Config.UI.Scale else p10.Stroke.Standard)
			var35 = smallCollectionItemMinItemCount
			var36 = smallCollectionItemMaxItemCount
		else
			argCheckModule.assert(p9 == collectionItemSize.XSmall)
			var34 = xSmallCollectionItemMinItemWidth * (if fFlagLuaAppLayoutParamsInContext then p10.Config.UI.Scale else p10.Stroke.Standard)
			var35 = xSmallCollectionItemMinItemCount
			var36 = xSmallCollectionItemMaxItemCount
		end
		return calculateNumColumnsModule(var34, p8, var35, var36, p6 - p7 * 2)
	end,
	calculateSideMargin = function(_, p11, p12)
		-- upvalues: hasExtraPlatformInset (ref), fFlagLuaAppLayoutParamsInContext (ref), getLegacySideMargin (ref)
		return if hasExtraPlatformInset() then if fFlagLuaAppLayoutParamsInContext then p11.Size.Size_1600 else p11.Size.Size_1600 else getLegacySideMargin(p12, p11)
	end,
	calculateColumnGap = function(_, p13, p14)
		-- upvalues: fFlagLuaAppLayoutParamsInContext (ref)
		return if p14 < 1024 then if fFlagLuaAppLayoutParamsInContext then p13.Gap.Medium else p13.Size.Size_300 elseif p14 < 1280 then 18 elseif fFlagLuaAppLayoutParamsInContext then p13.Gap.XXLarge else p13.Size.Size_600
	end,
	calculateVerticalPadding = function(p15, p16)
		-- upvalues: collectionItemSize (ref), xLargeCollectionItemVerticalGap (ref), fFlagLuaAppLayoutParamsInContext (ref), largeCollectionItemVerticalGap (ref), mediumCollectionItemVerticalGap (ref), smallCollectionItemVerticalGap (ref), xSmallCollectionItemVerticalGap (ref)
		return if p16 == collectionItemSize.XLarge then xLargeCollectionItemVerticalGap * (if fFlagLuaAppLayoutParamsInContext then p15.Config.UI.Scale else p15.Stroke.Standard) elseif p16 == collectionItemSize.Large then largeCollectionItemVerticalGap * (if fFlagLuaAppLayoutParamsInContext then p15.Config.UI.Scale else p15.Stroke.Standard) elseif p16 == collectionItemSize.Medium then mediumCollectionItemVerticalGap * (if fFlagLuaAppLayoutParamsInContext then p15.Config.UI.Scale else p15.Stroke.Standard) elseif p16 == collectionItemSize.Small then smallCollectionItemVerticalGap * (if fFlagLuaAppLayoutParamsInContext then p15.Config.UI.Scale else p15.Stroke.Standard) else xSmallCollectionItemVerticalGap * (if fFlagLuaAppLayoutParamsInContext then p15.Config.UI.Scale else p15.Stroke.Standard)
	end,
	calculateFractionalItemAmount = function(p17, p18)
		-- upvalues: collectionItemSize (ref), responsiveModule (ref), var28 (ref), var29 (ref), var30 (ref), var31 (ref), var32 (ref)
		return if p17 == collectionItemSize.XLarge then if p18 == responsiveModule.Input.Directional then 0 else var28 elseif p17 == collectionItemSize.Large then if p18 == responsiveModule.Input.Directional then 0 else var29 elseif p17 == collectionItemSize.Medium then if p18 == responsiveModule.Input.Directional then 0 else var30 elseif p17 == collectionItemSize.Small then if p18 == responsiveModule.Input.Directional then 0 else var31 elseif p18 == responsiveModule.Input.Directional then 0 else var32
	end,
	calculateMaxTilesToShow = function(a)
		-- upvalues: responsiveModule (ref)
		return if a == responsiveModule.Input.Directional then 20 else nil
	end,
	calculateLoadMoreThreshold = function(p19)
		return math.max(1000, p19)
	end
}