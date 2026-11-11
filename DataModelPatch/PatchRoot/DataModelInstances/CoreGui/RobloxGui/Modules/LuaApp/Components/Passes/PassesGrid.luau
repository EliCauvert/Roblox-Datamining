local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local GridMetrics = UIBloxModule.App.Grid.GridMetrics
local DefaultMetricsGridView = UIBloxModule.App.Grid.DefaultMetricsGridView
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PassTileModule = require(Modules.LuaApp.Components.Passes.PassTile)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local TagBasedImpressionsDetector = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).TagBasedImpressionsDetector
local EdpStoreAnalyticsModule = require(CorePackages.Workspace.Packages.EdpStoreAnalytics)
local Constants = EdpStoreAnalyticsModule.Constants
local EdpUnifiedImpressionsReporterFunction = EdpStoreAnalyticsModule.EdpUnifiedImpressionsReporter
local FFlagEnableEdpStoreUnifiedLoggingModule = require(Modules.LuaApp.Flags.FFlagEnableEdpStoreUnifiedLogging)
local AppPageModule = require(Modules.LuaApp.AppPage)
local GetFFlagEnableEdpStoreClickLoggingModule = require(Modules.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging)
local GetFFlagEnableEdpStoreGridPositionLoggingModule = require(Modules.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging)
local FFlagLuaAppGamePassesDataHydrationMigrationEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppGamePassesDataHydrationMigrationEnabled
local GAMEGRIDCHILDPADDING = DiscoveryTypesModule.Constants.GAME_GRID_CHILD_PADDING
local GAMEGRIDTILEFOOTERHEIGHT = DiscoveryTypesModule.Constants.GAME_GRID_TILE_FOOTER_HEIGHT
local PassesGrid = RoactModule.PureComponent:extend("PassesGrid")
PassesGrid.validateProps = TModule.strictInterface({
	universeId = TModule.string,
	passes = TModule.optional(TModule.table),
	numRows = TModule.optional(TModule.number),
	viewWidth = TModule.optional(TModule.number),
	layoutOrder = TModule.optional(TModule.integer),
	textSizeOffset = TModule.number,
	locationType = if GetFFlagEnableEdpStoreClickLoggingModule() then TModule.optional(TModule.string) else nil,
	passTiles = TModule.optional(TModule.table)
})

function PassesGrid.init(p1)
	-- upvalues: RoactModule (copy), PassTileModule (copy), GAMEGRIDTILEFOOTERHEIGHT (copy), FFlagEnableEdpStoreUnifiedLoggingModule (copy), Signal (copy)
	function p1.renderPass(p2)
		-- upvalues: RoactModule (upval), PassTileModule (upval)
		return RoactModule.createElement(PassTileModule, p2)
	end
	
	function p1.getPassesGridItemHeight(p2)
		-- upvalues: GAMEGRIDTILEFOOTERHEIGHT (upval), p1 (copy)
		return p2 + GAMEGRIDTILEFOOTERHEIGHT + p1.props.textSizeOffset
	end
	
	if FFlagEnableEdpStoreUnifiedLoggingModule then
		p1.ref = RoactModule.createRef()
		p1.requestImpressionsSignal = Signal.new()
	end
end

