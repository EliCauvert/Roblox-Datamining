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

return function(p0, p1, p2, p3) --[[ line: 41 ]]
	-- upvalues: performFetch (ref), AVATAR_EDITOR_CONSTANTS (ref), getGearAssetIdFromState (ref), fIntAXLookOutfitCreationDelayMs (ref), promiseModule (ref), reportAvatarEventCounterNoAnalyticsArgument (ref), constants (ref), reportAvatarEventCounterV1 (ref), setCurrentToastMessage (ref), t (ref), t_1 (ref), t_2 (ref)
	return function(p4, p5) --[[ line: 47 ]]
		-- upvalues: performFetch (copy), AVATAR_EDITOR_CONSTANTS (copy), getGearAssetIdFromState (copy), p1 (ref), p2 (ref), fIntAXLookOutfitCreationDelayMs (copy), promiseModule (copy), p0 (ref), reportAvatarEventCounterNoAnalyticsArgument (copy), constants (copy), reportAvatarEventCounterV1 (copy), p3 (ref), setCurrentToastMessage (copy), t (copy), t_1 (copy), t_2 (copy)
		local avatarEditorService = p5.avatarEditorService
		
		return performFetch.Single(AVATAR_EDITOR_CONSTANTS.CreateOutfitKey, function(p6) --[[ line: 49 ]]
			-- upvalues: getGearAssetIdFromState (copy), p1 (copy), p2 (copy), fIntAXLookOutfitCreationDelayMs (copy), promiseModule (copy), avatarEditorService (ref), p0 (copy), reportAvatarEventCounterNoAnalyticsArgument (copy), constants (copy), reportAvatarEventCounterV1 (copy), p3 (copy), setCurrentToastMessage (copy), t (copy), t_1 (copy), t_2 (copy)
			local state = p6:getState()
			local avatarType = Enum.HumanoidRigType[state.AvatarExperience.AvatarEditor.Character.AvatarType]
			local var9 = getGearAssetIdFromState(state.AvatarExperience)
			local var10 = p1(state, p2)
			task.spawn(function() --[[ line: 59 ]]
				-- upvalues: fIntAXLookOutfitCreationDelayMs (copy), promiseModule (copy), avatarEditorService (copy), var10 (ref), avatarType (ref), p0 (copy), var9 (ref), reportAvatarEventCounterNoAnalyticsArgument (copy), constants (copy), reportAvatarEventCounterV1 (copy), p3 (copy), p6 (ref), setCurrentToastMessage (copy), t (copy), t_1 (copy), t_2 (copy)
				task.wait(fIntAXLookOutfitCreationDelayMs / 1000)
				promiseModule.new(function(p7, p8) --[[ line: 63 ]]
					-- upvalues: avatarEditorService (copy), var10 (copy), avatarType (copy), p0 (copy), var9 (copy), reportAvatarEventCounterNoAnalyticsArgument (copy), constants (copy), reportAvatarEventCounterV1 (copy), p3 (copy), p6 (copy), setCurrentToastMessage (copy), t (copy), t_1 (copy), t_2 (copy)
					local var11 = avatarEditorService:NoPromptCreateOutfit(var10, avatarType, p0, var9)
					while not var11 do
						avatarEditorService.PromptCreateOutfitCompleted:Wait()
						var11 = avatarEditorService:NoPromptCreateOutfit(var10, avatarType, p0, 0)
						reportAvatarEventCounterNoAnalyticsArgument(constants.AVATAR_EDITOR_SERVICE_ERRORS.NoPromptCreateOutfit)
					end
					local var12, var13 = avatarEditorService.PromptCreateOutfitCompleted:Wait()
					
					if var12 == Enum.AvatarPromptResult.Success then
						reportAvatarEventCounterV1(constants.AVATAR_EVENT_COUNTER_NAME.AXCreateCostume)
						p3()
						p7()
						
						return
					elseif var13 == Enum.CreateOutfitFailure.InvalidName then
						p6:dispatch(setCurrentToastMessage(t))
					elseif var13 == Enum.CreateOutfitFailure.OutfitLimitReached then
						p6:dispatch(setCurrentToastMessage(t_1))
					elseif var13 == Enum.CreateOutfitFailure.Other then
						p6:dispatch(setCurrentToastMessage(t_2))
					end
					reportAvatarEventCounterNoAnalyticsArgument(constants.AVATAR_EDITOR_SERVICE_ERRORS.CreateOutfit)
					p8()
				end)
			end)
			
			return promiseModule.resolve()
		end)(p4):catch(function(_) --[[ line: 110 ]] end)
	end
end