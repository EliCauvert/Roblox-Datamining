local AvatarExperienceServerDrivenUi = script:FindFirstAncestor("AvatarExperienceServerDrivenUi")
local Parent = AvatarExperienceServerDrivenUi.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local GetSduiComponentRegistryFunction = SduiCoreSystemModule.getSduiComponentRegistry
local SduiComponentType = SduiCoreSystemModule.SduiComponentType
local FFlagSduiCatalogVirtualizedFeed = require(Parent.SharedFlags).FFlagSduiCatalogVirtualizedFeed
local FFlagSduiCatalogCategoryMenu = require(Parent.SharedFlags).FFlagSduiCatalogCategoryMenu
local FFlagSduiMarketplaceCatalogSortSupport = require(Parent.SharedFlags).FFlagSduiMarketplaceCatalogSortSupport

return function()
	-- upvalues: SduiComponentType (copy), FFlagSduiCatalogCategoryMenu (copy), AvatarExperienceServerDrivenUi (copy), FFlagSduiCatalogVirtualizedFeed (copy), FFlagSduiMarketplaceCatalogSortSupport (copy), GetSduiComponentRegistryFunction (copy)
	GetSduiComponentRegistryFunction().registerComponentDefinitions({
		[SduiComponentType.CatalogCategoryMenu] = if FFlagSduiCatalogCategoryMenu then {
			getLazyComponent = function()
				-- upvalues: AvatarExperienceServerDrivenUi (upval)
				return require(AvatarExperienceServerDrivenUi.UiComponents.SduiCatalogCategoryMenu)
			end
		} else nil,
		[SduiComponentType.CatalogVirtualizedFeed] = if FFlagSduiCatalogVirtualizedFeed then {
			getLazyComponent = function()
				-- upvalues: AvatarExperienceServerDrivenUi (upval)
				return require(AvatarExperienceServerDrivenUi.UiComponents.SduiCatalogVirtualizedFeed)
			end
		} else nil,
		[SduiComponentType.CatalogItemGroup] = if FFlagSduiMarketplaceCatalogSortSupport then {
			getLazyComponent = function()
				-- upvalues: AvatarExperienceServerDrivenUi (upval)
				return require(AvatarExperienceServerDrivenUi.UiComponents.SduiCatalogItemGroup)
			end
		} else nil,
		[SduiComponentType.CatalogItemCarousel] = if FFlagSduiMarketplaceCatalogSortSupport then {
			getLazyComponent = function()
				-- upvalues: AvatarExperienceServerDrivenUi (upval)
				return require(AvatarExperienceServerDrivenUi.UiComponents.SduiCatalogItemCarousel)
			end
		} else nil
	})
end