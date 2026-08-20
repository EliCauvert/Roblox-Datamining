local avatarViewport = script:FindFirstAncestor("AvatarViewport")
local reactModule = require(avatarViewport.Parent.React)
local constantsModule = require(avatarViewport.Constants)
local _ = require(avatarViewport.Types)
local useAvatarViewportSceneModule = require(avatarViewport.Hooks.useAvatarViewportScene)
local useViewportModelLoaderModule = require(avatarViewport.Hooks.useViewportModelLoader)
local useViewportOrbitInteractionsModule = require(avatarViewport.Hooks.useViewportOrbitInteractions)
local useViewportGamepadOrbitModule = require(avatarViewport.Hooks.useViewportGamepadOrbit)
local useOrbitHeadCameraModule = require(avatarViewport.Hooks.useOrbitHeadCamera)

return function(p0) --[[ line: 52 | named "useRotatableOrbitViewport" ]]
	-- upvalues: reactModule (ref), useAvatarViewportSceneModule (ref), useViewportOrbitInteractionsModule (ref), useViewportGamepadOrbitModule (ref), useViewportModelLoaderModule (ref), constantsModule (ref), useOrbitHeadCameraModule (ref)
	local var8 = reactModule.useRef(function(_) --[[ line: 54 ]] end)
	local var9 = useAvatarViewportSceneModule()
	local var10 = useViewportOrbitInteractionsModule({
		initialYRotDeg = p0.committedYRotDeg or p0.initialYRotDeg,
		distanceScale = p0.distanceScale,
		onYRotDegChanged = p0.onYRotDegChanged,
		onDistanceScaleChanged = p0.onDistanceScaleChanged,
		onCameraUpdateRequested = function() --[[ line: 63 ]]
			-- upvalues: var8 (ref)
			var8.current()
		end
	})
	useViewportGamepadOrbitModule({
		applyYawDelta = var10.applyYawDelta,
		applyZoomGesture = var10.applyZoomGesture,
		onOrbitEnded = var10.commitYaw,
		actionName = p0.gamepadActionName
	})
	local var11 = useViewportModelLoaderModule({
		modelSource = p0.modelSource,
		worldModelRef = var9.worldModel,
		onModelReady = function(p1) --[[ line: 78 ]]
			-- upvalues: var10 (ref), p0 (ref)
			var10.resetYaw(p0.committedYRotDeg or p0.initialYRotDeg)
			
			if p0.onModelReady then
				p0.onModelReady(p1)
			end
		end
	})
	local var12 = useOrbitHeadCameraModule({
		cameraRef = var9.camera,
		model = var11.model,
		yRotDeg = var10.yRotDeg,
		yRotDegRef = var10.yRotDegRef,
		distanceScale = p0.distanceScale,
		distanceScaleRef = var10.distanceScaleRef,
		config = reactModule.useMemo(function() --[[ line: 87 ]]
			-- upvalues: p0 (ref), constantsModule (copy)
			return {
				baseDistance = p0.baseDistance or constantsModule.DefaultOrbitBaseDistance,
				fieldOfViewDeg = p0.fieldOfViewDeg or constantsModule.DefaultOrbitFieldOfViewDeg,
				fieldOfViewForDistanceScaleDeg = p0.fieldOfViewForDistanceScaleDeg,
				focusPartName = p0.focusPartName or constantsModule.DefaultFocusPartName,
				layout = p0.layout
			}
		end, {
			p0.baseDistance, p0.fieldOfViewDeg, p0.fieldOfViewForDistanceScaleDeg,
			p0.focusPartName, p0.layout, p0.layout.viewportHeight,
			p0.layout.cutoutTopOffset, p0.layout.cutoutDiameter
		}),
		frameCloseupPreviewCamera = p0.frameCloseupPreviewCamera
	})
	var8.current = var12.frameCamera
	reactModule.useEffect(function() --[[ line: 120 ]]
		-- upvalues: p0 (ref), var10 (ref)
		if p0.committedYRotDeg ~= nil then
			var10.resetYaw(p0.committedYRotDeg)
		end
	end, { p0.committedYRotDeg, var10.resetYaw })
	
	return {
		refs = var9,
		inputHandlers = var10.inputHandlers,
		modelLoader = {
			isLoading = var11.isLoading,
			isReady = var11.isReady,
			model = var11.model
		},
		frameCamera = var12.frameCamera,
		resetYaw = var10.resetYaw
	}
end