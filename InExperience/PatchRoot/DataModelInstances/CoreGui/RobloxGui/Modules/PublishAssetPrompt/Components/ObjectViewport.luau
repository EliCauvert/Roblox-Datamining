local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local externalEventConnection = require(corePackagesService.Workspace.Packages.RoactUtils).ExternalEventConnection
local runService = game:GetService("RunService")
local objectViewport = roactModule.PureComponent:extend("ObjectViewport")
objectViewport.validateProps = tModule.strictInterface({ model = tModule.instanceOf("Model") })

local function _(p0, p1)
	local z = p1.Z
	
	return math.max(p1.X, p1.Y, z) / 2 * (1 / math.tan(math.rad(p0) / 2)) + z / 2
end

local _ = function(value, p2, p3)
	return CFrame.fromAxisAngle(p3, p2):VectorToWorldSpace(value)
end

function objectViewport.init(p4)
	-- upvalues: roactModule (ref)
	p4.cameraRef = roactModule.createRef()
	p4.worldModelRef = roactModule.createRef()
	local var5, var6 = roactModule.createBinding(CFrame.new())
	p4.cameraCFrameBinding = var5
	p4.updateCameraCFrameBinding = var6
	local var7, var8 = roactModule.createBinding(0)
	p4.cameraRotationBinding = var7
	p4.updateCameraRotationBinding = var8
	local var9, var10 = roactModule.createBinding(CFrame.new())
	p4.cameraFocusBinding = var9
	p4.updateCameraFocusBinding = var10
	p4:OnModelChanged()
end

function objectViewport.OnModelChanged(p5)
	if p5.props.model ~= nil then
		p5.modelCFrame = p5.props.model:GetModelCFrame()
		p5.initialLookVector = p5.modelCFrame.lookVector
		p5.modelExtentsSize = p5.props.model:GetExtentsSize()
		local modelExtentsSize = p5.modelExtentsSize
		local z = modelExtentsSize.Z
		p5.cameraDistance = math.max(modelExtentsSize.X, modelExtentsSize.Y, z) / 2 * 1.428148006742 + z / 2
	end
end

function objectViewport.render(p6)
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
			CurrentCamera = p6.cameraRef
		}, {
			Camera = roactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				FieldOfView = 70,
				CFrame = p6.cameraCFrameBinding,
				Focus = p6.cameraFocusBinding,
				[roactModule.Ref] = p6.cameraRef
			}),
			WorldModel = roactModule.createElement("WorldModel", { [roactModule.Ref] = p6.worldModelRef }),
			RenderSteppedConnection = roactModule.createElement(externalEventConnection, {
				event = runService.RenderStepped,
				callback = function()
					-- upvalues: p6 (ref)
					p6.updateCameraRotationBinding(p6.cameraRotationBinding:getValue() + 0.01)
					p6.updateCameraCFrameBinding(CFrame.new(p6.modelCFrame.p + CFrame.fromAxisAngle(Vector3.new(0, 1, 0), p6.cameraRotationBinding:getValue()):VectorToWorldSpace(p6.initialLookVector) * p6.cameraDistance, p6.modelCFrame.p))
				end
			})
		})
	})
end

function objectViewport.didMount(p7)
	if p7.worldModelRef:getValue() and p7.props.model ~= nil then
		p7.props.model.Parent = p7.worldModelRef:getValue()
	end
end

function objectViewport.willUnmount(p8)
	if p8.props.model then
		p8.props.model.Parent = nil
	end
end

function objectViewport.didUpdate(p9, p10)
	if p9.props.model ~= p10.model then
		if p10.model ~= nil then
			p10.model.Parent = nil
		end
		if p9.props.model ~= nil then
			p9.props.model.Parent = p9.worldModelRef:getValue()
		end
		p9:OnModelChanged()
	end
end

return objectViewport