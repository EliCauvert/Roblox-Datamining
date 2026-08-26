local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local _ = require(parent.Foundation)
local _ = require(parent.SduiSharedUtilities).SduiLoadTimer
local constantsModule = require(script.Parent.Constants)
local catalogSduiEntryPointModule = require(script.Parent.CatalogSduiEntryPoint)
local marketplaceCategoryMenuSkeletonModule = require(avatarExperienceCatalog.Components.MarketplaceCategoryMenuSkeleton.MarketplaceCategoryMenuSkeleton)
local fFlagAXMarketplaceLoadingSkeleton = require(parent.AvatarExperienceFlags).FFlagAXMarketplaceLoadingSkeleton

return function(p1)
	-- upvalues: fFlagAXMarketplaceLoadingSkeleton (ref), reactModule (ref), marketplaceCategoryMenuSkeletonModule (ref), catalogSduiEntryPointModule (ref), constantsModule (ref)
	return reactModule.createElement(catalogSduiEntryPointModule, {
		context = p1.context,
		identifier = constantsModule.CatalogCategoryMenuIdentifier,
		appPage = p1.appPage,
		loadTimer = p1.loadTimer,
		Size = p1.Size,
		Position = p1.Position,
		shouldDisplayError = p1.shouldDisplayError,
		shouldDisplayLoading = if fFlagAXMarketplaceLoadingSkeleton then true else false,
		loadingSlot = if fFlagAXMarketplaceLoadingSkeleton then reactModule.createElement(marketplaceCategoryMenuSkeletonModule) else nil
	})
end