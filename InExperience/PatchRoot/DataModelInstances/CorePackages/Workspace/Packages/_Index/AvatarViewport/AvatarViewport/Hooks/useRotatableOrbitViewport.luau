local AvatarViewport = script:FindFirstAncestor("AvatarViewport")
local ReactModule = require(AvatarViewport.Parent.React)
local ConstantsModule = require(AvatarViewport.Constants)
local _ = require(AvatarViewport.Types)
local UseAvatarViewportSceneModule = require(AvatarViewport.Hooks.useAvatarViewportScene)
local UseViewportModelLoaderModule = require(AvatarViewport.Hooks.useViewportModelLoader)
local UseViewportOrbitInteractionsModule = require(AvatarViewport.Hooks.useViewportOrbitInteractions)
local UseViewportGamepadOrbitModule = require(AvatarViewport.Hooks.useViewportGamepadOrbit)
local UseOrbitHeadCameraModule = require(AvatarViewport.Hooks.useOrbitHeadCamera)

return function(p1)
	-- upvalues: ReactModule (copy), UseAvatarViewportSceneModule (copy), UseViewportOrbitInteractionsModule (copy), UseViewportGamepadOrbitModule (copy), UseViewportModelLoaderModule (copy), ConstantsModule (copy), UseOrbitHeadCameraModule (copy)
	local UseRefResult = ReactModule.useRef(function(_) end)
	local UseAvatarViewportSceneModuleResult = UseAvatarViewportSceneModule()
	local UseViewportOrbitInteractionsModuleResult = UseViewportOrbitInteractionsModule({
		initialYRotDeg = p1.committedYRotDeg or p1.initialYRotDeg,
		distanceScale = p1.distanceScale,
		onYRotDegChanged = p1.onYRotDegChanged,
		onDistanceScaleChanged = p1.onDistanceScaleChanged,
		onCameraUpdateRequested = function()
			-- upvalues: UseRefResult (copy)
			UseRefResult.current()
		end
	})
	UseViewportGamepadOrbitModule({
		applyYawDelta = UseViewportOrbitInteractionsModuleResult.applyYawDelta,
		applyZoomGesture = UseViewportOrbitInteractionsModuleResult.applyZoomGesture,
		onOrbitEnded = UseViewportOrbitInteractionsModuleResult.commitYaw,
		actionName = p1.gamepadActionName
	})
	local UseViewportModelLoaderModuleResult = UseViewportModelLoaderModule({
		modelSource = p1.modelSource,
		worldModelRef = UseAvatarViewportSceneModuleResult.worldModel,
		onModelReady = function(p2)
			-- upvalues: UseViewportOrbitInteractionsModuleResult (copy), p1 (copy)
			UseViewportOrbitInteractionsModuleResult.resetYaw(p1.committedYRotDeg or p1.initialYRotDeg)
			
			if p1.onModelReady then
				p1.onModelReady(p2)
			end
		end
	})
	local UseOrbitHeadCameraModuleResult = UseOrbitHeadCameraModule({
		cameraRef = UseAvatarViewportSceneModuleResult.camera,
		model = UseViewportModelLoaderModuleResult.model,
		yRotDeg = UseViewportOrbitInteractionsModuleResult.yRotDeg,
		yRotDegRef = UseViewportOrbitInteractionsModuleResult.yRotDegRef,
		distanceScale = p1.distanceScale,
		distanceScaleRef = UseViewportOrbitInteractionsModuleResult.distanceScaleRef,
		config = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), ConstantsModule (upval)
			return {
				baseDistance = p1.baseDistance or ConstantsModule.DefaultOrbitBaseDistance,
				fieldOfViewDeg = p1.fieldOfViewDeg or ConstantsModule.DefaultOrbitFieldOfViewDeg,
				fieldOfViewForDistanceScaleDeg = p1.fieldOfViewForDistanceScaleDeg,
				focusPartName = p1.focusPartName or ConstantsModule.DefaultFocusPartName,
				layout = p1.layout
			}
		end, {
			p1.baseDistance, p1.fieldOfViewDeg, p1.fieldOfViewForDistanceScaleDeg,
			p1.focusPartName, p1.layout, p1.layout.viewportHeight,
			p1.layout.cutoutTopOffset, p1.layout.cutoutDiameter
		}),
		frameCloseupPreviewCamera = p1.frameCloseupPreviewCamera
	})
	UseRefResult.current = UseOrbitHeadCameraModuleResult.frameCamera
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseViewportOrbitInteractionsModuleResult (copy)
		if p1.committedYRotDeg ~= nil then
			UseViewportOrbitInteractionsModuleResult.resetYaw(p1.committedYRotDeg)
		end
	end, {
		p1.committedYRotDeg,
		UseViewportOrbitInteractionsModuleResult.resetYaw
	})
	
	return {
		refs = UseAvatarViewportSceneModuleResult,
		inputHandlers = UseViewportOrbitInteractionsModuleResult.inputHandlers,
		modelLoader = {
			isLoading = UseViewportModelLoaderModuleResult.isLoading,
			isReady = UseViewportModelLoaderModuleResult.isReady,
			model = UseViewportModelLoaderModuleResult.model
		},
		frameCamera = UseOrbitHeadCameraModuleResult.frameCamera,
		resetYaw = UseViewportOrbitInteractionsModuleResult.resetYaw
	}
end