local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local AvatarExperienceUIKitModule = require(Parent.AvatarExperienceUIKit)
local View = FoundationModule.View
local ScrollView = FoundationModule.ScrollView
local Visibility = FoundationModule.Enums.Visibility
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SectionTitleModule = require(AvatarExperienceProfilePictureEditor.Components.SectionTitle.SectionTitle)
local SectionTitleWithActionModule = require(AvatarExperienceProfilePictureEditor.Components.SectionTitle.SectionTitleWithAction)
local AssetPickerErrorBodyModule = require(script.Parent.AssetPickerErrorBody)
local AssetPickerTileModule = require(script.Parent.AssetPickerTile)
local _ = require(AvatarExperienceProfilePictureEditor.Utils.getAssetPickerStatus)
local TextKeysModule = require(AvatarExperienceProfilePictureEditor.Common.TextKeys)
local WidgetLayout = AvatarExperienceUIKitModule.WidgetComponents.WidgetLayout
local ItemCardThumbnailSkeleton = AvatarExperienceUIKitModule.ItemCardComponents.ItemCardThumbnailSkeleton

return function(p1) --[[ Line: 48 | Named "AssetPickerCarousel" ]]
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), View (copy), AssetPickerTileModule (copy), AssetPickerErrorBodyModule (copy), ItemCardThumbnailSkeleton (copy), Radius (copy), ScrollView (copy), Visibility (copy), WidgetLayout (copy), SectionTitleWithActionModule (copy), SectionTitleModule (copy)
	local Status = p1.status or "ready"
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({ details = TextKeysModule.DetailsButton })
	local TileSize = p1.tileSize
	local ShimmerTileCount = p1.shimmerTileCount or 8
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 56 ]]
		-- upvalues: UseLocalizationResult (copy)
		return { details = UseLocalizationResult.details }
	end, { UseLocalizationResult.details })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 63 ]]
		-- upvalues: p1 (copy), ReactModule (upval), View (upval), TileSize (copy), AssetPickerTileModule (upval), UseMemoResult (copy)
		local Elements = {}
		
		for LayoutOrder, item in p1.items do
			Elements["Asset_" .. item.id] = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y",
				Size = UDim2.fromOffset(TileSize, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = LayoutOrder
			}, {
				Tile = ReactModule.createElement(AssetPickerTileModule, {
					item = item,
					selectedId = p1.selectedId,
					onSelect = p1.onSelect,
					onDetailsActivated = p1.onDetailsActivated,
					labels = UseMemoResult
				})
			})
		end
		if p1.trailingCarouselComponent then
			Elements.Trailing = p1.trailingCarouselComponent
		end
		return Elements
	end, {
		p1.items, p1.selectedId, TileSize, p1.onSelect, p1.onDetailsActivated,
		UseMemoResult, p1.trailingCarouselComponent
	})
	local Title = p1.title or ""
	local HasOnTitleActivated: boolean = Status == "ready" and p1.onTitleActivated ~= nil
	local LayoutOrder = 1
	local t = {}
	
	if p1.bannerComponent then
		t.Banner = ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = LayoutOrder }, { Banner = p1.bannerComponent })
		LayoutOrder += 1
	end
	if Status == "error" then
		t.Error = ReactModule.createElement(AssetPickerErrorBodyModule, { onRetry = p1.onRetry, layoutOrder = LayoutOrder })
	else
		local Elements = nil
		if Status == "loading" then
			Elements = {}
			
			for i = 1, ShimmerTileCount do
				Elements["Shimmer_" .. i] = ReactModule.createElement(ItemCardThumbnailSkeleton, {
					Size = UDim2.fromOffset(TileSize, TileSize),
					radius = Radius.Medium,
					LayoutOrder = i
				})
			end
		else
			Elements = UseMemoResult1
		end
		local Copy = table.clone(Elements)
		Copy.CarouselStrokeInset = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseTokensResult.Padding.XSmall),
			PaddingBottom = UDim.new(0, UseTokensResult.Padding.XSmall),
			PaddingLeft = UDim.new(0, UseTokensResult.Padding.XSmall),
			PaddingRight = UDim.new(0, UseTokensResult.Padding.XSmall)
		})
		t.List = ReactModule.createElement(ScrollView, {
			tag = "size-full-0 auto-y",
			testId = "asset-picker-carousel-scroll",
			LayoutOrder = LayoutOrder,
			selection = { Selectable = false },
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, UseTokensResult.Gap.Medium),
				SortOrder = Enum.SortOrder.LayoutOrder
			},
			scroll = {
				ScrollingDirection = Enum.ScrollingDirection.X,
				AutomaticSize = Enum.AutomaticSize.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				CanvasSize = UDim2.fromScale(0, 0),
				scrollBarVisibility = Visibility.None
			}
		}, Copy)
	end
	return ReactModule.createElement(WidgetLayout, {
		LayoutOrder = p1.layoutOrder,
		padding = {
			left = UDim.new(0, UseTokensResult.Padding.XLarge),
			right = UDim.new(0, UseTokensResult.Padding.XLarge)
		},
		headerSlot = if Title == "" then nil elseif HasOnTitleActivated then ReactModule.createElement(SectionTitleWithActionModule, {
			variant = "expand",
			title = Title,
			leadingIconName = p1.titleLeadingIconName,
			onActivated = p1.onTitleActivated
		}) else ReactModule.createElement(SectionTitleModule, { title = Title, leadingIconName = p1.titleLeadingIconName }),
		contentSlot = ReactModule.createElement(View, { tag = "col gap-small size-full-0 auto-y" }, t)
	})
end