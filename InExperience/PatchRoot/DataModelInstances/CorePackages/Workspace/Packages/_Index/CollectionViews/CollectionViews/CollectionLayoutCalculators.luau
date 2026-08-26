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
local var1 = game:DefineFastInt("XLargeCollectionItemFractionalPercent", 10) / 100
local var2 = largeCollectionItemFractionalPercent / 100
local var3 = mediumCollectionItemFractionalPercent / 100
local var4 = smallCollectionItemFractionalPercent / 100
local var5 = xSmallCollectionItemFractionalPercent / 100
local fFlagLuaAppLayoutParamsInContext = require(parent.SharedFlags).FFlagLuaAppLayoutParamsInContext

local function _(p1, p2)
	-- upvalues: fFlagLuaAppLayoutParamsInContext (ref)
	return p1 * (if fFlagLuaAppLayoutParamsInContext then p2.Config.UI.Scale else p2.Stroke.Standard)
end

local function getLegacySideMargin(p1, p2)
	-- upvalues: fFlagLuaAppLayoutParamsInContext (ref)
	return if p1 < 1024 * (if fFlagLuaAppLayoutParamsInContext then p2.Config.UI.Scale else p2.Stroke.Standard) then if fFlagLuaAppLayoutParamsInContext then p2.Padding.Medium else p2.Size.Size_300 elseif p1 < 1280 * (if fFlagLuaAppLayoutParamsInContext then p2.Config.UI.Scale else p2.Stroke.Standard) then 18 * (if fFlagLuaAppLayoutParamsInContext then p2.Config.UI.Scale else p2.Stroke.Standard) elseif p1 < 1440 * (if fFlagLuaAppLayoutParamsInContext then p2.Config.UI.Scale else p2.Stroke.Standard) then if fFlagLuaAppLayoutParamsInContext then p2.Margin.Medium else p2.Size.Size_600 elseif p1 < 1920 * (if fFlagLuaAppLayoutParamsInContext then p2.Config.UI.Scale else p2.Stroke.Standard) then 34 * (if fFlagLuaAppLayoutParamsInContext then p2.Config.UI.Scale else p2.Stroke.Standard) elseif p1 < 2260 * (if fFlagLuaAppLayoutParamsInContext then p2.Config.UI.Scale else p2.Stroke.Standard) then 38 * (if fFlagLuaAppLayoutParamsInContext then p2.Config.UI.Scale else p2.Stroke.Standard) elseif fFlagLuaAppLayoutParamsInContext then p2.Margin.Large else p2.Size.Size_1200
end

local _ = function(p1, p2)
	-- upvalues: fFlagLuaAppLayoutParamsInContext (ref)
	return if p1 < 1024 then if fFlagLuaAppLayoutParamsInContext then p2.Gap.Medium else p2.Size.Size_300 elseif p1 < 1280 then 18 elseif fFlagLuaAppLayoutParamsInContext then p2.Gap.XXLarge else p2.Size.Size_600
end

