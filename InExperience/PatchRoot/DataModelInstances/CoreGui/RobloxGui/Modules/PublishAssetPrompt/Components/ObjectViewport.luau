local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local externalEventConnection = require(corePackagesService.Workspace.Packages.RoactUtils).ExternalEventConnection
local runService = game:GetService("RunService")
local objectViewport = roactModule.PureComponent:extend("ObjectViewport")
objectViewport.validateProps = tModule.strictInterface({ model = tModule.instanceOf("Model") })

local function _(p1, p2)
	local z = p2.Z
	
	return math.max(p2.X, p2.Y, z) / 2 * (1 / math.tan(math.rad(p1) / 2)) + z / 2
end

local _ = function(value, p1, p2)
	return CFrame.fromAxisAngle(p2, p1):VectorToWorldSpace(value)
end

function objectViewport.init(p1)
	-- upvalues: roactModule (ref)
	p1.cameraRef = roactModule.createRef()
	p1.worldModelRef = roactModule.createRef()
	local var1, var2 = roactModule.createBinding(CFrame.new())
	p1.cameraCFrameBinding = var1
	p1.updateCameraCFrameBinding = var2
	local var3, var4 = roactModule.createBinding(0)
	p1.cameraRotationBinding = var3
	p1.updateCameraRotationBinding = var4
	local var5, var6 = roactModule.createBinding(CFrame.new())
	p1.cameraFocusBinding = var5
	p1.updateCameraFocusBinding = var6
	p1:OnModelChanged()
end

function objectViewport.OnModelChanged(p1)
	if p1.props.model ~= nil then
		p1.modelCFrame = p1.props.model:GetModelCFrame()
		p1.initialLookVector = p1.modelCFrame.lookVector
		p1.modelExtentsSize = p1.props.model:GetExtentsSize()
		local modelExtentsSize = p1.modelExtentsSize
		local z = modelExtentsSize.Z
		p1.cameraDistance = math.max(modelExtentsSize.X, modelExtentsSize.Y, z) / 2 * 1.428148006742 + z / 2
	end
end

function objectViewport.render(p1)
	-- upvalues: roactModule (ref), externalEventConnection (ref), runService (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0, 0),
		AnchorPoint = Vector2.new(0, 0),
		Size = UDim2.fromScale(1, 1)
	}, {
		AspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}),
		ViewportFrame = roactModule.createElement("ViewportFrame", {
			BackgroundTransparency = 0,
			LightDirection = Vector3.new(1, 1, 1),
			BackgroundColor3 = Color3.new(0, 0, 0),
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			LightColor = Color3.fromRGB(240, 240, 240),
			Ambient = Color3.fromRGB(240, 240, 240),
			CurrentCamera = p1.cameraRef
		}, {
			Camera = roactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				FieldOfView = 70,
				CFrame = p1.cameraCFrameBinding,
				Focus = p1.cameraFocusBinding,
				[roactModule.Ref] = p1.cameraRef
			}),
			WorldModel = roactModule.createElement("WorldModel", { [roactModule.Ref] = p1.worldModelRef }),
			RenderSteppedConnection = roactModule.createElement(externalEventConnection, {
				event = runService.RenderStepped,
				callback = function()
					-- upvalues: p1 (ref)
					p1.updateCameraRotationBinding(p1.cameraRotationBinding:getValue() + 0.01)
					p1.updateCameraCFrameBinding(CFrame.new(p1.modelCFrame.p + CFrame.fromAxisAngle(Vector3.new(0, 1, 0), p1.cameraRotationBinding:getValue()):VectorToWorldSpace(p1.initialLookVector) * p1.cameraDistance, p1.modelCFrame.p))
				end
			})
		})
	})
end

function objectViewport.didMount(p1)
	if p1.worldModelRef:getValue() and p1.props.model ~= nil then
		p1.props.model.Parent = p1.worldModelRef:getValue()
	end
end

function objectViewport.willUnmount(p1)
	if p1.props.model then
		p1.props.model.Parent = nil
	end
end

function objectViewport.didUpdate(p1, p2)
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

return objectViewport