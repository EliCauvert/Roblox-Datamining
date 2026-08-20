local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local fFlagEditProfileFramesEnabled = require(parent.SharedFlags).FFlagEditProfileFramesEnabled
local editProfileImageHelpersModule = require(avatarExperienceProfilePictureEditor.Utils.editProfileImageHelpers)
local saveEditProfileImageModule = require(avatarExperienceProfilePictureEditor.Utils.saveEditProfileImage)
local showEditProfileImageToastModule = require(avatarExperienceProfilePictureEditor.Utils.showEditProfileImageToast)
local editProfileImageAnalyticsModule = require(avatarExperienceProfilePictureEditor.Analytics.EditProfileImageAnalytics)
local _ = require(avatarExperienceProfilePictureEditor.Common.Enums)

return function(p0) --[[ line: 41 | named "useEditProfileImageSave" ]]
	-- upvalues: reactModule (ref), editProfileImageHelpersModule (ref), saveEditProfileImageModule (ref), editProfileImageAnalyticsModule (ref), showEditProfileImageToastModule (ref), fFlagEditProfileFramesEnabled (ref)
	local var6, var7 = reactModule.useState(false)
	
	return {
		isSaving = var6,
		onSave = reactModule.useCallback(function() --[[ line: 49 ]]
			-- upvalues: var6 (ref), var7 (ref), editProfileImageHelpersModule (copy), p0 (ref), saveEditProfileImageModule (copy), editProfileImageAnalyticsModule (copy), showEditProfileImageToastModule (copy), fFlagEditProfileFramesEnabled (copy)
			if var6 then
				return
			end
			var7(true)
			local var8 = editProfileImageHelpersModule.buildSavePayloadForActiveView(p0.activeView, {
				selectedEmoteId = p0.selectedEmoteId,
				savedEmoteAssetId = p0.savedEmoteAssetId,
				selectedFrameId = if p0.showFrames then p0.selectedFrameId else nil,
				showFrames = p0.showFrames
			})
			local t = {
				emoteAssetId = var8.emoteAssetId,
				profileFrameAssetId = var8.profileFrameAssetId,
				cameraDistanceScale = p0.distanceScale,
				cameraYRotDeg = p0.yRotDeg,
				fieldOfViewDeg = p0.cutoutFieldOfViewDeg,
				localUserId = p0.localUserId
			}
			local onClose = p0.onClose
			local onSaveSuccess = p0.onSaveSuccess
			local titleBackAvailable = p0.titleBackAvailable
			task.spawn(function() --[[ line: 73 ]]
				-- upvalues: saveEditProfileImageModule (copy), t (ref), var7 (copy), editProfileImageAnalyticsModule (copy), p0 (copy), var8 (ref), showEditProfileImageToastModule (copy), editProfileImageHelpersModule (copy), fFlagEditProfileFramesEnabled (copy), titleBackAvailable (ref), onSaveSuccess (ref), onClose (ref)
				local var10 = saveEditProfileImageModule(t)
				var7(false)
				
				if not var10 then
					editProfileImageAnalyticsModule.logSave({
						result = "failure",
						mode = p0.mode,
						emoteAssetId = var8.emoteAssetId,
						frameAssetId = var8.profileFrameAssetId,
						isPlusSubscriber = p0.isPlusSubscriber
					})
					showEditProfileImageToastModule.showSaveFailureToast(p0.dispatch)
					
					return
				end
				editProfileImageAnalyticsModule.logSave({
					result = "success",
					mode = p0.mode,
					emoteAssetId = var8.emoteAssetId,
					frameAssetId = var8.profileFrameAssetId,
					isPlusSubscriber = p0.isPlusSubscriber
				})
				local var11 = editProfileImageHelpersModule.resolvePostSaveAction({
					framesFeatureEnabled = fFlagEditProfileFramesEnabled,
					hasOnTitleBack = titleBackAvailable,
					hasOnSaveSuccess = onSaveSuccess ~= nil
				})
				
				if var11 == "returnToCombined" then
					p0.onReturnToCombined()
					
					return
				elseif var11 == "exitWithSuccessCallback" and onSaveSuccess then
					onSaveSuccess()
					
					return
				end
				onClose()
			end)
		end, {
			var6, p0.mode, p0.activeView, p0.titleBackAvailable, p0.selectedEmoteId,
			p0.savedEmoteAssetId, p0.selectedFrameId, p0.showFrames, p0.distanceScale,
			p0.yRotDeg, p0.cutoutFieldOfViewDeg, p0.localUserId, p0.isPlusSubscriber,
			p0.dispatch, p0.onReturnToCombined, p0.onClose, p0.onSaveSuccess
		}),
		resetTransientState = reactModule.useCallback(function() --[[ line: 44 ]]
			-- upvalues: var7 (ref)
			var7(false)
		end, {})
	}
end