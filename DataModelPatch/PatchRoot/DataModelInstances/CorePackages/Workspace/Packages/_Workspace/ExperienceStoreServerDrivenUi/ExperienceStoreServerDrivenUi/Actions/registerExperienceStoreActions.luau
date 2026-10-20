local ExperienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local Parent = ExperienceStoreServerDrivenUi.Parent
local FFlagSduiDevStoreSeeAllSupport = require(Parent.SharedFlags).FFlagSduiDevStoreSeeAllSupport
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry

return function()
	-- upvalues: SduiActionType (copy), FFlagSduiDevStoreSeeAllSupport (copy), ExperienceStoreServerDrivenUi (copy), GetSduiActionHandlerRegistryFunction (copy)
	GetSduiActionHandlerRegistryFunction().registerActionHandlerConfigs({
		[SduiActionType.RefreshDeveloperProducts] = if FFlagSduiDevStoreSeeAllSupport then {
			lazyHandler = function()
				-- upvalues: ExperienceStoreServerDrivenUi (upval)
				return require(ExperienceStoreServerDrivenUi.Actions.SduiRefreshDeveloperProductsAction)
			end
		} else nil
	})
end