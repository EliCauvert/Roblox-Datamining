local ExperienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local SduiCoreSystemModule = require(ExperienceStoreServerDrivenUi.Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry

return function()
	-- upvalues: SduiActionType (copy), ExperienceStoreServerDrivenUi (copy), GetSduiActionHandlerRegistryFunction (copy)
	GetSduiActionHandlerRegistryFunction().registerActionHandlerConfigs({
		[SduiActionType.RefreshDeveloperProducts] = {
			lazyHandler = function()
				-- upvalues: ExperienceStoreServerDrivenUi (upval)
				return require(ExperienceStoreServerDrivenUi.Actions.SduiRefreshDeveloperProductsAction)
			end
		}
	})
end