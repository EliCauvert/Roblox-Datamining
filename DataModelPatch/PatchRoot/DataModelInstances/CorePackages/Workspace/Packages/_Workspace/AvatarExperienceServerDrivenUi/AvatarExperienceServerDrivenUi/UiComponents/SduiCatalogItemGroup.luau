local AvatarExperienceServerDrivenUi = script:FindFirstAncestor("AvatarExperienceServerDrivenUi")
local Parent = AvatarExperienceServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local AvatarExperienceCatalogModule = require(Parent.AvatarExperienceCatalog)
local CatalogItemGroupSortContainer = AvatarExperienceCatalogModule.Components.CatalogItemGroupSort.CatalogItemGroupSortContainer
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
	-- upvalues: CatalogSortConstantsModule (copy), ReactModule (copy), CatalogSduiPageContext (copy), GetCatalogPageRequestIdStoreFunction (copy), UseSignalStateFunction (copy), UseWrapZeroArgActionHandlerModule (copy), UseTrackedRowWidthModule (copy), CATALOGRESULTSHORIZONTALMARGIN (copy), FFlagAXSduiWidgetsTTITracking (copy), SduiWidgetTTITileLatencyContextModule (copy), CatalogItemGroupSortContainer (copy)
	local Id = p1.id
	local Type = p1.type
	local Content = p1.content
	local Title = p1.title
	local Description = p1.description
	local ItemFooters = p1.itemFooters or CatalogSortConstantsModule.DEFAULT_ITEM_FOOTERS
	local CardStyle = p1.cardStyle
	local TagId = p1.tagId
	local InformationPopoverText = p1.informationPopoverText
	local LayoutOrder = p1.layoutOrder or (p1.startRow or 1)
	local PreviewColumns = p1.previewColumns or CatalogSortConstantsModule.DEFAULT_PREVIEW_COLUMNS
	local PreviewRows = p1.previewRows or 1
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Id (copy), Type (copy), Content (copy), Title (copy), Description (copy), InformationPopoverText (copy), ItemFooters (copy), CardStyle (copy), PreviewRows (copy), PreviewColumns (copy), TagId (copy)
		return {
			id = Id,
			type = Type,
			content = Content or {},
			template = {
				type = "ItemGroup",
				localizedTitle = Title,
				localizedDescription = Description,
				informationPopoverText = InformationPopoverText,
				itemFooters = ItemFooters,
				cardStyle = CardStyle,
				previewRows = PreviewRows,
				previewColumns = PreviewColumns
			},
			tagId = TagId
		}
	end, {
		Id, Type, Content, Title, Description, InformationPopoverText, ItemFooters,
		CardStyle, TagId, PreviewRows, PreviewColumns
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
		Group = ReactModule.createElement(CatalogItemGroupSortContainer, {
			widgetRow = LayoutOrder,
			widgetInfo = UseMemoResult,
			itemsPerRow = PreviewColumns,
			rowCount = PreviewRows,
			widgetAnalyticsInfo = UseMemoResult2,
			onSeeAll = UseWrapZeroArgActionHandlerModuleResult,
			rowWidth = UseTrackedRowWidthModuleResult,
			horizontalMargin = p1.horizontalMargin or CATALOGRESULTSHORIZONTALMARGIN,
			onThumbnailLoaded = if FFlagAXSduiWidgetsTTITracking then ReactModule.useContext(SduiWidgetTTITileLatencyContextModule) else nil
		})
	})
end)