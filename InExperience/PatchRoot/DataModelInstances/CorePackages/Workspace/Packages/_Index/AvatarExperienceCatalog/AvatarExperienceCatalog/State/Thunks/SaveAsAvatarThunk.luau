local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local performFetch = require(parent.Http).PerformFetch
local promiseModule = require(parent.Promise)
local toastRoduxModule = require(parent.ToastRodux)
local AVATAR_EDITOR_CONSTANTS = avatarExperienceCommonModule.Constants.AVATAR_EDITOR_CONSTANTS
local toastType = toastRoduxModule.Enums.ToastType
local setCurrentToastMessage = toastRoduxModule.Actions.SetCurrentToastMessage
local constants = avatarExperienceAnalyticsModule.Constants
local getGearAssetIdFromState = avatarExperienceCommonModule.Utils.getGearAssetIdFromState
local reportAvatarEventCounterNoAnalyticsArgument = avatarExperienceAnalyticsModule.reportAvatarEventCounterNoAnalyticsArgument
local reportAvatarEventCounterV1 = avatarExperienceAnalyticsModule.reportAvatarEventCounterV1
local fIntAXLookOutfitCreationDelayMs = avatarExperienceFlagsModule.FIntAXLookOutfitCreationDelayMs
local t = {
	toastMessage = "Feature.Avatar.Message.InvalidName",
	isLocalized = false,
	toastType = toastType.InformationMessage
}
local t_1 = {
	toastMessage = "Feature.Avatar.Message.ReachedMaxOutfits",
	isLocalized = false,
	toastType = toastType.InformationMessage
}
local t_2 = {
	toastMessage = "Feature.Avatar.Message.UnknownErrorCreatingOutfit",
	isLocalized = false,
	toastType = toastType.InformationMessage
}

return function(p1, p2, p3, p4)
	-- upvalues: performFetch (ref), AVATAR_EDITOR_CONSTANTS (ref), getGearAssetIdFromState (ref), fIntAXLookOutfitCreationDelayMs (ref), promiseModule (ref), reportAvatarEventCounterNoAnalyticsArgument (ref), constants (ref), reportAvatarEventCounterV1 (ref), setCurrentToastMessage (ref), t (ref), t_1 (ref), t_2 (ref)
	return function(p5, p6)
		-- upvalues: performFetch (copy), AVATAR_EDITOR_CONSTANTS (copy), getGearAssetIdFromState (copy), p2 (ref), p3 (ref), fIntAXLookOutfitCreationDelayMs (copy), promiseModule (copy), p1 (ref), reportAvatarEventCounterNoAnalyticsArgument (copy), constants (copy), reportAvatarEventCounterV1 (copy), p4 (ref), setCurrentToastMessage (copy), t (copy), t_1 (copy), t_2 (copy)
		local avatarEditorService = p6.avatarEditorService
		
		return performFetch.Single(AVATAR_EDITOR_CONSTANTS.CreateOutfitKey, function(p7)
			-- upvalues: getGearAssetIdFromState (copy), p2 (copy), p3 (copy), fIntAXLookOutfitCreationDelayMs (copy), promiseModule (copy), avatarEditorService (ref), p1 (copy), reportAvatarEventCounterNoAnalyticsArgument (copy), constants (copy), reportAvatarEventCounterV1 (copy), p4 (copy), setCurrentToastMessage (copy), t (copy), t_1 (copy), t_2 (copy)
			local state = p7:getState()
			local avatarType = Enum.HumanoidRigType[state.AvatarExperience.AvatarEditor.Character.AvatarType]
			local var1 = getGearAssetIdFromState(state.AvatarExperience)
			local var2 = p2(state, p3)
			task.spawn(function()
				-- upvalues: fIntAXLookOutfitCreationDelayMs (copy), promiseModule (copy), avatarEditorService (copy), var2 (ref), avatarType (ref), p1 (copy), var1 (ref), reportAvatarEventCounterNoAnalyticsArgument (copy), constants (copy), reportAvatarEventCounterV1 (copy), p4 (copy), p7 (ref), setCurrentToastMessage (copy), t (copy), t_1 (copy), t_2 (copy)
				task.wait(fIntAXLookOutfitCreationDelayMs / 1000)
				promiseModule.new(function(p8, p9)
					-- upvalues: avatarEditorService (copy), var2 (copy), avatarType (copy), p1 (copy), var1 (copy), reportAvatarEventCounterNoAnalyticsArgument (copy), constants (copy), reportAvatarEventCounterV1 (copy), p4 (copy), p7 (copy), setCurrentToastMessage (copy), t (copy), t_1 (copy), t_2 (copy)
					local var3 = avatarEditorService:NoPromptCreateOutfit(var2, avatarType, p1, var1)
					while not var3 do
						avatarEditorService.PromptCreateOutfitCompleted:Wait()
						var3 = avatarEditorService:NoPromptCreateOutfit(var2, avatarType, p1, 0)
						reportAvatarEventCounterNoAnalyticsArgument(constants.AVATAR_EDITOR_SERVICE_ERRORS.NoPromptCreateOutfit)
					end
					local var4, var5 = avatarEditorService.PromptCreateOutfitCompleted:Wait()
					
					if var4 == Enum.AvatarPromptResult.Success then
						reportAvatarEventCounterV1(constants.AVATAR_EVENT_COUNTER_NAME.AXCreateCostume)
						p4()
						p8()
						
						return
					elseif var5 == Enum.CreateOutfitFailure.InvalidName then
						p7:dispatch(setCurrentToastMessage(t))
					elseif var5 == Enum.CreateOutfitFailure.OutfitLimitReached then
						p7:dispatch(setCurrentToastMessage(t_1))
					elseif var5 == Enum.CreateOutfitFailure.Other then
						p7:dispatch(setCurrentToastMessage(t_2))
					end
					reportAvatarEventCounterNoAnalyticsArgument(constants.AVATAR_EDITOR_SERVICE_ERRORS.CreateOutfit)
					p9()
				end)
			end)
			
			return promiseModule.resolve()
		end)(p5):catch(function(_) end)
	end
end