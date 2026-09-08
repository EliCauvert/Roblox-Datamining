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

function objectViewport.createCamera(p1)
	local camera = Instance.new("Camera")
	camera.CameraType = Enum.CameraType.Scriptable
	camera.Parent = p1.worldModelRef:getValue()
	camera.HeadLocked = true
	camera.VRTiltAndRollEnabled = true
	
	return camera
end

function objectViewport.init(p1)
	-- upvalues: roactModule (ref)
	p1.worldModelRef = roactModule.createRef()
	local var1, var2 = roactModule.createBinding(nil)
	p1.camera = var1
	p1.updateCamera = var2
	p1.isMounted = false
end

local function _(p1, p2)
	local z = p2.Z
	
	return math.max(p2.X, p2.Y, z) / 2 * (1 / math.tan(math.rad(p1) / 2)) + z / 2
end

function objectViewport.setupViewportForAsset(value)
	-- upvalues: makeupPreviewUtilsModule (ref)
	if not value.props.model then return end
	local var1, var2
	local var3 = value.props.model:Clone()
	var3.Parent = value.worldModelRef:getValue()
	local _ = nil
	local _ = nil
	
	if var3:IsA("Model") then
		var3:MoveTo(Vector3.new(0, 0, 0))
		local var4 = nil
		local var5 = nil
		
		if value.props.isMakeupPreview then
			local headPreviewCameraData, headPreviewCameraData_1 = makeupPreviewUtilsModule.getHeadPreviewCameraData(var3)
			var4 = headPreviewCameraData
			var5 = headPreviewCameraData_1
		end
		var1 = var4 or var3:GetModelCFrame()
		var2 = var5 or var3:GetExtentsSize()
	else
		local meshPart = var3:FindFirstChildWhichIsA("MeshPart", true)
		
		if not meshPart then return end
		meshPart.CFrame = CFrame.new(0, 0, 0)
		var1 = meshPart.CFrame
		var2 = meshPart.Size
	end
	local lookVector = var1.lookVector
	local var6 = value:createCamera()
	local var7 = if value.props.fieldOfView then value.props.fieldOfView else 30
	local z = var2.Z
	local vector2 = Vector2.new(5, 20)
	var6.CFrame = CFrame.new(var1.Position + CFrame.fromAxisAngle(Vector3.new(0, 1, 0), math.rad(vector2.Y)):VectorToWorldSpace(CFrame.fromAxisAngle(Vector3.new(1, 0, 0), math.rad(vector2.X)):VectorToWorldSpace(lookVector)) * (math.max(var2.X, var2.Y, z) / 2 * (1 / math.tan(math.rad(var7) / 2)) + z / 2), var1.Position)
	var6.FieldOfView = var7
	value.updateCamera(var6)
end

function objectViewport.setupViewport(value)
	-- upvalues: emoteUtility (ref), runService (ref), cFrameUtility (ref), characterUtility (ref), cameraUtility (ref)
	local var1 = value.props.model:Clone()
	assert(var1.PrimaryPart, "The Model should have a PrimaryPart for setting up Camera")
	var1.Parent = value.worldModelRef:getValue()
	var1:MoveTo(Vector3.new(0, 0, 0))
	local useFullBodyCameraSettings = value.props.useFullBodyCameraSettings
	
	if useFullBodyCameraSettings then
		emoteUtility.SetPlayerCharacterPoseWithMoodFallback(var1)
		runService.PostSimulation:Wait()
		
		if not value.isMounted then return end
	end
	local var2
	local var3 = value:createCamera()
	local _ = nil
	
	if useFullBodyCameraSettings then
		local var4 = cFrameUtility.CalculateTargetCFrame(var1.Head.CFrame)
		var2 = var4 - var4.Position + var1.PrimaryPart.CFrame.Position
	else
		var2 = var1.PrimaryPart.CFrame
	end
	local var5, var6 = characterUtility.CalculateModelExtents(var1, var2)
	local t = {
		extentScale = 1,
		optFieldOfView = if value.props.fieldOfView then value.props.fieldOfView else 30,
		targetCFrame = var2,
		minExtent = var5,
		maxExtent = var6
	}
	
	if useFullBodyCameraSettings then
		t.optCameraXRot = cameraUtility.XRotForFullBody
		t.optCameraDistanceScale = cameraUtility.DistanceScaleForFullBody
		t.extentScale = cameraUtility.DefaultBodyMarginScale
	else
		t.optCameraYRot = 25
	end
	cameraUtility.SetupCamera(var3, t)
	value.updateCamera(var3)
end

function objectViewport.didMount(p1)
	p1.isMounted = true
	task.spawn(function()
		-- upvalues: p1 (ref)
		if not p1.props.isLoading then
			if p1.props.isHumanoidModel then
				p1:setupViewport()
				
				return
			end
			p1:setupViewportForAsset()
		end
	end)
end

function objectViewport.didUpdate(p1, p2)
	if p2.isLoading and not p1.props.isLoading then
		task.spawn(function()
			-- upvalues: p1 (ref)
			if p1.props.isHumanoidModel then
				p1:setupViewport()
				
				return
			end
			p1:setupViewportForAsset()
		end)
	end
end

function objectViewport.render(p1)
	-- upvalues: withStyle (ref), roactModule (ref), constantsModule (ref), iconButton (ref), previewExpand (ref), iconSize (ref), imageSetLabel (ref), uDim2_1 (ref), dropshadow25 (ref), uDim2 (ref), skeleton (ref)
	return withStyle(function(p2)
		-- upvalues: p1 (ref), roactModule (copy), constantsModule (copy), iconButton (copy), previewExpand (copy), iconSize (copy), imageSetLabel (copy), uDim2_1 (copy), dropshadow25 (copy), uDim2 (copy), skeleton (copy)
		local theme = p2.Theme
		
		return if p1.props.isLoading then roactModule.createElement(skeleton, {
			Size = UDim2.new(1, constantsModule.PromptSidePadding * 2, 0, 240),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			LayoutOrder = p1.props.LayoutOrder
		}) else roactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(1, constantsModule.PromptSidePadding * 2, 0, 240),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			LayoutOrder = p1.props.LayoutOrder
		}, {
			ViewportFrame = roactModule.createElement("ViewportFrame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				LightColor = constantsModule.ViewportLightColor,
				Ambient = constantsModule.ViewportLightAmbient,
				LightDirection = constantsModule.ViewportLightDirection,
				CurrentCamera = p1.camera
			}, {
				WorldModel = roactModule.createElement("WorldModel", { [roactModule.Ref] = p1.worldModelRef })
			}),
			ExpandPreviewButton = p1.props.openPreviewView and roactModule.createElement(iconButton, {
				position = UDim2.new(1, -constantsModule.PromptSidePadding, 1, 0),
				anchorPoint = Vector2.new(1, 1),
				icon = previewExpand,
				iconSize = iconSize.Medium,
				onActivated = p1.props.openPreviewView
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

function objectViewport.willUnmount(p1)
	p1.isMounted = false
end

return objectViewport