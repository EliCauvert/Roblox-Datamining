local RunService = game:GetService("RunService")
local ModelViewport = script:FindFirstAncestor("ModelViewport")
local ReactModule = require(ModelViewport.Parent.React)
local ConstantsModule = require(ModelViewport.Constants)
local RotationModeModule = require(ModelViewport.Enums.RotationMode)
local _ = require(ModelViewport.Types)
local CreateCameraControllerModule = require(ModelViewport.createCameraController)
local UseModelViewportSceneModule = require(ModelViewport.Hooks.useModelViewportScene)
local UseViewportGamepadInputModule = require(ModelViewport.Hooks.useViewportGamepadInput)
local UseViewportPointerInputModule = require(ModelViewport.Hooks.useViewportPointerInput)
local t = {}
local t1 = {}

local function applyCameraToScene(SceneRefs, UseStateResult)
	local Current = SceneRefs.camera.current
	local Current1 = SceneRefs.viewportFrame.current
	
	if not Current or not Current1 then return end
	local AbsoluteSize = Current1.AbsoluteSize
	
	if AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 then return end
	local CameraCFrame = UseStateResult.getCameraCFrame(AbsoluteSize.X / AbsoluteSize.Y)
	
	if CameraCFrame then
		Current.FieldOfView = UseStateResult.getFieldOfViewDeg()
		Current.CFrame = CameraCFrame
	end
end

