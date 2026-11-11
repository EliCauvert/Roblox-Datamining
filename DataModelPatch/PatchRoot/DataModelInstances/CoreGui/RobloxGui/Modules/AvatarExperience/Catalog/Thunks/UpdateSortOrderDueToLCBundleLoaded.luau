local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AddSelectedBundleInfoModule = require(Modules.AvatarExperience.Common.Actions.AddSelectedBundleInfo)
local SelectOrderedToggledOnItemsListModule = require(Modules.AvatarExperience.Common.Selectors.SelectOrderedToggledOnItemsList)
local SelectUpdatedSortOrderForToggledOnItemsModule = require(Modules.AvatarExperience.Common.Selectors.SelectUpdatedSortOrderForToggledOnItems)
local SetOrderForTryOnsFunction = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceRodux).Actions.SetOrderForTryOns
local SetOrderModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetOrder)

return function(p1)
	-- upvalues: SelectOrderedToggledOnItemsListModule (copy), SelectUpdatedSortOrderForToggledOnItemsModule (copy), ConstantsModule (copy), SetOrderModule (copy), SetOrderForTryOnsFunction (copy), AddSelectedBundleInfoModule (copy)
	return function(p2)
		-- upvalues: SelectOrderedToggledOnItemsListModule (upval), SelectUpdatedSortOrderForToggledOnItemsModule (upval), p1 (copy), ConstantsModule (upval), SetOrderModule (upval), SetOrderForTryOnsFunction (upval), AddSelectedBundleInfoModule (upval)
		local State = p2:getState()
		local SelectOrderedToggledOnItemsListModuleResult, SelectOrderedToggledOnItemsListModuleResult2 = SelectOrderedToggledOnItemsListModule(State)
		local SelectUpdatedSortOrderForToggledOnItemsModuleResult = SelectUpdatedSortOrderForToggledOnItemsModule(State, p1, ConstantsModule.ItemType.Bundle, nil, SelectOrderedToggledOnItemsListModuleResult, SelectOrderedToggledOnItemsListModuleResult2)
		
		if SelectUpdatedSortOrderForToggledOnItemsModuleResult.equippedAssetsToSetOrder then
			p2:dispatch(SetOrderModule(SelectUpdatedSortOrderForToggledOnItemsModuleResult.equippedAssetsToSetOrder))
		end
		if SelectUpdatedSortOrderForToggledOnItemsModuleResult.itemIdToOrderMap then
			p2:dispatch(SetOrderForTryOnsFunction(SelectUpdatedSortOrderForToggledOnItemsModuleResult.itemIdToOrderMap))
		end
		p2:dispatch(AddSelectedBundleInfoModule(p1, SelectUpdatedSortOrderForToggledOnItemsModuleResult.bundleInfoMapping))
	end
end