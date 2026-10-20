local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Foundation)
local CatalogSduiEntryPointModule = require(script.Parent.CatalogSduiEntryPoint)
local GetCatalogPageIdentifierModule = require(script.Parent.Utils.getCatalogPageIdentifier)
local MarketplaceFeedSkeletonModule = require(AvatarExperienceCatalog.Components.MarketplaceFeedSkeleton.MarketplaceFeedSkeleton)
local CATALOGRESULTSHORIZONTALMARGIN = require(AvatarExperienceCatalog.Constants).CATALOG_RESULTS_HORIZONTAL_MARGIN
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXMarketplaceLoadingSkeleton = AvatarExperienceFlagsModule.FFlagAXMarketplaceLoadingSkeleton
local FFlagAXSduiCatalogScrollImpressions = AvatarExperienceFlagsModule.FFlagAXSduiCatalogScrollImpressions
local FFlagAXSduiFeedPublishesBreakpoint = AvatarExperienceFlagsModule.FFlagAXSduiFeedPublishesBreakpoint
local FFlagAXMarketplaceBreakpointMismatchCounter = AvatarExperienceFlagsModule.FFlagAXMarketplaceBreakpointMismatchCounter
local FFlagAXSduiFeedMaintainScrollOnSeeAll = AvatarExperienceFlagsModule.FFlagAXSduiFeedMaintainScrollOnSeeAll

return ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: FFlagAXMarketplaceLoadingSkeleton (copy), ReactModule (copy), MarketplaceFeedSkeletonModule (copy), CatalogSduiEntryPointModule (copy), GetCatalogPageIdentifierModule (copy), FFlagAXSduiCatalogScrollImpressions (copy), FFlagAXSduiFeedPublishesBreakpoint (copy), FFlagAXMarketplaceBreakpointMismatchCounter (copy), CATALOGRESULTSHORIZONTALMARGIN (copy), FFlagAXSduiFeedMaintainScrollOnSeeAll (copy)
	return ReactModule.createElement(CatalogSduiEntryPointModule, {
		context = Frame.context,
		identifier = GetCatalogPageIdentifierModule(Frame.context),
		Size = Frame.Size,
		AutomaticSize = Frame.AutomaticSize,
		Position = Frame.Position,
		loadingSlot = if FFlagAXMarketplaceLoadingSkeleton then ReactModule.createElement(MarketplaceFeedSkeletonModule) else nil,
		onScroll = if FFlagAXSduiCatalogScrollImpressions then Frame.onScroll else nil,
		requestImpressionsSignal = if FFlagAXSduiCatalogScrollImpressions then Frame.requestImpressionsSignal else nil,
		breakpointOptions = if FFlagAXSduiFeedPublishesBreakpoint or FFlagAXMarketplaceBreakpointMismatchCounter then {
			horizontalInset = if FFlagAXSduiFeedPublishesBreakpoint then CATALOGRESULTSHORIZONTALMARGIN * 2 else nil,
			publishToStore = if FFlagAXSduiFeedPublishesBreakpoint then true else nil,
			measurementSource = if FFlagAXMarketplaceBreakpointMismatchCounter then "SduiFeed" else nil
		} else nil,
		scrollPositionRef = if FFlagAXSduiFeedMaintainScrollOnSeeAll then Frame.scrollPositionRef else nil,
		scrollRestoreRef = if FFlagAXSduiFeedMaintainScrollOnSeeAll then Frame.scrollRestoreRef else nil,
		ref = Ref
	})
end)