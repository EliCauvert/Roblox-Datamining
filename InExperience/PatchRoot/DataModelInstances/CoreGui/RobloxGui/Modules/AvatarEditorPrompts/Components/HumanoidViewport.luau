local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local playersService = game:GetService("Players")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local skeleton = require(corePackagesService.Packages.Foundation).Skeleton
local promiseModule = require(corePackagesService.Packages.Promise)
local emptyState = UIBloxModule.App.Indicator.EmptyState
local _ = coreGuiService:WaitForChild("RobloxGui")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local cFrame = CFrame.fromEulerAnglesXYZ(0.349065850399, 0.261799387799, 0.698131700798)
local AXClusterCompositionTimeoutMs = game:DefineFastInt("AXClusterCompositionTimeoutMs", 3000)
local humanoidViewport = roactModule.PureComponent:extend("HumanoidViewport")
humanoidViewport.validateProps = tModule.strictInterface({
	humanoidDescription = tModule.optional(tModule.instanceOf("HumanoidDescription")),
	loadingFailed = tModule.boolean,
	retryLoadDescription = tModule.callback,
	rigType = tModule.optional(tModule.enum(Enum.HumanoidRigType))
})

function humanoidViewport.init(p0)
	-- upvalues: roactModule (ref)
	p0:setState({ loading = true, loadingFailed = false })
	p0.cameraRef = roactModule.createRef()
	p0.worldModelRef = roactModule.createRef()
	local var11, var12 = roactModule.createBinding(CFrame.new())
	p0.cameraCFrameBinding = var11
	p0.updateCameraCFrameBinding = var12
	local var13, var14 = roactModule.createBinding(CFrame.new())
	p0.cameraFocusBinding = var13
	p0.updateCameraFocusBinding = var14
	p0.humanoidModel = nil
	p0.mounted = false
	
	function p0.onRetryLoading()
		-- upvalues: p0 (ref)
		p0:setState({ loading = true, loadingFailed = false })
		
		if p0.props.humanoidDescription then
			p0:loadHumanoidModel()
			
			return
		end
		p0.props.retryLoadDescription()
	end
end

local function _(p1)
	-- upvalues: cFrame (ref)
	return (CFrame.new(Vector3.new(0, 0, 0), if math.abs(p1.Y) > 0.95 then Vector3.new(0, 0, -1) else Vector3.new(p1.X, 0, p1.Z).unit) * cFrame).lookVector
end

local _ = function(value, p2)
	return math.max(p2.X, p2.Y) / 2 * (1 / math.tan(math.rad(value) / 2)) + p2.Z / 2
end

local _ = function(p3, p4, p5)
	local extentsSize = p3:GetExtentsSize()
	
	return p5 - p5.p + p3:GetModelCFrame().p + p4 * ((math.max(extentsSize.X, extentsSize.Y) / 2 * 1.428148006742 + extentsSize.Z / 2) * 1)
end

function humanoidViewport.positionCamera(p6)
	-- upvalues: cFrame (ref)
	local humanoidModel = p6.humanoidModel
	local modelCFrame = humanoidModel:GetModelCFrame()
	local lookVector = modelCFrame.lookVector
	local humanoidRootPart = humanoidModel:FindFirstChild("HumanoidRootPart")
	
	if humanoidRootPart then
		lookVector = humanoidRootPart.CFrame.lookVector
	end
	lookVector = (CFrame.new(Vector3.new(0, 0, 0), if math.abs(lookVector.Y) > 0.95 then Vector3.new(0, 0, -1) else Vector3.new(lookVector.X, 0, lookVector.Z).unit) * cFrame).lookVector
	local cFrame_1 = CFrame.new(modelCFrame.p + lookVector * 5, modelCFrame.p)
	local extentsSize = humanoidModel:GetExtentsSize()
	p6.updateCameraCFrameBinding(cFrame_1 - cFrame_1.p + humanoidModel:GetModelCFrame().p + lookVector * ((math.max(extentsSize.X, extentsSize.Y) / 2 * 1.428148006742 + extentsSize.Z / 2) * 1))
	p6.updateCameraFocusBinding(modelCFrame)
end

