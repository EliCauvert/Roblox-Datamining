local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local GridMetrics = UIBloxModule.App.Grid.GridMetrics
local DefaultMetricsGridView = UIBloxModule.App.Grid.DefaultMetricsGridView
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local DeveloperProductTileModule = require(Modules.LuaApp.Components.DeveloperProduct.DeveloperProductTile)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local TagBasedImpressionsDetector = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).TagBasedImpressionsDetector
local EdpStoreAnalyticsModule = require(CorePackages.Workspace.Packages.EdpStoreAnalytics)
local Constants = EdpStoreAnalyticsModule.Constants
local EdpUnifiedImpressionsReporterFunction = EdpStoreAnalyticsModule.EdpUnifiedImpressionsReporter
local FFlagEnableEdpStoreUnifiedLoggingModule = require(Modules.LuaApp.Flags.FFlagEnableEdpStoreUnifiedLogging)
local AppPageModule = require(Modules.LuaApp.AppPage)
local GetFFlagEnableEdpStoreGridPositionLoggingModule = require(Modules.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging)
local GAMEGRIDCHILDPADDING = DiscoveryTypesModule.Constants.GAME_GRID_CHILD_PADDING
local GAMEGRIDTILEFOOTERHEIGHT = DiscoveryTypesModule.Constants.GAME_GRID_TILE_FOOTER_HEIGHT
local DeveloperProductsGrid = RoactModule.PureComponent:extend("DeveloperProductsGrid")
DeveloperProductsGrid.validateProps = TModule.strictInterface({
	universeId = TModule.string,
	developerProducts = TModule.optional(TModule.table),
	numRows = TModule.optional(TModule.number),
	viewWidth = TModule.optional(TModule.number),
	layoutOrder = TModule.optional(TModule.integer),
	locationType = TModule.optional(TModule.string),
	developerProductTiles = TModule.optional(TModule.table)
})

function DeveloperProductsGrid.init(p1)
	-- upvalues: RoactModule (copy), DeveloperProductTileModule (copy), GAMEGRIDTILEFOOTERHEIGHT (copy), FFlagEnableEdpStoreUnifiedLoggingModule (copy), Signal (copy)
	function p1.renderDeveloperProduct(p2)
		-- upvalues: RoactModule (upval), DeveloperProductTileModule (upval)
		return RoactModule.createElement(DeveloperProductTileModule, p2)
	end
	
	function p1.getDeveloperProductsGridItemHeight(p2)
		-- upvalues: GAMEGRIDTILEFOOTERHEIGHT (upval)
		return p2 + GAMEGRIDTILEFOOTERHEIGHT
	end
	
	if FFlagEnableEdpStoreUnifiedLoggingModule then
		p1.ref = RoactModule.createRef()
		p1.requestImpressionsSignal = Signal.new()
	end
end

