local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Foundation)
local CatalogSduiEntryPointModule = require(script.Parent.CatalogSduiEntryPoint)
local GetCatalogPageIdentifierModule = require(script.Parent.Utils.getCatalogPageIdentifier)
local MarketplaceFeedSkeletonModule = require(AvatarExperienceCatalog.Components.MarketplaceFeedSkeleton.MarketplaceFeedSkeleton)
local FFlagAXMarketplaceLoadingSkeleton = require(Parent.AvatarExperienceFlags).FFlagAXMarketplaceLoadingSkeleton

return ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: FFlagAXMarketplaceLoadingSkeleton (copy), ReactModule (copy), MarketplaceFeedSkeletonModule (copy), CatalogSduiEntryPointModule (copy), GetCatalogPageIdentifierModule (copy)
	return ReactModule.createElement(CatalogSduiEntryPointModule, {
		context = Frame.context,
		identifier = GetCatalogPageIdentifierModule(Frame.context),
		Size = Frame.Size,
		AutomaticSize = Frame.AutomaticSize,
		Position = Frame.Position,
		loadingSlot = if FFlagAXMarketplaceLoadingSkeleton then ReactModule.createElement(MarketplaceFeedSkeletonModule) else nil,
		ref = Ref
	})
end)