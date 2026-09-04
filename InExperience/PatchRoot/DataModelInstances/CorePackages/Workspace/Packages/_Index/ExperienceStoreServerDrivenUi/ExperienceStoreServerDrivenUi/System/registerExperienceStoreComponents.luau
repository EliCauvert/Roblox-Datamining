local experienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local parent = experienceStoreServerDrivenUi.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local getSduiComponentRegistry = sduiCoreSystemModule.getSduiComponentRegistry
local sduiComponentType = sduiCoreSystemModule.SduiComponentType
local fFlagSduiGameItemsComponent = require(parent.SharedFlags).FFlagSduiGameItemsComponent

return function()
	-- upvalues: sduiComponentType (ref), fFlagSduiGameItemsComponent (ref), experienceStoreServerDrivenUi (ref), getSduiComponentRegistry (ref)
	getSduiComponentRegistry().registerComponentDefinitions({
		[sduiComponentType.VirtualGameItemText] = if fFlagSduiGameItemsComponent then {
			getLazyComponent = function()
				-- upvalues: experienceStoreServerDrivenUi (copy)
				return require(experienceStoreServerDrivenUi.Components.SduiVirtualGameItemText)
			end
		} else nil
	})
end