local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local withStyle = require(corePackagesService.Packages.UIBlox).Style.withStyle
local cameraUtility = require(corePackagesService.Packages.Thumbnailing).CameraUtility
local mannequinUtility = require(corePackagesService.Packages.Thumbnailing).MannequinUtility
local constantsModule = require(script.Parent.Parent.Parent.Parent.Constants)
local avatarPartViewport = roactModule.PureComponent:extend("AvatarPartViewport")
avatarPartViewport.validateProps = tModule.strictInterface({
	LayoutOrder = tModule.optional(tModule.number),
	asset = tModule.union(tModule.table, tModule.instanceOf("MeshPart"), tModule.instanceOf("Accessory")),
	viewportSize = tModule.optional(tModule.Vector2)
})

function avatarPartViewport.init(p0) --[[ line: 34 ]]
	-- upvalues: roactModule (ref)
	p0.camera = nil
	p0.modelRef = roactModule.createRef()
	local var5, var6 = roactModule.createBinding(nil)
	p0.camera = var5
	p0.updateCamera = var6
end

function avatarPartViewport.createViewportCamera(p1) --[[ line: 40 ]]
	local camera = Instance.new("Camera")
	camera.Parent = p1.modelRef:getValue()
	camera.CameraType = Enum.CameraType.Scriptable
	camera.HeadLocked = true
	camera.VRTiltAndRollEnabled = true
	
	return camera
end

function avatarPartViewport.addBodyPartMannequinToViewport(p2) --[[ line: 51 ]]
	-- upvalues: mannequinUtility (ref), cameraUtility (ref)
	local var8, var9, var10 = mannequinUtility.CreateBodyPartMannequin(p2.props.asset, false)
	local var11, var12 = mannequinUtility.SetupBodyPartMannequin(var8, var9, var10, p2.props.asset)
	var10.Parent = p2.modelRef:getValue()
	local var13 = p2:createViewportCamera()
	cameraUtility.SetupBodyPartCamera(var10, var11, var12, var13)
	p2.updateCamera(var13)
end

function avatarPartViewport.addHeadModelToViewport(p3) --[[ line: 63 ]]
	-- upvalues: mannequinUtility (ref), cameraUtility (ref)
	local var14 = mannequinUtility.CreateHeadModel(p3.props.asset)
	var14.Parent = p3.modelRef:getValue()
	local var15 = p3:createViewportCamera()
	cameraUtility.SetupHeadCamera(var14, var15)
	p3.updateCamera(var15)
end

function avatarPartViewport.addAccessoryToViewport(p4) --[[ line: 72 ]]
	-- upvalues: cameraUtility (ref)
	local model = Instance.new("Model")
	p4.props.asset.Parent = model
	model.Parent = p4.modelRef:getValue()
	local var17 = p4:createViewportCamera()
	cameraUtility.SetupAccessoryCamera(model, var17)
	p4.updateCamera(var17)
end

function avatarPartViewport.didMount(p5) --[[ line: 82 ]]
	local asset = p5.props.asset
	
	if typeof(asset) ~= "Instance" then
		p5:addBodyPartMannequinToViewport()
		
		return
	elseif asset:IsA("MeshPart") then
		p5:addHeadModelToViewport()
		
		return
	end
	p5:addAccessoryToViewport()
end

function avatarPartViewport.render(p6) --[[ line: 95 ]]
	-- upvalues: withStyle (ref), constantsModule (ref), roactModule (ref)
	return withStyle(function(p7) --[[ line: 96 ]]
		-- upvalues: p6 (ref), constantsModule (copy), roactModule (copy)
		local theme = p7.Theme
		local var18 = if p6.props.viewportSize then p6.props.viewportSize else constantsModule.ItemCardWidthLandscape
		
		return roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 0,
			LayoutOrder = p6.props.LayoutOrder,
			BackgroundColor3 = theme.PlaceHolder.Color,
			BackgroundTransparency = theme.PlaceHolder.Transparency,
			Size = UDim2.fromOffset(var18, var18)
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
				CurrentCamera = p6.camera
			}, {
				UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 10) }),
				WorldModel = roactModule.createElement("WorldModel", { [roactModule.Ref] = p6.modelRef })
			})
		})
	end)
end

return avatarPartViewport