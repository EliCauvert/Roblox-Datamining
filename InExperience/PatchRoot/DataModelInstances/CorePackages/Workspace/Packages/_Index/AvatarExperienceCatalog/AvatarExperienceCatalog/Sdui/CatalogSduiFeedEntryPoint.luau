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

return reactModule.forwardRef(function(p0, p1) --[[ line: 29 | named "CatalogSduiFeedEntryPoint" ]]
	-- upvalues: fFlagAXMarketplaceLoadingSkeleton (ref), reactModule (ref), marketplaceFeedSkeletonModule (ref), catalogSduiEntryPointModule (ref), getCatalogPageIdentifierModule (ref), fFlagAXSduiCatalogScrollImpressions (ref)
	return reactModule.createElement(catalogSduiEntryPointModule, {
		context = p0.context,
		identifier = getCatalogPageIdentifierModule(p0.context),
		Size = p0.Size,
		AutomaticSize = p0.AutomaticSize,
		Position = p0.Position,
		loadingSlot = if fFlagAXMarketplaceLoadingSkeleton then reactModule.createElement(marketplaceFeedSkeletonModule) else nil,
		onScroll = if fFlagAXSduiCatalogScrollImpressions then p0.onScroll else nil,
		requestImpressionsSignal = if fFlagAXSduiCatalogScrollImpressions then p0.requestImpressionsSignal else nil,
		ref = p1
	})
end)