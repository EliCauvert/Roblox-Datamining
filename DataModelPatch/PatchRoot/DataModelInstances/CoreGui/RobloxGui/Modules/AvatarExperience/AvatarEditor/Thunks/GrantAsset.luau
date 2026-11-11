local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local GrantAssetModule = require(Modules.AvatarExperience.AvatarEditor.Actions.GrantAsset)
local AddNewAssetNotificationModule = require(Modules.AvatarExperience.Common.Actions.AddNewAssetNotification)
local FetchAssetOrBundleInfoModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local MarkInventoryStaleOnGrantModule = require(Modules.AvatarExperience.AvatarEditor.markInventoryStaleOnGrant)
local FFlagAXRefetchInventoryOnAssetGrant = AvatarExperienceFlagsModule.FFlagAXRefetchInventoryOnAssetGrant
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

local function v14(State, AvatarEditor, AssetTypeIdString): boolean
	-- upvalues: AvatarScreen (copy), GetAvatarEditorCategoriesModule (copy)
	local IsAvatarEditorMatch = AvatarEditor == AvatarScreen.AvatarEditor
	local Subcategory = State.AvatarExperience.AvatarEditor.Categories.subcategory
	local AvatarEditorCategoriesModuleEntry = GetAvatarEditorCategoriesModule()[State.AvatarExperience.AvatarEditor.Categories.category]
	
	if IsAvatarEditorMatch then
		local Subcategories = AvatarEditorCategoriesModuleEntry and AvatarEditorCategoriesModuleEntry.Subcategories or nil
		local AssetTypeIdStrings = Subcategories and Subcategories[Subcategory].AssetTypeIdStrings or AvatarEditorCategoriesModuleEntry.AssetTypeIdStrings
		
		if AssetTypeIdStrings then
			for _, assetTypeIdString in AssetTypeIdStrings do
				if assetTypeIdString == AssetTypeIdString then
					return true
				end
			end
		end
	end
	return false
end

return function(AssetTypeIdString, p1, p2, p3, p4)
	-- upvalues: ArgCheckModule (copy), FFlagAXInventoryDurablesSupport (copy), FFlagAXRefetchInventoryOnAssetGrant (copy), MarkInventoryStaleOnGrantModule (copy), GrantAssetModule (copy), FetchAssetOrBundleInfoModule (copy), ConstantsModule (copy), v14 (copy), AddNewAssetNotificationModule (copy)
	ArgCheckModule.isType(p1, "string", "GrantAsset request expects assetId")
	ArgCheckModule.isType(AssetTypeIdString, "string", "GrantAsset request expects assetTypeIdString")
	
	return function(p5)
		-- upvalues: FFlagAXInventoryDurablesSupport (upval), FFlagAXRefetchInventoryOnAssetGrant (upval), MarkInventoryStaleOnGrantModule (upval), AssetTypeIdString (copy), GrantAssetModule (upval), p1 (copy), FetchAssetOrBundleInfoModule (upval), p2 (copy), p3 (copy), ConstantsModule (upval), v14 (upval), p4 (copy), AddNewAssetNotificationModule (upval)
		local OwnedItemIdsBySubtype = p5:getState().AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype
		local v1 = if FFlagAXInventoryDurablesSupport then true else nil
		
		if FFlagAXRefetchInventoryOnAssetGrant then
			MarkInventoryStaleOnGrantModule({ assetTypeIdString = AssetTypeIdString })
		else
			p5:dispatch(GrantAssetModule(AssetTypeIdString, p1))
			p5:dispatch(FetchAssetOrBundleInfoModule(p2, p3, p1, ConstantsModule.ItemType.Asset, if FFlagAXInventoryDurablesSupport then v1 else nil))
		end
		local OwnedItemIdsBySubtype1 = if FFlagAXRefetchInventoryOnAssetGrant then nil else p5:getState().AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype
		
		if (FFlagAXRefetchInventoryOnAssetGrant or OwnedItemIdsBySubtype ~= OwnedItemIdsBySubtype1) and not v14(p5:getState(), p4, AssetTypeIdString) then
			p5:dispatch(AddNewAssetNotificationModule(AssetTypeIdString))
		end
	end
end