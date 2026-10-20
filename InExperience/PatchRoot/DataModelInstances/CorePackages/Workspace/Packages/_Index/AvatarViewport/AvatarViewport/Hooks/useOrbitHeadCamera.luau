local TweenService = game:GetService("TweenService")
local AvatarViewport = script:FindFirstAncestor("AvatarViewport")
local ReactModule = require(AvatarViewport.Parent.React)
local ComputeOrbitHeadCFrameModule = require(AvatarViewport.Camera.computeOrbitHeadCFrame)
local ConstantsModule = require(AvatarViewport.Constants)
local _ = require(AvatarViewport.Types)

return function(p1)
	-- upvalues: ReactModule (copy), ComputeOrbitHeadCFrameModule (copy), TweenService (copy), ConstantsModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(p1.config)
	UseRefResult1.current = p1.config
	local UseRefResult2 = ReactModule.useRef(p1.frameCloseupPreviewCamera)
	UseRefResult2.current = p1.frameCloseupPreviewCamera
	local UseRefResult3 = ReactModule.useRef(p1.yRotDeg)
	local UseRefResult4 = ReactModule.useRef(p1.distanceScale)
	local YRotDegRef = p1.yRotDegRef or UseRefResult3
	local DistanceScaleRef = p1.distanceScaleRef or UseRefResult4
	
	if not p1.yRotDegRef then
		UseRefResult3.current = p1.yRotDeg
	end
	if not p1.distanceScaleRef then
		UseRefResult4.current = p1.distanceScale
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Current then
			Current:Cancel()
			UseRefResult.current = nil
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), UseRefResult1 (copy), UseRefResult2 (copy), YRotDegRef (copy), DistanceScaleRef (copy), ComputeOrbitHeadCFrameModule (upval), UseResult (copy), TweenService (upval), ConstantsModule (upval), UseRefResult (copy)
		local Current = p1.cameraRef.current
		local Model = p1.model
		
		if not Current or not Model then return end
		local Current1 = UseRefResult1.current
		local CurrentFunction = UseRefResult2.current
		local CurrentResult = if CurrentFunction then CurrentFunction({
			character = Model,
			yRotDeg = YRotDegRef.current,
			distanceScale = DistanceScaleRef.current,
			config = Current1
		}) else ComputeOrbitHeadCFrameModule({
			character = Model,
			yRotDeg = YRotDegRef.current,
			distanceScale = DistanceScaleRef.current,
			baseDistance = Current1.baseDistance,
			fieldOfViewDeg = Current1.fieldOfViewDeg,
			fieldOfViewForDistanceScaleDeg = Current1.fieldOfViewForDistanceScaleDeg,
			focusPartName = Current1.focusPartName,
			layout = Current1.layout
		})
		
		if not CurrentResult then return end
		Current.FieldOfView = Current1.fieldOfViewDeg
		
		if p2 and p2.tween then
			UseResult()
			local Tween = TweenService:Create(Current, ConstantsModule.EmoteCameraTweenInfo, { CFrame = CurrentResult })
			UseRefResult.current = Tween
			Tween.Completed:Connect(function()
				-- upvalues: UseRefResult (upval), Tween (copy)
				if UseRefResult.current == Tween then
					UseRefResult.current = nil
				end
			end)
			Tween:Play()
			
			return
		else
			UseResult()
			Current.CFrame = CurrentResult
		end
	end, { p1.model, UseResult, p1.cameraRef })
	ReactModule.useEffect(function()
		-- upvalues: UseResult1 (copy)
		UseResult1()
	end, {
		p1.yRotDeg, p1.distanceScale, p1.model, p1.config.fieldOfViewDeg,
		p1.config.fieldOfViewForDistanceScaleDeg, p1.config.layout.viewportHeight,
		p1.config.layout.cutoutTopOffset, p1.config.layout.cutoutDiameter, UseResult1
	})
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		return function()
			-- upvalues: UseResult (upval)
			UseResult()
		end
	end, { UseResult })
	
	return { frameCamera = UseResult1 }
end