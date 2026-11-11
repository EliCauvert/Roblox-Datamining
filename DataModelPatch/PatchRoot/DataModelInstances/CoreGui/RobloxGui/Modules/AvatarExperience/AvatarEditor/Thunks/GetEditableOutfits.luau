local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local CryoModule = require(CorePackages.Packages.Cryo)
local SetOwnedItemIdsBySubtypeModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetOwnedItemIdsBySubtype)
local SetPageFinishedModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetPageFinished)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local FFlagAEGetEditableOutfitsTypeModule = require(Modules.AvatarExperience.Flags.FFlagAEGetEditableOutfitsType)
local GetOutfitsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetOutfits)

return function()
	-- upvalues: ConstantsModule1 (copy), CryoModule (copy), UtilsModule (copy), SetOwnedItemIdsBySubtypeModule (copy), SetPageFinishedModule (copy), PromiseModule (copy), GetOutfitsModule (copy), FFlagAEGetEditableOutfitsTypeModule (copy), ConstantsModule (copy)
	return function(p1)
		-- upvalues: ConstantsModule1 (upval), CryoModule (upval), UtilsModule (upval), SetOwnedItemIdsBySubtypeModule (upval), SetPageFinishedModule (upval), PromiseModule (upval), GetOutfitsModule (upval), FFlagAEGetEditableOutfitsTypeModule (upval), ConstantsModule (upval)
		local State = p1:getState()
		
		if State.AvatarExperience.AvatarEditor.PageFinished[ConstantsModule1.CharacterKey] then
			local OutfitInfos = State.AvatarExperience.AvatarEditor.OutfitInfos
			local Flag = true
			local FilterResult = CryoModule.List.filter(State.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[ConstantsModule1.CharacterKey], function(p2): boolean
				-- upvalues: OutfitInfos (copy), UtilsModule (upval), Flag (ref)
				local OutfitInfo = OutfitInfos[tostring(p2)]
				
				if OutfitInfo then
					return not UtilsModule.isPresetOutfit(OutfitInfo)
				else
					Flag = false
					
					return false
				end
			end)
			
			if Flag then
				p1:dispatch(SetOwnedItemIdsBySubtypeModule(ConstantsModule1.EditableCharacterKey, FilterResult))
				p1:dispatch(SetPageFinishedModule(ConstantsModule1.EditableCharacterKey, true))
				
				return PromiseModule.resolve()
			end
		end
		return p1:dispatch(GetOutfitsModule(ConstantsModule1.EditableCharacterKey, true, nil, if FFlagAEGetEditableOutfitsTypeModule then ConstantsModule.OutfitTypes.Avatar else nil))
	end
end