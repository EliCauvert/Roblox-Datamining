local experienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local parent = experienceStoreServerDrivenUi.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local getSduiComponentRegistry = sduiCoreSystemModule.getSduiComponentRegistry
local sduiComponentType = sduiCoreSystemModule.SduiComponentType
local fFlagSduiGameItemsComponent = require(parent.SharedFlags).FFlagSduiGameItemsComponent
local fFlagSduiLocalFeedFilter = require(parent.SharedFlags).FFlagSduiLocalFeedFilter

return function()
	-- upvalues: sduiComponentType (ref), fFlagSduiLocalFeedFilter (ref), experienceStoreServerDrivenUi (ref), fFlagSduiGameItemsComponent (ref), getSduiComponentRegistry (ref)
	getSduiComponentRegistry().registerComponentDefinitions({
		[sduiComponentType.PillTabsCarousel] = if fFlagSduiLocalFeedFilter then {
			getLazyComponent = function()
				-- upvalues: experienceStoreServerDrivenUi (copy)
				return require(experienceStoreServerDrivenUi.Components.SduiPillTabsCarousel)
			end
		} else nil,
		[sduiComponentType.VirtualGameItemText] = if fFlagSduiGameItemsComponent then {
			getLazyComponent = function()
				-- upvalues: experienceStoreServerDrivenUi (copy)
				return require(experienceStoreServerDrivenUi.Components.SduiVirtualGameItemText)
			end
		} else nil
	})
end