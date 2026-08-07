local sharedFlagsModule = require(script.Parent.Parent.SharedFlags)
local getFIntMaquettesAppPanelDistanceMultiplierPercentage = sharedFlagsModule.GetFIntMaquettesAppPanelDistanceMultiplierPercentage
local fFlagLuaAppForceVrAppPanelWidthRollout = sharedFlagsModule.FFlagLuaAppForceVrAppPanelWidthRollout
local var1 = if sharedFlagsModule.GetFFlagEnableVRChartsTab() then 1 else 0.8
local var2 = getFIntMaquettesAppPanelDistanceMultiplierPercentage() / 100

return {
	ToastPosition = Vector3.new(0, 3.299999952316, -2.799999952316),
	ToastCurvature = 50,
	DefaultCameraPosition = Vector3.new(0, 4.800000190735, 0),
	ROUNDED_CORNER_RADIUS = 15,
	PositionLockedPanelName = "PositionLocked",
	MainScreenResolution = if fFlagLuaAppForceVrAppPanelWidthRollout then Vector2.new(1120, 900) else Vector2.new(1600, 900),
	MainScreenSize = if fFlagLuaAppForceVrAppPanelWidthRollout then Vector2.new(3.15, 2.7) * var2 else Vector2.new(4.5, 2.7) * var2,
	MainScreenCurvature = if fFlagLuaAppForceVrAppPanelWidthRollout then 0 else 70,
	MainScreenPosition = Vector3.new(0, 4.8, -4 * var2),
	AppSystemBarPosition = if fFlagLuaAppForceVrAppPanelWidthRollout then Vector3.new(-2.35 * var2 * 0.7 + -0.4, 4.8, -3.15 * var2 + -1.28) else Vector3.new(-2.35 * var2, 4.8, -3.15 * var2),
	AppSystemBarSize = if fFlagLuaAppForceVrAppPanelWidthRollout then Vector2.new(0.495, var1 * 2.7) * var2 else Vector2.new(0.495, 2.7) * var2,
	AppSystemBarResolution = if fFlagLuaAppForceVrAppPanelWidthRollout then Vector2.new(64, var1 * 360) else Vector2.new(64, 360),
	CentralOverlayPosition = Vector3.new(0, 4.8, -3.5 * var2),
	ToastSize = Vector2.new(2.5, 1.5),
	ToastResolution = Vector2.new(650, 382),
	FTUX = { UniverseId = "4510252459", PlaceId = "12887241816" }
}