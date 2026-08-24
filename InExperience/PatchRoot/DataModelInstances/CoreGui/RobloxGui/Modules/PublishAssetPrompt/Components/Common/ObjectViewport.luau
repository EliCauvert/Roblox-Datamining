local corePackagesService = game:GetService("CorePackages")
local runService = game:GetService("RunService")
local roactModule = require(corePackagesService.Packages.Roact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local skeleton = require(corePackagesService.Packages.Foundation).Skeleton
local withStyle = UIBloxModule.Style.withStyle
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local tModule = require(corePackagesService.Packages.t)
local images = UIBloxModule.App.ImageSet.Images
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local characterUtility = require(corePackagesService.Packages.Thumbnailing).CharacterUtility
local cameraUtility = require(corePackagesService.Packages.Thumbnailing).CameraUtility
local cFrameUtility = require(corePackagesService.Packages.Thumbnailing).CFrameUtility
local emoteUtility = require(corePackagesService.Packages.Thumbnailing).EmoteUtility
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local previewExpand = images["icons/actions/previewExpand"]
local dropshadow25 = images["component_assets/dropshadow_25"]
local uDim2 = UDim2.new(0.4, 50, 0.15, 10)
local uDim2_1 = UDim2.new(0.5, 0, 1, 0)
local objectViewport = roactModule.PureComponent:extend("ObjectViewport")
objectViewport.validateProps = tModule.strictInterface({
	model = tModule.optional(tModule.instanceOf("Model")),
	fieldOfView = tModule.optional(tModule.number),
	isLoading = tModule.optional(tModule.boolean),
	useFullBodyCameraSettings = tModule.optional(tModule.boolean),
	openPreviewView = tModule.optional(tModule.callback),
	LayoutOrder = tModule.optional(tModule.number),
	isHumanoidModel = tModule.optional(tModule.boolean)
})

function objectViewport.createCamera(p0)
	local camera = Instance.new("Camera")
	camera.CameraType = Enum.CameraType.Scriptable
	camera.Parent = p0.worldModelRef:getValue()
	camera.HeadLocked = true
	camera.VRTiltAndRollEnabled = true
	
	return camera
end

function objectViewport.init(p1)
	-- upvalues: roactModule (ref)
	p1.worldModelRef = roactModule.createRef()
	local var10, var11 = roactModule.createBinding(nil)
	p1.camera = var10
	p1.updateCamera = var11
	p1.isMounted = false
end

local function _(p2, p3)
	local z = p3.Z
	
	return math.max(p3.X, p3.Y, z) / 2 * (1 / math.tan(math.rad(p2) / 2)) + z / 2
end

function objectViewport.setupViewportForAsset(value)
	if not value.props.model then return end
	local modelCFrame, extentsSize
	local var12 = value.props.model:Clone()
	var12.Parent = value.worldModelRef:getValue()
	local _ = nil
	local _ = nil
	
	if var12:IsA("Model") then
		var12:MoveTo(Vector3.new(0, 0, 0))
		modelCFrame = var12:GetModelCFrame()
		extentsSize = var12:GetExtentsSize()
	else
		local meshPart = var12:FindFirstChildWhichIsA("MeshPart", true)
		
		if not meshPart then return end
		meshPart.CFrame = CFrame.new(0, 0, 0)
		modelCFrame = meshPart.CFrame
		extentsSize = meshPart.Size
	end
	local lookVector = modelCFrame.lookVector
	local var16 = value:createCamera()
	local var17 = if value.props.fieldOfView then value.props.fieldOfView else 30
	local z = extentsSize.Z
	local vector2 = Vector2.new(5, 20)
	var16.CFrame = CFrame.new(modelCFrame.Position + CFrame.fromAxisAngle(Vector3.new(0, 1, 0), math.rad(vector2.Y)):VectorToWorldSpace(CFrame.fromAxisAngle(Vector3.new(1, 0, 0), math.rad(vector2.X)):VectorToWorldSpace(lookVector)) * (math.max(extentsSize.X, extentsSize.Y, z) / 2 * (1 / math.tan(math.rad(var17) / 2)) + z / 2), modelCFrame.Position)
	var16.FieldOfView = var17
	value.updateCamera(var16)
end

function objectViewport.setupViewport(value)
	-- upvalues: emoteUtility (ref), runService (ref), cFrameUtility (ref), characterUtility (ref), cameraUtility (ref)
	local var19 = value.props.model:Clone()
	assert(var19.PrimaryPart, "The Model should have a PrimaryPart for setting up Camera")
	var19.Parent = value.worldModelRef:getValue()
	var19:MoveTo(Vector3.new(0, 0, 0))
	local useFullBodyCameraSettings = value.props.useFullBodyCameraSettings
	
	if useFullBodyCameraSettings then
		emoteUtility.SetPlayerCharacterPoseWithMoodFallback(var19)
		runService.PostSimulation:Wait()
		
		if not value.isMounted then return end
	end
	local var22
	local var20 = value:createCamera()
	local _ = nil
	
	if useFullBodyCameraSettings then
		local var21 = cFrameUtility.CalculateTargetCFrame(var19.Head.CFrame)
		var22 = var21 - var21.Position + var19.PrimaryPart.CFrame.Position
	else
		var22 = var19.PrimaryPart.CFrame
	end
	local var23, var24 = characterUtility.CalculateModelExtents(var19, var22)
	local t = {
		extentScale = 1,
		optFieldOfView = if value.props.fieldOfView then value.props.fieldOfView else 30,
		targetCFrame = var22,
		minExtent = var23,
		maxExtent = var24
	}
	
	if useFullBodyCameraSettings then
		t.optCameraXRot = cameraUtility.XRotForFullBody
		t.optCameraDistanceScale = cameraUtility.DistanceScaleForFullBody
		t.extentScale = cameraUtility.DefaultBodyMarginScale
	else
		t.optCameraYRot = 25
	end
	cameraUtility.SetupCamera(var20, t)
	value.updateCamera(var20)
end

function objectViewport.didMount(p4)
	p4.isMounted = true
	task.spawn(function()
		-- upvalues: p4 (ref)
		if not p4.props.isLoading then
			if p4.props.isHumanoidModel then
				p4:setupViewport()
				
				return
			end
			p4:setupViewportForAsset()
		end
	end)
end

function objectViewport.didUpdate(p5, p6)
	if p6.isLoading and not p5.props.isLoading then
		task.spawn(function()
			-- upvalues: p5 (ref)
			if p5.props.isHumanoidModel then
				p5:setupViewport()
				
				return
			end
			p5:setupViewportForAsset()
		end)
	end
end

function objectViewport.render(p7)
	-- upvalues: withStyle (ref), roactModule (ref), constantsModule (ref), iconButton (ref), previewExpand (ref), iconSize (ref), imageSetLabel (ref), uDim2_1 (ref), dropshadow25 (ref), uDim2 (ref), skeleton (ref)
	return withStyle(function(p8)
		-- upvalues: p7 (ref), roactModule (copy), constantsModule (copy), iconButton (copy), previewExpand (copy), iconSize (copy), imageSetLabel (copy), uDim2_1 (copy), dropshadow25 (copy), uDim2 (copy), skeleton (copy)
		local theme = p8.Theme
		
		return if p7.props.isLoading then roactModule.createElement(skeleton, {
			Size = UDim2.new(1, constantsModule.PromptSidePadding * 2, 0, 240),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			LayoutOrder = p7.props.LayoutOrder
		}) else roactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(1, constantsModule.PromptSidePadding * 2, 0, 240),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			LayoutOrder = p7.props.LayoutOrder
		}, {
			ViewportFrame = roactModule.createElement("ViewportFrame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				LightColor = constantsModule.ViewportLightColor,
				Ambient = constantsModule.ViewportLightAmbient,
				LightDirection = constantsModule.ViewportLightDirection,
				CurrentCamera = p7.camera
			}, {
				WorldModel = roactModule.createElement("WorldModel", { [roactModule.Ref] = p7.worldModelRef })
			}),
			ExpandPreviewButton = p7.props.openPreviewView and roactModule.createElement(iconButton, {
				position = UDim2.new(1, -constantsModule.PromptSidePadding, 1, 0),
				anchorPoint = Vector2.new(1, 1),
				icon = previewExpand,
				iconSize = iconSize.Medium,
				onActivated = p7.props.openPreviewView
			}),
			Gradient = roactModule.createElement("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, theme.BackgroundMuted.Color),
					ColorSequenceKeypoint.new(1, theme.BackgroundMuted.Color)
				}),
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(0.7, 0.75),
					NumberSequenceKeypoint.new(1, 1)
				})
			}),
			DropShadow = roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.5,
				ZIndex = 0,
				Position = uDim2_1,
				AnchorPoint = Vector2.new(0.5, 1),
				Image = dropshadow25,
				Size = uDim2
			})
		})
	end)
end

function objectViewport.willUnmount(p9)
	p9.isMounted = false
end

return objectViewport