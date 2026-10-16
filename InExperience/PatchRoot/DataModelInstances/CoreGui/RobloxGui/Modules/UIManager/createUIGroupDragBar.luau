local Parent = script.Parent
local DragBarModule = require(Parent.DragBar)
local ConstantsModule = require(Parent.Constants)
local CoreGui = game:GetService("CoreGui")

return function(p1) --[[ Line: 8 ]]
	-- upvalues: CoreGui (copy), ConstantsModule (copy), DragBarModule (copy)
	local Part = Instance.new("Part")
	Part.Size = vector.create(0.6000000238418579, 0.11999999731779099, 9.999999747378752e-06)
	Part.Name = p1.name .. "_DragBar"
	Part.Color = Color3.new(1, 1, 1)
	Part.Parent = workspace.CurrentCamera
	Part.Anchored = true
	Part.CanTouch = true
	Part.CanCollide = false
	Part.CastShadow = false
	Part.Material = Enum.Material.Glass
	Part.Transparency = 1
	local DragDetector = Instance.new("DragDetector")
	DragDetector.Enabled = true
	DragDetector.Parent = Part
	DragDetector.DragStyle = Enum.DragDetectorDragStyle.BestForDevice
	local dragBar_SurfaceGui = Instance.new("SurfaceGui", CoreGui)
	dragBar_SurfaceGui.Name = "dragBar_SurfaceGui"
	dragBar_SurfaceGui.Enabled = true
	dragBar_SurfaceGui.CanvasSize = Vector2.new(Part.Size.X, Part.Size.Y) * ConstantsModule.VR_PANEL_RESOLUTION_MULTIPLIER
	dragBar_SurfaceGui.AlwaysOnTop = true
	dragBar_SurfaceGui.Shape = Enum.SurfaceGuiShape.Flat
	dragBar_SurfaceGui.HorizontalCurvature = 0
	dragBar_SurfaceGui.Active = true
	dragBar_SurfaceGui.Adornee = Part
	dragBar_SurfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	dragBar_SurfaceGui.LightInfluence = 0
	dragBar_SurfaceGui.ZOffset = 0
	dragBar_SurfaceGui.Face = Enum.NormalId.Back
	local Image = Instance.new("ImageLabel")
	Image.Image = "rbxasset://textures/ui/InGameMenu/DragBar_Bright.png"
	Image.Parent = dragBar_SurfaceGui
	Image.BackgroundTransparency = 1
	Image.BackgroundColor3 = Color3.new(1, 1, 1)
	Image.AnchorPoint = Vector2.new(0.5, 0.5)
	Image.Position = UDim2.new(0.5, 0, 0.5, 0)
	Image.Size = UDim2.new(0.5, 0, 0.25, 0)
	Image.ImageColor3 = Color3.new(1, 1, 1)
	DragDetector.RunLocally = true
	
	if p1.dragFunction then
		DragDetector.DragContinue:Connect(p1.dragFunction)
	end
	if p1.dragStartFunction then
		DragDetector.DragStart:Connect(p1.dragStartFunction)
	end
	if p1.dragEndFunction then
		DragDetector.DragEnd:Connect(p1.dragEndFunction)
	end
	return (DragBarModule.new(Part, Image))
end