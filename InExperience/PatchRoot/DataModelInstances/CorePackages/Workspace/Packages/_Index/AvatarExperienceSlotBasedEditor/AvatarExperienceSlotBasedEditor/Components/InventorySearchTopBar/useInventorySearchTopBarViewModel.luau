local AvatarExperienceSlotBasedEditor = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor")
local Parent = AvatarExperienceSlotBasedEditor.Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen
local UseAvatarEditorStoresModule = require(AvatarExperienceSlotBasedEditor.Context.useAvatarEditorStores)
local UseInventorySearchQueryModule = require(AvatarExperienceSlotBasedEditor.Hooks.useInventorySearchQuery)
local _ = require(script.Parent.InventorySearchTopBarView)

return function()
	-- upvalues: UseAvatarEditorStoresModule (copy), UseInventorySearchQueryModule (copy), UseNavigationFunction (copy), ReactModule (copy), AvatarScreen (copy)
	local InventorySearchStore = UseAvatarEditorStoresModule().inventorySearchStore
	local UseInventorySearchQueryModuleResult = UseInventorySearchQueryModule()
	local UseNavigationResult = UseNavigationFunction()
	
	return {
		query = UseInventorySearchQueryModuleResult,
		searchBarRef = ReactModule.useRef(nil),
		onFocus = ReactModule.useCallback(function(TextBox)
			-- upvalues: InventorySearchStore (copy), UseNavigationResult (copy), AvatarScreen (upval)
			TextBox:ReleaseFocus()
			
			if InventorySearchStore and InventorySearchStore.getQuery(false) ~= "" then
				UseNavigationResult.navigate(AvatarScreen.InventorySearchLanding)
			end
		end, { InventorySearchStore, UseNavigationResult }),
		onClear = ReactModule.useCallback(function()
			-- upvalues: InventorySearchStore (copy), UseNavigationResult (copy), AvatarScreen (upval)
			if InventorySearchStore then
				InventorySearchStore.clearQuery()
			end
			UseNavigationResult.navigate(AvatarScreen.InventorySearchLanding)
		end, { InventorySearchStore, UseNavigationResult }),
		onCancel = ReactModule.useCallback(function()
			-- upvalues: InventorySearchStore (copy)
			if InventorySearchStore then
				InventorySearchStore.clearQuery()
			end
		end, { InventorySearchStore })
	}
end