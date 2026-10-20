local AvatarExperienceServerDrivenUi = script:FindFirstAncestor("AvatarExperienceServerDrivenUi")
local Parent = AvatarExperienceServerDrivenUi.Parent
local FFlagSduiMarketplaceCatalogActions = require(Parent.SharedFlags).FFlagSduiMarketplaceCatalogActions
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry

return function()
	-- upvalues: SduiActionType (copy), FFlagSduiMarketplaceCatalogActions (copy), AvatarExperienceServerDrivenUi (copy), GetSduiActionHandlerRegistryFunction (copy)
	GetSduiActionHandlerRegistryFunction().registerActionHandlerConfigs({
		[SduiActionType.OpenMarketplaceCatalogFilters] = if FFlagSduiMarketplaceCatalogActions then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: AvatarExperienceServerDrivenUi (upval)
				return require(AvatarExperienceServerDrivenUi.Actions.SduiOpenMarketplaceCatalogFiltersAction)
			end
		} else nil,
		[SduiActionType.SelectMarketplaceCatalogCategory] = if FFlagSduiMarketplaceCatalogActions then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: AvatarExperienceServerDrivenUi (upval)
				return require(AvatarExperienceServerDrivenUi.Actions.SduiSelectMarketplaceCatalogCategoryAction)
			end
		} else nil,
		[SduiActionType.SelectMarketplaceCatalogSubcategory] = if FFlagSduiMarketplaceCatalogActions then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: AvatarExperienceServerDrivenUi (upval)
				return require(AvatarExperienceServerDrivenUi.Actions.SduiSelectMarketplaceCatalogSubcategoryAction)
			end
		} else nil,
		[SduiActionType.OpenMarketplaceCatalogSeeAll] = if FFlagSduiMarketplaceCatalogActions then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: AvatarExperienceServerDrivenUi (upval)
				return require(AvatarExperienceServerDrivenUi.Actions.SduiOpenMarketplaceCatalogSeeAllAction)
			end
		} else nil
	})
end