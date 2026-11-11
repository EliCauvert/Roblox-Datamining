local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local GrantOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Actions.GrantOutfit)
local AddNewOutfitNotificationModule = require(Modules.AvatarExperience.Common.Actions.AddNewOutfitNotification)
local GrantEditableOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Actions.GrantEditableOutfit)
local GrantPurchasedOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Actions.GrantPurchasedOutfit)
local GetOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetOutfit)
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local GrantOutfitByTypeModule = require(Modules.AvatarExperience.AvatarEditor.Actions.GrantOutfitByType)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local _ = require(Modules.AvatarExperience.Common.Types)
local AXFixShoesInPurchasedCharacters = game:DefineFastFlag("AXFixShoesInPurchasedCharacters", false)
local GetFFlagAXEnableNewInventoryItemsListModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList)
local FFlagAXFixMakeupLookGrantOutfitHoisting = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixMakeupLookGrantOutfitHoisting

local function _(p1, AvatarEditor): boolean
	-- upvalues: AvatarScreen (copy), GetAvatarEditorCategoriesModule (copy), ConstantsModule (copy)
	local IsAvatarEditorMatch = AvatarEditor == AvatarScreen.AvatarEditor
	local Subcategory = p1.AvatarExperience.AvatarEditor.Categories.subcategory
	local AvatarEditorCategoriesModuleEntry = GetAvatarEditorCategoriesModule()[p1.AvatarExperience.AvatarEditor.Categories.category]
	local Subcategories = AvatarEditorCategoriesModuleEntry and AvatarEditorCategoriesModuleEntry.Subcategories or nil
	
	return IsAvatarEditorMatch and Subcategories and Subcategories[Subcategory].SearchUuid == ConstantsModule.PurchasedCharacterKey or false
end

local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function()
	-- upvalues: GetAvatarEditorCategoriesModule (copy), ConstantsModule1 (copy)
	for _, value in GetAvatarEditorCategoriesModule() do
		if value and value.Subcategories then
			for _, subcategory in value.Subcategories do
				if subcategory and subcategory.OutfitType == ConstantsModule1.OutfitTypes.DynamicHead then
					return subcategory.SearchUuid
				end
			end
		end
	end
	return nil
end)

