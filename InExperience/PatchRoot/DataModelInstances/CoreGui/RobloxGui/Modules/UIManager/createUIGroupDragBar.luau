local parent = script.Parent
local dragBarModule = require(parent.DragBar)
local constantsModule = require(parent.Constants)
local coreGuiService = game:GetService("CoreGui")

return function(p1)
	-- upvalues: coreGuiService (ref), constantsModule (ref), dragBarModule (ref)
	local part = Instance.new("Part")
	part.Size = Vector3.new(0.600000023842, 0.119999997318, 0.00001)
	part.Name = p1.name .. "_DragBar"
	part.Color = Color3.new(1, 1, 1)
	part.Parent = workspace.CurrentCamera
	part.Anchored = true
	part.CanTouch = true
	part.CanCollide = false
	part.CastShadow = false
	part.Material = Enum.Material.Glass
	part.Transparency = 1
	local dragDetector = Instance.new("DragDetector")
	dragDetector.Enabled = true
	dragDetector.Parent = part
	dragDetector.DragStyle = Enum.DragDetectorDragStyle.BestForDevice
	local dragBarSurfaceGui = Instance.new("SurfaceGui", coreGuiService)
	dragBarSurfaceGui.Name = "dragBar_SurfaceGui"
	dragBarSurfaceGui.Enabled = true
	dragBarSurfaceGui.CanvasSize = Vector2.new(part.Size.X, part.Size.Y) * constantsModule.VR_PANEL_RESOLUTION_MULTIPLIER
	dragBarSurfaceGui.AlwaysOnTop = true
	dragBarSurfaceGui.Shape = Enum.SurfaceGuiShape.Flat
	dragBarSurfaceGui.HorizontalCurvature = 0
	dragBarSurfaceGui.Active = true
	dragBarSurfaceGui.Adornee = part
	dragBarSurfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	dragBarSurfaceGui.LightInfluence = 0
	dragBarSurfaceGui.ZOffset = 0
	dragBarSurfaceGui.Face = Enum.NormalId.Back
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Image = "rbxasset://textures/ui/InGameMenu/DragBar_Bright.png"
	imageLabel.Parent = dragBarSurfaceGui
	imageLabel.BackgroundTransparency = 1
	imageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
	imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	imageLabel.Size = UDim2.new(0.5, 0, 0.25, 0)
	imageLabel.ImageColor3 = Color3.new(1, 1, 1)
	dragDetector.RunLocally = true
	
	if p1.dragFunction then
		dragDetector.DragContinue:Connect(p1.dragFunction)
	end
	if p1.dragStartFunction then
		dragDetector.DragStart:Connect(p1.dragStartFunction)
	end
	if p1.dragEndFunction then
		dragDetector.DragEnd:Connect(p1.dragEndFunction)
	end
	return dragBarModule.new(part, imageLabel)
end