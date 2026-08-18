local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local profileRefreshSignal = require(avatarExperienceProfilePictureEditor.Parent.ProfilePlatformCommon).Signals.ProfileRefreshSignal
local userAvatarConfigurationsCacheModule = require(avatarExperienceProfilePictureEditor.Api.userAvatarConfigurationsCache)
local saveCloseupAndFullBody = require(avatarExperienceProfilePictureEditor.Shared.savePPEConfig).saveCloseupAndFullBody

return function(p0) --[[ line: 25 | named "saveEditProfileImage" ]]
	-- upvalues: saveCloseupAndFullBody (ref), userAvatarConfigurationsCacheModule (ref), profileRefreshSignal (ref)
	local ok, status = pcall(function() --[[ line: 26 ]]
		-- upvalues: saveCloseupAndFullBody (copy), p0 (ref)
		return saveCloseupAndFullBody({
			emoteAssetId = p0.emoteAssetId,
			cameraDistanceScale = p0.cameraDistanceScale,
			cameraYRotDeg = p0.cameraYRotDeg,
			fieldOfViewDeg = p0.fieldOfViewDeg,
			profileFrameAssetId = p0.profileFrameAssetId
		})
	end)
	
	if not ok or not status.ok then
		return false
	elseif p0.localUserId then
		userAvatarConfigurationsCacheModule.invalidate(p0.localUserId)
	end
	profileRefreshSignal.notifyProfileRefresh()
	
	return true
end