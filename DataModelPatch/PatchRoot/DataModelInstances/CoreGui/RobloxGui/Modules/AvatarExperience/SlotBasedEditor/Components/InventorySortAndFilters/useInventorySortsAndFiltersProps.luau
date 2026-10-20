local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local AvatarExperienceSlotBasedEditorModule = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local InventorySorts = AvatarExperienceSlotBasedEditorModule.Enums.InventorySorts
local InventoryFilters = AvatarExperienceSlotBasedEditorModule.Enums.InventoryFilters
local UseAvatarEditorStoresFunction = AvatarExperienceSlotBasedEditorModule.Context.useAvatarEditorStores
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local UseCloseFiltersSignalModule = require(Modules.AvatarExperience.Catalog.Hooks.useCloseFiltersSignal)
local _ = require(Modules.AvatarExperience.SlotBasedEditor.Components.InventorySortAndFilters.InventorySortAndFilters)
local FFlagAXAvatarEditorStoresContext = AvatarExperienceFlagsModule.FFlagAXAvatarEditorStoresContext
local FFlagAXInventoryDurablesExpiredFilter = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesExpiredFilter

return function(p1)
	-- upvalues: FFlagAXAvatarEditorStoresContext (copy), UseAvatarEditorStoresFunction (copy), UseSignalStateFunction (copy), UseCloseFiltersSignalModule (copy), ReactModule (copy), FFlagAXInventoryDurablesExpiredFilter (copy), InventorySorts (copy), InventoryFilters (copy)
	local SortAndFiltersStore = nil
	local CategoryInventoryStores = nil
	
	if FFlagAXAvatarEditorStoresContext then
		local UseAvatarEditorStoresResult = UseAvatarEditorStoresFunction()
		SortAndFiltersStore = UseAvatarEditorStoresResult.sortAndFiltersStore
		CategoryInventoryStores = UseAvatarEditorStoresResult.categoryInventoryStores
	else
		local SlotBasedEditorContext = p1.slotBasedEditorContext
		SortAndFiltersStore = SlotBasedEditorContext.sortAndFiltersStore
		CategoryInventoryStores = SlotBasedEditorContext.categoryInventoryStores
	end
	local UseSignalStateResult = UseSignalStateFunction(SortAndFiltersStore.getSortAndFilters)
	local UseCloseFiltersSignalModuleResult = UseCloseFiltersSignalModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseSignalStateResult.sort)
	local Active = nil
	local Callback = nil
	
	if FFlagAXInventoryDurablesExpiredFilter then
		Active, Callback = ReactModule.useState(UseSignalStateResult.filter)
	end
	return {
		canApply = if FFlagAXInventoryDurablesExpiredFilter then UseSignalStateResult.sort ~= UseStateResult or UseSignalStateResult.filter ~= Active else UseSignalStateResult.sort ~= UseStateResult,
		canReset = if FFlagAXInventoryDurablesExpiredFilter then UseStateResult ~= InventorySorts.Newest or Active ~= InventoryFilters.Active else UseStateResult ~= InventorySorts.Newest,
		onApply = ReactModule.useCallback(function()
			-- upvalues: CategoryInventoryStores (ref), SortAndFiltersStore (ref), UseStateResult (copy), FFlagAXInventoryDurablesExpiredFilter (upval), Active (ref), UseCloseFiltersSignalModuleResult (copy)
			for _, categoryInventoryStore in CategoryInventoryStores do
				categoryInventoryStore.startNewSearch()
			end
			SortAndFiltersStore.applySortAndFilters({
				sort = UseStateResult,
				filter = if FFlagAXInventoryDurablesExpiredFilter then Active else nil
			})
			UseCloseFiltersSignalModuleResult:fire()
		end, {
			CategoryInventoryStores,
			SortAndFiltersStore.applySortAndFilters,
			UseStateResult,
			if FFlagAXInventoryDurablesExpiredFilter then Active else nil,
			UseCloseFiltersSignalModuleResult
		}),
		onReset = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy), InventorySorts (upval), FFlagAXInventoryDurablesExpiredFilter (upval), Callback (ref), InventoryFilters (upval)
			UseStateResult2(InventorySorts.Newest)
			
			if FFlagAXInventoryDurablesExpiredFilter then
				Callback(InventoryFilters.Active)
			end
		end, {}),
		currentSort = UseStateResult,
		setCurrentSort = UseStateResult2,
		currentFilter = if FFlagAXInventoryDurablesExpiredFilter then Active else nil,
		setCurrentFilter = if FFlagAXInventoryDurablesExpiredFilter then Callback else nil,
		closePeekViewSignal = UseCloseFiltersSignalModuleResult
	}
end