return {
	calculateNumColumns = function(p1, p2, p3, p4, p5)
		-- upvalues: collectionItemSize (ref), xLargeCollectionItemMinItemWidth (ref), fFlagLuaAppLayoutParamsInContext (ref), xLargeCollectionItemMinItemCount (ref), xLargeCollectionItemMaxItemCount (ref), largeCollectionItemMinItemWidth (ref), largeCollectionItemMinItemCount (ref), largeCollectionItemMaxItemCount (ref), mediumCollectionItemMinItemWidth (ref), mediumCollectionItemMinItemCount (ref), mediumCollectionItemMaxItemCount (ref), argCheckModule (ref), smallCollectionItemMinItemWidth (ref), smallCollectionItemMinItemCount (ref), smallCollectionItemMaxItemCount (ref), xSmallCollectionItemMinItemWidth (ref), xSmallCollectionItemMinItemCount (ref), xSmallCollectionItemMaxItemCount (ref), calculateNumColumnsModule (ref)
		local var6, var7, var8
		local _ = nil
		local _ = nil
		local _ = nil
		
		if p4 == collectionItemSize.XLarge then
			var6 = xLargeCollectionItemMinItemWidth * (if fFlagLuaAppLayoutParamsInContext then p5.Config.UI.Scale else p5.Stroke.Standard)
			var7 = xLargeCollectionItemMinItemCount
			var8 = xLargeCollectionItemMaxItemCount
		elseif p4 == collectionItemSize.Large then
			var6 = largeCollectionItemMinItemWidth * (if fFlagLuaAppLayoutParamsInContext then p5.Config.UI.Scale else p5.Stroke.Standard)
			var7 = largeCollectionItemMinItemCount
			var8 = largeCollectionItemMaxItemCount
		elseif p4 == collectionItemSize.Medium then
			var6 = mediumCollectionItemMinItemWidth * (if fFlagLuaAppLayoutParamsInContext then p5.Config.UI.Scale else p5.Stroke.Standard)
			var7 = mediumCollectionItemMinItemCount
			var8 = mediumCollectionItemMaxItemCount
		elseif p4 == collectionItemSize.Small then
			argCheckModule.assert(p4 == collectionItemSize.Small)
			var6 = smallCollectionItemMinItemWidth * (if fFlagLuaAppLayoutParamsInContext then p5.Config.UI.Scale else p5.Stroke.Standard)
			var7 = smallCollectionItemMinItemCount
			var8 = smallCollectionItemMaxItemCount
		else
			argCheckModule.assert(p4 == collectionItemSize.XSmall)
			var6 = xSmallCollectionItemMinItemWidth * (if fFlagLuaAppLayoutParamsInContext then p5.Config.UI.Scale else p5.Stroke.Standard)
			var7 = xSmallCollectionItemMinItemCount
			var8 = xSmallCollectionItemMaxItemCount
		end
		return calculateNumColumnsModule(var6, p3, var7, var8, p1 - p2 * 2)
	end,
	calculateSideMargin = function(_, p1, p2)
		-- upvalues: hasExtraPlatformInset (ref), fFlagLuaAppLayoutParamsInContext (ref), getLegacySideMargin (ref)
		return if hasExtraPlatformInset() then if fFlagLuaAppLayoutParamsInContext then p1.Size.Size_1600 else p1.Size.Size_1600 else getLegacySideMargin(p2, p1)
	end,
	calculateColumnGap = function(_, p1, p2)
		-- upvalues: fFlagLuaAppLayoutParamsInContext (ref)
		return if p2 < 1024 then if fFlagLuaAppLayoutParamsInContext then p1.Gap.Medium else p1.Size.Size_300 elseif p2 < 1280 then 18 elseif fFlagLuaAppLayoutParamsInContext then p1.Gap.XXLarge else p1.Size.Size_600
	end,
	calculateVerticalPadding = function(p1, p2)
		-- upvalues: collectionItemSize (ref), xLargeCollectionItemVerticalGap (ref), fFlagLuaAppLayoutParamsInContext (ref), largeCollectionItemVerticalGap (ref), mediumCollectionItemVerticalGap (ref), smallCollectionItemVerticalGap (ref), xSmallCollectionItemVerticalGap (ref)
		return if p2 == collectionItemSize.XLarge then xLargeCollectionItemVerticalGap * (if fFlagLuaAppLayoutParamsInContext then p1.Config.UI.Scale else p1.Stroke.Standard) elseif p2 == collectionItemSize.Large then largeCollectionItemVerticalGap * (if fFlagLuaAppLayoutParamsInContext then p1.Config.UI.Scale else p1.Stroke.Standard) elseif p2 == collectionItemSize.Medium then mediumCollectionItemVerticalGap * (if fFlagLuaAppLayoutParamsInContext then p1.Config.UI.Scale else p1.Stroke.Standard) elseif p2 == collectionItemSize.Small then smallCollectionItemVerticalGap * (if fFlagLuaAppLayoutParamsInContext then p1.Config.UI.Scale else p1.Stroke.Standard) else xSmallCollectionItemVerticalGap * (if fFlagLuaAppLayoutParamsInContext then p1.Config.UI.Scale else p1.Stroke.Standard)
	end,
	calculateFractionalItemAmount = function(p1, p2)
		-- upvalues: collectionItemSize (ref), responsiveModule (ref), var1 (ref), var2 (ref), var3 (ref), var4 (ref), var5 (ref)
		return if p1 == collectionItemSize.XLarge then if p2 == responsiveModule.Input.Directional then 0 else var1 elseif p1 == collectionItemSize.Large then if p2 == responsiveModule.Input.Directional then 0 else var2 elseif p1 == collectionItemSize.Medium then if p2 == responsiveModule.Input.Directional then 0 else var3 elseif p1 == collectionItemSize.Small then if p2 == responsiveModule.Input.Directional then 0 else var4 elseif p2 == responsiveModule.Input.Directional then 0 else var5
	end,
	calculateMaxTilesToShow = function(a)
		-- upvalues: responsiveModule (ref)
		return if a == responsiveModule.Input.Directional then 20 else nil
	end,
	calculateLoadMoreThreshold = function(p1)
		return math.max(1000, p1)
	end
}