local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local withStyle = require(corePackagesService.Packages.UIBlox).Style.withStyle
local cameraUtility = require(corePackagesService.Packages.Thumbnailing).CameraUtility
local mannequinUtility = require(corePackagesService.Packages.Thumbnailing).MannequinUtility
local constantsModule = require(script.Parent.Parent.Parent.Parent.Constants)
local makeupPreviewUtilsModule = require(script.Parent.Parent.Parent.Parent.MakeupPreviewUtils)
local getFFlagSingleUploadMakeupSupportModule = require(script.Parent.Parent.Parent.Parent.Flags.GetFFlagSingleUploadMakeupSupport)
local avatarPartViewport = roactModule.PureComponent:extend("AvatarPartViewport")
avatarPartViewport.validateProps = tModule.strictInterface({
	LayoutOrder = tModule.optional(tModule.number),
	asset = tModule.union(tModule.table, tModule.instanceOf("MeshPart"), tModule.instanceOf("Accessory"), tModule.instanceIsA("Decal")),
	assetType = tModule.optional(tModule.EnumItem),
	viewportSize = tModule.optional(tModule.Vector2)
})

function avatarPartViewport.init(p1)
	-- upvalues: roactModule (ref)
	p1.camera = nil
	p1.modelRef = roactModule.createRef()
	local var1, var2 = roactModule.createBinding(nil)
	p1.camera = var1
	p1.updateCamera = var2
end

function avatarPartViewport.createViewportCamera(p1)
	local camera = Instance.new("Camera")
	camera.Parent = p1.modelRef:getValue()
	camera.CameraType = Enum.CameraType.Scriptable
	camera.HeadLocked = true
	camera.VRTiltAndRollEnabled = true
	
	return camera
end

function avatarPartViewport.addBodyPartMannequinToViewport(p1)
	-- upvalues: mannequinUtility (ref), cameraUtility (ref)
	local var1, var2, var3 = mannequinUtility.CreateBodyPartMannequin(p1.props.asset, false)
	local var4, var5 = mannequinUtility.SetupBodyPartMannequin(var1, var2, var3, p1.props.asset)
	var3.Parent = p1.modelRef:getValue()
	local var6 = p1:createViewportCamera()
	cameraUtility.SetupBodyPartCamera(var3, var4, var5, var6)
	p1.updateCamera(var6)
end

function avatarPartViewport.addHeadModelToViewport(p1)
	-- upvalues: mannequinUtility (ref), cameraUtility (ref)
	local var1 = mannequinUtility.CreateHeadModel(p1.props.asset)
	var1.Parent = p1.modelRef:getValue()
	local var2 = p1:createViewportCamera()
	cameraUtility.SetupHeadCamera(var1, var2)
	p1.updateCamera(var2)
end

function avatarPartViewport.addAccessoryToViewport(p1)
	-- upvalues: cameraUtility (ref)
	local model = Instance.new("Model")
	p1.props.asset.Parent = model
	model.Parent = p1.modelRef:getValue()
	local var1 = p1:createViewportCamera()
	cameraUtility.SetupAccessoryCamera(model, var1)
	p1.updateCamera(var1)
end

function avatarPartViewport.addMakeupDecalToViewport(p1)
	-- upvalues: makeupPreviewUtilsModule (ref)
	local var1 = makeupPreviewUtilsModule.createMakeupThumbnailPreview(p1.props.asset, p1.props.assetType)
	
	if not var1 then return end
	var1.Parent = p1.modelRef:getValue()
	local var2 = p1:createViewportCamera()
	
	if makeupPreviewUtilsModule.setupMakeupThumbnailCamera(var1, var2, p1.props.assetType) then
		p1.updateCamera(var2)
	end
end

function avatarPartViewport.didMount(p1)
	-- upvalues: getFFlagSingleUploadMakeupSupportModule (ref), makeupPreviewUtilsModule (ref)
	local asset = p1.props.asset
	
	if typeof(asset) ~= "Instance" then
		p1:addBodyPartMannequinToViewport()
		
		return
	elseif asset:IsA("MeshPart") then
		p1:addHeadModelToViewport()
		
		return
	elseif getFFlagSingleUploadMakeupSupportModule() and (asset:IsA("Decal") or p1.props.assetType and makeupPreviewUtilsModule.isMakeupAssetType(p1.props.assetType)) then
		p1:addMakeupDecalToViewport()
		
		return
	end
	p1:addAccessoryToViewport()
end

function avatarPartViewport.render(p1)
	-- upvalues: withStyle (ref), constantsModule (ref), roactModule (ref)
	return withStyle(function(p2)
		-- upvalues: p1 (ref), constantsModule (copy), roactModule (copy)
		local theme = p2.Theme
		local var1 = if p1.props.viewportSize then p1.props.viewportSize else constantsModule.ItemCardWidthLandscape
		
		return roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 0,
			LayoutOrder = p1.props.LayoutOrder,
			BackgroundColor3 = theme.PlaceHolder.Color,
			BackgroundTransparency = theme.PlaceHolder.Transparency,
			Size = UDim2.fromOffset(var1, var1)
		}, {
			UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 10) }),
			AspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1,
				AspectType = Enum.AspectType.FitWithinMaxSize,
				DominantAxis = Enum.DominantAxis.Width
			}),
			ViewportFrame = roactModule.createElement("ViewportFrame", {
				ImageTransparency = 0,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				LightColor = constantsModule.ViewportLightColor,
				Ambient = constantsModule.ViewportLightAmbient,
				LightDirection = constantsModule.ViewportLightDirection,
				CurrentCamera = p1.camera
			}, {
				UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 10) }),
				WorldModel = roactModule.createElement("WorldModel", { [roactModule.Ref] = p1.modelRef })
			})
		})
	end)
end

return avatarPartViewport