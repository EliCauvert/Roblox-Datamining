local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(AvatarExperienceProfilePictureEditor.Common.TextKeys)
local SectionTitleModule = require(AvatarExperienceProfilePictureEditor.Components.SectionTitle.SectionTitle)
local AssetPickerGridBodyModule = require(script.Parent.AssetPickerGridBody)
local _ = require(script.Parent.AssetPickerTile)
local _ = require(AvatarExperienceProfilePictureEditor.Utils.getAssetPickerStatus)
local GetGridMetricsModule = require(AvatarExperienceProfilePictureEditor.Utils.getGridMetrics)
local WidgetHeader = require(Parent.AvatarExperienceUIKit).WidgetComponents.WidgetHeader

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), GetGridMetricsModule (copy), View (copy), AssetPickerGridBodyModule (copy), WidgetHeader (copy), SectionTitleModule (copy)
	local Status = p1.status or "ready"
	local UseTokensResult = UseTokensFunction()
	local ContainerWidth = p1.containerWidth
	local UseLocalizationResult = UseLocalizationFunction({ details = TextKeysModule.DetailsButton })
	local TileSize = p1.tileSize
	local Medium = UseTokensResult.Gap.Medium
	local ShimmerTileCount = p1.shimmerTileCount or 30
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseLocalizationResult (copy)
		return { details = UseLocalizationResult.details }
	end, { UseLocalizationResult.details })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: GetGridMetricsModule (upval), ContainerWidth (copy), TileSize (copy), Medium (copy), UseTokensResult (copy)
		return GetGridMetricsModule({
			containerWidth = ContainerWidth,
			minTileSize = TileSize,
			gap = Medium,
			horizontalPadding = UseTokensResult.Padding.XLarge,
			strokeInset = UseTokensResult.Padding.XSmall
		})
	end, {
		ContainerWidth,
		TileSize,
		Medium,
		UseTokensResult.Padding.XLarge,
		UseTokensResult.Padding.XSmall
	})
	local Title = p1.title or ""
	local LayoutOrder = 1
	local t = {}
	
	if p1.bannerComponent then
		t.Banner = ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = LayoutOrder }, { Banner = p1.bannerComponent })
		LayoutOrder += 1
	end
	if Status ~= "ready" or #p1.items > 0 then
		t.Grid = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y padding-x-xsmall padding-y-xsmall",
			LayoutOrder = LayoutOrder
		}, {
			Content = ReactModule.createElement(AssetPickerGridBodyModule, {
				status = Status,
				items = p1.items,
				selectedId = p1.selectedId,
				itemsPerRow = UseMemoResult1.itemsPerRow,
				gap = Medium,
				shimmerTileCount = ShimmerTileCount,
				onSelect = p1.onSelect,
				onDetailsActivated = p1.onDetailsActivated,
				labels = UseMemoResult,
				onRetry = p1.onRetry
			})
		})
		LayoutOrder += 1
	end
	if p1.footerComponent then
		t.Footer = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y padding-y-medium",
			LayoutOrder = LayoutOrder
		}, { Footer = p1.footerComponent })
	end
	local LayoutOrder1 = 1
	local t1 = {}
	
	if Title ~= "" then
		t1.Title = ReactModule.createElement(View, {
			tag = "auto-xy padding-x-xlarge",
			LayoutOrder = LayoutOrder1
		}, {
			Header = if p1.seeAllCallback then ReactModule.createElement(WidgetHeader, { titleText = Title, seeAllCallback = p1.seeAllCallback }) else ReactModule.createElement(SectionTitleModule, { title = Title })
		})
		LayoutOrder1 += 1
	end
	t1.Body = ReactModule.createElement(View, {
		tag = "col gap-small size-full-0 auto-y padding-x-xlarge",
		LayoutOrder = LayoutOrder1
	}, t)
	
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, t1)
end