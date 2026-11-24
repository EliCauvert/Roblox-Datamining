local AvatarExperienceSlotBasedEditor = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor")
local Parent = AvatarExperienceSlotBasedEditor.Parent
local SignalsModule = require(Parent.Signals)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseAvatarEditorStoresModule = require(AvatarExperienceSlotBasedEditor.Context.useAvatarEditorStores)
local Signal = SignalsModule.createSignal("")

return function()
	-- upvalues: UseAvatarEditorStoresModule (copy), UseSignalStateFunction (copy), Signal (copy)
	local InventorySearchStore = UseAvatarEditorStoresModule().inventorySearchStore
	
	return UseSignalStateFunction(if InventorySearchStore then InventorySearchStore.getQuery else Signal)
end