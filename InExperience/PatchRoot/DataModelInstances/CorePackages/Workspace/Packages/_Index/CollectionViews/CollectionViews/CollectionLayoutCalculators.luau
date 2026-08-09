local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local _ = require(parent.Style)
local _ = require(parent.Foundation)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
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

local function _(p0, p1) --[[ line: 60 | named "scaleSizeForPlatform" ]]
	-- upvalues: fFlagLuaAppLayoutParamsInContext (ref), fFlagRenameDeprecatedUIBloxTokens (ref)
	return p0 * (if fFlagLuaAppLayoutParamsInContext then p1.Config.UI.Scale elseif fFlagRenameDeprecatedUIBloxTokens then p1.Stroke.Standard else p1.Global.Stroke_100)
end

local function getLegacySideMargin(p2, p3) --[[ line: 71 ]]
	-- upvalues: fFlagLuaAppLayoutParamsInContext (ref), fFlagRenameDeprecatedUIBloxTokens (ref)
	return if p2 < 1024 * (if fFlagLuaAppLayoutParamsInContext then p3.Config.UI.Scale elseif fFlagRenameDeprecatedUIBloxTokens then p3.Stroke.Standard else p3.Global.Stroke_100) then if fFlagLuaAppLayoutParamsInContext then p3.Padding.Medium elseif fFlagRenameDeprecatedUIBloxTokens then p3.Size.Size_300 else p3.Global.Space_150 elseif p2 < 1280 * (if fFlagLuaAppLayoutParamsInContext then p3.Config.UI.Scale elseif fFlagRenameDeprecatedUIBloxTokens then p3.Stroke.Standard else p3.Global.Stroke_100) then 18 * (if fFlagLuaAppLayoutParamsInContext then p3.Config.UI.Scale elseif fFlagRenameDeprecatedUIBloxTokens then p3.Stroke.Standard else p3.Global.Stroke_100) elseif p2 < 1440 * (if fFlagLuaAppLayoutParamsInContext then p3.Config.UI.Scale elseif fFlagRenameDeprecatedUIBloxTokens then p3.Stroke.Standard else p3.Global.Stroke_100) then if fFlagLuaAppLayoutParamsInContext then p3.Margin.Medium elseif fFlagRenameDeprecatedUIBloxTokens then p3.Size.Size_600 else p3.Global.Space_300 elseif p2 < 1920 * (if fFlagLuaAppLayoutParamsInContext then p3.Config.UI.Scale elseif fFlagRenameDeprecatedUIBloxTokens then p3.Stroke.Standard else p3.Global.Stroke_100) then 34 * (if fFlagLuaAppLayoutParamsInContext then p3.Config.UI.Scale elseif fFlagRenameDeprecatedUIBloxTokens then p3.Stroke.Standard else p3.Global.Stroke_100) elseif p2 < 2260 * (if fFlagLuaAppLayoutParamsInContext then p3.Config.UI.Scale elseif fFlagRenameDeprecatedUIBloxTokens then p3.Stroke.Standard else p3.Global.Stroke_100) then 38 * (if fFlagLuaAppLayoutParamsInContext then p3.Config.UI.Scale elseif fFlagRenameDeprecatedUIBloxTokens then p3.Stroke.Standard else p3.Global.Stroke_100) elseif fFlagLuaAppLayoutParamsInContext then p3.Margin.Large elseif fFlagRenameDeprecatedUIBloxTokens then p3.Size.Size_1200 else p3.Global.Space_600
end

local _ = function(p4, p5) --[[ line: 102 | named "getLegacyColumnGap" ]]
	-- upvalues: fFlagLuaAppLayoutParamsInContext (ref), fFlagRenameDeprecatedUIBloxTokens (ref)
	return if p4 < 1024 then if fFlagLuaAppLayoutParamsInContext then p5.Gap.Medium elseif fFlagRenameDeprecatedUIBloxTokens then p5.Size.Size_300 else p5.Global.Space_150 elseif p4 < 1280 then 18 elseif fFlagLuaAppLayoutParamsInContext then p5.Gap.XXLarge elseif fFlagRenameDeprecatedUIBloxTokens then p5.Size.Size_600 else p5.Global.Space_300
