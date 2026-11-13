local SharedFlagsModule = require(script.Parent.Parent.SharedFlags)
local GetFIntMaquettesAppPanelDistanceMultiplierPercentageFunction = SharedFlagsModule.GetFIntMaquettesAppPanelDistanceMultiplierPercentage
local v1: number = if SharedFlagsModule.GetFFlagEnableVRChartsTab() then 1 else 0.8
local FIntMaquettesAppPanelDistanceMultiplierPercentageRatio = GetFIntMaquettesAppPanelDistanceMultiplierPercentageFunction() / 100

return {
	MainScreenCurvature = 0,
	ToastPosition = vector.create(0, 3.299999952316284, -2.799999952316284),
	ToastCurvature = 50,
	DefaultCameraPosition = vector.create(0, 4.800000190734863, 0),
	ROUNDED_CORNER_RADIUS = 15,
	PositionLockedPanelName = "PositionLocked",
	MainScreenResolution = Vector2.new(1120, 900),
	MainScreenSize = Vector2.new(3.15, 2.7) * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio,
	MainScreenPosition = Vector3.new(0, 4.8, -4 * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio),
	AppSystemBarPosition = Vector3.new(-2.35 * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio * 0.7 + -0.4, 4.8, -3.15 * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio + -1.28),
	AppSystemBarSize = Vector2.new(0.495, v1 * 2.7) * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio,
	AppSystemBarResolution = Vector2.new(64, v1 * 360),
	CentralOverlayPosition = Vector3.new(0, 4.8, -3.5 * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio),
	ToastSize = Vector2.new(2.5, 1.5),
	ToastResolution = Vector2.new(650, 382),
	FTUX = { UniverseId = "4510252459", PlaceId = "12887241816" }
}