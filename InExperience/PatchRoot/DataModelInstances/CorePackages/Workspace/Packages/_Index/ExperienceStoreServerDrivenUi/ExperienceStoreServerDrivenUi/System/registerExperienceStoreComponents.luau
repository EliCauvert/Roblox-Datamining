local ExperienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local Parent = ExperienceStoreServerDrivenUi.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local GetSduiComponentRegistryFunction = SduiCoreSystemModule.getSduiComponentRegistry
local SduiComponentType = SduiCoreSystemModule.SduiComponentType
local FFlagSduiGameItemsComponent = require(Parent.SharedFlags).FFlagSduiGameItemsComponent
local FFlagSduiLocalFeedFilter = require(Parent.SharedFlags).FFlagSduiLocalFeedFilter

return function()
	-- upvalues: SduiComponentType (copy), FFlagSduiLocalFeedFilter (copy), ExperienceStoreServerDrivenUi (copy), FFlagSduiGameItemsComponent (copy), GetSduiComponentRegistryFunction (copy)
	GetSduiComponentRegistryFunction().registerComponentDefinitions({
		[SduiComponentType.PillTabsCarousel] = if FFlagSduiLocalFeedFilter then {
			getLazyComponent = function()
				-- upvalues: ExperienceStoreServerDrivenUi (upval)
				return require(ExperienceStoreServerDrivenUi.Components.SduiPillTabsCarousel)
			end
		} else nil,
		[SduiComponentType.VirtualGameItemText] = if FFlagSduiGameItemsComponent then {
			getLazyComponent = function()
				-- upvalues: ExperienceStoreServerDrivenUi (upval)
				return require(ExperienceStoreServerDrivenUi.Components.SduiVirtualGameItemText)
			end
		} else nil
	})
end