function PassesGrid.render(p1)
	-- upvalues: FFlagEnableEdpStoreUnifiedLoggingModule (copy), RoactModule (copy), DefaultMetricsGridView (copy), GridMetrics (copy), GAMEGRIDCHILDPADDING (copy), TagBasedImpressionsDetector (copy), AppPageModule (copy), Constants (copy), Logging (copy), EdpUnifiedImpressionsReporterFunction (copy)
	local PassTiles = p1.props.passTiles
	
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
			renderItem = p1.renderPass,
			getItemHeight = p1.getPassesGridItemHeight,
			getItemMetrics = GridMetrics.getSmallMetrics,
			itemPadding = Vector2.new(GAMEGRIDCHILDPADDING, GAMEGRIDCHILDPADDING),
			items = PassTiles
		}),
		UnifiedImpressionsDetector = RoactModule.createElement(TagBasedImpressionsDetector, {
			parentRef = p1.ref,
			pageFilter = function(GameDetail): boolean
				-- upvalues: AppPageModule (upval), p1 (copy), Constants (upval), Logging (upval)
				if GameDetail == AppPageModule.GameDetail then
					return p1.props.locationType == Constants.StoreEnums.LocationType.Edp
				elseif GameDetail == AppPageModule.PassesPage then
					return p1.props.locationType == Constants.StoreEnums.LocationType.Store
				else
					Logging.warn("Skip Impression Logging for page: " .. GameDetail)
					
					return false
				end
			end,
			requestImpressionsSignal = p1.requestImpressionsSignal,
			extensions = {
				EdpUnifiedImpressionsReporterFunction(p1.props.locationType)
			}
		})
	}) else RoactModule.createElement(DefaultMetricsGridView, {
		renderItem = p1.renderPass,
		getItemHeight = p1.getPassesGridItemHeight,
		getItemMetrics = GridMetrics.getSmallMetrics,
		itemPadding = Vector2.new(GAMEGRIDCHILDPADDING, GAMEGRIDCHILDPADDING),
		items = PassTiles,
		LayoutOrder = p1.props.layoutOrder
	})
end

local MemoizeResult = MemoizeFunction(function(List, p1, UniverseId, p2, p3, p4: number)
	-- upvalues: FFlagLuaAppGamePassesDataHydrationMigrationEnabled (copy), GetFFlagEnableEdpStoreGridPositionLoggingModule (copy), GetFFlagEnableEdpStoreClickLoggingModule (copy)
	local List1 = {}
	
	if p2 and p2 == 0 then
		return List1
	end
	if List then
		for i, Pass in ipairs(List) do
			if Pass.price ~= nil then
				local Formatted = ""
				
				if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then
					if Pass.displayIconImageAssetId then
						Formatted = string.format("rbxthumb://type=Asset&id=%s&w=150&h=150", (tostring(Pass.displayIconImageAssetId)))
					end
				elseif p1 and p1[tostring(Pass.id)] then
					Formatted = p1[tostring(Pass.id)].url
				end
				local NewFloored: number? = nil
				local GridPositionColumn: number? = nil
				
				if GetFFlagEnableEdpStoreGridPositionLoggingModule() and p4 and p4 > 0 then
					NewFloored = math.floor((i - 1) / p4) + 1
					GridPositionColumn = (i - 1) % p4 + 1
				end
				table.insert(List1, {
					universeId = UniverseId,
					pass = Pass,
					passThumbnail = Formatted,
					locationType = if GetFFlagEnableEdpStoreClickLoggingModule() then p3 else nil,
					gridPositionRow = NewFloored,
					gridPositionColumn = GridPositionColumn
				})
				
				if p2 and p2 <= #List1 then break end
			else
				continue
			end
		end
	end
	return List1
end)

return (RoactRoduxModule.connect(function(p5, p6)
	-- upvalues: FFlagLuaAppGamePassesDataHydrationMigrationEnabled (copy), GetFFlagEnableEdpStoreClickLoggingModule (copy), GetFFlagEnableEdpStoreGridPositionLoggingModule (copy), GridMetrics (copy), GAMEGRIDCHILDPADDING (copy), MemoizeResult (copy)
	local Passes = p6.passes
	local UniverseId = p6.universeId
	local NumRows = p6.numRows
	local ViewWidth = p6.viewWidth
	local PassesThumbnails = if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then nil else p5.PassesThumbnails
	local LocationType = if GetFFlagEnableEdpStoreClickLoggingModule() then p6.locationType else nil
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
		passTiles = MemoizeResult(Passes, PassesThumbnails, UniverseId, ScaledItemsPerRow, if GetFFlagEnableEdpStoreClickLoggingModule() then LocationType else nil, if GetFFlagEnableEdpStoreGridPositionLoggingModule() then ItemsPerRow else nil)
	}
end)(PassesGrid))