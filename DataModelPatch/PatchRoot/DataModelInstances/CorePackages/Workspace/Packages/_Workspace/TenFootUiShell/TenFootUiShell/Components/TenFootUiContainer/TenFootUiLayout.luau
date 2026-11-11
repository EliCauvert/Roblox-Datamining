local TenFootUiShell = script:FindFirstAncestor("TenFootUiShell")
local Parent = TenFootUiShell.Parent
local ReactModule = require(Parent.React)
local SceneManagementModule = require(Parent.SceneManagement)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local UseFocusNavigableSurfaceRegistryConnectionFunction = FocusNavigationUtilsModule.useFocusNavigableSurfaceRegistryConnection
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseRootFocusNavigationBindingsModule = require(TenFootUiShell.Hooks.useRootFocusNavigationBindings)
local ConstantsModule = require(TenFootUiShell.ReactNavigationExtend.Views.Constants)
local SurfaceGuiWithAdornee = SceneManagementModule.SurfaceGuiWithAdornee
local UseCameraFacingGeometryFunction = SceneManagementModule.useCameraFacingGeometry

local function _(p1)
	-- upvalues: ConstantsModule (copy)
	return function(Vector): Vector3
		-- upvalues: p1 (copy), ConstantsModule (upval)
		return (Vector3.new(Vector.X, Vector.Y * p1, ConstantsModule.ADORNEE_DEPTH))
	end
end

local v1 = 1

local function v11(Vector): Vector3
	-- upvalues: v1 (copy), ConstantsModule (copy)
	return (Vector3.new(Vector.X, Vector.Y * v1, ConstantsModule.ADORNEE_DEPTH))
end

local TOPBARHEIGHTRATIO = ConstantsModule.TOP_BAR_HEIGHT_RATIO

local function v13(Vector): Vector3
	-- upvalues: TOPBARHEIGHTRATIO (copy), ConstantsModule (copy)
	return (Vector3.new(Vector.X, Vector.Y * TOPBARHEIGHTRATIO, ConstantsModule.ADORNEE_DEPTH))
end

local CONTROLLERBARHEIGHTRATIO = ConstantsModule.CONTROLLER_BAR_HEIGHT_RATIO

local function v15(Vector): Vector3
	-- upvalues: CONTROLLERBARHEIGHTRATIO (copy), ConstantsModule (copy)
	return (Vector3.new(Vector.X, Vector.Y * CONTROLLERBARHEIGHTRATIO, ConstantsModule.ADORNEE_DEPTH))
end

local function getGlobalNavCFrame(p1): CFrame
	-- upvalues: ConstantsModule (copy)
	local Y: number = p1.viewportFillDimensions.Y
	
	return p1.cFrame * CFrame.new(0, Y / 2 - Y * ConstantsModule.TOP_BAR_HEIGHT_RATIO / 2, 0)
end

local function getControllerBarCFrame(p1): CFrame
	-- upvalues: ConstantsModule (copy)
	local Y: number = p1.viewportFillDimensions.Y
	
	return p1.cFrame * CFrame.new(0, Y * ConstantsModule.CONTROLLER_BAR_HEIGHT_RATIO / 2 - Y / 2, 0)
end

local function RootViewSurface(p1)
	-- upvalues: UseCameraFacingGeometryFunction (copy), ConstantsModule (copy), ReactModule (copy), SurfaceGuiWithAdornee (copy), v11 (copy)
	local UseCameraFacingGeometryResult = UseCameraFacingGeometryFunction(ConstantsModule.DEFAULT_SCREEN_DISTANCE_TO_CAMERA)
	
	return ReactModule.createElement(SurfaceGuiWithAdornee, {
		name = "RootViewSurface",
		isVisible = true,
		adorneeSize = UseCameraFacingGeometryResult.viewportFillDimensions:map(v11),
		adorneeCFrame = UseCameraFacingGeometryResult.cFrame,
		adorneeParent = p1.adorneeParent,
		canvasSize = ConstantsModule.FULLSCREEN_CANVAS_SIZE,
		surfaceGuiParent = p1.surfaceGuiParent
	}, p1.content)
