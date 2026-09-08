local tweenService = game:GetService("TweenService")
local avatarViewport = script:FindFirstAncestor("AvatarViewport")
local reactModule = require(avatarViewport.Parent.React)
local computeOrbitHeadCFrameModule = require(avatarViewport.Camera.computeOrbitHeadCFrame)
local constantsModule = require(avatarViewport.Constants)
local _ = require(avatarViewport.Types)

return function(p1)
	-- upvalues: reactModule (ref), computeOrbitHeadCFrameModule (ref), tweenService (ref), constantsModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(p1.config)
	var2.current = p1.config
	local var3 = reactModule.useRef(p1.frameCloseupPreviewCamera)
	var3.current = p1.frameCloseupPreviewCamera
	local var4 = reactModule.useRef(p1.yRotDeg)
	local var5 = reactModule.useRef(p1.distanceScale)
	local yRotDegRef = p1.yRotDegRef or var4
	local distanceScaleRef = p1.distanceScaleRef or var5
	
	if not p1.yRotDegRef then
		var4.current = p1.yRotDeg
	end
	if not p1.distanceScaleRef then
		var5.current = p1.distanceScale
	end
	local var6 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		local current = var1.current
		
		if current then
			current:Cancel()
			var1.current = nil
		end
	end, {})
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), var2 (ref), var3 (ref), yRotDegRef (ref), distanceScaleRef (ref), computeOrbitHeadCFrameModule (copy), var6 (ref), tweenService (copy), constantsModule (copy), var1 (ref)
		local current = p1.cameraRef.current
		local model = p1.model
		
		if not current or not model then return end
		local current_1 = var2.current
		local _ = nil
		local current_2 = var3.current
		local var8 = if current_2 then current_2({
			character = model,
			yRotDeg = yRotDegRef.current,
			distanceScale = distanceScaleRef.current,
			config = current_1
		}) else computeOrbitHeadCFrameModule({
			character = model,
			yRotDeg = yRotDegRef.current,
			distanceScale = distanceScaleRef.current,
			baseDistance = current_1.baseDistance,
			fieldOfViewDeg = current_1.fieldOfViewDeg,
			fieldOfViewForDistanceScaleDeg = current_1.fieldOfViewForDistanceScaleDeg,
			focusPartName = current_1.focusPartName,
			layout = current_1.layout
		})
		
		if not var8 then return end
		current.FieldOfView = current_1.fieldOfViewDeg
		
		if p2 and p2.tween then
			var6()
			local var9 = tweenService:Create(current, constantsModule.EmoteCameraTweenInfo, { CFrame = var8 })
			var1.current = var9
			var9.Completed:Connect(function()
				-- upvalues: var1 (copy), var9 (ref)
				if var1.current == var9 then
					var1.current = nil
				end
			end)
			var9:Play()
			
			return
		end
		var6()
		current.CFrame = var8
	end, { p1.model, var6, p1.cameraRef })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref)
		var7()
	end, {
		p1.yRotDeg, p1.distanceScale, p1.model, p1.config.fieldOfViewDeg,
		p1.config.fieldOfViewForDistanceScaleDeg, p1.config.layout.viewportHeight,
		p1.config.layout.cutoutTopOffset, p1.config.layout.cutoutDiameter, var7
	})
	reactModule.useEffect(function()
		-- upvalues: var6 (ref)
		return function()
			-- upvalues: var6 (copy)
			var6()
		end
	end, { var6 })
	
	return { frameCamera = var7 }
end