function humanoidViewport.loadIdleAnimation(_, p7)
	local humanoid = p7:FindFirstChildOfClass("Humanoid")
	
	if humanoid.HumanoidDescription.IdleAnimation == 0 then return end
	local animate = p7:FindFirstChild("Animate")
	
	if not animate then return end
	local idle = animate:FindFirstChild("idle")
	
	if not idle then return end
	local animation = idle:FindFirstChildOfClass("Animation")
	
	if animation then
		local var24 = humanoid:LoadAnimation(animation)
		var24.Looped = true
		var24:Play()
		
		return
	end
end

function humanoidViewport.loadHumanoidModel(p8)
	-- upvalues: playersService (ref), promiseModule (ref), AXClusterCompositionTimeoutMs (ref)
	local humanoidDescription = p8.props.humanoidDescription
	local rigType = p8.props.rigType
	coroutine.wrap(function()
		-- upvalues: playersService (copy), humanoidDescription (ref), rigType (ref), p8 (ref), promiseModule (copy), AXClusterCompositionTimeoutMs (copy)
		local var25 = nil
		pcall(function()
			-- upvalues: var25 (write), playersService (copy), humanoidDescription (copy), rigType (copy)
			if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
				var25 = playersService:CreateHumanoidModelFromDescriptionAsync(humanoidDescription, rigType)
				
				return
			end
			var25 = playersService:CreateHumanoidModelFromDescription(humanoidDescription, rigType)
		end)
		
		if not p8.mounted then return end
		if p8.props.humanoidDescription ~= humanoidDescription then return end
		if p8.props.rigType ~= rigType then return end
		if var25 == nil then
			p8:setState({ loadingFailed = true })
			
			return
		end
		p8.humanoidModel = var25
		
		if p8.worldModelRef:getValue() then
			p8.humanoidModel.Parent = p8.worldModelRef:getValue()
		end
		if #humanoidDescription:GetAccessories(false) > 0 then
			promiseModule.race({
				promiseModule.fromEvent(var25.Humanoid.ClusterCompositionFinished),
				promiseModule.delay(AXClusterCompositionTimeoutMs * 0.001)
			}):await()
		end
		if p8.mounted then
			p8:positionCamera()
			p8:loadIdleAnimation(var25)
			p8:setState({ loading = false, loadingFailed = false })
			
			return
		end
	end)()
end

function humanoidViewport.render(p9)
	-- upvalues: roactModule (ref), skeleton (ref), emptyState (ref), robloxTranslatorModule (ref)
	local loadingFailed = p9.props.loadingFailed or p9.state.loadingFailed
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, {
		AspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}),
		ShimmerFrame = not loadingFailed and p9.state.loading and roactModule.createElement(skeleton, {
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}),
		LoadingFailed = loadingFailed and roactModule.createElement(emptyState, {
			text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.ItemsListLoadingFailed"),
			size = UDim2.fromScale(1, 1),
			onActivated = p9.onRetryLoading
		}),
		ViewportFrame = roactModule.createElement("ViewportFrame", {
			BackgroundTransparency = 1,
			Visible = not (loadingFailed or p9.state.loading),
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			LightColor = Color3.fromRGB(240, 240, 240),
			Ambient = Color3.fromRGB(240, 240, 240),
			CurrentCamera = p9.cameraRef
		}, {
			Camera = roactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				FieldOfView = 70,
				CFrame = p9.cameraCFrameBinding,
				Focus = p9.cameraFocusBinding,
				[roactModule.Ref] = p9.cameraRef
			}),
			WorldModel = roactModule.createElement("WorldModel", { [roactModule.Ref] = p9.worldModelRef })
		})
	})
end

function humanoidViewport.didMount(p10)
	p10.mounted = true
	
	if p10.props.humanoidDescription then
		p10:loadHumanoidModel()
	end
end

function humanoidViewport.didUpdate(p11, p12)
	if p11.worldModelRef:getValue() and p11.humanoidModel then
		p11.humanoidModel.Parent = p11.worldModelRef:getValue()
	end
	if p11.props.rigType ~= nil and (p11.props.humanoidDescription ~= nil and (p11.props.humanoidDescription ~= p12.humanoidDescription or p11.props.rigType ~= p12.rigType)) then
		p11:setState({ loading = true })
		
		if p11.props.humanoidDescription ~= nil then
			p11:loadHumanoidModel()
		end
	end
end

function humanoidViewport.willUnmount(p13)
	p13.mounted = false
end

return humanoidViewport