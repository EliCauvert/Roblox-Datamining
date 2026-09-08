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

return function(value)
	-- upvalues: useTokens (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), getGridMetricsModule (ref), view (ref), assetPickerGridBodyModule (ref), widgetHeader (ref), sectionTitleModule (ref)
	local status = value.status or "ready"
	local var1 = useTokens()
	local containerWidth = value.containerWidth
	local var2 = useLocalization({ details = textKeysModule.DetailsButton })
	local tileSize = value.tileSize
	local medium = var1.Gap.Medium
	local shimmerTileCount = value.shimmerTileCount or 30
	local var3 = reactModule.useMemo(function()
		-- upvalues: var2 (ref)
		return { details = var2.details }
	end, { var2.details })
	local var4 = reactModule.useMemo(function()
		-- upvalues: getGridMetricsModule (copy), containerWidth (ref), tileSize (ref), medium (ref), var1 (ref)
		return getGridMetricsModule({
			containerWidth = containerWidth,
			minTileSize = tileSize,
			gap = medium,
			horizontalPadding = var1.Padding.XLarge,
			strokeInset = var1.Padding.XSmall
		})
	end, {
		containerWidth,
		tileSize,
		medium,
		var1.Padding.XLarge,
		var1.Padding.XSmall
	})
	local title = value.title or ""
	local var5 = 1
	local t = {}
	
	if value.bannerComponent then
		t.Banner = reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = var5 }, { Banner = value.bannerComponent })
		var5 += 1
	end
	if status ~= "ready" or #value.items > 0 then
		t.Grid = reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-x-xsmall padding-y-xsmall",
			LayoutOrder = var5
		}, {
			Content = reactModule.createElement(assetPickerGridBodyModule, {
				status = status,
				items = value.items,
				selectedId = value.selectedId,
				itemsPerRow = var4.itemsPerRow,
				gap = medium,
				shimmerTileCount = shimmerTileCount,
				onSelect = value.onSelect,
				onDetailsActivated = value.onDetailsActivated,
				labels = var3,
				onRetry = value.onRetry
			})
		})
		var5 += 1
	end
	if value.footerComponent then
		t.Footer = reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-y-medium",
			LayoutOrder = var5
		}, { Footer = value.footerComponent })
	end
	local var6 = 1
	local t_1 = {}
	
	if title ~= "" then
		t_1.Title = reactModule.createElement(view, { tag = "auto-xy padding-x-xlarge", LayoutOrder = var6 }, {
			Header = if value.seeAllCallback then reactModule.createElement(widgetHeader, { titleText = title, seeAllCallback = value.seeAllCallback }) else reactModule.createElement(sectionTitleModule, { title = title })
		})
		var6 += 1
	end
	t_1.Body = reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y padding-x-xlarge",
		LayoutOrder = var6
	}, t)
	
	return reactModule.createElement(view, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = value.layoutOrder
	}, t_1)
end