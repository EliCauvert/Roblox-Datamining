local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local _ = require(Modules.AvatarExperience.Common.Types)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local GetAvatarEditorStructureModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorStructure)
local FFlagAXFixMakeupLookGrantOutfitHoisting = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixMakeupLookGrantOutfitHoisting

local function _()
	-- upvalues: GetAvatarEditorStructureModule (copy)
	return GetAvatarEditorStructureModule().AssetTypeToSearchUuids
end

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.AvatarEditor.Actions.SetOwnedItemIdsBySubtype).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local t = {}
		local v1 = p1[p2.itemSubType] and p1[p2.itemSubType] or {}
		for _, value in v1 do
			t[value] = value
		end
		for _, itemId in p2.itemIds do
			if not t[itemId] then
				v1[#v1 + 1] = itemId
				t[itemId] = itemId
			end
		end
		return CryoModule.Dictionary.join(p1, { [p2.itemSubType] = v1 })
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.GrantAsset).name] = function(p3, p4)
		-- upvalues: GetAvatarEditorStructureModule (copy), CryoModule (copy)
		local t = {}
		local Text = tostring(p4.assetId)
		local AssetTypeToSearchUuid = GetAvatarEditorStructureModule().AssetTypeToSearchUuids[tostring(p4.assetTypeId)]
		
		if not AssetTypeToSearchUuid then
			return p3
		end
		local Flag = nil
		for _, value in AssetTypeToSearchUuid do
			local list = { Text }
			Flag = false
			
			for i, value1 in p3[value] and p3[value] or {} do
				if value1 == Text then
					Flag = true
					break
				else
					list[i + 1] = value1
					continue
				end
			end
			if not Flag then
				t[value] = list
			end
		end
		return if next(t) then CryoModule.Dictionary.join(p3, t) else p3
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.RevokeAsset).name] = function(p5, p6)
		-- upvalues: GetAvatarEditorStructureModule (copy), CryoModule (copy)
		local RemoveValueResults = {}
		local Text = tostring(p6.assetId)
		local AssetTypeToSearchUuid = GetAvatarEditorStructureModule().AssetTypeToSearchUuids[tostring(p6.assetTypeId)]
		
		if not AssetTypeToSearchUuid then
			return p5
		end
		for _, value in AssetTypeToSearchUuid do
			local v2 = p5[value] and p5[value] or {}
			local RemoveValueResult = CryoModule.List.removeValue(v2, Text)
			
			if #v2 ~= #RemoveValueResult then
				RemoveValueResults[value] = RemoveValueResult
			end
		end
		return if next(RemoveValueResults) then CryoModule.Dictionary.join(p5, RemoveValueResults) else p5
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.GrantOutfitByType).name] = function(p7, p8)
		-- upvalues: CryoModule (copy)
		local Text = tostring(p8.outfitId)
		local OutfitTypeId = p8.outfitTypeId
		local List = { Text }
		
		for _, value in p7[OutfitTypeId] or {} do
			if value == Text then
				return p7
			end
			table.insert(List, value)
		end
		return CryoModule.Dictionary.join(p7, { [OutfitTypeId] = List })
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.GrantOutfit).name] = function(p9, p10)
		-- upvalues: ConstantsModule1 (copy), CryoModule (copy)
		local Text = tostring(p10.outfitId)
		local list = { Text }
		
		for i, value in p9[ConstantsModule1.CharacterKey] or {} do
			if value == Text then
				return p9
			end
			list[i + 1] = value
		end
		return CryoModule.Dictionary.join(p9, { [ConstantsModule1.CharacterKey] = list })
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.GrantEditableOutfit).name] = function(p11, p12)
		-- upvalues: ConstantsModule1 (copy), CryoModule (copy)
		local Text = tostring(p12.outfitId)
		local list = { Text }
		
		for i, value in p11[ConstantsModule1.EditableCharacterKey] or {} do
			if value == Text then
				return p11
			end
			list[i + 1] = value
		end
		return CryoModule.Dictionary.join(p11, { [ConstantsModule1.EditableCharacterKey] = list })
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.GrantPurchasedOutfit).name] = function(p13, p14)
		-- upvalues: ConstantsModule1 (copy), CryoModule (copy)
		local Text = tostring(p14.outfitId)
		local list = { Text }
		
		for i, value in p13[ConstantsModule1.PurchasedCharacterKey] or {} do
			if value == Text then
				return p13
			end
			list[i + 1] = value
		end
		return CryoModule.Dictionary.join(p13, { [ConstantsModule1.PurchasedCharacterKey] = list })
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.UpdateOutfit).name] = function(p15, p16)
		-- upvalues: FFlagAXFixMakeupLookGrantOutfitHoisting (copy), ConstantsModule (copy), ConstantsModule1 (copy), CryoModule (copy)
		local Text = tostring(p16.outfitId)
		
		if FFlagAXFixMakeupLookGrantOutfitHoisting and p16.outfitType == ConstantsModule.OutfitTypes.Makeup then
			return CryoModule.Dictionary.join(p15, {
				[ConstantsModule1.MakeupOutfitKey] = CryoModule.List.join({ Text }, CryoModule.List.removeValue(p15[ConstantsModule1.MakeupOutfitKey] or {}, Text))
			})
		end
		local v3 = p15[ConstantsModule1.CharacterKey] or {}
		local v4 = p15[ConstantsModule1.EditableCharacterKey] or {}
		local JoinResult = nil
		local JoinResult1 = nil
		
		if p16.isEditable then
			JoinResult = v3
			JoinResult1 = CryoModule.List.join({ Text }, CryoModule.List.removeValue(v4, Text))
		else
			JoinResult = CryoModule.List.join({ Text }, CryoModule.List.removeValue(v3, Text))
			JoinResult1 = v4
		end
		return CryoModule.Dictionary.join(p15, {
			[ConstantsModule1.CharacterKey] = JoinResult,
			[ConstantsModule1.EditableCharacterKey] = JoinResult1
		})
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.RevokeOutfit).name] = function(p15, p16)
		-- upvalues: ConstantsModule1 (copy), CryoModule (copy)
		local Text = tostring(p16.outfitId)
		
		return CryoModule.Dictionary.join(p15, {
			[ConstantsModule1.CharacterKey] = CryoModule.List.removeValue(p15[ConstantsModule1.CharacterKey] or {}, Text),
			[ConstantsModule1.EditableCharacterKey] = CryoModule.List.removeValue(p15[ConstantsModule1.EditableCharacterKey] or {}, Text)
		})
	end
})