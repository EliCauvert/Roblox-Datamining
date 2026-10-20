local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local RunService = game:GetService("RunService")
local ObjectViewport = RoactModule.PureComponent:extend("ObjectViewport")
ObjectViewport.validateProps = TModule.strictInterface({ model = TModule.instanceOf("Model") })

local function _(Degrees: number, Vector): number
	local Z: number = Vector.Z
	
	return math.max(Vector.X, Vector.Y, Z) / 2 * (1 / math.tan(math.rad(Degrees) / 2)) + Z / 2
end

local _ = function(p1, Angle, Axis)
	return CFrame.fromAxisAngle(Axis, Angle):VectorToWorldSpace(p1)
end

function ObjectViewport.init(p1)
	-- upvalues: RoactModule (copy)
	p1.cameraRef = RoactModule.createRef()
	p1.worldModelRef = RoactModule.createRef()
	p1.cameraCFrameBinding, p1.updateCameraCFrameBinding = RoactModule.createBinding(CFrame.new())
	p1.cameraRotationBinding, p1.updateCameraRotationBinding = RoactModule.createBinding(0)
	p1.cameraFocusBinding, p1.updateCameraFocusBinding = RoactModule.createBinding(CFrame.new())
	p1:OnModelChanged()
end

function ObjectViewport.OnModelChanged(p1)
	if p1.props.model ~= nil then
		p1.modelCFrame = p1.props.model:GetModelCFrame()
		p1.initialLookVector = p1.modelCFrame.lookVector
		p1.modelExtentsSize = p1.props.model:GetExtentsSize()
		local ModelExtentsSize = p1.modelExtentsSize
		local Z: number = ModelExtentsSize.Z
		p1.cameraDistance = math.max(ModelExtentsSize.X, ModelExtentsSize.Y, Z) / 2 * 1.4281480067421146 + Z / 2
	end
end

function ObjectViewport.render(p1)
	-- upvalues: RoactModule (copy), ExternalEventConnection (copy), RunService (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0, 0),
		AnchorPoint = Vector2.new(0, 0),
		Size = UDim2.fromScale(1, 1)
	}, {
		AspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}),
		ViewportFrame = RoactModule.createElement("ViewportFrame", {
			BackgroundTransparency = 0,
			LightDirection = vector.create(1, 1, 1),
			BackgroundColor3 = Color3.new(0, 0, 0),
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			LightColor = Color3.fromRGB(240, 240, 240),
			Ambient = Color3.fromRGB(240, 240, 240),
			CurrentCamera = p1.cameraRef
		}, {
			Camera = RoactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				FieldOfView = 70,
				CFrame = p1.cameraCFrameBinding,
				Focus = p1.cameraFocusBinding,
				[RoactModule.Ref] = p1.cameraRef
			}),
			WorldModel = RoactModule.createElement("WorldModel", { [RoactModule.Ref] = p1.worldModelRef }),
			RenderSteppedConnection = RoactModule.createElement(ExternalEventConnection, {
				event = RunService.RenderStepped,
				callback = function()
					-- upvalues: p1 (copy)
					p1.updateCameraRotationBinding(p1.cameraRotationBinding:getValue() + 0.01)
					p1.updateCameraCFrameBinding((CFrame.new(p1.modelCFrame.p + CFrame.fromAxisAngle(vector.create(0, 1, 0), (p1.cameraRotationBinding:getValue())):VectorToWorldSpace(p1.initialLookVector) * p1.cameraDistance, p1.modelCFrame.p)))
				end
			})
		})
	})
end

function ObjectViewport.didMount(p1)
	if p1.worldModelRef:getValue() and p1.props.model ~= nil then
		p1.props.model.Parent = p1.worldModelRef:getValue()
	end
end

function ObjectViewport.willUnmount(p1)
	if p1.props.model then
		p1.props.model.Parent = nil
	end
end

function ObjectViewport.didUpdate(p1, p2)
	if p1.props.model ~= p2.model then
		if p2.model ~= nil then
			p2.model.Parent = nil
		end
		if p1.props.model ~= nil then
			p1.props.model.Parent = p1.worldModelRef:getValue()
		end
		p1:OnModelChanged()
	end
end

return ObjectViewport