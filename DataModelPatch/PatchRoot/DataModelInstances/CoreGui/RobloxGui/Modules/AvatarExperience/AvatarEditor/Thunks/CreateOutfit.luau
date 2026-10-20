local CorePackages = game:GetService("CorePackages")
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PromiseModule = require(CorePackages.Packages.Promise)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local UtilsModule1 = require(Modules.AvatarExperience.AvatarEditor.Utils)
local GetFFlagAvatarEditorServiceCreateOutfitSupportsGearsModule = require(Modules.AvatarExperience.Flags.GetFFlagAvatarEditorServiceCreateOutfitSupportsGears)
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local FFlagAXUpdateSlotBasedEditorToastAndPrompts = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXUpdateSlotBasedEditorToastAndPrompts
local FFlagAXBackgroundsOutfitPersistence = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXBackgroundsOutfitPersistence
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local config = {
	toastMessage = "Feature.Avatar.Message.InvalidName",
	isLocalized = false,
	toastType = ToastTypeModule.InformationMessage
}
local config1 = {
	toastMessage = "Feature.Avatar.Message.ReachedMaxOutfits",
	isLocalized = false,
	toastType = ToastTypeModule.InformationMessage
}
local config2 = {
	toastMessage = "Feature.Avatar.Message.UnknownErrorCreatingOutfit",
	isLocalized = false,
	toastType = ToastTypeModule.InformationMessage
}

return function(AvatarName, p1, p2, Callback, p3)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), ConstantsModule (copy), UtilsModule1 (copy), GetFFlagAvatarEditorServiceCreateOutfitSupportsGearsModule (copy), FFlagAXBackgroundsOutfitPersistence (copy), AvatarExperienceCommonModule (copy), PromiseModule (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule1 (copy), FFlagAXUpdateSlotBasedEditorToastAndPrompts (copy), UtilsModule (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy), config (copy), config1 (copy), config2 (copy)
	ArgCheckModule.isTypeOrNil(AvatarName, "string", "CreateOutfit thunk expects name to be a string or nil")
	ArgCheckModule.isType(p1, "table", "CreateOutfit thunk expects avatarEditorAnalytics to be a table")
	ArgCheckModule.isTypeOrNil(p2, "function", "CreateOutfit thunk expects checkIsMounted to be a function or nil")
	ArgCheckModule.isTypeOrNil(Callback, "function", "CreateOutfit thunk expects onComplete to be a callback or nil")
	ArgCheckModule.isTypeOrNil(p3, "Instance", "CreateOutfit thunk expects altHumanoidDescription to be an Instance or nil")
	
	return function(p4, p5)
		-- upvalues: PerformFetch (upval), ConstantsModule (upval), p3 (copy), UtilsModule1 (upval), GetFFlagAvatarEditorServiceCreateOutfitSupportsGearsModule (upval), FFlagAXBackgroundsOutfitPersistence (upval), AvatarExperienceCommonModule (upval), PromiseModule (upval), AvatarName (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), p1 (copy), FFlagAXUpdateSlotBasedEditorToastAndPrompts (upval), UtilsModule (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), Callback (copy), config (upval), config1 (upval), config2 (upval)
		local AvatarEditorService = p5.avatarEditorService
		
		return PerformFetch.Single(ConstantsModule.CreateOutfitKey, function(p6)
			-- upvalues: p3 (upval), UtilsModule1 (upval), GetFFlagAvatarEditorServiceCreateOutfitSupportsGearsModule (upval), FFlagAXBackgroundsOutfitPersistence (upval), AvatarExperienceCommonModule (upval), PromiseModule (upval), AvatarEditorService (copy), AvatarName (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), p1 (upval), FFlagAXUpdateSlotBasedEditorToastAndPrompts (upval), UtilsModule (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), Callback (upval), config (upval), config1 (upval), config2 (upval)
			local State = p6:getState()
			local HumanoidRigTypeEntry = Enum.HumanoidRigType[State.AvatarExperience.AvatarEditor.Character.AvatarType]
			local GearAssetIdFromState = 0
			local HumanoidDescriptionFromState = nil
			HumanoidDescriptionFromState = if p3 == nil then UtilsModule1.getHumanoidDescriptionFromState(State.AvatarExperience) else p3
			
			if GetFFlagAvatarEditorServiceCreateOutfitSupportsGearsModule() then
				GearAssetIdFromState = UtilsModule1.getGearAssetIdFromState(State.AvatarExperience)
			end
			local Config = if FFlagAXBackgroundsOutfitPersistence then {
				ProfileConfiguration = AvatarExperienceCommonModule.Backgrounds.buildOutfitProfileConfiguration(State.AvatarExperience)
			} else nil
			
			return PromiseModule.new(function(Callback1: () -> (), Callback2: () -> ())
				-- upvalues: GetFFlagAvatarEditorServiceCreateOutfitSupportsGearsModule (upval), AvatarEditorService (upval), HumanoidDescriptionFromState (ref), HumanoidRigTypeEntry (copy), AvatarName (upval), GearAssetIdFromState (ref), Config (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), p1 (upval), FFlagAXUpdateSlotBasedEditorToastAndPrompts (upval), UtilsModule (upval), p6 (copy), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), Callback (upval), config (upval), config1 (upval), config2 (upval)
				local NoPromptCreateOutfitResult = if GetFFlagAvatarEditorServiceCreateOutfitSupportsGearsModule() then AvatarEditorService:NoPromptCreateOutfit(HumanoidDescriptionFromState, HumanoidRigTypeEntry, AvatarName, GearAssetIdFromState, Config) else AvatarEditorService:NoPromptCreateOutfit(HumanoidDescriptionFromState, HumanoidRigTypeEntry, AvatarName, 0, Config)
				while not NoPromptCreateOutfitResult do
					AvatarEditorService.PromptCreateOutfitCompleted:Wait()
					NoPromptCreateOutfitResult = AvatarEditorService:NoPromptCreateOutfit(HumanoidDescriptionFromState, HumanoidRigTypeEntry, AvatarName, 0, Config)
					
					if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
						ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule1.Counter.AvatarEditorServiceErrors.NoPromptCreateOutfit)
					end
				end
				local Result, FailureType = AvatarEditorService.PromptCreateOutfitCompleted:Wait()
				
				if Result == Enum.AvatarPromptResult.Success then
					p1.outfitCreated(AvatarName)
					
					if FFlagAXUpdateSlotBasedEditorToastAndPrompts then
						p6:dispatch(SetCurrentToastMessageModule({
							isLocalized = true,
							toastMessage = UtilsModule.translateString("Feature.Avatar.Message.AvatarAdded", { avatarName = AvatarName }),
							toastType = ToastTypeModule.SuccessConfirmation
						}))
					end
					Callback1()
					
					if Callback ~= nil then
						Callback(true)
						
						return
					end
				else
					if FailureType == Enum.CreateOutfitFailure.InvalidName then
						p6:dispatch(SetCurrentToastMessageModule(config))
					elseif FailureType == Enum.CreateOutfitFailure.OutfitLimitReached then
						p6:dispatch(SetCurrentToastMessageModule(config1))
					elseif FailureType == Enum.CreateOutfitFailure.Other then
						p6:dispatch(SetCurrentToastMessageModule(config2))
					end
					if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
						ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule1.Counter.AvatarEditorServiceErrors.CreateOutfit)
					end
					Callback2()
					
					if Callback ~= nil then
						Callback(false)
					end
				end
			end)
		end)(p4):catch(function(_) end)
	end
end