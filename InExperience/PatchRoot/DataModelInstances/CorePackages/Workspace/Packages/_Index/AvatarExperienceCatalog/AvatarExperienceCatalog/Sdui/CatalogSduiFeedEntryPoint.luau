local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local _ = require(parent.Foundation)
local catalogSduiEntryPointModule = require(script.Parent.CatalogSduiEntryPoint)
local getCatalogPageIdentifierModule = require(script.Parent.Utils.getCatalogPageIdentifier)
local marketplaceFeedSkeletonModule = require(avatarExperienceCatalog.Components.MarketplaceFeedSkeleton.MarketplaceFeedSkeleton)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXMarketplaceLoadingSkeleton = avatarExperienceFlagsModule.FFlagAXMarketplaceLoadingSkeleton
local fFlagAXSduiCatalogScrollImpressions = avatarExperienceFlagsModule.FFlagAXSduiCatalogScrollImpressions
local fFlagAXSduiFeedMaintainScrollOnSeeAll = avatarExperienceFlagsModule.FFlagAXSduiFeedMaintainScrollOnSeeAll

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: fFlagAXMarketplaceLoadingSkeleton (ref), reactModule (ref), marketplaceFeedSkeletonModule (ref), catalogSduiEntryPointModule (ref), getCatalogPageIdentifierModule (ref), fFlagAXSduiCatalogScrollImpressions (ref), fFlagAXSduiFeedMaintainScrollOnSeeAll (ref)
	return reactModule.createElement(catalogSduiEntryPointModule, {
		context = p1.context,
		identifier = getCatalogPageIdentifierModule(p1.context),
		Size = p1.Size,
		AutomaticSize = p1.AutomaticSize,
		Position = p1.Position,
		loadingSlot = if fFlagAXMarketplaceLoadingSkeleton then reactModule.createElement(marketplaceFeedSkeletonModule) else nil,
		onScroll = if fFlagAXSduiCatalogScrollImpressions then p1.onScroll else nil,
		requestImpressionsSignal = if fFlagAXSduiCatalogScrollImpressions then p1.requestImpressionsSignal else nil,
		scrollPositionRef = if fFlagAXSduiFeedMaintainScrollOnSeeAll then p1.scrollPositionRef else nil,
		scrollRestoreRef = if fFlagAXSduiFeedMaintainScrollOnSeeAll then p1.scrollRestoreRef else nil,
		ref = p2
	})
end)