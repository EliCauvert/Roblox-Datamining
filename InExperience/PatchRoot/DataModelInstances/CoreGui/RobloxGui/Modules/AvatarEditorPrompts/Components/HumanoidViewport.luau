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

function humanoidViewport.init(p1)
	-- upvalues: roactModule (ref)
	p1:setState({ loading = true, loadingFailed = false })
	p1.cameraRef = roactModule.createRef()
	p1.worldModelRef = roactModule.createRef()
	local var1, var2 = roactModule.createBinding(CFrame.new())
	p1.cameraCFrameBinding = var1
	p1.updateCameraCFrameBinding = var2
	local var3, var4 = roactModule.createBinding(CFrame.new())
	p1.cameraFocusBinding = var3
	p1.updateCameraFocusBinding = var4
	p1.humanoidModel = nil
	p1.mounted = false
	
	function p0.onRetryLoading()
		-- upvalues: p1 (ref)
		p1:setState({ loading = true, loadingFailed = false })
		
		if p1.props.humanoidDescription then
			p1:loadHumanoidModel()
			
			return
		end
		p1.props.retryLoadDescription()
	end
end

local function _(p1)
	-- upvalues: cFrame (ref)
	return (CFrame.new(Vector3.new(0, 0, 0), if math.abs(p1.Y) > 0.95 then Vector3.new(0, 0, -1) else Vector3.new(p1.X, 0, p1.Z).unit) * cFrame).lookVector
end

local _ = function(value, p1)
	return math.max(p1.X, p1.Y) / 2 * (1 / math.tan(math.rad(value) / 2)) + p1.Z / 2
end

local _ = function(p1, p2, p3)
	local extentsSize = p1:GetExtentsSize()
	
	return p3 - p3.p + p1:GetModelCFrame().p + p2 * ((math.max(extentsSize.X, extentsSize.Y) / 2 * 1.428148006742 + extentsSize.Z / 2) * 1)
end

function humanoidViewport.positionCamera(p1)
	-- upvalues: cFrame (ref)
	local humanoidModel = p1.humanoidModel
	local modelCFrame = humanoidModel:GetModelCFrame()
	local lookVector = modelCFrame.lookVector
	local humanoidRootPart = humanoidModel:FindFirstChild("HumanoidRootPart")
	
	if humanoidRootPart then
		lookVector = humanoidRootPart.CFrame.lookVector
	end
	lookVector = (CFrame.new(Vector3.new(0, 0, 0), if math.abs(lookVector.Y) > 0.95 then Vector3.new(0, 0, -1) else Vector3.new(lookVector.X, 0, lookVector.Z).unit) * cFrame).lookVector
	local cFrame_1 = CFrame.new(modelCFrame.p + lookVector * 5, modelCFrame.p)
	local extentsSize = humanoidModel:GetExtentsSize()
	p1.updateCameraCFrameBinding(cFrame_1 - cFrame_1.p + humanoidModel:GetModelCFrame().p + lookVector * ((math.max(extentsSize.X, extentsSize.Y) / 2 * 1.428148006742 + extentsSize.Z / 2) * 1))
	p1.updateCameraFocusBinding(modelCFrame)
end

function humanoidViewport.loadIdleAnimation(_, p1)
	local humanoid = p1:FindFirstChildOfClass("Humanoid")
	
	if humanoid.HumanoidDescription.IdleAnimation == 0 then return end
	local animate = p1:FindFirstChild("Animate")
	
	if not animate then return end
	local idle = animate:FindFirstChild("idle")
	
	if not idle then return end
	local animation = idle:FindFirstChildOfClass("Animation")
	
	if animation then
		local var1 = humanoid:LoadAnimation(animation)
		var1.Looped = true
		var1:Play()
		
		return
	end
end

function humanoidViewport.loadHumanoidModel(p1)
	-- upvalues: playersService (ref), promiseModule (ref), AXClusterCompositionTimeoutMs (ref)
	local humanoidDescription = p1.props.humanoidDescription
	local rigType = p1.props.rigType
	coroutine.wrap(function()
		-- upvalues: playersService (copy), humanoidDescription (ref), rigType (ref), p1 (ref), promiseModule (copy), AXClusterCompositionTimeoutMs (copy)
		local var1 = nil
		pcall(function()
			-- upvalues: var1 (write), playersService (copy), humanoidDescription (copy), rigType (copy)
			var1 = playersService:CreateHumanoidModelFromDescriptionAsync(humanoidDescription, rigType)
		end)
		
		if not p1.mounted then return end
		if p1.props.humanoidDescription ~= humanoidDescription then return end
		if p1.props.rigType ~= rigType then return end
		if var1 == nil then
			p1:setState({ loadingFailed = true })
			
			return
		end
		p1.humanoidModel = var1
		
		if p1.worldModelRef:getValue() then
			p1.humanoidModel.Parent = p1.worldModelRef:getValue()
		end
		if #humanoidDescription:GetAccessories(false) > 0 then
			promiseModule.race({
				promiseModule.fromEvent(var1.Humanoid.ClusterCompositionFinished),
				promiseModule.delay(AXClusterCompositionTimeoutMs * 0.001)
			}):await()
		end
		if p1.mounted then
			p1:positionCamera()
			p1:loadIdleAnimation(var1)
			p1:setState({ loading = false, loadingFailed = false })
			
			return
		end
	end)()
end

function humanoidViewport.render(p1)
	-- upvalues: roactModule (ref), skeleton (ref), emptyState (ref), robloxTranslatorModule (ref)
	local loadingFailed = p1.props.loadingFailed or p1.state.loadingFailed
	
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
		ShimmerFrame = not loadingFailed and p1.state.loading and roactModule.createElement(skeleton, {
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}),
		LoadingFailed = loadingFailed and roactModule.createElement(emptyState, {
			text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.ItemsListLoadingFailed"),
			size = UDim2.fromScale(1, 1),
			onActivated = p1.onRetryLoading
		}),
		ViewportFrame = roactModule.createElement("ViewportFrame", {
			BackgroundTransparency = 1,
			Visible = not (loadingFailed or p1.state.loading),
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			LightColor = Color3.fromRGB(240, 240, 240),
			Ambient = Color3.fromRGB(240, 240, 240),
			CurrentCamera = p1.cameraRef
		}, {
			Camera = roactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				FieldOfView = 70,
				CFrame = p1.cameraCFrameBinding,
				Focus = p1.cameraFocusBinding,
				[roactModule.Ref] = p1.cameraRef
			}),
			WorldModel = roactModule.createElement("WorldModel", { [roactModule.Ref] = p1.worldModelRef })
		})
	})
end

function humanoidViewport.didMount(p1)
	p1.mounted = true
	
	if p1.props.humanoidDescription then
		p1:loadHumanoidModel()
	end
end

function humanoidViewport.didUpdate(p1, p2)
	if p1.worldModelRef:getValue() and p1.humanoidModel then
		p1.humanoidModel.Parent = p1.worldModelRef:getValue()
	end
	if p1.props.rigType ~= nil and (p1.props.humanoidDescription ~= nil and (p1.props.humanoidDescription ~= p2.humanoidDescription or p1.props.rigType ~= p2.rigType)) then
		p1:setState({ loading = true })
		
		if p1.props.humanoidDescription ~= nil then
			p1:loadHumanoidModel()
		end
	end
end

function humanoidViewport.willUnmount(p1)
	p1.mounted = false
end

return humanoidViewport