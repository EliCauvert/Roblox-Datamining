local SharedFlagsModule = require(script.Parent.Parent.SharedFlags)
local FFlagLuaAppForceVrAppPanelWidthRollout = SharedFlagsModule.FFlagLuaAppForceVrAppPanelWidthRollout
local v1: number = if SharedFlagsModule.GetFFlagEnableVRChartsTab() then 1 else 0.8
local FIntMaquettesAppPanelDistanceMultiplierPercentageRatio = SharedFlagsModule.GetFIntMaquettesAppPanelDistanceMultiplierPercentage() / 100

return {
	ToastPosition = vector.create(0, 3.299999952316284, -2.799999952316284),
	ToastCurvature = 50,
	DefaultCameraPosition = vector.create(0, 4.800000190734863, 0),
	ROUNDED_CORNER_RADIUS = 15,
	PositionLockedPanelName = "PositionLocked",
	MainScreenResolution = if FFlagLuaAppForceVrAppPanelWidthRollout then Vector2.new(1120, 900) else Vector2.new(1600, 900),
	MainScreenSize = if FFlagLuaAppForceVrAppPanelWidthRollout then Vector2.new(3.15, 2.7) * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio else Vector2.new(4.5, 2.7) * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio,
	MainScreenCurvature = if FFlagLuaAppForceVrAppPanelWidthRollout then 0 else 70,
	MainScreenPosition = Vector3.new(0, 4.8, -4 * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio),
	AppSystemBarPosition = if FFlagLuaAppForceVrAppPanelWidthRollout then Vector3.new(-2.35 * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio * 0.7 + -0.4, 4.8, -3.15 * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio + -1.28) else Vector3.new(-2.35 * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio, 4.8, -3.15 * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio),
	AppSystemBarSize = if FFlagLuaAppForceVrAppPanelWidthRollout then Vector2.new(0.495, v1 * 2.7) * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio else Vector2.new(0.495, 2.7) * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio,
	AppSystemBarResolution = if FFlagLuaAppForceVrAppPanelWidthRollout then Vector2.new(64, v1 * 360) else Vector2.new(64, 360),
	CentralOverlayPosition = Vector3.new(0, 4.8, -3.5 * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio),
	ToastSize = Vector2.new(2.5, 1.5),
	ToastResolution = Vector2.new(650, 382),
	FTUX = { UniverseId = "4510252459", PlaceId = "12887241816" }
}