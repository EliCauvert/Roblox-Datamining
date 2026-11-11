local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Skeleton = require(CorePackages.Packages.Foundation).Skeleton
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local TModule = require(CorePackages.Packages.t)
local Images = UIBloxModule.App.ImageSet.Images
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local CharacterUtility = require(CorePackages.Packages.Thumbnailing).CharacterUtility
local CameraUtility = require(CorePackages.Packages.Thumbnailing).CameraUtility
local CFrameUtility = require(CorePackages.Packages.Thumbnailing).CFrameUtility
local EmoteUtility = require(CorePackages.Packages.Thumbnailing).EmoteUtility
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local IconsActionsPreviewExpand = Images["icons/actions/previewExpand"]
local ComponentAssetsDropshadow25 = Images["component_assets/dropshadow_25"]
local _UDim2 = UDim2.new(0.4, 50, 0.15, 10)
local _UDim2_1 = UDim2.new(0.5, 0, 1, 0)
local ObjectViewport = RoactModule.PureComponent:extend("ObjectViewport")
ObjectViewport.validateProps = TModule.strictInterface({
	model = TModule.optional(TModule.instanceOf("Model")),
	fieldOfView = TModule.optional(TModule.number),
	isLoading = TModule.optional(TModule.boolean),
	useFullBodyCameraSettings = TModule.optional(TModule.boolean),
	openPreviewView = TModule.optional(TModule.callback),
	LayoutOrder = TModule.optional(TModule.number),
	isHumanoidModel = TModule.optional(TModule.boolean)
})

function ObjectViewport.createCamera(p1)
	local Camera = Instance.new("Camera")
	Camera.CameraType = Enum.CameraType.Scriptable
	Camera.Parent = p1.worldModelRef:getValue()
	Camera.HeadLocked = true
	Camera.VRTiltAndRollEnabled = true
	
	return Camera
end

function ObjectViewport.init(p1)
	-- upvalues: RoactModule (copy)
	p1.worldModelRef = RoactModule.createRef()
	p1.camera, p1.updateCamera = RoactModule.createBinding(nil)
	p1.isMounted = false
end

local function _(Degrees: number, Vector): number
	local Z: number = Vector.Z
	
	return math.max(Vector.X, Vector.Y, Z) / 2 * (1 / math.tan(math.rad(Degrees) / 2)) + Z / 2
end

function ObjectViewport.setupViewportForAsset(p1)
	if not p1.props.model then return end
	local Model = p1.props.model:Clone()
	Model.Parent = p1.worldModelRef:getValue()
	local ModelCFrame = nil
	local ExtentsSize = nil
	
	if Model:IsA("Model") then
		Model:MoveTo(vector.create(0, 0, 0))
		ModelCFrame = Model:GetModelCFrame()
		ExtentsSize = Model:GetExtentsSize()
	else
		local MeshPart = Model:FindFirstChildWhichIsA("MeshPart", true)
		
		if not MeshPart then return end
		MeshPart.CFrame = CFrame.new(0, 0, 0)
		ModelCFrame = MeshPart.CFrame
		ExtentsSize = MeshPart.Size
	end
	local Camera = p1:createCamera()
	local FieldOfView = if p1.props.fieldOfView then p1.props.fieldOfView else 30
	local Z: number = ExtentsSize.Z
	local _Vector2 = Vector2.new(5, 20)
	Camera.CFrame = CFrame.new(ModelCFrame.Position + CFrame.fromAxisAngle(vector.create(0, 1, 0), (math.rad(_Vector2.Y))):VectorToWorldSpace((CFrame.fromAxisAngle(vector.create(1, 0, 0), (math.rad(_Vector2.X))):VectorToWorldSpace(ModelCFrame.lookVector))) * (math.max(ExtentsSize.X, ExtentsSize.Y, Z) / 2 * (1 / math.tan(math.rad(FieldOfView) / 2)) + Z / 2), ModelCFrame.Position)
	Camera.FieldOfView = FieldOfView
	p1.updateCamera(Camera)
end

