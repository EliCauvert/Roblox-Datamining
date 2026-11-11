local CorePackages = game:GetService("CorePackages")
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PromiseModule = require(CorePackages.Packages.Promise)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UpdateOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.UpdateOutfit)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local UtilsModule1 = require(Modules.AvatarExperience.Common.Utils)
local GetFFlagAvatarEditorServiceCreateOutfitSupportsGearsModule = require(Modules.AvatarExperience.Flags.GetFFlagAvatarEditorServiceCreateOutfitSupportsGears)
local FFlagAXUpdateSlotBasedEditorToastAndPrompts = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXUpdateSlotBasedEditorToastAndPrompts
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local FFlagAXEnableModeratedItemsFlowForDurables = AvatarExperienceFlagsModule.FFlagAXEnableModeratedItemsFlowForDurables
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local FFlagAXBackgroundsOutfitPersistence = AvatarExperienceFlagsModule.FFlagAXBackgroundsOutfitPersistence
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local config = {
	toastMessage = "Feature.Avatar.Message.UpdateOutfitSuccess",
	isLocalized = false,
	toastType = ToastTypeModule.SuccessConfirmation
}
local config1 = {
	toastMessage = "Feature.Avatar.Message.FailedUpdateOutfit",
	isLocalized = false,
	toastType = ToastTypeModule.InformationMessage
}

local function _(Text): string
	-- upvalues: ConstantsModule (copy)
	return ConstantsModule.UpdateOutfitKey .. Text
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), ConstantsModule (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), UtilsModule (copy), GetFFlagAvatarEditorServiceCreateOutfitSupportsGearsModule (copy), FFlagAXBackgroundsOutfitPersistence (copy), AvatarExperienceCommonModule (copy), PromiseModule (copy), UpdateOutfitModule (copy), FFlagAXUpdateSlotBasedEditorToastAndPrompts (copy), UtilsModule1 (copy), FFlagAXInventoryDurablesSupport (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy), config (copy), config1 (copy)
	ArgCheckModule.isType(p2, "string", "UpdateSavedOutfit thunk expects outfitId to be a string")
	ArgCheckModule.isType(p1, "table", "UpdateSavedOutfit thunk expects avatarEditorAnalytics to be a table")
	ArgCheckModule.isType(p2, "string", "UpdateSavedOutfit thunk expects outfitId to be a string")
	
	return function(p6, p7)
		-- upvalues: PerformFetch (upval), p2 (copy), ConstantsModule (upval), FFlagAXModeratedItemsFlow (upval), FFlagAXEnableModeratedItemsFlowForDurables (upval), p3 (copy), UtilsModule (upval), GetFFlagAvatarEditorServiceCreateOutfitSupportsGearsModule (upval), FFlagAXBackgroundsOutfitPersistence (upval), AvatarExperienceCommonModule (upval), PromiseModule (upval), UpdateOutfitModule (upval), p5 (copy), FFlagAXUpdateSlotBasedEditorToastAndPrompts (upval), UtilsModule1 (upval), FFlagAXInventoryDurablesSupport (upval), p4 (copy), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), config (upval), config1 (upval)
		local AvatarEditorService = p7.avatarEditorService
		
		return PerformFetch.Single(ConstantsModule.UpdateOutfitKey .. p2, function(p8)
			-- upvalues: FFlagAXModeratedItemsFlow (upval), FFlagAXEnableModeratedItemsFlowForDurables (upval), p3 (upval), UtilsModule (upval), GetFFlagAvatarEditorServiceCreateOutfitSupportsGearsModule (upval), FFlagAXBackgroundsOutfitPersistence (upval), AvatarExperienceCommonModule (upval), PromiseModule (upval), AvatarEditorService (copy), p2 (upval), UpdateOutfitModule (upval), p5 (upval), FFlagAXUpdateSlotBasedEditorToastAndPrompts (upval), UtilsModule1 (upval), FFlagAXInventoryDurablesSupport (upval), p4 (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), config (upval), config1 (upval)
			local State = p8:getState()
			local FFlagAXModeratedItemsFlow1 = FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables
			local HumanoidDescriptionFromOutfitInfo = if FFlagAXModeratedItemsFlow1 and p3 then UtilsModule.getHumanoidDescriptionFromOutfitInfo(p3) else UtilsModule.getHumanoidDescriptionFromState(State.AvatarExperience)
			local HumanoidRigTypeEntry = Enum.HumanoidRigType[State.AvatarExperience.AvatarEditor.Character.AvatarType]
			local GearAssetIdFromState = if GetFFlagAvatarEditorServiceCreateOutfitSupportsGearsModule() then UtilsModule.getGearAssetIdFromState(State.AvatarExperience) else 0
			local Config = if FFlagAXBackgroundsOutfitPersistence then {
				ProfileConfiguration = AvatarExperienceCommonModule.Backgrounds.buildOutfitProfileConfiguration(State.AvatarExperience)
			} else nil
			
			return PromiseModule.new(function(Callback1: () -> (), Callback: () -> ())
				-- upvalues: UtilsModule (upval), AvatarEditorService (upval), p2 (upval), HumanoidDescriptionFromOutfitInfo (copy), HumanoidRigTypeEntry (copy), GearAssetIdFromState (ref), Config (copy), p8 (copy), UpdateOutfitModule (upval), p5 (upval), FFlagAXUpdateSlotBasedEditorToastAndPrompts (upval), State (copy), UtilsModule1 (upval), FFlagAXInventoryDurablesSupport (upval), p4 (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), config (upval), config1 (upval)
				if UtilsModule.doAESCallAndAwaitResult(AvatarEditorService, AvatarEditorService.NoPromptUpdateOutfit, AvatarEditorService.PromptUpdateOutfitCompleted, p2, HumanoidDescriptionFromOutfitInfo, HumanoidRigTypeEntry, GearAssetIdFromState, Config) ~= Enum.AvatarPromptResult.Success then
					p8:dispatch(SetCurrentToastMessageModule(config1))
					Callback()
					
					return
				end
				p8:dispatch(UpdateOutfitModule(p2, p5))
				local Name = FFlagAXUpdateSlotBasedEditorToastAndPrompts and (State.AvatarExperience.AvatarEditor.OutfitInfos[p2] and State.AvatarExperience.AvatarEditor.OutfitInfos[p2].name)
				
				if FFlagAXUpdateSlotBasedEditorToastAndPrompts and Name then
					local FeatureAvatarMessageAvatarUpdated = UtilsModule1.translateString("Feature.Avatar.Message.AvatarUpdated", { avatarName = Name })
					
					if FFlagAXInventoryDurablesSupport and not p4 then
						p8:dispatch(SetCurrentToastMessageModule({
							isLocalized = true,
							toastMessage = FeatureAvatarMessageAvatarUpdated,
							toastType = ToastTypeModule.SuccessConfirmation
						}))
					end
				else
					p8:dispatch(SetCurrentToastMessageModule(config))
				end
				Callback1()
			end)
		end)(p6)
	end
end