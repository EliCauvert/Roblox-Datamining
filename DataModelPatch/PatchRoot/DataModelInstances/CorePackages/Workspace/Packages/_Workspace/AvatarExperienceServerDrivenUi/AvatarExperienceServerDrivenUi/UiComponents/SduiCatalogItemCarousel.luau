local AvatarExperienceServerDrivenUi = script:FindFirstAncestor("AvatarExperienceServerDrivenUi")
local Parent = AvatarExperienceServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local AvatarExperienceCatalogModule = require(Parent.AvatarExperienceCatalog)
local CatalogItemCarouselSortContainer = AvatarExperienceCatalogModule.Components.CatalogItemCarouselSort.CatalogItemCarouselSortContainer
local CATALOGRESULTSHORIZONTALMARGIN = AvatarExperienceCatalogModule.Constants.CATALOG_RESULTS_HORIZONTAL_MARGIN
local CatalogSduiPageContext = AvatarExperienceCatalogModule.Sdui.CatalogSduiPageContext
local GetCatalogPageRequestIdStoreFunction = AvatarExperienceCatalogModule.Stores.getCatalogPageRequestIdStore
local _ = require(Parent.AvatarExperienceCommon)
local _ = require(Parent.SduiCoreSystem)
local _ = require(AvatarExperienceServerDrivenUi.Utils.wrapZeroArgAction)
local UseTrackedRowWidthModule = require(AvatarExperienceServerDrivenUi.hooks.useTrackedRowWidth)
local UseWrapZeroArgActionHandlerModule = require(AvatarExperienceServerDrivenUi.hooks.useWrapZeroArgActionHandler)
local _ = require(AvatarExperienceServerDrivenUi.Types.CatalogSortPropTypes)
local CatalogSortConstantsModule = require(AvatarExperienceServerDrivenUi.Constants.CatalogSortConstants)
local SduiWidgetTTITileLatencyContextModule = require(AvatarExperienceServerDrivenUi.Context.SduiWidgetTTITileLatencyContext)
local FFlagAXSduiWidgetsTTITracking = require(Parent.AvatarExperienceFlags).FFlagAXSduiWidgetsTTITracking

return ReactModule.memo(function(p1)
	-- upvalues: CatalogSortConstantsModule (copy), ReactModule (copy), CatalogSduiPageContext (copy), GetCatalogPageRequestIdStoreFunction (copy), UseSignalStateFunction (copy), UseWrapZeroArgActionHandlerModule (copy), UseTrackedRowWidthModule (copy), CATALOGRESULTSHORIZONTALMARGIN (copy), FFlagAXSduiWidgetsTTITracking (copy), SduiWidgetTTITileLatencyContextModule (copy), CatalogItemCarouselSortContainer (copy)
	local Id = p1.id
	local Type = p1.type
	local Content = p1.content
	local NumItemsToShow = p1.numItemsToShow
	local Title = p1.title
	local Description = p1.description
	local ItemFooters = p1.itemFooters or CatalogSortConstantsModule.DEFAULT_ITEM_FOOTERS
	local CardStyle = p1.cardStyle
	local TagId = p1.tagId
	local InformationPopoverText = p1.informationPopoverText
	local LayoutOrder = p1.layoutOrder or (p1.startRow or 1)
	local PreviewColumns = p1.previewColumns or CatalogSortConstantsModule.DEFAULT_PREVIEW_COLUMNS
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Id (copy), Type (copy), Content (copy), NumItemsToShow (copy), Title (copy), Description (copy), InformationPopoverText (copy), ItemFooters (copy), CardStyle (copy), PreviewColumns (copy), TagId (copy)
		return {
			id = Id,
			type = Type,
			content = Content or {},
			template = {
				type = "Carousel",
				previewRows = 1,
				numItemsToShow = NumItemsToShow,
				localizedTitle = Title,
				localizedDescription = Description,
				informationPopoverText = InformationPopoverText,
				itemFooters = ItemFooters,
				cardStyle = CardStyle,
				previewColumns = PreviewColumns
			},
			tagId = TagId
		}
	end, {
		Id, Type, Content, NumItemsToShow, Title, Description, InformationPopoverText,
		ItemFooters, CardStyle, TagId, PreviewColumns
	})
	local UseContextResult = ReactModule.useContext(CatalogSduiPageContext)
	local Identifier = if UseContextResult then UseContextResult.identifier else nil
	local CatalogPageRequestIdStore = GetCatalogPageRequestIdStoreFunction(false)
	local UseSignalStateResultEntry = UseSignalStateFunction(CatalogPageRequestIdStore.getPageRequestIdMap)[Identifier or ""]
	ReactModule.useEffect(function()
		-- upvalues: Identifier (copy), CatalogPageRequestIdStore (copy)
		if Identifier ~= nil then
			CatalogPageRequestIdStore.getOrCreatePageRequestId(Identifier)
		end
	end, { Identifier, CatalogPageRequestIdStore })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: Content (copy), PreviewColumns (copy)
		local Ids = {}
		local Content1 = Content or {}
		for i = 1, math.min(#Content1, PreviewColumns) do
			local ContentEntry = Content1[i]
			
			if ContentEntry ~= nil and ContentEntry.id ~= nil then
				table.insert(Ids, ContentEntry.id)
			end
		end
		return Ids
	end, { Content, PreviewColumns })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: Id (copy), Type (copy), LayoutOrder (copy), PreviewColumns (copy), UseSignalStateResultEntry (copy), UseMemoResult1 (copy)
		return {
			widgetId = Id,
			widgetType = Type,
			widgetPosition = LayoutOrder,
			widgetAbsPosition = (LayoutOrder - 1) * PreviewColumns,
			requestId = UseSignalStateResultEntry,
			widgetItemIds = UseMemoResult1
		}
	end, {
		Id, Type, LayoutOrder, PreviewColumns, UseSignalStateResultEntry,
		UseMemoResult1
	})
	local UseWrapZeroArgActionHandlerModuleResult = UseWrapZeroArgActionHandlerModule(p1.onSeeAll)
	local UseTrackedRowWidthModuleResult, UseTrackedRowWidthModuleResult2 = UseTrackedRowWidthModule(p1.feedRowWidth)
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		[ReactModule.Change.AbsoluteSize] = UseTrackedRowWidthModuleResult2
	}, {
		Carousel = ReactModule.createElement(CatalogItemCarouselSortContainer, {
			widgetRow = LayoutOrder,
			widgetInfo = UseMemoResult,
			itemsPerRow = PreviewColumns,
			widgetAnalyticsInfo = UseMemoResult2,
			onSeeAll = UseWrapZeroArgActionHandlerModuleResult,
			rowWidth = UseTrackedRowWidthModuleResult,
			horizontalMargin = p1.horizontalMargin or CATALOGRESULTSHORIZONTALMARGIN,
			onThumbnailLoaded = if FFlagAXSduiWidgetsTTITracking then ReactModule.useContext(SduiWidgetTTITileLatencyContextModule) else nil
		})
	})
end)