function ObjectViewport.setupViewport(p1)
	-- upvalues: EmoteUtility (copy), RunService (copy), CFrameUtility (copy), CharacterUtility (copy), CameraUtility (copy)
	local Model = p1.props.model:Clone()
	assert(Model.PrimaryPart, "The Model should have a PrimaryPart for setting up Camera")
	Model.Parent = p1.worldModelRef:getValue()
	Model:MoveTo(vector.create(0, 0, 0))
	local UseFullBodyCameraSettings = p1.props.useFullBodyCameraSettings
	
	if UseFullBodyCameraSettings then
		EmoteUtility.SetPlayerCharacterPoseWithMoodFallback(Model)
		RunService.PostSimulation:Wait()
		
		if not p1.isMounted then return end
	end
	local Camera = p1:createCamera()
	local NewTargetCFrame = nil
	
	if UseFullBodyCameraSettings then
		local TargetCFrame = CFrameUtility.CalculateTargetCFrame(Model.Head.CFrame)
		NewTargetCFrame = TargetCFrame - TargetCFrame.Position + Model.PrimaryPart.CFrame.Position
	else
		NewTargetCFrame = Model.PrimaryPart.CFrame
	end
	local ModelExtents, ModelExtents2 = CharacterUtility.CalculateModelExtents(Model, NewTargetCFrame)
	local config = {
		extentScale = 1,
		optFieldOfView = if p1.props.fieldOfView then p1.props.fieldOfView else 30,
		targetCFrame = NewTargetCFrame,
		minExtent = ModelExtents,
		maxExtent = ModelExtents2
	}
	
	if UseFullBodyCameraSettings then
		config.optCameraXRot = CameraUtility.XRotForFullBody
		config.optCameraDistanceScale = CameraUtility.DistanceScaleForFullBody
		config.extentScale = CameraUtility.DefaultBodyMarginScale
	else
		config.optCameraYRot = 25
	end
	CameraUtility.SetupCamera(Camera, config)
	p1.updateCamera(Camera)
end

function ObjectViewport.didMount(p1)
	p1.isMounted = true
	task.spawn(function()
		-- upvalues: p1 (copy)
		if not p1.props.isLoading then
			if p1.props.isHumanoidModel then
				p1:setupViewport()
				
				return
			end
			p1:setupViewportForAsset()
		end
	end)
end

function ObjectViewport.didUpdate(p1, p2)
	if p2.isLoading and not p1.props.isLoading then
		task.spawn(function()
			-- upvalues: p1 (copy)
			if p1.props.isHumanoidModel then
				p1:setupViewport()
				
				return
			else
				p1:setupViewportForAsset()
			end
		end)
	end
end

function ObjectViewport.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), ConstantsModule (copy), IconButton (copy), IconsActionsPreviewExpand (copy), IconSize (copy), ImageSetLabel (copy), _UDim2_1 (copy), ComponentAssetsDropshadow25 (copy), _UDim2 (copy), Skeleton (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), RoactModule (upval), ConstantsModule (upval), IconButton (upval), IconsActionsPreviewExpand (upval), IconSize (upval), ImageSetLabel (upval), _UDim2_1 (upval), ComponentAssetsDropshadow25 (upval), _UDim2 (upval), Skeleton (upval)
		local Theme = p2.Theme
		
		return if p1.props.isLoading then RoactModule.createElement(Skeleton, {
			Size = UDim2.new(1, ConstantsModule.PromptSidePadding * 2, 0, 240),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			LayoutOrder = p1.props.LayoutOrder
		}) else RoactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(1, ConstantsModule.PromptSidePadding * 2, 0, 240),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			LayoutOrder = p1.props.LayoutOrder
		}, {
			ViewportFrame = RoactModule.createElement("ViewportFrame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				LightColor = ConstantsModule.ViewportLightColor,
				Ambient = ConstantsModule.ViewportLightAmbient,
				LightDirection = ConstantsModule.ViewportLightDirection,
				CurrentCamera = p1.camera
			}, {
				WorldModel = RoactModule.createElement("WorldModel", { [RoactModule.Ref] = p1.worldModelRef })
			}),
			ExpandPreviewButton = p1.props.openPreviewView and RoactModule.createElement(IconButton, {
				position = UDim2.new(1, -ConstantsModule.PromptSidePadding, 1, 0),
				anchorPoint = Vector2.new(1, 1),
				icon = IconsActionsPreviewExpand,
				iconSize = IconSize.Medium,
				onActivated = p1.props.openPreviewView
			}),
			Gradient = RoactModule.createElement("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Theme.BackgroundMuted.Color),
					ColorSequenceKeypoint.new(1, Theme.BackgroundMuted.Color)
				}),
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(0.7, 0.75),
					NumberSequenceKeypoint.new(1, 1)
				})
			}),
			DropShadow = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.5,
				ZIndex = 0,
				Position = _UDim2_1,
				AnchorPoint = Vector2.new(0.5, 1),
				Image = ComponentAssetsDropshadow25,
				Size = _UDim2
			})
		})
	end)
end

function ObjectViewport.willUnmount(p1)
	p1.isMounted = false
end

return ObjectViewport