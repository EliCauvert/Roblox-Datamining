local parseUserAvatarConfigurationsV4Module = require(script.Shared.parseUserAvatarConfigurationsV4)

return {
	["jest.config"] = script["jest.config"],
	["jest.main.config"] = script["jest.main.config"],
	["jest.mockDataModel.config"] = script["jest.mockDataModel.config"],
	EditProfileImage = require(script.Components.EditProfileImage.EditProfileImage),
	EditProfileImageScreen = require(script.Components.EditProfileImage.EditProfileImageScreen),
	ProfileFramePreviewThumbnail = require(script.Components.ProfileFramePreviewThumbnail.ProfileFramePreviewThumbnail),
	closeProfilePictureEditor = require(script.Utils.closeProfilePictureEditor),
	showEditProfileImageToast = require(script.Utils.showEditProfileImageToast),
	Enums = require(script.Common.Enums),
	Constants = require(script.Constants),
	useUserAvatarConfigurations = require(script.Hooks.useUserAvatarConfigurations),
	parseCloseupCameraConfig = require(script.Shared.parseCloseupCameraConfig),
	parseProfileFrameAssetId = require(script.Shared.parseProfileFrameAssetId),
	parseUserAvatarConfigurationsV4 = parseUserAvatarConfigurationsV4Module.parseUserAvatarConfigurationsV4,
	parseProfileFrameAssetIdFromV4 = parseUserAvatarConfigurationsV4Module.parseProfileFrameAssetIdFromV4,
	savePPEConfig = require(script.Shared.savePPEConfig),
	getEmoteRecommendations = require(script.Shared.getEmoteRecommendations),
	applyCloseupPreviewPose = require(script.Shared.applyCloseupPreviewPose),
	computeCutoutFieldOfViewDeg = require(script.Shared.computeCutoutFieldOfViewDeg),
	computeFocusAngleAboveCenterRad = require(script.Shared.computeFocusAngleAboveCenterRad),
	frameCloseupPreviewCamera = require(script.Shared.frameCloseupPreviewCamera)
}