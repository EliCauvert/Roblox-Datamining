local ExperienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local Parent = ExperienceStoreServerDrivenUi.Parent
local FFlagEnableOpenGameItemDetailsAction = require(Parent.SharedFlags).FFlagEnableOpenGameItemDetailsAction
local FFlagSduiRemoveGamePassFromInventory = require(Parent.SharedFlags).FFlagSduiRemoveGamePassFromInventory
local FFlagSduiToggleGamePassVote = require(Parent.SharedFlags).FFlagSduiToggleGamePassVote
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry

return function()
	-- upvalues: SduiActionType (copy), ExperienceStoreServerDrivenUi (copy), FFlagEnableOpenGameItemDetailsAction (copy), FFlagSduiRemoveGamePassFromInventory (copy), FFlagSduiToggleGamePassVote (copy), GetSduiActionHandlerRegistryFunction (copy)
	GetSduiActionHandlerRegistryFunction().registerActionHandlerConfigs({
		[SduiActionType.RefreshDeveloperProducts] = {
			lazyHandler = function()
				-- upvalues: ExperienceStoreServerDrivenUi (upval)
				return require(ExperienceStoreServerDrivenUi.Actions.SduiRefreshDeveloperProductsAction)
			end
		},
		[SduiActionType.OpenGameItemDetails] = if FFlagEnableOpenGameItemDetailsAction then {
			lazyHandler = function()
				-- upvalues: ExperienceStoreServerDrivenUi (upval)
				return require(ExperienceStoreServerDrivenUi.Actions.SduiOpenGameItemDetailsAction)
			end
		} else nil,
		[SduiActionType.RemoveGamePassFromInventory] = if FFlagSduiRemoveGamePassFromInventory then {
			lazyHandler = function()
				-- upvalues: ExperienceStoreServerDrivenUi (upval)
				return require(ExperienceStoreServerDrivenUi.Actions.SduiRemoveGamePassFromInventoryAction)
			end
		} else nil,
		[SduiActionType.ToggleGamePassVote] = if FFlagSduiToggleGamePassVote then {
			lazyHandler = function()
				-- upvalues: ExperienceStoreServerDrivenUi (upval)
				return require(ExperienceStoreServerDrivenUi.Actions.SduiToggleGamePassVoteAction)
			end
		} else nil
	})
end