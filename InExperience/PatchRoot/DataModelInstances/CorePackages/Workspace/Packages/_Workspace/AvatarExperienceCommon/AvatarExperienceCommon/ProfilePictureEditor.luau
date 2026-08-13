local parseUserAvatarConfigurationsV4Module = require(script.parseUserAvatarConfigurationsV4)

return {
	Constants = require(script.Constants),
	parseCloseupCameraConfig = require(script.parseCloseupCameraConfig),
	parseProfileFrameAssetId = require(script.parseProfileFrameAssetId),
	parseUserAvatarConfigurationsV4 = parseUserAvatarConfigurationsV4Module.parseUserAvatarConfigurationsV4,
	parseProfileFrameAssetIdFromV4 = parseUserAvatarConfigurationsV4Module.parseProfileFrameAssetIdFromV4,
	savePPEConfig = require(script.savePPEConfig),
	getEmoteRecommendations = require(script.getEmoteRecommendations)
}