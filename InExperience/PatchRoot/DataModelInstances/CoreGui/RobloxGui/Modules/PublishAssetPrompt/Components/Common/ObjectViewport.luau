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
local makeupPreviewUtilsModule = require(script.Parent.Parent.Parent.MakeupPreviewUtils)
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
	isHumanoidModel = tModule.optional(tModule.boolean),
	isMakeupPreview = tModule.optional(tModule.boolean)
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
	local var11, var12 = roactModule.createBinding(nil)
	p1.camera = var11
	p1.updateCamera = var12
	p1.isMounted = false
end

local function _(p2, p3)
	local z = p3.Z
	
	return math.max(p3.X, p3.Y, z) / 2 * (1 / math.tan(math.rad(p2) / 2)) + z / 2
end

function objectViewport.setupViewportForAsset(value)
	-- upvalues: makeupPreviewUtilsModule (ref)
	if not value.props.model then return end
	local var14_1, var19
	local var13 = value.props.model:Clone()
	var13.Parent = value.worldModelRef:getValue()
	local _ = nil
	local _ = nil
	
	if var13:IsA("Model") then
		var13:MoveTo(Vector3.new(0, 0, 0))
		local var14 = nil
		local var15 = nil
		
		if value.props.isMakeupPreview then
			local headPreviewCameraData, headPreviewCameraData_1 = makeupPreviewUtilsModule.getHeadPreviewCameraData(var13)
			var14 = headPreviewCameraData
			var15 = headPreviewCameraData_1
		end
		var14_1 = var14 or var13:GetModelCFrame()
		var19 = var15 or var13:GetExtentsSize()
	else
		local meshPart = var13:FindFirstChildWhichIsA("MeshPart", true)
		
		if not meshPart then return end
		meshPart.CFrame = CFrame.new(0, 0, 0)
		var14_1 = meshPart.CFrame
		var19 = meshPart.Size
	end
	local lookVector = var14_1.lookVector
	local var21 = value:createCamera()
	local var22 = if value.props.fieldOfView then value.props.fieldOfView else 30
	local z = var19.Z
	local vector2 = Vector2.new(5, 20)
	var21.CFrame = CFrame.new(var14_1.Position + CFrame.fromAxisAngle(Vector3.new(0, 1, 0), math.rad(vector2.Y)):VectorToWorldSpace(CFrame.fromAxisAngle(Vector3.new(1, 0, 0), math.rad(vector2.X)):VectorToWorldSpace(lookVector)) * (math.max(var19.X, var19.Y, z) / 2 * (1 / math.tan(math.rad(var22) / 2)) + z / 2), var14_1.Position)
	var21.FieldOfView = var22
	value.updateCamera(var21)
end

function objectViewport.setupViewport(value)
	-- upvalues: emoteUtility (ref), runService (ref), cFrameUtility (ref), characterUtility (ref), cameraUtility (ref)
	local var24 = value.props.model:Clone()
	assert(var24.PrimaryPart, "The Model should have a PrimaryPart for setting up Camera")
	var24.Parent = value.worldModelRef:getValue()
	var24:MoveTo(Vector3.new(0, 0, 0))
	local useFullBodyCameraSettings = value.props.useFullBodyCameraSettings
	
	if useFullBodyCameraSettings then
		emoteUtility.SetPlayerCharacterPoseWithMoodFallback(var24)
		runService.PostSimulation:Wait()
		
		if not value.isMounted then return end
	end
	local var27
	local var25 = value:createCamera()
	local _ = nil
	
	if useFullBodyCameraSettings then
		local var26 = cFrameUtility.CalculateTargetCFrame(var24.Head.CFrame)
		var27 = var26 - var26.Position + var24.PrimaryPart.CFrame.Position
	else
		var27 = var24.PrimaryPart.CFrame
	end
	local var28, var29 = characterUtility.CalculateModelExtents(var24, var27)
	local t = {
		extentScale = 1,
		optFieldOfView = if value.props.fieldOfView then value.props.fieldOfView else 30,
		targetCFrame = var27,
		minExtent = var28,
		maxExtent = var29
	}
	
	if useFullBodyCameraSettings then
		t.optCameraXRot = cameraUtility.XRotForFullBody
		t.optCameraDistanceScale = cameraUtility.DistanceScaleForFullBody
		t.extentScale = cameraUtility.DefaultBodyMarginScale
	else
		t.optCameraYRot = 25
	end
	cameraUtility.SetupCamera(var25, t)
	value.updateCamera(var25)
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