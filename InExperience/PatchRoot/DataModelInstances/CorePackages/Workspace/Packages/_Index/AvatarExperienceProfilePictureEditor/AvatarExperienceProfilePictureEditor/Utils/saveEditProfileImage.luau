local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local profileRefreshSignal = require(avatarExperienceProfilePictureEditor.Parent.ProfilePlatformCommon).Signals.ProfileRefreshSignal
local userAvatarConfigurationsCacheModule = require(avatarExperienceProfilePictureEditor.Api.userAvatarConfigurationsCache)
local saveCloseupAndFullBody = require(avatarExperienceProfilePictureEditor.Shared.savePPEConfig).saveCloseupAndFullBody

return function(p1)
	-- upvalues: saveCloseupAndFullBody (ref), userAvatarConfigurationsCacheModule (ref), profileRefreshSignal (ref)
	local ok, status = pcall(function()
		-- upvalues: saveCloseupAndFullBody (copy), p1 (ref)
		return saveCloseupAndFullBody({
			emoteAssetId = p1.emoteAssetId,
			cameraDistanceScale = p1.cameraDistanceScale,
			cameraYRotDeg = p1.cameraYRotDeg,
			fieldOfViewDeg = p1.fieldOfViewDeg,
			profileFrameAssetId = p1.profileFrameAssetId
		})
	end)
	
	if not ok or not status.ok then
		return false
	elseif p1.localUserId then
		userAvatarConfigurationsCacheModule.invalidate(p1.localUserId)
	end
	profileRefreshSignal.notifyProfileRefresh()
	
	return true
end