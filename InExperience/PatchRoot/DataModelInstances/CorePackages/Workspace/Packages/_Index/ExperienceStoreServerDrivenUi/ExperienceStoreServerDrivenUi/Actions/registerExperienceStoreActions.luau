local experienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local parent = experienceStoreServerDrivenUi.Parent
local fFlagSduiDevStoreSeeAllSupport = require(parent.SharedFlags).FFlagSduiDevStoreSeeAllSupport
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local getSduiActionHandlerRegistry = sduiCoreSystemModule.getSduiActionHandlerRegistry

return function()
	-- upvalues: sduiActionType (ref), fFlagSduiDevStoreSeeAllSupport (ref), experienceStoreServerDrivenUi (ref), getSduiActionHandlerRegistry (ref)
	getSduiActionHandlerRegistry().registerActionHandlerConfigs({
		[sduiActionType.RefreshDeveloperProducts] = if fFlagSduiDevStoreSeeAllSupport then {
			lazyHandler = function()
				-- upvalues: experienceStoreServerDrivenUi (copy)
				return require(experienceStoreServerDrivenUi.Actions.SduiRefreshDeveloperProductsAction)
			end
		} else nil
	})
end