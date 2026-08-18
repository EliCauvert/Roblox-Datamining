local tweenService = game:GetService("TweenService")
local avatarViewport = script:FindFirstAncestor("AvatarViewport")
local reactModule = require(avatarViewport.Parent.React)
local computeOrbitHeadCFrameModule = require(avatarViewport.Camera.computeOrbitHeadCFrame)
local constantsModule = require(avatarViewport.Constants)
local _ = require(avatarViewport.Types)

return function(p0) --[[ line: 36 | named "useOrbitHeadCamera" ]]
	-- upvalues: reactModule (ref), computeOrbitHeadCFrameModule (ref), tweenService (ref), constantsModule (ref)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(p0.config)
	var6.current = p0.config
	local var7 = reactModule.useRef(p0.frameCloseupPreviewCamera)
	var7.current = p0.frameCloseupPreviewCamera
	local var8 = reactModule.useRef(p0.yRotDeg)
	local var9 = reactModule.useRef(p0.distanceScale)
	local yRotDegRef = p0.yRotDegRef or var8
	local distanceScaleRef = p0.distanceScaleRef or var9
	
	if not p0.yRotDegRef then
		var8.current = p0.yRotDeg
	end
	if not p0.distanceScaleRef then
		var9.current = p0.distanceScale
	end
	local var12 = reactModule.useCallback(function() --[[ line: 56 ]]
		-- upvalues: var5 (ref)
		local current = var5.current
		
		if current then
			current:Cancel()
			var5.current = nil
		end
	end, {})
	local var13 = reactModule.useCallback(function(p1) --[[ line: 64 ]]
		-- upvalues: p0 (ref), var6 (ref), var7 (ref), yRotDegRef (ref), distanceScaleRef (ref), computeOrbitHeadCFrameModule (copy), var12 (ref), tweenService (copy), constantsModule (copy), var5 (ref)
		local current = p0.cameraRef.current
		local model = p0.model
		
		if not current or not model then return end
		local current_1 = var6.current
		local _ = nil
		local current_2 = var7.current
		local var14 = if current_2 then current_2({
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
		
		if not var14 then return end
		current.FieldOfView = current_1.fieldOfViewDeg
		
		if p1 and p1.tween then
			var12()
			local var15 = tweenService:Create(current, constantsModule.EmoteCameraTweenInfo, { CFrame = var14 })
			var5.current = var15
			var15.Completed:Connect(function() --[[ line: 107 ]]
				-- upvalues: var5 (copy), var15 (ref)
				if var5.current == var15 then
					var5.current = nil
				end
			end)
			var15:Play()
			
			return
		end
		var12()
		current.CFrame = var14
	end, { p0.model, var12, p0.cameraRef })
	reactModule.useEffect(function() --[[ line: 122 ]]
		-- upvalues: var13 (ref)
		var13()
	end, {
		p0.yRotDeg, p0.distanceScale, p0.model, p0.config.fieldOfViewDeg,
		p0.config.fieldOfViewForDistanceScaleDeg, p0.config.layout.viewportHeight,
		p0.config.layout.cutoutTopOffset, p0.config.layout.cutoutDiameter, var13
	})
	reactModule.useEffect(function() --[[ line: 138 ]]
		-- upvalues: var12 (ref)
		return function() --[[ line: 139 ]]
			-- upvalues: var12 (copy)
			var12()
		end
	end, { var12 })
	
	return { frameCamera = var13 }
end