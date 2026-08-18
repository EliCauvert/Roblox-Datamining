local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local _ = require(parent.Foundation)
local _ = require(parent.SduiSharedUtilities).SduiLoadTimer
local constantsModule = require(script.Parent.Constants)
local catalogSduiEntryPointModule = require(script.Parent.CatalogSduiEntryPoint)
local marketplaceCategoryMenuSkeletonModule = require(avatarExperienceCatalog.Components.MarketplaceCategoryMenuSkeleton.MarketplaceCategoryMenuSkeleton)
local fFlagAXMarketplaceLoadingSkeleton = require(parent.AvatarExperienceFlags).FFlagAXMarketplaceLoadingSkeleton

return function(p0) --[[ line: 26 | named "CatalogSduiCategoryMenuEntryPoint" ]]
	-- upvalues: fFlagAXMarketplaceLoadingSkeleton (ref), reactModule (ref), marketplaceCategoryMenuSkeletonModule (ref), catalogSduiEntryPointModule (ref), constantsModule (ref)
	return reactModule.createElement(catalogSduiEntryPointModule, {
		context = p0.context,
		identifier = constantsModule.CatalogCategoryMenuIdentifier,
		appPage = p0.appPage,
		loadTimer = p0.loadTimer,
		Size = p0.Size,
		Position = p0.Position,
		shouldDisplayError = p0.shouldDisplayError,
		shouldDisplayLoading = if fFlagAXMarketplaceLoadingSkeleton then true else false,
		loadingSlot = if fFlagAXMarketplaceLoadingSkeleton then reactModule.createElement(marketplaceCategoryMenuSkeletonModule) else nil
	})
end