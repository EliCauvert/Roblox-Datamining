local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local TModule = require(CorePackages.Packages.t)
local StrictInterfaceResult = TModule.strictInterface({
	regularProps = TModule.optional(TModule.table),
	modelRef = TModule.optional(TModule.strictInterface({ value = TModule.instanceIsA("Model") })),
	cameraFocusPoint = TModule.optional(TModule.Vector3),
	cameraLookVector = TModule.optional(TModule.Vector3),
	cameraDistance = TModule.optional(TModule.number),
	cameraUpVector = TModule.optional(TModule.Vector3)
})
local ViewportFrame = RoactModule.PureComponent:extend("ViewportFrame")
ViewportFrame.defaultProps = {
	cameraDistance = 6,
	cameraUpVector = Vector3.FromAxis(Enum.Axis.Y)
}

function ViewportFrame.init(p1)
	-- upvalues: RoactModule (copy)
	p1.viewportRef = RoactModule.createRef()
	p1.model = nil
	p1.camera = nil
end

function ViewportFrame.updateModel(p1)
	if p1.model ~= nil then
		p1.model.Parent = nil
		p1.model = nil
	end
	local ModelRef = p1.props.modelRef
	
	if p1.viewportRef.current ~= nil and ModelRef ~= nil then
		p1.model = ModelRef.value
		p1.model.Parent = p1.viewportRef.current
		
		return
	end
end

function ViewportFrame.updateCamera(p1)
	if p1.viewportRef.current == nil or p1.model == nil then return end
	if p1.camera == nil then
		p1.camera = Instance.new("Camera")
		p1.camera.Name = "Camera"
		p1.camera.CameraType = Enum.CameraType.Scriptable
		p1.camera.Parent = p1.viewportRef.current
		p1.viewportRef.current.CurrentCamera = p1.camera
	end
	local ScaledCameraDistance = (p1.props.cameraLookVector or (if p1.model.PrimaryPart == nil then vector.create(0, 0, 1) else -p1.model.PrimaryPart.CFrame.lookVector or vector.create(0, 0, 1))) * p1.props.cameraDistance
	p1.camera.CFrame = CFrame.fromMatrix((p1.props.cameraFocusPoint or (if p1.model.PrimaryPart == nil then vector.create(0, 0, 0) else p1.model.PrimaryPart.Position or vector.create(0, 0, 0))) - ScaledCameraDistance, ScaledCameraDistance:Cross(p1.props.cameraUpVector).Unit, ScaledCameraDistance:Cross(p1.props.cameraUpVector):Cross(ScaledCameraDistance).Unit)
end

function ViewportFrame.updateViewport(p1)
	p1:updateModel()
	p1:updateCamera()
end

function ViewportFrame.didMount(p1)
	p1:updateViewport()
end

function ViewportFrame.willUnmount(p1)
	if p1.model ~= nil then
		p1.model.Parent = nil
		p1.model = nil
	end
	if p1.camera ~= nil then
		p1.camera.Parent = nil
		p1.camera = nil
	end
end

function ViewportFrame.didUpdate(p1, p2)
	if p2.modelRef ~= p1.props.modelRef then
		p1:updateViewport()
		
		return
	end
	if p2.cameraFocusPoint ~= p1.props.cameraFocusPoint or p2.cameraLookVector ~= p1.props.cameraLookVector or p2.cameraDistance ~= p1.props.cameraDistance then
		p1:updateCamera()
	end
end

function ViewportFrame.render(p1)
	-- upvalues: StrictInterfaceResult (copy), CryoModule (copy), RoactModule (copy)
	assert(StrictInterfaceResult(p1.props))
	
	return RoactModule.createElement("ViewportFrame", (CryoModule.Dictionary.join(p1.props.regularProps or {}, { [RoactModule.Ref] = p1.viewportRef })))
end

return ViewportFrame