local Modules = game:GetService("CoreGui").RobloxGui.Modules
local EmoteUtility = require(game:GetService("CorePackages").Packages.Thumbnailing).EmoteUtility
local PPEThumbnailTypeModule = require(Modules.AvatarExperience.ProfilePictureEditor.PPEThumbnailType)
local SelectIsToolEquippedModule = require(Modules.AvatarExperience.Common.Selectors.SelectIsToolEquipped)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local _ = require(Modules.AvatarExperience.Common.Managers.AnimationManagerTypes)
local CompletePPEEmoteLoadingModule = require(Modules.AvatarExperience.ProfilePictureEditor.Actions.CompletePPEEmoteLoading)
local StartPPEEmoteLoadingModule = require(Modules.AvatarExperience.ProfilePictureEditor.Actions.StartPPEEmoteLoading)
local SetLastSuccessfulPoseEmoteAssetIdModule = require(Modules.AvatarExperience.ProfilePictureEditor.Actions.SetLastSuccessfulPoseEmoteAssetId)
local AnimationUtilsModule = require(Modules.AvatarExperience.Common.Managers.AnimationUtils)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)

local function _(p1): boolean
	return if p1 then p1:getEquippedToolModel() ~= nil else false
end

local Enabled = false

return {
	getDidSomethingRequiringPPEPoseAdjustment = function(p1, p2, p3): boolean
		-- upvalues: PPEThumbnailTypeModule (copy), SelectIsToolEquippedModule (copy)
		if p1.AvatarExperience.AvatarScene.Character.CharacterModelVersion ~= p2.AvatarExperience.AvatarScene.Character.CharacterModelVersion then
			return true
		end
		local FinalPageViewMode = p1.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode
		local FinalPageViewMode1 = p2.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode
		
		if FinalPageViewMode ~= FinalPageViewMode1 then
			if FinalPageViewMode == PPEThumbnailTypeModule.Closeup and FinalPageViewMode1 == PPEThumbnailTypeModule.FullBody then
				if SelectIsToolEquippedModule(p2) and not (if p3 then p3:getEquippedToolModel() ~= nil else false) then
					return false
				else
					return true
				end
			elseif FinalPageViewMode == PPEThumbnailTypeModule.FullBody and FinalPageViewMode1 == PPEThumbnailTypeModule.Closeup then
				if SelectIsToolEquippedModule(p2) and (if p3 then p3:getEquippedToolModel() ~= nil else false) then
					return false
				else
					return true
				end
			end
		end
		return false
	end,
	getAssetIdsToLoad = function(p1, p2)
		-- upvalues: UtilsModule (copy)
		local config = { ppeEmoteAssetId = UtilsModule.getAssetIdForPPEPose(p1) }
		
		if p2 then
			config.moodAssetId = UtilsModule.getEquippedMoodAssetId(p1)
		end
		return config
	end,
	makeLoadedAssets = function(p1, p2, p3)
		-- upvalues: Enabled (ref), StartPPEEmoteLoadingModule (copy), EmoteUtility (copy), CompletePPEEmoteLoadingModule (copy)
		local t = {}
		local CurrentCharacter = p1:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter
		
		if not CurrentCharacter then
			return t
		end
		if not CurrentCharacter:FindFirstChildOfClass("Humanoid") then
			return t
		end
		assert(Enabled == false, "promiseHasOutstandingPPELoading should be false")
		p1:dispatch(StartPPEEmoteLoadingModule())
		Enabled = true
		local Number: number? = nil
		local Number1: number? = nil
		
		if p3.ppeEmoteAssetId then
			Number = tonumber(p3.ppeEmoteAssetId)
		end
		if p3.moodAssetId then
			Number1 = tonumber(p3.moodAssetId)
		end
		t.keyframesForPose = EmoteUtility.LoadKeyframesForPose(CurrentCharacter, Number, Number1, true, not p2.ppeFinalPageFullView)
		p1:dispatch(CompletePPEEmoteLoadingModule())
		Enabled = false
		
		return t
	end,
	maybeNoteLoadingFinished = function(p1)
		-- upvalues: Enabled (ref), CompletePPEEmoteLoadingModule (copy)
		if Enabled then
			p1:dispatch(CompletePPEEmoteLoadingModule())
		end
		Enabled = false
	end,
	applyNewProfilePictureEditorPose = function(p1, p2, Humanoid, p3)
		-- upvalues: EmoteUtility (copy), AnimationUtilsModule (copy), SetLastSuccessfulPoseEmoteAssetIdModule (copy)
		assert(p2, "currentCharacter is non-nil.")
		assert(Humanoid, "humanoid is non-nil..")
		
		if p3 then
			EmoteUtility.ApplyKeyframesForPose(p2, p3)
		else
			EmoteUtility.SetPlayerCharacterNeutralPose(p2)
			
			if Enum.HumanoidRigType.R6 == Humanoid.RigType then
				EmoteUtility.AdjustArmOnR6ForTool(p2)
			end
		end
		local FinalAnimationAssetIdOrUrl = nil
		
		if p3 then
			FinalAnimationAssetIdOrUrl = p3.finalAnimationAssetIdOrUrl
			
			if FinalAnimationAssetIdOrUrl then
				FinalAnimationAssetIdOrUrl = tostring(FinalAnimationAssetIdOrUrl)
			end
		end
		AnimationUtilsModule.waitForAnimationAndPosingToResolve(function()
			-- upvalues: p1 (copy), SetLastSuccessfulPoseEmoteAssetIdModule (upval), FinalAnimationAssetIdOrUrl (ref)
			p1:dispatch(SetLastSuccessfulPoseEmoteAssetIdModule(FinalAnimationAssetIdOrUrl))
		end)
	end,
	undoOldProfilePictureEditorPose = function(p1, p2, p3)
		-- upvalues: EmoteUtility (copy), SetLastSuccessfulPoseEmoteAssetIdModule (copy)
		if p3 and p2 then
			EmoteUtility.SetPlayerCharacterNeutralPose(p2)
			p1:dispatch(SetLastSuccessfulPoseEmoteAssetIdModule(nil))
		end
	end
}