end

return {
	calculateNumColumns = function(p6, p7, p8, p9, p10) --[[ line: 167 ]]
		-- upvalues: collectionItemSize (ref), xLargeCollectionItemMinItemWidth (ref), fFlagLuaAppLayoutParamsInContext (ref), fFlagRenameDeprecatedUIBloxTokens (ref), xLargeCollectionItemMinItemCount (ref), xLargeCollectionItemMaxItemCount (ref), largeCollectionItemMinItemWidth (ref), largeCollectionItemMinItemCount (ref), largeCollectionItemMaxItemCount (ref), mediumCollectionItemMinItemWidth (ref), mediumCollectionItemMinItemCount (ref), mediumCollectionItemMaxItemCount (ref), argCheckModule (ref), smallCollectionItemMinItemWidth (ref), smallCollectionItemMinItemCount (ref), smallCollectionItemMaxItemCount (ref), xSmallCollectionItemMinItemWidth (ref), xSmallCollectionItemMinItemCount (ref), xSmallCollectionItemMaxItemCount (ref), calculateNumColumnsModule (ref)
		local var34, var35, var36
		local _ = nil
		local _ = nil
		local _ = nil
		
		if p9 == collectionItemSize.XLarge then
			var34 = xLargeCollectionItemMinItemWidth * (if fFlagLuaAppLayoutParamsInContext then p10.Config.UI.Scale elseif fFlagRenameDeprecatedUIBloxTokens then p10.Stroke.Standard else p10.Global.Stroke_100)
			var35 = xLargeCollectionItemMinItemCount
			var36 = xLargeCollectionItemMaxItemCount
		elseif p9 == collectionItemSize.Large then
			var34 = largeCollectionItemMinItemWidth * (if fFlagLuaAppLayoutParamsInContext then p10.Config.UI.Scale elseif fFlagRenameDeprecatedUIBloxTokens then p10.Stroke.Standard else p10.Global.Stroke_100)
			var35 = largeCollectionItemMinItemCount
			var36 = largeCollectionItemMaxItemCount
		elseif p9 == collectionItemSize.Medium then
			var34 = mediumCollectionItemMinItemWidth * (if fFlagLuaAppLayoutParamsInContext then p10.Config.UI.Scale elseif fFlagRenameDeprecatedUIBloxTokens then p10.Stroke.Standard else p10.Global.Stroke_100)
			var35 = mediumCollectionItemMinItemCount
			var36 = mediumCollectionItemMaxItemCount
		elseif p9 == collectionItemSize.Small then
			argCheckModule.assert(p9 == collectionItemSize.Small)
			var34 = smallCollectionItemMinItemWidth * (if fFlagLuaAppLayoutParamsInContext then p10.Config.UI.Scale elseif fFlagRenameDeprecatedUIBloxTokens then p10.Stroke.Standard else p10.Global.Stroke_100)
			var35 = smallCollectionItemMinItemCount
			var36 = smallCollectionItemMaxItemCount
		else
			argCheckModule.assert(p9 == collectionItemSize.XSmall)
			var34 = xSmallCollectionItemMinItemWidth * (if fFlagLuaAppLayoutParamsInContext then p10.Config.UI.Scale elseif fFlagRenameDeprecatedUIBloxTokens then p10.Stroke.Standard else p10.Global.Stroke_100)
			var35 = xSmallCollectionItemMinItemCount
			var36 = xSmallCollectionItemMaxItemCount
		end
		return calculateNumColumnsModule(var34, p8, var35, var36, p6 - p7 * 2)
	end,
	calculateSideMargin = function(_, p11, p12) --[[ line: 122 ]]
		-- upvalues: hasExtraPlatformInset (ref), fFlagLuaAppLayoutParamsInContext (ref), fFlagRenameDeprecatedUIBloxTokens (ref), getLegacySideMargin (ref)
		return if hasExtraPlatformInset() then if fFlagLuaAppLayoutParamsInContext then p11.Size.Size_1600 elseif fFlagRenameDeprecatedUIBloxTokens then p11.Size.Size_1600 else p11.Global.Space_800 else getLegacySideMargin(p12, p11)
	end,
	calculateColumnGap = function(_, p13, p14) --[[ line: 150 ]]
		-- upvalues: fFlagLuaAppLayoutParamsInContext (ref), fFlagRenameDeprecatedUIBloxTokens (ref)
		return if p14 < 1024 then if fFlagLuaAppLayoutParamsInContext then p13.Gap.Medium elseif fFlagRenameDeprecatedUIBloxTokens then p13.Size.Size_300 else p13.Global.Space_150 elseif p14 < 1280 then 18 elseif fFlagLuaAppLayoutParamsInContext then p13.Gap.XXLarge elseif fFlagRenameDeprecatedUIBloxTokens then p13.Size.Size_600 else p13.Global.Space_300
	end,
	calculateVerticalPadding = function(p15, p16) --[[ line: 206 ]]
		-- upvalues: collectionItemSize (ref), xLargeCollectionItemVerticalGap (ref), fFlagLuaAppLayoutParamsInContext (ref), fFlagRenameDeprecatedUIBloxTokens (ref), largeCollectionItemVerticalGap (ref), mediumCollectionItemVerticalGap (ref), smallCollectionItemVerticalGap (ref), xSmallCollectionItemVerticalGap (ref)
		return if p16 == collectionItemSize.XLarge then xLargeCollectionItemVerticalGap * (if fFlagLuaAppLayoutParamsInContext then p15.Config.UI.Scale elseif fFlagRenameDeprecatedUIBloxTokens then p15.Stroke.Standard else p15.Global.Stroke_100) elseif p16 == collectionItemSize.Large then largeCollectionItemVerticalGap * (if fFlagLuaAppLayoutParamsInContext then p15.Config.UI.Scale elseif fFlagRenameDeprecatedUIBloxTokens then p15.Stroke.Standard else p15.Global.Stroke_100) elseif p16 == collectionItemSize.Medium then mediumCollectionItemVerticalGap * (if fFlagLuaAppLayoutParamsInContext then p15.Config.UI.Scale elseif fFlagRenameDeprecatedUIBloxTokens then p15.Stroke.Standard else p15.Global.Stroke_100) elseif p16 == collectionItemSize.Small then smallCollectionItemVerticalGap * (if fFlagLuaAppLayoutParamsInContext then p15.Config.UI.Scale elseif fFlagRenameDeprecatedUIBloxTokens then p15.Stroke.Standard else p15.Global.Stroke_100) else xSmallCollectionItemVerticalGap * (if fFlagLuaAppLayoutParamsInContext then p15.Config.UI.Scale elseif fFlagRenameDeprecatedUIBloxTokens then p15.Stroke.Standard else p15.Global.Stroke_100)
	end,
	calculateFractionalItemAmount = function(p17, p18) --[[ line: 234 ]]
		-- upvalues: collectionItemSize (ref), responsiveModule (ref), var28 (ref), var29 (ref), var30 (ref), var31 (ref), var32 (ref)
		return if p17 == collectionItemSize.XLarge then if p18 == responsiveModule.Input.Directional then 0 else var28 elseif p17 == collectionItemSize.Large then if p18 == responsiveModule.Input.Directional then 0 else var29 elseif p17 == collectionItemSize.Medium then if p18 == responsiveModule.Input.Directional then 0 else var30 elseif p17 == collectionItemSize.Small then if p18 == responsiveModule.Input.Directional then 0 else var31 elseif p18 == responsiveModule.Input.Directional then 0 else var32
	end,
	calculateMaxTilesToShow = function(a) --[[ line: 225 ]]
		-- upvalues: responsiveModule (ref)
		return if a == responsiveModule.Input.Directional then 20 else nil
	end,
	calculateLoadMoreThreshold = function(p19) --[[ line: 248 ]]
		return math.max(1000, p19)
	end
}