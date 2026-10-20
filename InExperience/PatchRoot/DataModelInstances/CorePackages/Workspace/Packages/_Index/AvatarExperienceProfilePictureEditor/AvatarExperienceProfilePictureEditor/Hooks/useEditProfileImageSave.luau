local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local FFlagEditProfileFramesEnabled = require(Parent.SharedFlags).FFlagEditProfileFramesEnabled
local EditProfileImageHelpersModule = require(AvatarExperienceProfilePictureEditor.Utils.editProfileImageHelpers)
local SaveEditProfileImageModule = require(AvatarExperienceProfilePictureEditor.Utils.saveEditProfileImage)
local ShowEditProfileImageToastModule = require(AvatarExperienceProfilePictureEditor.Utils.showEditProfileImageToast)
local EditProfileImageAnalyticsModule = require(AvatarExperienceProfilePictureEditor.Analytics.EditProfileImageAnalytics)
local _ = require(AvatarExperienceProfilePictureEditor.Common.Enums)

return function(p1)
	-- upvalues: ReactModule (copy), EditProfileImageHelpersModule (copy), SaveEditProfileImageModule (copy), EditProfileImageAnalyticsModule (copy), ShowEditProfileImageToastModule (copy), FFlagEditProfileFramesEnabled (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return {
		isSaving = UseStateResult,
		onSave = ReactModule.useCallback(function()
			-- upvalues: UseStateResult (copy), UseStateResult2 (copy), EditProfileImageHelpersModule (upval), p1 (copy), SaveEditProfileImageModule (upval), EditProfileImageAnalyticsModule (upval), ShowEditProfileImageToastModule (upval), FFlagEditProfileFramesEnabled (upval)
			if not UseStateResult then
				UseStateResult2(true)
				local SavePayloadForActiveView = EditProfileImageHelpersModule.buildSavePayloadForActiveView(p1.activeView, {
					selectedEmoteId = p1.selectedEmoteId,
					savedEmoteAssetId = p1.savedEmoteAssetId,
					selectedFrameId = if p1.showFrames then p1.selectedFrameId else nil,
					showFrames = p1.showFrames
				})
				local config = {
					emoteAssetId = SavePayloadForActiveView.emoteAssetId,
					profileFrameAssetId = SavePayloadForActiveView.profileFrameAssetId,
					cameraDistanceScale = p1.distanceScale,
					cameraYRotDeg = p1.yRotDeg,
					fieldOfViewDeg = p1.cutoutFieldOfViewDeg,
					localUserId = p1.localUserId
				}
				local OnCloseFunction = p1.onClose
				local OnSaveSuccessFunction = p1.onSaveSuccess
				local TitleBackAvailable = p1.titleBackAvailable
				task.spawn(function()
					-- upvalues: SaveEditProfileImageModule (upval), config (copy), UseStateResult2 (upval), EditProfileImageAnalyticsModule (upval), p1 (upval), SavePayloadForActiveView (copy), ShowEditProfileImageToastModule (upval), EditProfileImageHelpersModule (upval), FFlagEditProfileFramesEnabled (upval), TitleBackAvailable (copy), OnSaveSuccessFunction (copy), OnCloseFunction (copy)
					local SaveEditProfileImageModuleResult = SaveEditProfileImageModule(config)
					UseStateResult2(false)
					
					if not SaveEditProfileImageModuleResult then
						EditProfileImageAnalyticsModule.logSave({
							result = "failure",
							mode = p1.mode,
							emoteAssetId = SavePayloadForActiveView.emoteAssetId,
							frameAssetId = SavePayloadForActiveView.profileFrameAssetId,
							isPlusSubscriber = p1.isPlusSubscriber
						})
						ShowEditProfileImageToastModule.showSaveFailureToast(p1.dispatch)
						
						return
					end
					EditProfileImageAnalyticsModule.logSave({
						result = "success",
						mode = p1.mode,
						emoteAssetId = SavePayloadForActiveView.emoteAssetId,
						frameAssetId = SavePayloadForActiveView.profileFrameAssetId,
						isPlusSubscriber = p1.isPlusSubscriber
					})
					local ResolvePostSaveActionResult = EditProfileImageHelpersModule.resolvePostSaveAction({
						framesFeatureEnabled = FFlagEditProfileFramesEnabled,
						hasOnTitleBack = TitleBackAvailable,
						hasOnSaveSuccess = OnSaveSuccessFunction ~= nil
					})
					
					if ResolvePostSaveActionResult == "returnToCombined" then
						p1.onReturnToCombined()
						
						return
					end
					if ResolvePostSaveActionResult == "exitWithSuccessCallback" and OnSaveSuccessFunction then
						OnSaveSuccessFunction()
						
						return
					else
						OnCloseFunction()
					end
				end)
				
				return
			end
		end, {
			UseStateResult, p1.mode, p1.activeView, p1.titleBackAvailable,
			p1.selectedEmoteId, p1.savedEmoteAssetId, p1.selectedFrameId, p1.showFrames,
			p1.distanceScale, p1.yRotDeg, p1.cutoutFieldOfViewDeg, p1.localUserId,
			p1.isPlusSubscriber, p1.dispatch, p1.onReturnToCombined, p1.onClose,
			p1.onSaveSuccess
		}),
		resetTransientState = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end, {})
	}
end