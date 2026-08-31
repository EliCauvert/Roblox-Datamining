local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local avatarExperienceUIKitModule = require(parent.AvatarExperienceUIKit)
local view = foundationModule.View
local scrollView = foundationModule.ScrollView
local visibility = foundationModule.Enums.Visibility
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = localizationModule.Hooks.useLocalization
local sectionTitleModule = require(avatarExperienceProfilePictureEditor.Components.SectionTitle.SectionTitle)
local sectionTitleWithActionModule = require(avatarExperienceProfilePictureEditor.Components.SectionTitle.SectionTitleWithAction)
local assetPickerErrorBodyModule = require(script.Parent.AssetPickerErrorBody)
local assetPickerTileModule = require(script.Parent.AssetPickerTile)
local _ = require(avatarExperienceProfilePictureEditor.Utils.getAssetPickerStatus)
local textKeysModule = require(avatarExperienceProfilePictureEditor.Common.TextKeys)
local widgetLayout = avatarExperienceUIKitModule.WidgetComponents.WidgetLayout
local itemCardThumbnailSkeleton = avatarExperienceUIKitModule.ItemCardComponents.ItemCardThumbnailSkeleton

return function(value)
	-- upvalues: useTokens (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), view (ref), assetPickerTileModule (ref), assetPickerErrorBodyModule (ref), itemCardThumbnailSkeleton (ref), radius (ref), scrollView (ref), visibility (ref), widgetLayout (ref), sectionTitleWithActionModule (ref), sectionTitleModule (ref)
	local status = value.status or "ready"
	local var1 = useTokens()
	local var2 = useLocalization({ details = textKeysModule.DetailsButton })
	local tileSize = value.tileSize
	local shimmerTileCount = value.shimmerTileCount or 8
	local var3 = reactModule.useMemo(function()
		-- upvalues: var2 (ref)
		return { details = var2.details }
	end, { var2.details })
	local var4 = reactModule.useMemo(function()
		-- upvalues: value (ref), reactModule (copy), view (copy), tileSize (ref), assetPickerTileModule (copy), var3 (ref)
		local t = {}
		
		for i, v in value.items do
			t["Asset_" .. v.id] = reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				Size = UDim2.fromOffset(tileSize, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = i
			}, {
				Tile = reactModule.createElement(assetPickerTileModule, {
					item = v,
					selectedId = value.selectedId,
					onSelect = value.onSelect,
					onDetailsActivated = value.onDetailsActivated,
					labels = var3
				})
			})
		end
		if value.trailingCarouselComponent then
			t.Trailing = value.trailingCarouselComponent
		end
		return t
	end, {
		value.items, value.selectedId, tileSize, value.onSelect,
		value.onDetailsActivated, var3, value.trailingCarouselComponent
	})
	local title = value.title or ""
	local var5 = status == "ready" and value.onTitleActivated ~= nil
	local var6 = 1
	local t = {}
	
	if value.bannerComponent then
		t.Banner = reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = var6 }, { Banner = value.bannerComponent })
		var6 += 1
	end
	if status == "error" then
		t.Error = reactModule.createElement(assetPickerErrorBodyModule, { onRetry = value.onRetry, layoutOrder = var6 })
	else
		local t_1
		local _ = nil
		
		if status == "loading" then
			t_1 = {}
			
			for i = 1, shimmerTileCount do
				t_1["Shimmer_" .. i] = reactModule.createElement(itemCardThumbnailSkeleton, {
					Size = UDim2.fromOffset(tileSize, tileSize),
					radius = radius.Medium,
					LayoutOrder = i
				})
			end
		else
			t_1 = var4
		end
		local cloned = table.clone(t_1)
		cloned.CarouselStrokeInset = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var1.Padding.XSmall),
			PaddingBottom = UDim.new(0, var1.Padding.XSmall),
			PaddingLeft = UDim.new(0, var1.Padding.XSmall),
			PaddingRight = UDim.new(0, var1.Padding.XSmall)
		})
		t.List = reactModule.createElement(scrollView, {
			tag = "size-full-0 auto-y",
			testId = "asset-picker-carousel-scroll",
			LayoutOrder = var6,
			selection = { Selectable = false },
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, var1.Gap.Medium),
				SortOrder = Enum.SortOrder.LayoutOrder
			},
			scroll = {
				ScrollingDirection = Enum.ScrollingDirection.X,
				AutomaticSize = Enum.AutomaticSize.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				CanvasSize = UDim2.fromScale(0, 0),
				scrollBarVisibility = visibility.None
			}
		}, cloned)
	end
	return reactModule.createElement(widgetLayout, {
		LayoutOrder = value.layoutOrder,
		padding = {
			left = UDim.new(0, var1.Padding.XLarge),
			right = UDim.new(0, var1.Padding.XLarge)
		},
		headerSlot = if title ~= "" then nil elseif var5 then reactModule.createElement(sectionTitleWithActionModule, {
			variant = "expand",
			title = title,
			leadingIconName = value.titleLeadingIconName,
			onActivated = value.onTitleActivated
		}) else reactModule.createElement(sectionTitleModule, {
			title = title,
			leadingIconName = value.titleLeadingIconName
		}),
		contentSlot = reactModule.createElement(view, { tag = "col gap-small size-full-0 auto-y" }, t)
	})
end