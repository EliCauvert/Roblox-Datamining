local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local motionModule = require(parent.Motion)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local t = {
	[Enum.KeyCode.Left] = Vector2.new(-1, 0),
	[Enum.KeyCode.Right] = Vector2.new(1, 0),
	[Enum.KeyCode.Up] = Vector2.new(0, -1),
	[Enum.KeyCode.Down] = Vector2.new(0, 1)
}

local function _(p1, p2, p3)
	return math.max(p2.Magnitude / 2, 0.01) / math.sin(math.atan(math.tan(math.rad(p1) / 2) * math.min(1, if p3.X > 0 and p3.Y > 0 then p3.X / p3.Y else 1)))
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), foundationModule (ref), reactModule (ref), motionModule (ref), t (ref), view (ref)
	local var1 = useTokens()
	local reducedMotion = foundationModule.Hooks.usePreferences().reducedMotion
	local var2 = reactModule.useRef(nil)
	local var3, var4 = motionModule.useMotion({ size = UDim2.fromScale(1, 1) })
	local var5 = reactModule.useRef(var4)
	var5.current = var4
	local var6, var7 = reactModule.useState(nil)
	local var8, var9 = reactModule.useState(0)
	local model = p1.model
	local fieldOfView = p1.fieldOfView or 30
	local cameraDistanceScale = p1.cameraDistanceScale or 1
	local var10 = p1.isInteractive == true
	local var11 = reactModule.useRef({
		yaw = 0.349065850399,
		pitch = -0.261799387799,
		zoom = 1,
		center = Vector3.new(0, 0, 0),
		baseDistance = 0,
		camera = nil,
		sourceModel = nil,
		dragInput = nil,
		lastDragPosition = nil
	})
	local var12 = reactModule.useCallback(function()
		-- upvalues: var11 (ref)
		local current = var11.current
		local camera = current.camera
		
		if camera == nil then
			return
		end
		camera.CFrame = CFrame.lookAt(current.center + CFrame.fromEulerAnglesYXZ(current.pitch, current.yaw, 0) * Vector3.new(0, 0, current.baseDistance * current.zoom), current.center)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), model (ref), var7 (ref), var9 (ref), fieldOfView (ref), var11 (ref), cameraDistanceScale (ref), var12 (ref), var10 (ref)
		local current = var2.current
		
		if current == nil or model == nil then
			return nil
		end
		local var13 = model:Clone()
		
		if var13 == nil then
			var7(model)
			local var14 = model:GetPropertyChangedSignal("Archivable"):Connect(function()
				-- upvalues: var9 (copy)
				var9(function(p2)
					return p2 + 1
				end)
			end)
			
			return function()
				-- upvalues: var14 (ref)
				var14:Disconnect()
			end
		end
		var7(nil)
		local worldModel = Instance.new("WorldModel")
		worldModel.Parent = current
		var13.Parent = worldModel
		local camera = Instance.new("Camera")
		camera.CameraType = Enum.CameraType.Scriptable
		camera.FieldOfView = fieldOfView
		camera.Parent = worldModel
		current.CurrentCamera = camera
		local current_1 = var11.current
		current_1.camera = camera
		
		if current_1.sourceModel ~= model then
			current_1.yaw = 0.349065850399
			current_1.pitch = -0.261799387799
			current_1.zoom = 1
			current_1.sourceModel = model
		end
		local boundingBox, boundingBox_1 = var13:GetBoundingBox()
		var13:TranslateBy(-boundingBox.Position)
		current_1.center = Vector3.new(0, 0, 0)
		local var15 = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: current_1 (ref), fieldOfView (copy), boundingBox_1 (write), current (ref), cameraDistanceScale (copy), var12 (copy)
			local absoluteSize = current.AbsoluteSize
			current_1.baseDistance = math.max(boundingBox_1.Magnitude / 2, 0.01) / math.sin(math.atan(math.tan(math.rad(fieldOfView) / 2) * math.min(1, if absoluteSize.X > 0 and absoluteSize.Y > 0 then absoluteSize.X / absoluteSize.Y else 1))) * cameraDistanceScale
			var12()
		end)
		local absoluteSize = current.AbsoluteSize
		current_1.baseDistance = math.max(boundingBox_1.Magnitude / 2, 0.01) / math.sin(math.atan(math.tan(math.rad(fieldOfView) / 2) * math.min(1, if absoluteSize.X > 0 and absoluteSize.Y > 0 then absoluteSize.X / absoluteSize.Y else 1))) * cameraDistanceScale
		var12()
		local var16 = false
		local var17 = nil
		local t = {}
		
		local function refreshPreview()
			-- upvalues: var17 (write), var16 (write), model (copy), var13 (write), worldModel (ref), boundingBox_1 (write), current_1 (ref), fieldOfView (copy), current (ref), cameraDistanceScale (copy), var12 (copy)
			var17 = nil
			
			if var16 then return end
			local var18 = model:Clone()
			
			if var18 == nil then return end
			local boundingBox, boundingBox_2 = var18:GetBoundingBox()
			var18:TranslateBy(-boundingBox.Position)
			var13:Destroy()
			var13 = var18
			var13.Parent = worldModel
			boundingBox_1 = boundingBox_2
			local absoluteSize = current.AbsoluteSize
			current_1.baseDistance = math.max(boundingBox_1.Magnitude / 2, 0.01) / math.sin(math.atan(math.tan(math.rad(fieldOfView) / 2) * math.min(1, if absoluteSize.X > 0 and absoluteSize.Y > 0 then absoluteSize.X / absoluteSize.Y else 1))) * cameraDistanceScale
			var12()
		end
		
		absoluteSize = function()
			-- upvalues: var16 (write), var17 (write), refreshPreview (ref)
			if var16 or var17 ~= nil then
				return
			end
			var17 = task.defer(refreshPreview)
		end
		
		local function _(p2)
			-- upvalues: t (ref), absoluteSize (ref)
			if t[p2] == nil then
				t[p2] = p2.Changed:Connect(absoluteSize)
			end
		end
		
		local descendantAddedConnection = nil
		local descendantRemovingConnection = nil
		
		if var10 then
			if t[model] == nil then
				t[model] = model.Changed:Connect(absoluteSize)
			end
			for i, v in model:GetDescendants() do
				if t[v] == nil then
					t[v] = v.Changed:Connect(absoluteSize)
				end
			end
			descendantAddedConnection = model.DescendantAdded:Connect(function(p2)
				-- upvalues: t (ref), absoluteSize (ref), var16 (write), var17 (write), refreshPreview (ref)
				if t[p2] == nil then
					t[p2] = p2.Changed:Connect(absoluteSize)
				end
				if not var16 then
					if var17 ~= nil then return end
					var17 = task.defer(refreshPreview)
				end
			end)
			descendantRemovingConnection = model.DescendantRemoving:Connect(function(p2)
				-- upvalues: t (ref), var16 (write), var17 (write), refreshPreview (ref)
				local var18 = t[p2]
				
				if var18 ~= nil then
					var18:Disconnect()
					t[p2] = nil
				end
				if not var16 then
					if var17 ~= nil then return end
					var17 = task.defer(refreshPreview)
				end
			end)
		end
		return function()
			-- upvalues: var16 (write), var17 (write), descendantAddedConnection (write), descendantRemovingConnection (write), t (ref), var15 (ref), current_1 (ref), worldModel (ref)
			var16 = true
			
			if var17 ~= nil then
				task.cancel(var17)
			end
			if descendantAddedConnection then
				descendantAddedConnection:Disconnect()
			end
			if descendantRemovingConnection then
				descendantRemovingConnection:Disconnect()
			end
			for i, v in t do
				v:Disconnect()
			end
			var15:Disconnect()
			current_1.camera = nil
			current_1.dragInput = nil
			current_1.lastDragPosition = nil
			worldModel:Destroy()
		end
	end, {
		model or false, fieldOfView, cameraDistanceScale, var10, var12, var8
	})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var10 (ref), var5 (ref), motionModule (copy), reducedMotion (ref)
		local current = var2.current
		
		if current == nil or not var10 then
			return nil
		end
		local parent = current.Parent
		local var18 = false
		
		local function resizeViewport()
			-- upvalues: parent (ref), var5 (copy), motionModule (copy), var18 (write), reducedMotion (copy)
			local absoluteSize = parent.AbsoluteSize
			
			if absoluteSize.X <= 0 or absoluteSize.Y <= 0 then return end
			var5.current(motionModule.createState({ size = UDim2.fromOffset(absoluteSize.X, absoluteSize.Y) }, {
				default = motionModule.transition({
					duration = if var18 and not reducedMotion then 0.25 else 0,
					easingStyle = Enum.EasingStyle.Quad
				})
			}))
			var18 = true
		end
		
		resizeViewport()
		local var19 = parent:GetPropertyChangedSignal("AbsoluteSize"):Connect(resizeViewport)
		
		return function()
			-- upvalues: var19 (ref)
			var19:Disconnect()
		end
	end, { var10, reducedMotion })
	local var18 = reactModule.useCallback(function(_, p2)
		-- upvalues: var11 (ref), var10 (ref)
		local current = var11.current
		
		if not var10 or current.dragInput ~= nil then return end
		if p2.UserInputType == Enum.UserInputType.MouseButton1 or p2.UserInputType == Enum.UserInputType.Touch then
			current.dragInput = p2
			current.lastDragPosition = p2.Position
		end
	end, { var10 })
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var11 (ref), var12 (ref), t (copy)
		if var10 then
			local userInputService = game:GetService("UserInputService")
			local inputChangedConnection = userInputService.InputChanged:Connect(function(p2)
				-- upvalues: var11 (copy), var12 (copy)
				local current = var11.current
				local dragInput = current.dragInput
				
				if dragInput == nil or current.lastDragPosition == nil then return end
				if (dragInput.UserInputType == Enum.UserInputType.MouseButton1 and p2.UserInputType == Enum.UserInputType.MouseMovement) or p2 == dragInput then
					local var19 = p2.Position - current.lastDragPosition
					current.lastDragPosition = p2.Position
					current.yaw -= var19.X * 0.01
					current.pitch = math.clamp(current.pitch - var19.Y * 0.01, -1.483529864195, 1.483529864195)
					var12()
					
					return
				end
			end)
			local inputEndedConnection = userInputService.InputEnded:Connect(function(p2)
				-- upvalues: var11 (copy)
				if var11.current.dragInput == p2 then
					var11.current.dragInput = nil
					var11.current.lastDragPosition = nil
				end
			end)
			local windowFocusReleasedConnection = userInputService.WindowFocusReleased:Connect(function()
				-- upvalues: var11 (copy)
				var11.current.dragInput = nil
				var11.current.lastDragPosition = nil
			end)
			local inputBeganConnection = userInputService.InputBegan:Connect(function(p2, p3)
				-- upvalues: t (copy), var11 (copy), var12 (copy)
				local keyCode = t[p2.KeyCode]
				
				if p3 or keyCode == nil then
					return
				end
				local current = var11.current
				current.yaw -= keyCode.X * 0.261799387799
				current.pitch = math.clamp(current.pitch - keyCode.Y * 0.261799387799, -1.483529864195, 1.483529864195)
				var12()
			end)
			
			return function()
				-- upvalues: inputBeganConnection (ref), inputChangedConnection (ref), inputEndedConnection (ref), windowFocusReleasedConnection (ref), var11 (copy)
				inputBeganConnection:Disconnect()
				inputChangedConnection:Disconnect()
				inputEndedConnection:Disconnect()
				windowFocusReleasedConnection:Disconnect()
				var11.current.dragInput = nil
				var11.current.lastDragPosition = nil
			end
		end
		return nil
	end, { var10, var12 })
	
	return reactModule.createElement(view, {
		Size = p1.size or UDim2.fromScale(1, 1),
		backgroundStyle = if p1.backgroundTransparency ~= nil then nil else {
			Color3 = var1.Color.Surface.Surface_200.Color3,
			Transparency = p1.backgroundTransparency
		},
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId
	}, {
		Unavailable = if model == nil or var6 ~= model then nil else reactModule.createElement(foundationModule.Text, {
			tag = "size-full padding-small text-body-small text-wrap text-align-x-center content-default",
			Text = p1.unavailableText,
			testId = if p1.testId ~= nil then nil else `{p1.testId}.Unavailable`
		}),
		Viewport = reactModule.createElement("ViewportFrame", {
			Visible = if model ~= nil then var6 ~= model else true,
			Size = if var10 then var3.size else UDim2.fromScale(1, 1),
			BackgroundColor3 = var1.Color.Surface.Surface_200.Color3,
			BackgroundTransparency = p1.backgroundTransparency or var1.Color.Surface.Surface_200.Transparency,
			BorderSizePixel = 0,
			Active = var10,
			ref = var2,
			[reactModule.Tag] = if p1.testId ~= nil then nil else `data-testid={p1.testId}.Viewport`,
			[reactModule.Event.InputBegan] = var18,
			[reactModule.Event.InputChanged] = reactModule.useCallback(function(_, p2)
				-- upvalues: var11 (ref), var10 (ref), var12 (ref)
				local current = var11.current
				
				if var10 and current.dragInput == nil and p2.UserInputType == Enum.UserInputType.MouseWheel then
					current.zoom = math.clamp(current.zoom - p2.Position.Z * 0.12, 0.4, 2.5)
					var12()
				end
			end, { var10, var12 })
		})
	})
end)