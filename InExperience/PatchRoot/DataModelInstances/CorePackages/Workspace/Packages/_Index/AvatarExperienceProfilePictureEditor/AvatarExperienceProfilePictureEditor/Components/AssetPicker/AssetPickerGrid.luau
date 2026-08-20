local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local avatarExperienceUIKitModule = require(parent.AvatarExperienceUIKit)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = localizationModule.Hooks.useLocalization
local textKeysModule = require(avatarExperienceProfilePictureEditor.Common.TextKeys)
local sectionTitleModule = require(avatarExperienceProfilePictureEditor.Components.SectionTitle.SectionTitle)
local assetPickerGridBodyModule = require(script.Parent.AssetPickerGridBody)
local _ = require(script.Parent.AssetPickerTile)
local _ = require(avatarExperienceProfilePictureEditor.Utils.getAssetPickerStatus)
local getGridMetricsModule = require(avatarExperienceProfilePictureEditor.Utils.getGridMetrics)
local widgetHeader = avatarExperienceUIKitModule.WidgetComponents.WidgetHeader

return function(value) --[[ line: 46 | named "AssetPickerGrid" ]]
	-- upvalues: useTokens (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), getGridMetricsModule (ref), view (ref), assetPickerGridBodyModule (ref), widgetHeader (ref), sectionTitleModule (ref)
	local status = value.status or "ready"
	local var10 = useTokens()
	local containerWidth = value.containerWidth
	local var11 = useLocalization({ details = textKeysModule.DetailsButton })
	local tileSize = value.tileSize
	local medium = var10.Gap.Medium
	local shimmerTileCount = value.shimmerTileCount or 30
	local var13 = reactModule.useMemo(function() --[[ line: 57 ]]
		-- upvalues: var11 (ref)
		return { details = var11.details }
	end, { var11.details })
	local var14 = reactModule.useMemo(function() --[[ line: 63 ]]
		-- upvalues: getGridMetricsModule (copy), containerWidth (ref), tileSize (ref), medium (ref), var10 (ref)
		return getGridMetricsModule({
			containerWidth = containerWidth,
			minTileSize = tileSize,
			gap = medium,
			horizontalPadding = var10.Padding.XLarge,
			strokeInset = var10.Padding.XSmall
		})
	end, {
		containerWidth,
		tileSize,
		medium,
		var10.Padding.XLarge,
		var10.Padding.XSmall
	})
	local title = value.title or ""
	local var16 = 1
	local t = {}
	
	if value.bannerComponent then
		t.Banner = reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = var16 }, { Banner = value.bannerComponent })
		var16 += 1
	end
	if status ~= "ready" or #value.items > 0 then
		t.Grid = reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-x-xsmall padding-y-xsmall",
			LayoutOrder = var16
		}, {
			Content = reactModule.createElement(assetPickerGridBodyModule, {
				status = status,
				items = value.items,
				selectedId = value.selectedId,
				itemsPerRow = var14.itemsPerRow,
				gap = medium,
				shimmerTileCount = shimmerTileCount,
				onSelect = value.onSelect,
				onDetailsActivated = value.onDetailsActivated,
				labels = var13,
				onRetry = value.onRetry
			})
		})
		var16 += 1
	end
	if value.footerComponent then
		t.Footer = reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-y-medium",
			LayoutOrder = var16
		}, { Footer = value.footerComponent })
	end
	local var18 = 1
	local t_1 = {}
	
	if title ~= "" then
		t_1.Title = reactModule.createElement(view, { tag = "auto-xy padding-x-xlarge", LayoutOrder = var18 }, {
			Header = if value.seeAllCallback then reactModule.createElement(widgetHeader, { titleText = title, seeAllCallback = value.seeAllCallback }) else reactModule.createElement(sectionTitleModule, { title = title })
		})
		var18 += 1
	end
	t_1.Body = reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y padding-x-xlarge",
		LayoutOrder = var18
	}, t)
	
	return reactModule.createElement(view, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = value.layoutOrder
	}, t_1)
end