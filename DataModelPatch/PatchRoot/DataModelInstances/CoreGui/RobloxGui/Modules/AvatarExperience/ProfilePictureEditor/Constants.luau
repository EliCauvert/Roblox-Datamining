local PPEThumbnailTypeModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.ProfilePictureEditor.PPEThumbnailType)

return {
	CameraFieldOfViewDeg = 70,
	ViewportHalfWidthUnits = 1.25,
	PeekabooBorderWidthPix = 6,
	AnalyticsTag = "LuaProfilePictureEditor",
	SliderMax = 20,
	YRotMaxDeg = 60,
	ZoomMinScale = 0.5,
	PPEConfigFetchStatusKey = "avatar.ppe.fetchStatus",
	FullscreenTweenTimeSeconds = 0.25,
	CircleCutoutAsset = "rbxasset://textures/ui/AvatarExperience/CircleCutoutLargeNoBorder.png",
	PPEConfigWriteStatusKeys = {
		[PPEThumbnailTypeModule.Closeup] = "avatar.ppe.closeup.writeStatus",
		[PPEThumbnailTypeModule.FullBody] = "avatar.ppe.fullBody.writeStatus"
	}
}