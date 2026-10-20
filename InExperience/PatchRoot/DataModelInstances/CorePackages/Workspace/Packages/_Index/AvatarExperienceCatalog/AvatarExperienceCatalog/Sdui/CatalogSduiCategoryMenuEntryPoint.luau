local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Foundation)
local _ = require(Parent.SduiSharedUtilities).SduiLoadTimer
local ConstantsModule = require(script.Parent.Constants)
local CatalogSduiEntryPointModule = require(script.Parent.CatalogSduiEntryPoint)
local MarketplaceCategoryMenuSkeletonModule = require(AvatarExperienceCatalog.Components.MarketplaceCategoryMenuSkeleton.MarketplaceCategoryMenuSkeleton)
local FFlagAXMarketplaceLoadingSkeleton = require(Parent.AvatarExperienceFlags).FFlagAXMarketplaceLoadingSkeleton

return function(p1)
	-- upvalues: FFlagAXMarketplaceLoadingSkeleton (copy), ReactModule (copy), MarketplaceCategoryMenuSkeletonModule (copy), CatalogSduiEntryPointModule (copy), ConstantsModule (copy)
	return ReactModule.createElement(CatalogSduiEntryPointModule, {
		context = p1.context,
		identifier = ConstantsModule.CatalogCategoryMenuIdentifier,
		appPage = p1.appPage,
		loadTimer = p1.loadTimer,
		Size = p1.Size,
		Position = p1.Position,
		shouldDisplayError = p1.shouldDisplayError,
		shouldDisplayLoading = if FFlagAXMarketplaceLoadingSkeleton then true else false,
		loadingSlot = if FFlagAXMarketplaceLoadingSkeleton then ReactModule.createElement(MarketplaceCategoryMenuSkeletonModule) else nil
	})
end