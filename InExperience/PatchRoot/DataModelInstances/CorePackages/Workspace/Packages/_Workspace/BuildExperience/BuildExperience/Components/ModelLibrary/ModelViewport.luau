local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

local function _(p1, p2)
	return math.max(p2.X, p2.Y, p2.Z) / 2 * (1 / math.tan(math.rad(p1) / 2)) + p2.Z / 2
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref)
	local var1 = useTokens()
	local var2 = reactModule.useRef(nil)
	local model = p1.model
	local fieldOfView = p1.fieldOfView or 30
	local cameraDistanceScale = p1.cameraDistanceScale or 1
	local var3 = p1.autoRotate == true
	local var4 = p1.isInteractive == true
	local var5 = reactModule.useRef({
		yaw = 0.349065850399,
		pitch = -0.261799387799,
		zoom = 1,
		center = Vector3.new(0, 0, 0),
		baseDistance = 0,
		camera = nil,
		dragInput = nil,
		lastDragPosition = nil
	})
	local var6 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		local current = var5.current
		local camera = current.camera
		
		if camera == nil then
			return
		end
		camera.CFrame = CFrame.lookAt(current.center + CFrame.fromEulerAnglesYXZ(current.pitch, current.yaw, 0) * Vector3.new(0, 0, current.baseDistance * current.zoom), current.center)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var5 (ref), var6 (ref)
		local controllerRef = p1.controllerRef
		
		if controllerRef == nil then
			return function() end
		end
		controllerRef.current = {
			rotateLeft = function()
				-- upvalues: var5 (copy), var6 (copy)
				var5.current.yaw -= 0.785398163397
				var6()
			end,
			rotateRight = function()
				-- upvalues: var5 (copy), var6 (copy)
				var5.current.yaw += 0.785398163397
				var6()
			end,
			reset = function()
				-- upvalues: var5 (copy), var6 (copy)
				var5.current.yaw = 0.349065850399
				var5.current.pitch = -0.261799387799
				var5.current.zoom = 1
				var6()
			end
		}
		
		return function()
			-- upvalues: controllerRef (ref)
			controllerRef.current = nil
		end
	end, { p1.controllerRef or false, var6 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), model (ref), fieldOfView (ref), var5 (ref), cameraDistanceScale (ref), var6 (ref)
		local current = var2.current
		
		if current == nil or model == nil then
			return nil
		end
		local worldModel = Instance.new("WorldModel")
		worldModel.Parent = current
		local var7 = model:Clone()
		var7.Parent = worldModel
		local camera = Instance.new("Camera")
		camera.CameraType = Enum.CameraType.Scriptable
		camera.FieldOfView = fieldOfView
		camera.Parent = worldModel
		current.CurrentCamera = camera
		local current_1 = var5.current
		current_1.camera = camera
		current_1.yaw = 0.349065850399
		current_1.pitch = -0.261799387799
		current_1.zoom = 1
		local boundingBox, boundingBox_1 = var7:GetBoundingBox()
		var7:TranslateBy(-boundingBox.Position)
		current_1.center = Vector3.new(0, 0, 0)
		current_1.baseDistance = (math.max(boundingBox_1.X, boundingBox_1.Y, boundingBox_1.Z) / 2 * (1 / math.tan(math.rad(fieldOfView) / 2)) + boundingBox_1.Z / 2) * cameraDistanceScale
		var6()
		
		return function()
			-- upvalues: current_1 (ref), worldModel (ref)
			current_1.camera = nil
			worldModel:Destroy()
		end
	end, { model or false, fieldOfView, cameraDistanceScale, var6 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var5 (ref), var6 (ref)
		if var3 then
			local renderSteppedConnection = game:GetService("RunService").RenderStepped:Connect(function(p2)
				-- upvalues: var5 (copy), var6 (copy)
				local current = var5.current
				
				if current.dragInput == nil and current.camera ~= nil then
					current.yaw += 0.35 * p2
					var6()
					
					return
				end
			end)
			
			return function()
				-- upvalues: renderSteppedConnection (ref)
				renderSteppedConnection:Disconnect()
			end
		end
		return nil
	end, { var3, var6 })
	
	return reactModule.createElement(view, {
		Size = p1.size or UDim2.fromScale(1, 1),
		backgroundStyle = if p1.backgroundTransparency ~= nil then nil else {
			Color3 = var1.Color.Surface.Surface_200.Color3,
			Transparency = p1.backgroundTransparency
		},
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId
	}, {
		Viewport = reactModule.createElement("ViewportFrame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = var1.Color.Surface.Surface_200.Color3,
			BackgroundTransparency = p1.backgroundTransparency or var1.Color.Surface.Surface_200.Transparency,
			BorderSizePixel = 0,
			Active = var4,
			ref = var2,
			[reactModule.Tag] = if p1.testId ~= nil then nil else `data-testid={p1.testId}.Viewport`,
			[reactModule.Event.InputBegan] = reactModule.useCallback(function(_, p2)
				-- upvalues: var4 (ref), var5 (ref)
				if not var4 then return end
				if p2.UserInputType == Enum.UserInputType.MouseButton1 or p2.UserInputType == Enum.UserInputType.Touch then
					local current = var5.current
					current.dragInput = p2
					current.lastDragPosition = p2.Position
				end
			end, { var4 }),
			[reactModule.Event.InputChanged] = reactModule.useCallback(function(_, p2)
				-- upvalues: var4 (ref), var5 (ref), var6 (ref)
				if not var4 then return end
				local current = var5.current
				
				if current.dragInput == nil then
					if p2.UserInputType == Enum.UserInputType.MouseWheel then
						current.zoom = math.clamp(current.zoom - p2.Position.Z * 0.12, 0.4, 2.5)
						var6()
					end
					return
				elseif p2 == current.dragInput and current.lastDragPosition ~= nil then
					local var7 = p2.Position - current.lastDragPosition
					current.lastDragPosition = p2.Position
					current.yaw -= var7.X * 0.01
					current.pitch = math.clamp(current.pitch - var7.Y * 0.01, -1.483529864195, 1.483529864195)
					var6()
					
					return
				end
			end, { var6, var4 }),
			[reactModule.Event.InputEnded] = reactModule.useCallback(function(_, p2)
				-- upvalues: var5 (ref)
				local current = var5.current
				
				if current.dragInput == p2 then
					current.dragInput = nil
					current.lastDragPosition = nil
				end
			end, {})
		})
	})
end)