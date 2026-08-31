local avatarViewport = script:FindFirstAncestor("AvatarViewport")
local reactModule = require(avatarViewport.Parent.React)
local constantsModule = require(avatarViewport.Constants)
local _ = require(avatarViewport.Types)
local useAvatarViewportSceneModule = require(avatarViewport.Hooks.useAvatarViewportScene)
local useViewportModelLoaderModule = require(avatarViewport.Hooks.useViewportModelLoader)
local useViewportOrbitInteractionsModule = require(avatarViewport.Hooks.useViewportOrbitInteractions)
local useViewportGamepadOrbitModule = require(avatarViewport.Hooks.useViewportGamepadOrbit)
local useOrbitHeadCameraModule = require(avatarViewport.Hooks.useOrbitHeadCamera)

return function(p1)
	-- upvalues: reactModule (ref), useAvatarViewportSceneModule (ref), useViewportOrbitInteractionsModule (ref), useViewportGamepadOrbitModule (ref), useViewportModelLoaderModule (ref), constantsModule (ref), useOrbitHeadCameraModule (ref)
	local var1 = reactModule.useRef(function(_) end)
	local var2 = useAvatarViewportSceneModule()
	local var3 = useViewportOrbitInteractionsModule({
		initialYRotDeg = p1.committedYRotDeg or p1.initialYRotDeg,
		distanceScale = p1.distanceScale,
		onYRotDegChanged = p1.onYRotDegChanged,
		onDistanceScaleChanged = p1.onDistanceScaleChanged,
		onCameraUpdateRequested = function()
			-- upvalues: var1 (ref)
			var1.current()
		end
	})
	useViewportGamepadOrbitModule({
		applyYawDelta = var3.applyYawDelta,
		applyZoomGesture = var3.applyZoomGesture,
		onOrbitEnded = var3.commitYaw,
		actionName = p1.gamepadActionName
	})
	local var4 = useViewportModelLoaderModule({
		modelSource = p1.modelSource,
		worldModelRef = var2.worldModel,
		onModelReady = function(p2)
			-- upvalues: var3 (ref), p1 (ref)
			var3.resetYaw(p1.committedYRotDeg or p1.initialYRotDeg)
			
			if p1.onModelReady then
				p1.onModelReady(p2)
			end
		end
	})
	local var5 = useOrbitHeadCameraModule({
		cameraRef = var2.camera,
		model = var4.model,
		yRotDeg = var3.yRotDeg,
		yRotDegRef = var3.yRotDegRef,
		distanceScale = p1.distanceScale,
		distanceScaleRef = var3.distanceScaleRef,
		config = reactModule.useMemo(function()
			-- upvalues: p1 (ref), constantsModule (copy)
			return {
				baseDistance = p1.baseDistance or constantsModule.DefaultOrbitBaseDistance,
				fieldOfViewDeg = p1.fieldOfViewDeg or constantsModule.DefaultOrbitFieldOfViewDeg,
				fieldOfViewForDistanceScaleDeg = p1.fieldOfViewForDistanceScaleDeg,
				focusPartName = p1.focusPartName or constantsModule.DefaultFocusPartName,
				layout = p1.layout
			}
		end, {
			p1.baseDistance, p1.fieldOfViewDeg, p1.fieldOfViewForDistanceScaleDeg,
			p1.focusPartName, p1.layout, p1.layout.viewportHeight,
			p1.layout.cutoutTopOffset, p1.layout.cutoutDiameter
		}),
		frameCloseupPreviewCamera = p1.frameCloseupPreviewCamera
	})
	var1.current = var5.frameCamera
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref)
		if p1.committedYRotDeg ~= nil then
			var3.resetYaw(p1.committedYRotDeg)
		end
	end, { p1.committedYRotDeg, var3.resetYaw })
	
	return {
		refs = var2,
		inputHandlers = var3.inputHandlers,
		modelLoader = {
			isLoading = var4.isLoading,
			isReady = var4.isReady,
			model = var4.model
		},
		frameCamera = var5.frameCamera,
		resetYaw = var3.resetYaw
	}
end