local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local CameraUtility = require(CorePackages.Packages.Thumbnailing).CameraUtility
local MannequinUtility = require(CorePackages.Packages.Thumbnailing).MannequinUtility
local ConstantsModule = require(script.Parent.Parent.Parent.Parent.Constants)
local MakeupPreviewUtilsModule = require(script.Parent.Parent.Parent.Parent.MakeupPreviewUtils)
local GetFFlagSingleUploadMakeupSupportModule = require(script.Parent.Parent.Parent.Parent.Flags.GetFFlagSingleUploadMakeupSupport)
local AvatarPartViewport = RoactModule.PureComponent:extend("AvatarPartViewport")
AvatarPartViewport.validateProps = TModule.strictInterface({
	LayoutOrder = TModule.optional(TModule.number),
	asset = TModule.union(TModule.table, TModule.instanceOf("MeshPart"), TModule.instanceOf("Accessory"), TModule.instanceIsA("Decal")),
	assetType = TModule.optional(TModule.EnumItem),
	viewportSize = TModule.optional(TModule.Vector2)
})

function AvatarPartViewport.init(p1)
	-- upvalues: RoactModule (copy)
	p1.camera = nil
	p1.modelRef = RoactModule.createRef()
	p1.camera, p1.updateCamera = RoactModule.createBinding(nil)
end

function AvatarPartViewport.createViewportCamera(p1)
	local Camera = Instance.new("Camera")
	Camera.Parent = p1.modelRef:getValue()
	Camera.CameraType = Enum.CameraType.Scriptable
	Camera.HeadLocked = true
	Camera.VRTiltAndRollEnabled = true
	
	return Camera
end

function AvatarPartViewport.addBodyPartMannequinToViewport(p1)
	-- upvalues: MannequinUtility (copy), CameraUtility (copy)
	local BodyPartMannequin, BodyPartMannequin2, BodyPartMannequin3 = MannequinUtility.CreateBodyPartMannequin(p1.props.asset, false)
	local SetupBodyPartMannequinResult, SetupBodyPartMannequinResult2 = MannequinUtility.SetupBodyPartMannequin(BodyPartMannequin, BodyPartMannequin2, BodyPartMannequin3, p1.props.asset)
	BodyPartMannequin3.Parent = p1.modelRef:getValue()
	local ViewportCamera = p1:createViewportCamera()
	CameraUtility.SetupBodyPartCamera(BodyPartMannequin3, SetupBodyPartMannequinResult, SetupBodyPartMannequinResult2, ViewportCamera)
	p1.updateCamera(ViewportCamera)
end

function AvatarPartViewport.addHeadModelToViewport(p1)
	-- upvalues: MannequinUtility (copy), CameraUtility (copy)
	local HeadModel = MannequinUtility.CreateHeadModel(p1.props.asset)
	HeadModel.Parent = p1.modelRef:getValue()
	local ViewportCamera = p1:createViewportCamera()
	CameraUtility.SetupHeadCamera(HeadModel, ViewportCamera)
	p1.updateCamera(ViewportCamera)
end

function AvatarPartViewport.addAccessoryToViewport(p1)
	-- upvalues: CameraUtility (copy)
	local Model = Instance.new("Model")
	p1.props.asset.Parent = Model
	Model.Parent = p1.modelRef:getValue()
	local ViewportCamera = p1:createViewportCamera()
	CameraUtility.SetupAccessoryCamera(Model, ViewportCamera)
	p1.updateCamera(ViewportCamera)
end

function AvatarPartViewport.addMakeupDecalToViewport(p1)
	-- upvalues: MakeupPreviewUtilsModule (copy)
	local MakeupThumbnailPreview = MakeupPreviewUtilsModule.createMakeupThumbnailPreview(p1.props.asset, p1.props.assetType)
	
	if not MakeupThumbnailPreview then return end
	MakeupThumbnailPreview.Parent = p1.modelRef:getValue()
	local ViewportCamera = p1:createViewportCamera()
	
	if MakeupPreviewUtilsModule.setupMakeupThumbnailCamera(MakeupThumbnailPreview, ViewportCamera, p1.props.assetType) then
		p1.updateCamera(ViewportCamera)
	end
end

function AvatarPartViewport.didMount(p1)
	-- upvalues: GetFFlagSingleUploadMakeupSupportModule (copy), MakeupPreviewUtilsModule (copy)
	local Asset = p1.props.asset
	
	if typeof(Asset) ~= "Instance" then
		p1:addBodyPartMannequinToViewport()
		
		return
	end
	if Asset:IsA("MeshPart") then
		p1:addHeadModelToViewport()
		
		return
	end
	if GetFFlagSingleUploadMakeupSupportModule() and (Asset:IsA("Decal") or p1.props.assetType and MakeupPreviewUtilsModule.isMakeupAssetType(p1.props.assetType)) then
		p1:addMakeupDecalToViewport()
		
		return
	else
		p1:addAccessoryToViewport()
	end
end

function AvatarPartViewport.render(p1)
	-- upvalues: WithStyleFunction (copy), ConstantsModule (copy), RoactModule (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), ConstantsModule (upval), RoactModule (upval)
		local Theme = p2.Theme
		local ViewportSize = if p1.props.viewportSize then p1.props.viewportSize else ConstantsModule.ItemCardWidthLandscape
		
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 0,
			LayoutOrder = p1.props.LayoutOrder,
			BackgroundColor3 = Theme.PlaceHolder.Color,
			BackgroundTransparency = Theme.PlaceHolder.Transparency,
			Size = UDim2.fromOffset(ViewportSize, ViewportSize)
		}, {
			UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 10) }),
			AspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1,
				AspectType = Enum.AspectType.FitWithinMaxSize,
				DominantAxis = Enum.DominantAxis.Width
			}),
			ViewportFrame = RoactModule.createElement("ViewportFrame", {
				ImageTransparency = 0,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				LightColor = ConstantsModule.ViewportLightColor,
				Ambient = ConstantsModule.ViewportLightAmbient,
				LightDirection = ConstantsModule.ViewportLightDirection,
				CurrentCamera = p1.camera
			}, {
				UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 10) }),
				WorldModel = RoactModule.createElement("WorldModel", { [RoactModule.Ref] = p1.modelRef })
			})
		})
	end)
end

return AvatarPartViewport