end

local function GlobalNavBarSurface(p1)
	-- upvalues: ReactModule (copy), UseRootFocusNavigationBindingsModule (copy), UseCameraFacingGeometryFunction (copy), ConstantsModule (copy), v13 (copy), getGlobalNavCFrame (copy), UseFocusNavigableSurfaceRegistryConnectionFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), SurfaceGuiWithAdornee (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRootFocusNavigationBindingsModuleResult = UseRootFocusNavigationBindingsModule(UseStateResult2)
	local UseCameraFacingGeometryResult = UseCameraFacingGeometryFunction(ConstantsModule.DEFAULT_SCREEN_DISTANCE_TO_CAMERA)
	local MapResult = UseCameraFacingGeometryResult.viewportFillDimensions:map(v13)
	local MapResult1 = ReactModule.joinBindings({
		viewportFillDimensions = UseCameraFacingGeometryResult.viewportFillDimensions,
		cFrame = UseCameraFacingGeometryResult.cFrame
	}):map(getGlobalNavCFrame)
	UseFocusNavigableSurfaceRegistryConnectionFunction(UseStateResult, FocusNavigableSurfaceIdentifierEnum.NavBar)
	
	return ReactModule.createElement(SurfaceGuiWithAdornee, {
		isVisible = true,
		name = "GlobalNavBarSurface",
		adorneeSize = MapResult,
		adorneeCFrame = MapResult1,
		canvasSize = ConstantsModule.TOP_BAR_CANVAS_SIZE,
		adorneeParent = p1.adorneeParent,
		surfaceGuiParent = p1.surfaceGuiParent
	}, (ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = UseRootFocusNavigationBindingsModuleResult,
		Position = UDim2.fromOffset(0, 0),
		Size = UDim2.fromScale(1, 1)
	}, p1.content)))
end

local function ControllerBarSurface(p1)
	-- upvalues: UseCameraFacingGeometryFunction (copy), ConstantsModule (copy), v15 (copy), ReactModule (copy), getControllerBarCFrame (copy), SurfaceGuiWithAdornee (copy)
	local UseCameraFacingGeometryResult = UseCameraFacingGeometryFunction(ConstantsModule.DEFAULT_SCREEN_DISTANCE_TO_CAMERA - 1)
	
	return ReactModule.createElement(SurfaceGuiWithAdornee, {
		isVisible = true,
		name = "ControllerBarSurface",
		adorneeSize = UseCameraFacingGeometryResult.viewportFillDimensions:map(v15),
		adorneeCFrame = ReactModule.joinBindings({
			viewportFillDimensions = UseCameraFacingGeometryResult.viewportFillDimensions,
			cFrame = UseCameraFacingGeometryResult.cFrame
		}):map(getControllerBarCFrame),
		canvasSize = ConstantsModule.CONTROLLER_BAR_CANVAS_SIZE,
		adorneeParent = p1.adorneeParent,
		surfaceGuiParent = p1.surfaceGuiParent
	}, p1.content)
end

return function(p1)
	-- upvalues: ReactModule (copy), RootViewSurface (copy), GlobalNavBarSurface (copy), ControllerBarSurface (copy)
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		RootViewSlot = if p1.rootViewSlot then ReactModule.createElement(RootViewSurface, {
			adorneeParent = p1.adorneeParent,
			surfaceGuiParent = p1.surfaceGuiParent,
			content = p1.rootViewSlot
		}) else nil,
		GlobalNavBarSlot = if p1.globalNavSlot then ReactModule.createElement(GlobalNavBarSurface, {
			adorneeParent = p1.adorneeParent,
			surfaceGuiParent = p1.surfaceGuiParent,
			content = p1.globalNavSlot
		}) else nil,
		ControllerBarSlot = if p1.controllerBarSlot then ReactModule.createElement(ControllerBarSurface, {
			adorneeParent = p1.adorneeParent,
			surfaceGuiParent = p1.surfaceGuiParent,
			content = p1.controllerBarSlot
		}) else nil
	})
end