local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local fFlagEditProfileFramesEnabled = require(parent.SharedFlags).FFlagEditProfileFramesEnabled
local editProfileImageHelpersModule = require(avatarExperienceProfilePictureEditor.Utils.editProfileImageHelpers)
local saveEditProfileImageModule = require(avatarExperienceProfilePictureEditor.Utils.saveEditProfileImage)
local showEditProfileImageToastModule = require(avatarExperienceProfilePictureEditor.Utils.showEditProfileImageToast)
local editProfileImageAnalyticsModule = require(avatarExperienceProfilePictureEditor.Analytics.EditProfileImageAnalytics)
local _ = require(avatarExperienceProfilePictureEditor.Common.Enums)

return function(p1)
	-- upvalues: reactModule (ref), editProfileImageHelpersModule (ref), saveEditProfileImageModule (ref), editProfileImageAnalyticsModule (ref), showEditProfileImageToastModule (ref), fFlagEditProfileFramesEnabled (ref)
	local var1, var2 = reactModule.useState(false)
	
	return {
		isSaving = var1,
		onSave = reactModule.useCallback(function()
			-- upvalues: var1 (ref), var2 (ref), editProfileImageHelpersModule (copy), p1 (ref), saveEditProfileImageModule (copy), editProfileImageAnalyticsModule (copy), showEditProfileImageToastModule (copy), fFlagEditProfileFramesEnabled (copy)
			if var1 then
				return
			end
			var2(true)
			local var3 = editProfileImageHelpersModule.buildSavePayloadForActiveView(p1.activeView, {
				selectedEmoteId = p1.selectedEmoteId,
				savedEmoteAssetId = p1.savedEmoteAssetId,
				selectedFrameId = if p1.showFrames then p1.selectedFrameId else nil,
				showFrames = p1.showFrames
			})
			local t = {
				emoteAssetId = var3.emoteAssetId,
				profileFrameAssetId = var3.profileFrameAssetId,
				cameraDistanceScale = p1.distanceScale,
				cameraYRotDeg = p1.yRotDeg,
				fieldOfViewDeg = p1.cutoutFieldOfViewDeg,
				localUserId = p1.localUserId
			}
			local onClose = p1.onClose
			local onSaveSuccess = p1.onSaveSuccess
			local titleBackAvailable = p1.titleBackAvailable
			task.spawn(function()
				-- upvalues: saveEditProfileImageModule (copy), t (ref), var2 (copy), editProfileImageAnalyticsModule (copy), p1 (copy), var3 (ref), showEditProfileImageToastModule (copy), editProfileImageHelpersModule (copy), fFlagEditProfileFramesEnabled (copy), titleBackAvailable (ref), onSaveSuccess (ref), onClose (ref)
				local var4 = saveEditProfileImageModule(t)
				var2(false)
				
				if not var4 then
					editProfileImageAnalyticsModule.logSave({
						result = "failure",
						mode = p1.mode,
						emoteAssetId = var3.emoteAssetId,
						frameAssetId = var3.profileFrameAssetId,
						isPlusSubscriber = p1.isPlusSubscriber
					})
					showEditProfileImageToastModule.showSaveFailureToast(p1.dispatch)
					
					return
				end
				editProfileImageAnalyticsModule.logSave({
					result = "success",
					mode = p1.mode,
					emoteAssetId = var3.emoteAssetId,
					frameAssetId = var3.profileFrameAssetId,
					isPlusSubscriber = p1.isPlusSubscriber
				})
				local var5 = editProfileImageHelpersModule.resolvePostSaveAction({
					framesFeatureEnabled = fFlagEditProfileFramesEnabled,
					hasOnTitleBack = titleBackAvailable,
					hasOnSaveSuccess = onSaveSuccess ~= nil
				})
				
				if var5 == "returnToCombined" then
					p1.onReturnToCombined()
					
					return
				elseif var5 == "exitWithSuccessCallback" and onSaveSuccess then
					onSaveSuccess()
					
					return
				end
				onClose()
			end)
		end, {
			var1, p1.mode, p1.activeView, p1.titleBackAvailable, p1.selectedEmoteId,
			p1.savedEmoteAssetId, p1.selectedFrameId, p1.showFrames, p1.distanceScale,
			p1.yRotDeg, p1.cutoutFieldOfViewDeg, p1.localUserId, p1.isPlusSubscriber,
			p1.dispatch, p1.onReturnToCombined, p1.onClose, p1.onSaveSuccess
		}),
		resetTransientState = reactModule.useCallback(function()
			-- upvalues: var2 (ref)
			var2(false)
		end, {})
	}
end