return function(p1)
	-- upvalues: t (copy), t1 (copy), UseModelViewportSceneModule (copy), ReactModule (copy), applyCameraToScene (copy), RunService (copy), CreateCameraControllerModule (copy), RotationModeModule (copy), ConstantsModule (copy), UseViewportPointerInputModule (copy), UseViewportGamepadInputModule (copy)
	local Framing = p1.framing or t
	local Interaction = p1.interaction or t1
	local UseModelViewportSceneModuleResult = UseModelViewportSceneModule()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(Framing)
	UseRefResult1.current = Framing
	local UseRefResult2 = ReactModule.useRef(p1.onInteractionEnded)
	UseRefResult2.current = p1.onInteractionEnded
	local UseStateResult = ReactModule.useState(function()
		-- upvalues: applyCameraToScene (upval), UseModelViewportSceneModuleResult (copy), UseRefResult (copy), RunService (upval), CreateCameraControllerModule (upval), Framing (copy), Interaction (copy)
		local v1 = nil
		v1 = CreateCameraControllerModule({
			framing = Framing,
			interaction = Interaction,
			onChanged = function()
				-- upvalues: applyCameraToScene (upval), UseModelViewportSceneModuleResult (upval), v1 (ref), UseRefResult (upval), RunService (upval)
				applyCameraToScene(UseModelViewportSceneModuleResult, v1)
				local Current = UseRefResult.current
				
				if v1.isTransitioning() then
					if not Current then
						UseRefResult.current = RunService.RenderStepped:Connect(v1.step)
						
						return
					end
				elseif Current then
					Current:Disconnect()
					UseRefResult.current = nil
				end
			end
		})
		
		return v1
	end)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult (copy), Framing (copy), Interaction (copy)
		UseStateResult.setOptions(Framing, Interaction)
	end, { UseStateResult, Framing, Interaction })
	local UseRefResult3 = ReactModule.useRef(nil)
	ReactModule.useLayoutEffect(function()
		-- upvalues: Framing (copy), UseRefResult3 (copy), UseStateResult (copy), p1 (copy), UseRefResult1 (copy)
		local Focus = Framing.focus
		
		if Focus == UseRefResult3.current then
			UseStateResult.setModel(p1.model, true)
			
			return
		else
			UseRefResult3.current = Focus
			UseStateResult.setModel(p1.model, false)
			UseStateResult.focusOn(Focus, UseRefResult1.current.transition)
		end
	end, { UseStateResult, p1.model, Framing.focus })
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseRefResult6 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseModelViewportSceneModuleResult (copy), UseRefResult4 (copy), UseRefResult5 (copy), UseRefResult6 (copy), applyCameraToScene (upval), UseStateResult (copy)
		local Current = UseModelViewportSceneModuleResult.viewportFrame.current
		local Current1 = UseModelViewportSceneModuleResult.camera.current
		
		if Current == UseRefResult4.current and Current1 == UseRefResult5.current then return end
		UseRefResult5.current = Current1
		
		if Current ~= UseRefResult4.current then
			UseRefResult4.current = Current
			
			if UseRefResult6.current then
				UseRefResult6.current:Disconnect()
				UseRefResult6.current = nil
			end
			if Current then
				UseRefResult6.current = Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
					-- upvalues: applyCameraToScene (upval), UseModelViewportSceneModuleResult (upval), UseStateResult (upval)
					applyCameraToScene(UseModelViewportSceneModuleResult, UseStateResult)
				end)
			end
		end
		applyCameraToScene(UseModelViewportSceneModuleResult, UseStateResult)
	end, { UseModelViewportSceneModuleResult, UseStateResult })
	
	if UseModelViewportSceneModuleResult.onSceneChanged then
		UseModelViewportSceneModuleResult.onSceneChanged.current = UseResult
	end
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult6 (copy), UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult6 (upval), UseRefResult (upval)
			if UseRefResult6.current then
				UseRefResult6.current:Disconnect()
				UseRefResult6.current = nil
			end
			if UseRefResult.current then
				UseRefResult.current:Disconnect()
				UseRefResult.current = nil
			end
		end
	end, {})
	local IsEnabled = Interaction.enabled ~= false
	local Rotation = Interaction.rotation or RotationModeModule.Yaw
	local IsNotRotationMatch = Rotation ~= RotationModeModule.None
	local HasZoom = Interaction.zoom ~= nil
	local HasPan = Interaction.pan ~= nil
	local IsNotRotationMatch1: boolean = IsEnabled and (IsNotRotationMatch or (HasZoom or HasPan))
	local DegreesPerPixel = Interaction.degreesPerPixel or ConstantsModule.DefaultDegreesPerPixel
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), UseRefResult2 (copy)
		local State = UseStateResult.getState()
		local CurrentFunction: (any) -> () = UseRefResult2.current
		
		if State and CurrentFunction then
			CurrentFunction(State)
		end
	end, { UseStateResult })
	local UseViewportPointerInputModuleResult = UseViewportPointerInputModule({
		enabled = IsNotRotationMatch1,
		canRotate = IsNotRotationMatch,
		canZoom = HasZoom,
		canPan = HasPan,
		onRotate = function(Vector)
			-- upvalues: UseStateResult (copy), DegreesPerPixel (copy)
			UseStateResult.rotate(-Vector.X * DegreesPerPixel, Vector.Y * DegreesPerPixel)
		end,
		onZoom = UseStateResult.zoomBySteps,
		onPan = function(p2)
			-- upvalues: UseModelViewportSceneModuleResult (copy), UseStateResult (copy)
			local Current = UseModelViewportSceneModuleResult.viewportFrame.current
			
			if Current then
				UseStateResult.panByPixels(p2, Current.AbsoluteSize)
			end
		end,
		onEnded = UseResult1
	})
	UseViewportGamepadInputModule({
		enabled = IsEnabled and (IsNotRotationMatch or HasZoom),
		config = Interaction.gamepad,
		rotation = Rotation,
		canZoom = HasZoom,
		onRotate = UseStateResult.rotate,
		onZoom = UseStateResult.zoomBySteps,
		onEnded = UseResult1
	})
	
	return {
		sceneRefs = UseModelViewportSceneModuleResult,
		inputHandlers = if IsNotRotationMatch1 then UseViewportPointerInputModuleResult else nil,
		reset = ReactModule.useCallback(function()
			-- upvalues: UseStateResult (copy), UseRefResult1 (copy)
			UseStateResult.reset(UseRefResult1.current.transition)
		end, { UseStateResult }),
		refit = UseStateResult.refit,
		focusOn = ReactModule.useCallback(function(p2, p3)
			-- upvalues: UseStateResult (copy)
			UseStateResult.focusOn(p2, p3)
		end, { UseStateResult })
	}
end