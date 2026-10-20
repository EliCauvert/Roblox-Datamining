local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local MotionModule = require(Parent.Motion)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local config = {
	[Enum.KeyCode.Left] = Vector2.new(-1, 0),
	[Enum.KeyCode.Right] = Vector2.new(1, 0),
	[Enum.KeyCode.Up] = Vector2.new(0, -1),
	[Enum.KeyCode.Down] = Vector2.new(0, 1)
}

local function _(Degrees: number, Offset, Vector): number
	return math.max(Offset.Magnitude / 2, 0.01) / math.sin((math.atan(math.tan(math.rad(Degrees) / 2) * math.min(1, if Vector.X > 0 and Vector.Y > 0 then Vector.X / Vector.Y else 1))))
end

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensFunction (copy), FoundationModule (copy), ReactModule (copy), MotionModule (copy), config (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	local ReducedMotion = FoundationModule.Hooks.usePreferences().reducedMotion
	local UseRefResult = ReactModule.useRef(nil)
	local UseMotionResult, UseMotionResult2 = MotionModule.useMotion({ size = UDim2.fromScale(1, 1) })
	local UseRefResult1 = ReactModule.useRef(UseMotionResult2)
	UseRefResult1.current = UseMotionResult2
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local Model = Frame.model
	local FieldOfView = Frame.fieldOfView or 30
	local CameraDistanceScale = Frame.cameraDistanceScale or 1
	local IsIsInteractive = Frame.isInteractive == true
	local UseRefResult2 = ReactModule.useRef({
		yaw = 0.3490658503988659,
		pitch = -0.2617993877991494,
		zoom = 1,
		center = vector.create(0, 0, 0),
		baseDistance = 0,
		camera = nil,
		sourceModel = nil,
		dragInput = nil,
		lastDragPosition = nil
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy)
		local Current = UseRefResult2.current
		local Camera = Current.camera
		
		if Camera ~= nil then
			Camera.CFrame = CFrame.lookAt(Current.center + CFrame.fromEulerAnglesYXZ(Current.pitch, Current.yaw, 0) * Vector3.new(0, 0, Current.baseDistance * Current.zoom), Current.center)
			
			return
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), Model (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), FieldOfView (copy), UseRefResult2 (copy), CameraDistanceScale (copy), UseResult (copy), IsIsInteractive (copy)
		local Current = UseRefResult.current
		
		if Current == nil or Model == nil then
			return nil
		end
		local ModelClone = Model:Clone()
		
		if ModelClone == nil then
			UseStateResult2(Model)
			local Connection = Model:GetPropertyChangedSignal("Archivable"):Connect(function()
				-- upvalues: UseStateResult2_1 (upval)
				UseStateResult2_1(function(p1: number): number
					return p1 + 1
				end)
			end)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end
		UseStateResult2(nil)
		local WorldModel = Instance.new("WorldModel")
		WorldModel.Parent = Current
		ModelClone.Parent = WorldModel
		local Camera = Instance.new("Camera")
		Camera.CameraType = Enum.CameraType.Scriptable
		Camera.FieldOfView = FieldOfView
		Camera.Parent = WorldModel
		Current.CurrentCamera = Camera
		local Current1 = UseRefResult2.current
		Current1.camera = Camera
		
		if Current1.sourceModel ~= Model then
			Current1.yaw = 0.3490658503988659
			Current1.pitch = -0.2617993877991494
			Current1.zoom = 1
			Current1.sourceModel = Model
		end
		local BoundingCFrame, BoundingSize = ModelClone:GetBoundingBox()
		ModelClone:TranslateBy(-BoundingCFrame.Position)
		Current1.center = vector.create(0, 0, 0)
		local Connection1 = Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: Current1 (copy), FieldOfView (upval), BoundingSize (ref), Current (copy), CameraDistanceScale (upval), UseResult (upval)
			local AbsoluteSize = Current.AbsoluteSize
			Current1.baseDistance = math.max(BoundingSize.Magnitude / 2, 0.01) / math.sin((math.atan(math.tan(math.rad(FieldOfView) / 2) * math.min(1, if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 then AbsoluteSize.X / AbsoluteSize.Y else 1)))) * CameraDistanceScale
			UseResult()
		end)
		local AbsoluteSize = Current.AbsoluteSize
		Current1.baseDistance = math.max(BoundingSize.Magnitude / 2, 0.01) / math.sin((math.atan(math.tan(math.rad(FieldOfView) / 2) * math.min(1, if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 then AbsoluteSize.X / AbsoluteSize.Y else 1)))) * CameraDistanceScale
		UseResult()
		local Flag = false
		local DeferredThread = nil
		local ChangedConnections = {}
		
		local function refreshPreview()
			-- upvalues: DeferredThread (ref), Flag (ref), Model (upval), ModelClone (ref), WorldModel (copy), BoundingSize (ref), Current1 (copy), FieldOfView (upval), Current (copy), CameraDistanceScale (upval), UseResult (upval)
			DeferredThread = nil
			
			if Flag then return end
			local ModelClone1 = Model:Clone()
			
			if ModelClone1 ~= nil then
				local BoundingCFrame, BoundingSize1 = ModelClone1:GetBoundingBox()
				ModelClone1:TranslateBy(-BoundingCFrame.Position)
				ModelClone:Destroy()
				ModelClone = ModelClone1
				ModelClone.Parent = WorldModel
				BoundingSize = BoundingSize1
				local AbsoluteSize = Current.AbsoluteSize
				Current1.baseDistance = math.max(BoundingSize.Magnitude / 2, 0.01) / math.sin((math.atan(math.tan(math.rad(FieldOfView) / 2) * math.min(1, if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 then AbsoluteSize.X / AbsoluteSize.Y else 1)))) * CameraDistanceScale
				UseResult()
				
				return
			end
		end
		
		local function scheduleRefresh()
			-- upvalues: Flag (ref), DeferredThread (ref), refreshPreview (copy)
			if not Flag and DeferredThread == nil then
				DeferredThread = task.defer(refreshPreview)
				
				return
			end
		end
		
		local function _(Key)
			-- upvalues: ChangedConnections (copy), scheduleRefresh (copy)
			if ChangedConnections[Key] == nil then
				ChangedConnections[Key] = Key.Changed:Connect(scheduleRefresh)
			end
		end
		
		local Connection2 = nil
		local Connection3 = nil
		
		if IsIsInteractive then
			if ChangedConnections[Model] == nil then
				ChangedConnections[Model] = Model.Changed:Connect(scheduleRefresh)
			end
			for _, descendant in Model:GetDescendants() do
				if ChangedConnections[descendant] == nil then
					ChangedConnections[descendant] = descendant.Changed:Connect(scheduleRefresh)
				end
			end
			Connection2 = Model.DescendantAdded:Connect(function(Descendant)
				-- upvalues: ChangedConnections (copy), scheduleRefresh (copy), Flag (ref), DeferredThread (ref), refreshPreview (copy)
				if ChangedConnections[Descendant] == nil then
					ChangedConnections[Descendant] = Descendant.Changed:Connect(scheduleRefresh)
				end
				if not Flag then
					if DeferredThread ~= nil then return end
					DeferredThread = task.defer(refreshPreview)
				end
			end)
			Connection3 = Model.DescendantRemoving:Connect(function(Descendant)
				-- upvalues: ChangedConnections (copy), Flag (ref), DeferredThread (ref), refreshPreview (copy)
				local ChangedConnection = ChangedConnections[Descendant]
				
				if ChangedConnection ~= nil then
					ChangedConnection:Disconnect()
					ChangedConnections[Descendant] = nil
				end
				if not Flag then
					if DeferredThread ~= nil then return end
					DeferredThread = task.defer(refreshPreview)
				end
			end)
		end
		return function()
			-- upvalues: Flag (ref), DeferredThread (ref), Connection2 (ref), Connection3 (ref), ChangedConnections (copy), Connection1 (copy), Current1 (copy), WorldModel (copy)
			Flag = true
			
			if DeferredThread ~= nil then
				task.cancel(DeferredThread)
			end
			if Connection2 then
				Connection2:Disconnect()
			end
			if Connection3 then
				Connection3:Disconnect()
			end
			for _, changedConnection in ChangedConnections do
				changedConnection:Disconnect()
			end
			Connection1:Disconnect()
			Current1.camera = nil
			Current1.dragInput = nil
			Current1.lastDragPosition = nil
			WorldModel:Destroy()
		end
	end, {
		Model or false, FieldOfView, CameraDistanceScale, IsIsInteractive, UseResult,
		UseStateResult1
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), IsIsInteractive (copy), UseRefResult1 (copy), MotionModule (upval), ReducedMotion (copy)
		local Current = UseRefResult.current
		
		if Current == nil or not IsIsInteractive then
			return nil
		else
			local Parent = Current.Parent
			local Flag = false
			
			local function resizeViewport()
				-- upvalues: Parent (copy), UseRefResult1 (upval), MotionModule (upval), Flag (ref), ReducedMotion (upval)
				local AbsoluteSize = Parent.AbsoluteSize
				
				if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 then
					UseRefResult1.current(MotionModule.createState({ size = UDim2.fromOffset(AbsoluteSize.X, AbsoluteSize.Y) }, {
						default = MotionModule.transition({
							duration = if Flag and not ReducedMotion then 0.25 else 0,
							easingStyle = Enum.EasingStyle.Quad
						})
					}))
					Flag = true
					
					return
				end
			end
			
			resizeViewport()
			local Connection = Parent:GetPropertyChangedSignal("AbsoluteSize"):Connect(resizeViewport)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end
	end, { IsIsInteractive, ReducedMotion })
	local UseResult1 = ReactModule.useCallback(function(_, Input)
		-- upvalues: UseRefResult2 (copy), IsIsInteractive (copy)
		local Current = UseRefResult2.current
		
		if not IsIsInteractive or Current.dragInput ~= nil then return end
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			Current.dragInput = Input
			Current.lastDragPosition = Input.Position
		end
	end, { IsIsInteractive })
	ReactModule.useEffect(function()
		-- upvalues: IsIsInteractive (copy), UseRefResult2 (copy), UseResult (copy), config (upval)
		if IsIsInteractive then
			local UserInputService = game:GetService("UserInputService")
			local InputChangedConnection = UserInputService.InputChanged:Connect(function(Input)
				-- upvalues: UseRefResult2 (upval), UseResult (upval)
				local Current = UseRefResult2.current
				local DragInput = Current.dragInput
				
				if DragInput == nil or Current.lastDragPosition == nil then return end
				if DragInput.UserInputType == Enum.UserInputType.MouseButton1 and Input.UserInputType == Enum.UserInputType.MouseMovement or Input == DragInput then
					local PositionDelta = Input.Position - Current.lastDragPosition
					Current.lastDragPosition = Input.Position
					Current.yaw -= PositionDelta.X * 0.01
					Current.pitch = math.clamp(Current.pitch - PositionDelta.Y * 0.01, -1.4835298641951802, 1.4835298641951802)
					UseResult()
					
					return
				end
			end)
			local InputEndedConnection = UserInputService.InputEnded:Connect(function(Input)
				-- upvalues: UseRefResult2 (upval)
				if UseRefResult2.current.dragInput == Input then
					UseRefResult2.current.dragInput = nil
					UseRefResult2.current.lastDragPosition = nil
				end
			end)
			local WindowFocusReleasedConnection = UserInputService.WindowFocusReleased:Connect(function()
				-- upvalues: UseRefResult2 (upval)
				UseRefResult2.current.dragInput = nil
				UseRefResult2.current.lastDragPosition = nil
			end)
			local InputBeganConnection = UserInputService.InputBegan:Connect(function(Input, GameProcessed)
				-- upvalues: config (upval), UseRefResult2 (upval), UseResult (upval)
				local Entry = config[Input.KeyCode]
				
				if not GameProcessed and Entry ~= nil then
					local Current = UseRefResult2.current
					Current.yaw -= Entry.X * 0.2617993877991494
					Current.pitch = math.clamp(Current.pitch - Entry.Y * 0.2617993877991494, -1.4835298641951802, 1.4835298641951802)
					UseResult()
					
					return
				end
			end)
			
			return function()
				-- upvalues: InputBeganConnection (copy), InputChangedConnection (copy), InputEndedConnection (copy), WindowFocusReleasedConnection (copy), UseRefResult2 (upval)
				InputBeganConnection:Disconnect()
				InputChangedConnection:Disconnect()
				InputEndedConnection:Disconnect()
				WindowFocusReleasedConnection:Disconnect()
				UseRefResult2.current.dragInput = nil
				UseRefResult2.current.lastDragPosition = nil
			end
		else
			return nil
		end
	end, { IsIsInteractive, UseResult })
	
	return ReactModule.createElement(View, {
		Size = Frame.size or UDim2.fromScale(1, 1),
		backgroundStyle = if Frame.backgroundTransparency == nil then nil else {
			Color3 = UseTokensResult.Color.Surface.Surface_200.Color3,
			Transparency = Frame.backgroundTransparency
		},
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}, {
		Unavailable = if Model == nil or UseStateResult ~= Model then nil else ReactModule.createElement(FoundationModule.Text, {
			tag = "size-full padding-small text-body-small text-wrap text-align-x-center content-default",
			Text = Frame.unavailableText,
			testId = if Frame.testId == nil then nil else `{Frame.testId}.Unavailable`
		}),
		Viewport = ReactModule.createElement("ViewportFrame", {
			Visible = Model == nil or UseStateResult ~= Model,
			Size = if IsIsInteractive then UseMotionResult.size else UDim2.fromScale(1, 1),
			BackgroundColor3 = UseTokensResult.Color.Surface.Surface_200.Color3,
			BackgroundTransparency = Frame.backgroundTransparency or UseTokensResult.Color.Surface.Surface_200.Transparency,
			BorderSizePixel = 0,
			Active = IsIsInteractive,
			ref = UseRefResult,
			[ReactModule.Tag] = if Frame.testId == nil then nil else `data-testid={Frame.testId}.Viewport`,
			[ReactModule.Event.InputBegan] = UseResult1,
			[ReactModule.Event.InputChanged] = ReactModule.useCallback(function(_, Input)
				-- upvalues: UseRefResult2 (copy), IsIsInteractive (copy), UseResult (copy)
				local Current = UseRefResult2.current
				
				if IsIsInteractive and Current.dragInput == nil and Input.UserInputType == Enum.UserInputType.MouseWheel then
					Current.zoom = math.clamp(Current.zoom - Input.Position.Z * 0.12, 0.4, 2.5)
					UseResult()
				end
			end, { IsIsInteractive, UseResult })
		})
	})
end)