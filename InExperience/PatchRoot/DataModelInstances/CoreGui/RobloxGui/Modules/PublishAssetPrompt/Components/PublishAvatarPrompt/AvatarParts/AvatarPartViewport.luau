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

function avatarPartViewport.init(p0) --[[ line: 38 ]]
	-- upvalues: roactModule (ref)
	p0.camera = nil
	p0.modelRef = roactModule.createRef()
	local var7, var8 = roactModule.createBinding(nil)
	p0.camera = var7
	p0.updateCamera = var8
end

function avatarPartViewport.createViewportCamera(p1) --[[ line: 44 ]]
	local camera = Instance.new("Camera")
	camera.Parent = p1.modelRef:getValue()
	camera.CameraType = Enum.CameraType.Scriptable
	camera.HeadLocked = true
	camera.VRTiltAndRollEnabled = true
	
	return camera
end

function avatarPartViewport.addBodyPartMannequinToViewport(p2) --[[ line: 55 ]]
	-- upvalues: mannequinUtility (ref), cameraUtility (ref)
	local var10, var11, var12 = mannequinUtility.CreateBodyPartMannequin(p2.props.asset, false)
	local var13, var14 = mannequinUtility.SetupBodyPartMannequin(var10, var11, var12, p2.props.asset)
	var12.Parent = p2.modelRef:getValue()
	local var15 = p2:createViewportCamera()
	cameraUtility.SetupBodyPartCamera(var12, var13, var14, var15)
	p2.updateCamera(var15)
end

function avatarPartViewport.addHeadModelToViewport(p3) --[[ line: 67 ]]
	-- upvalues: mannequinUtility (ref), cameraUtility (ref)
	local var16 = mannequinUtility.CreateHeadModel(p3.props.asset)
	var16.Parent = p3.modelRef:getValue()
	local var17 = p3:createViewportCamera()
	cameraUtility.SetupHeadCamera(var16, var17)
	p3.updateCamera(var17)
end

function avatarPartViewport.addAccessoryToViewport(p4) --[[ line: 76 ]]
	-- upvalues: cameraUtility (ref)
	local model = Instance.new("Model")
	p4.props.asset.Parent = model
	model.Parent = p4.modelRef:getValue()
	local var19 = p4:createViewportCamera()
	cameraUtility.SetupAccessoryCamera(model, var19)
	p4.updateCamera(var19)
end

function avatarPartViewport.addMakeupDecalToViewport(p5) --[[ line: 86 ]]
	-- upvalues: makeupPreviewUtilsModule (ref), cameraUtility (ref)
	local var20 = makeupPreviewUtilsModule.createMakeupThumbnailPreview(p5.props.asset, p5.props.assetType)
	
	if var20 then
		var20.Parent = p5.modelRef:getValue()
		local var21 = p5:createViewportCamera()
		cameraUtility.SetupHeadCamera(var20, var21)
		p5.updateCamera(var21)
		
		return
	end
end

function avatarPartViewport.didMount(p6) --[[ line: 98 ]]
	-- upvalues: getFFlagSingleUploadMakeupSupportModule (ref), makeupPreviewUtilsModule (ref)
	local asset = p6.props.asset
	
	if typeof(asset) ~= "Instance" then
		p6:addBodyPartMannequinToViewport()
		
		return
	elseif asset:IsA("MeshPart") then
		p6:addHeadModelToViewport()
		
		return
	elseif getFFlagSingleUploadMakeupSupportModule() and (asset:IsA("Decal") or p6.props.assetType and makeupPreviewUtilsModule.isMakeupAssetType(p6.props.assetType)) then
		p6:addMakeupDecalToViewport()
		
		return
	end
	p6:addAccessoryToViewport()
end

function avatarPartViewport.render(p7) --[[ line: 119 ]]
	-- upvalues: withStyle (ref), constantsModule (ref), roactModule (ref)
	return withStyle(function(p8) --[[ line: 120 ]]
		-- upvalues: p7 (ref), constantsModule (copy), roactModule (copy)
		local theme = p8.Theme
		local var22 = if p7.props.viewportSize then p7.props.viewportSize else constantsModule.ItemCardWidthLandscape
		
		return roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 0,
			LayoutOrder = p7.props.LayoutOrder,
			BackgroundColor3 = theme.PlaceHolder.Color,
			BackgroundTransparency = theme.PlaceHolder.Transparency,
			Size = UDim2.fromOffset(var22, var22)
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
				CurrentCamera = p7.camera
			}, {
				UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 10) }),
				WorldModel = roactModule.createElement("WorldModel", { [roactModule.Ref] = p7.modelRef })
			})
		})
	end)
end

return avatarPartViewport