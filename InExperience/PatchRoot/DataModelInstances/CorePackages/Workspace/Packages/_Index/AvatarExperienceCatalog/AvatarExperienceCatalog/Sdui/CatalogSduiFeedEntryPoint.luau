local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local _ = require(parent.Foundation)
local catalogSduiEntryPointModule = require(script.Parent.CatalogSduiEntryPoint)
local getCatalogPageIdentifierModule = require(script.Parent.Utils.getCatalogPageIdentifier)
local marketplaceFeedSkeletonModule = require(avatarExperienceCatalog.Components.MarketplaceFeedSkeleton.MarketplaceFeedSkeleton)
local CATALOG_RESULTS_HORIZONTAL_MARGIN = require(avatarExperienceCatalog.Constants).CATALOG_RESULTS_HORIZONTAL_MARGIN
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXMarketplaceLoadingSkeleton = avatarExperienceFlagsModule.FFlagAXMarketplaceLoadingSkeleton
local fFlagAXSduiCatalogScrollImpressions = avatarExperienceFlagsModule.FFlagAXSduiCatalogScrollImpressions
local fFlagAXSduiFeedPublishesBreakpoint = avatarExperienceFlagsModule.FFlagAXSduiFeedPublishesBreakpoint
local fFlagAXMarketplaceBreakpointMismatchCounter = avatarExperienceFlagsModule.FFlagAXMarketplaceBreakpointMismatchCounter
local fFlagAXSduiFeedMaintainScrollOnSeeAll = avatarExperienceFlagsModule.FFlagAXSduiFeedMaintainScrollOnSeeAll

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: fFlagAXMarketplaceLoadingSkeleton (ref), reactModule (ref), marketplaceFeedSkeletonModule (ref), catalogSduiEntryPointModule (ref), getCatalogPageIdentifierModule (ref), fFlagAXSduiCatalogScrollImpressions (ref), fFlagAXSduiFeedPublishesBreakpoint (ref), fFlagAXMarketplaceBreakpointMismatchCounter (ref), CATALOG_RESULTS_HORIZONTAL_MARGIN (ref), fFlagAXSduiFeedMaintainScrollOnSeeAll (ref)
	return reactModule.createElement(catalogSduiEntryPointModule, {
		context = p1.context,
		identifier = getCatalogPageIdentifierModule(p1.context),
		Size = p1.Size,
		AutomaticSize = p1.AutomaticSize,
		Position = p1.Position,
		loadingSlot = if fFlagAXMarketplaceLoadingSkeleton then reactModule.createElement(marketplaceFeedSkeletonModule) else nil,
		onScroll = if fFlagAXSduiCatalogScrollImpressions then p1.onScroll else nil,
		requestImpressionsSignal = if fFlagAXSduiCatalogScrollImpressions then p1.requestImpressionsSignal else nil,
		breakpointOptions = if fFlagAXSduiFeedPublishesBreakpoint or fFlagAXMarketplaceBreakpointMismatchCounter then {
			horizontalInset = if fFlagAXSduiFeedPublishesBreakpoint then CATALOG_RESULTS_HORIZONTAL_MARGIN * 2 else nil,
			publishToStore = if fFlagAXSduiFeedPublishesBreakpoint then true else nil,
			measurementSource = if fFlagAXMarketplaceBreakpointMismatchCounter then "SduiFeed" else nil
		} else nil,
		scrollPositionRef = if fFlagAXSduiFeedMaintainScrollOnSeeAll then p1.scrollPositionRef else nil,
		scrollRestoreRef = if fFlagAXSduiFeedMaintainScrollOnSeeAll then p1.scrollRestoreRef else nil,
		ref = p2
	})
end)