function DeveloperProductsGrid.render(p1)
	-- upvalues: FFlagEnableEdpStoreUnifiedLoggingModule (copy), RoactModule (copy), DefaultMetricsGridView (copy), GridMetrics (copy), GAMEGRIDCHILDPADDING (copy), TagBasedImpressionsDetector (copy), Constants (copy), AppPageModule (copy), EdpUnifiedImpressionsReporterFunction (copy)
	local DeveloperProductTiles = p1.props.developerProductTiles
	
	return if FFlagEnableEdpStoreUnifiedLoggingModule then RoactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p1.props.layoutOrder,
		[RoactModule.Change.AbsolutePosition] = function()
			-- upvalues: p1 (copy)
			p1.requestImpressionsSignal:fire()
		end
	}, {
		GridView = RoactModule.createElement(DefaultMetricsGridView, {
			[RoactModule.Ref] = p1.ref,
			renderItem = p1.renderDeveloperProduct,
			getItemHeight = p1.getDeveloperProductsGridItemHeight,
			getItemMetrics = GridMetrics.getSmallMetrics,
			itemPadding = Vector2.new(GAMEGRIDCHILDPADDING, GAMEGRIDCHILDPADDING),
			items = DeveloperProductTiles
		}),
		UnifiedImpressionsDetector = RoactModule.createElement(TagBasedImpressionsDetector, {
			parentRef = p1.ref,
			pageFilter = function(PassesPage): boolean
				-- upvalues: p1 (copy), Constants (upval), AppPageModule (upval)
				return p1.props.locationType == Constants.StoreEnums.LocationType.Store and PassesPage == AppPageModule.PassesPage
			end,
			requestImpressionsSignal = p1.requestImpressionsSignal,
			extensions = {
				EdpUnifiedImpressionsReporterFunction(p1.props.locationType)
			}
		})
	}) else RoactModule.createElement(DefaultMetricsGridView, {
		renderItem = p1.renderDeveloperProduct,
		getItemHeight = p1.getDeveloperProductsGridItemHeight,
		getItemMetrics = GridMetrics.getSmallMetrics,
		itemPadding = Vector2.new(GAMEGRIDCHILDPADDING, GAMEGRIDCHILDPADDING),
		items = DeveloperProductTiles,
		LayoutOrder = p1.props.layoutOrder
	})
end

local MemoizeResult = MemoizeFunction(function(DeveloperProducts, p1, UniverseId, p2, p3: number)
	-- upvalues: GetFFlagEnableEdpStoreGridPositionLoggingModule (copy)
	local List = {}
	
	if p2 and p2 == 0 then
		return List
	end
	if DeveloperProducts then
		for i, developerProduct in ipairs(DeveloperProducts) do
			if developerProduct.priceInRobux ~= nil and not developerProduct.storePageEnabled then
				local Url = if p1 and p1[tostring(developerProduct.iconImageAssetId)] then p1[tostring(developerProduct.iconImageAssetId)].url else ""
				local NewFloored: number? = nil
				local GridPositionColumn: number? = nil
				
				if GetFFlagEnableEdpStoreGridPositionLoggingModule() and p3 and p3 > 0 then
					NewFloored = math.floor((i - 1) / p3) + 1
					GridPositionColumn = (i - 1) % p3 + 1
				end
				table.insert(List, {
					universeId = UniverseId,
					developerProduct = developerProduct,
					developerProductThumbnail = Url,
					gridPositionRow = NewFloored,
					gridPositionColumn = GridPositionColumn
				})
				
				if p2 and p2 <= #List then break end
			else
				continue
			end
		end
	end
	return List
end)

return (RoactRoduxModule.connect(function(p4, p5)
	-- upvalues: GetFFlagEnableEdpStoreGridPositionLoggingModule (copy), GridMetrics (copy), GAMEGRIDCHILDPADDING (copy), MemoizeResult (copy)
	local DeveloperProducts = p5.developerProducts
	local UniverseId = p5.universeId
	local NumRows = p5.numRows
	local ViewWidth = p5.viewWidth
	local DeveloperProductsThumbnails = p4.DeveloperProductsThumbnails
	local ScaledItemsPerRow = nil
	local ItemsPerRow = nil
	
	if GetFFlagEnableEdpStoreGridPositionLoggingModule() then
		if ViewWidth then
			ItemsPerRow = GridMetrics.getSmallMetrics(ViewWidth, GAMEGRIDCHILDPADDING).itemsPerRow
		end
		if NumRows and ItemsPerRow then
			ScaledItemsPerRow = ItemsPerRow * NumRows
		end
	elseif NumRows then
		ScaledItemsPerRow = GridMetrics.getSmallMetrics(ViewWidth, GAMEGRIDCHILDPADDING).itemsPerRow * NumRows
	end
	return {
		developerProductTiles = MemoizeResult(DeveloperProducts, DeveloperProductsThumbnails, UniverseId, ScaledItemsPerRow, if GetFFlagEnableEdpStoreGridPositionLoggingModule() then ItemsPerRow else nil)
	}
end)(DeveloperProductsGrid))