return function(p1, AvatarEditor)
	-- upvalues: ArgCheckModule (copy), GetFFlagAXEnableNewInventoryItemsListModule (copy), GrantOutfitModule (copy), GetOutfitModule (copy), ConstantsModule1 (copy), AddNewOutfitNotificationModule (copy), MemoizeResult (copy), GrantOutfitByTypeModule (copy), FFlagAXFixMakeupLookGrantOutfitHoisting (copy), ConstantsModule (copy), GrantEditableOutfitModule (copy), AXFixShoesInPurchasedCharacters (copy), GrantPurchasedOutfitModule (copy), AvatarScreen (copy), GetAvatarEditorCategoriesModule (copy)
	ArgCheckModule.isType(p1, "string", "GrantOutfit thunk expects outfitId to be a string")
	
	return function(p2)
		-- upvalues: GetFFlagAXEnableNewInventoryItemsListModule (upval), GrantOutfitModule (upval), p1 (copy), GetOutfitModule (upval), ConstantsModule1 (upval), AddNewOutfitNotificationModule (upval), MemoizeResult (upval), GrantOutfitByTypeModule (upval), FFlagAXFixMakeupLookGrantOutfitHoisting (upval), ConstantsModule (upval), GrantEditableOutfitModule (upval), AXFixShoesInPurchasedCharacters (upval), GrantPurchasedOutfitModule (upval), AvatarEditor (copy), AvatarScreen (upval), GetAvatarEditorCategoriesModule (upval)
		local OwnedItemIdsBySubtype = nil
		local OwnedItemIdsBySubtype1 = nil
		
		if not GetFFlagAXEnableNewInventoryItemsListModule() then
			OwnedItemIdsBySubtype = p2:getState().AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype
			p2:dispatch(GrantOutfitModule(p1))
			OwnedItemIdsBySubtype1 = p2:getState().AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype
		end
		p2:dispatch(GetOutfitModule(p1)):andThen(function()
			-- upvalues: p2 (copy), p1 (upval), GetFFlagAXEnableNewInventoryItemsListModule (upval), ConstantsModule1 (upval), OwnedItemIdsBySubtype (ref), GrantOutfitModule (upval), OwnedItemIdsBySubtype1 (ref), AddNewOutfitNotificationModule (upval), MemoizeResult (upval), GrantOutfitByTypeModule (upval), FFlagAXFixMakeupLookGrantOutfitHoisting (upval), ConstantsModule (upval), GrantEditableOutfitModule (upval), AXFixShoesInPurchasedCharacters (upval), GrantPurchasedOutfitModule (upval), AvatarEditor (upval), AvatarScreen (upval), GetAvatarEditorCategoriesModule (upval)
			local State = p2:getState()
			local OutfitInfo = State.AvatarExperience.AvatarEditor.OutfitInfos[tostring(p1)]
			
			if GetFFlagAXEnableNewInventoryItemsListModule() then
				local OutfitType = OutfitInfo.outfitType
				
				if OutfitInfo.inventoryType == ConstantsModule1.OutfitTypes.Animations then
					OutfitType = ConstantsModule1.OutfitTypes.Animations
				elseif OutfitType == ConstantsModule1.OutfitTypes.Avatar and OutfitInfo.isEditable then
					OutfitType = ConstantsModule1.OutfitTypes.EditableAvatar
				end
				OwnedItemIdsBySubtype = p2:getState().AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype
				p2:dispatch(GrantOutfitModule(p1, OutfitType))
				OwnedItemIdsBySubtype1 = p2:getState().AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype
				p2:dispatch(AddNewOutfitNotificationModule(OutfitType))
			end
			if p1 and OutfitInfo.outfitType == ConstantsModule1.OutfitTypes.DynamicHead then
				local MemoizeResultResult = MemoizeResult()
				
				if MemoizeResultResult then
					p2:dispatch(GrantOutfitByTypeModule(MemoizeResultResult, p1))
					
					if not GetFFlagAXEnableNewInventoryItemsListModule() then
						p2:dispatch(AddNewOutfitNotificationModule(ConstantsModule1.OutfitTypes.DynamicHead))
					end
				end
				return
			else
				local IsOutfitTypeMatch = if FFlagAXFixMakeupLookGrantOutfitHoisting then OutfitInfo.outfitType == ConstantsModule1.OutfitTypes.Makeup else nil
				
				if FFlagAXFixMakeupLookGrantOutfitHoisting and p1 and IsOutfitTypeMatch then
					p2:dispatch(GrantOutfitByTypeModule(ConstantsModule.MakeupOutfitKey, p1))
					
					return
				end
				if p1 and OutfitInfo.isEditable then
					p2:dispatch(GrantEditableOutfitModule(p1))
					
					return
				end
				if OwnedItemIdsBySubtype ~= OwnedItemIdsBySubtype1 and (not AXFixShoesInPurchasedCharacters or OutfitInfo.outfitType == ConstantsModule1.OutfitTypes.Avatar) then
					if p1 and not OutfitInfo.isEditable then
						p2:dispatch(GrantPurchasedOutfitModule(p1))
					end
					if not GetFFlagAXEnableNewInventoryItemsListModule() then
						local IsAvatarEditorMatch = AvatarEditor == AvatarScreen.AvatarEditor
						local Subcategory = State.AvatarExperience.AvatarEditor.Categories.subcategory
						local AvatarEditorCategoriesModuleEntry = GetAvatarEditorCategoriesModule()[State.AvatarExperience.AvatarEditor.Categories.category]
						local Subcategories = AvatarEditorCategoriesModuleEntry and AvatarEditorCategoriesModuleEntry.Subcategories or nil
						
						if (not IsAvatarEditorMatch or not Subcategories or Subcategories[Subcategory].SearchUuid ~= ConstantsModule.PurchasedCharacterKey) and true then
							p2:dispatch(AddNewOutfitNotificationModule(ConstantsModule1.OutfitTypes.Avatar))
						end
					end
				end
			end
		end)
	end
end