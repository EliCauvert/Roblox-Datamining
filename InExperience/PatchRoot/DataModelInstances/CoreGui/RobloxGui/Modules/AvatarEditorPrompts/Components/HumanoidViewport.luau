local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local Skeleton = require(CorePackages.Packages.Foundation).Skeleton
local PromiseModule = require(CorePackages.Packages.Promise)
local EmptyState = require(CorePackages.Packages.UIBlox).App.Indicator.EmptyState
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local _CFrame = CFrame.fromEulerAnglesXYZ(0.3490658503988659, 0.2617993877991494, 0.6981317007977318)
local AXClusterCompositionTimeoutMs = game:DefineFastInt("AXClusterCompositionTimeoutMs", 3000)
local HumanoidViewport = RoactModule.PureComponent:extend("HumanoidViewport")
HumanoidViewport.validateProps = TModule.strictInterface({
	humanoidDescription = TModule.optional(TModule.instanceOf("HumanoidDescription")),
	loadingFailed = TModule.boolean,
	retryLoadDescription = TModule.callback,
	rigType = TModule.optional(TModule.enum(Enum.HumanoidRigType))
})

function HumanoidViewport.init(p1) --[[ Line: 34 ]]
	-- upvalues: RoactModule (copy)
	p1:setState({ loading = true, loadingFailed = false })
	p1.cameraRef = RoactModule.createRef()
	p1.worldModelRef = RoactModule.createRef()
	p1.cameraCFrameBinding, p1.updateCameraCFrameBinding = RoactModule.createBinding(CFrame.new())
	p1.cameraFocusBinding, p1.updateCameraFocusBinding = RoactModule.createBinding(CFrame.new())
	p1.humanoidModel = nil
	p1.mounted = false
	
	function p1.onRetryLoading() --[[ Line: 50 ]]
		-- upvalues: p1 (copy)
		p1:setState({ loading = true, loadingFailed = false })
		
		if p1.props.humanoidDescription then
			p1:loadHumanoidModel()
			
			return
		else
			p1.props.retryLoadDescription()
		end
	end
end

local function _(Vector) --[[ Line: 64 | Named "rotateLookVector" ]]
	-- upvalues: _CFrame (copy)
	return (CFrame.new(vector.create(0, 0, 0), if math.abs(Vector.Y) > 0.95 then vector.create(0, 0, -1) else Vector3.new(Vector.X, 0, Vector.Z).unit) * _CFrame).lookVector
end

local _ = function(Degrees: number, Vector): number --[[ Line: 77 | Named "getCameraOffset" ]]
	return math.max(Vector.X, Vector.Y) / 2 * (1 / math.tan(math.rad(Degrees) / 2)) + Vector.Z / 2
end

local _ = function(Model: Model, p1, p2) --[[ Line: 87 | Named "zoomExtents" ]]
	local ExtentsSize = Model:GetExtentsSize()
	
	return p2 - p2.p + Model:GetModelCFrame().p + p1 * ((math.max(ExtentsSize.X, ExtentsSize.Y) / 2 * 1.4281480067421146 + ExtentsSize.Z / 2) * 1)
end

function HumanoidViewport.positionCamera(p1) --[[ Line: 98 ]]
	-- upvalues: _CFrame (copy)
	local HumanoidModel = p1.humanoidModel
	local ModelCFrame = HumanoidModel:GetModelCFrame()
	local LookVector = ModelCFrame.lookVector
	local HumanoidRootPart = HumanoidModel:FindFirstChild("HumanoidRootPart")
	
	if HumanoidRootPart then
		LookVector = HumanoidRootPart.CFrame.lookVector
	end
	local LookVector1: number = (CFrame.new(vector.create(0, 0, 0), if math.abs(LookVector.Y) > 0.95 then vector.create(0, 0, -1) else Vector3.new(LookVector.X, 0, LookVector.Z).unit) * _CFrame).lookVector
	local _CFrame1 = CFrame.new(ModelCFrame.p + LookVector1 * 5, ModelCFrame.p)
	local ExtentsSize = HumanoidModel:GetExtentsSize()
	p1.updateCameraCFrameBinding(_CFrame1 - _CFrame1.p + HumanoidModel:GetModelCFrame().p + LookVector1 * ((math.max(ExtentsSize.X, ExtentsSize.Y) / 2 * 1.4281480067421146 + ExtentsSize.Z / 2) * 1))
	p1.updateCameraFocusBinding(ModelCFrame)
end

function HumanoidViewport:loadIdleAnimation(Object) --[[ Line: 115 ]]
	local Humanoid = Object:FindFirstChildOfClass("Humanoid")
	
	if Humanoid.HumanoidDescription.IdleAnimation == 0 then return end
	local Animate = Object:FindFirstChild("Animate")
	
	if not Animate then return end
	local Idle = Animate:FindFirstChild("idle")
	
	if not Idle then return end
	local Animation = Idle:FindFirstChildOfClass("Animation")
	
	if Animation then
		local AnimationTrack = Humanoid:LoadAnimation(Animation)
		AnimationTrack.Looped = true
		AnimationTrack:Play()
		
		return
	end
end

function HumanoidViewport.loadHumanoidModel(p1) --[[ Line: 143 ]]
	-- upvalues: Players (copy), PromiseModule (copy), AXClusterCompositionTimeoutMs (copy)
	local HumanoidDescription = p1.props.humanoidDescription
	local RigType = p1.props.rigType
	coroutine.wrap(function() --[[ Line: 147 ]]
		-- upvalues: Players (upval), HumanoidDescription (copy), RigType (copy), p1 (copy), PromiseModule (upval), AXClusterCompositionTimeoutMs (upval)
		local HumanoidModelFromDescriptionAsync = nil
		pcall(function() --[[ Line: 149 ]]
			-- upvalues: HumanoidModelFromDescriptionAsync (ref), Players (upval), HumanoidDescription (upval), RigType (upval)
			HumanoidModelFromDescriptionAsync = Players:CreateHumanoidModelFromDescriptionAsync(HumanoidDescription, RigType)
		end)
		
		if not p1.mounted then return end
		if p1.props.humanoidDescription ~= HumanoidDescription then return end
		if p1.props.rigType ~= RigType then return end
		if HumanoidModelFromDescriptionAsync == nil then
			p1:setState({ loadingFailed = true })
			
			return
		end
		p1.humanoidModel = HumanoidModelFromDescriptionAsync
		
		if p1.worldModelRef:getValue() then
			p1.humanoidModel.Parent = p1.worldModelRef:getValue()
		end
		if #HumanoidDescription:GetAccessories(false) > 0 then
			PromiseModule.race({
				PromiseModule.fromEvent(HumanoidModelFromDescriptionAsync.Humanoid.ClusterCompositionFinished),
				PromiseModule.delay(AXClusterCompositionTimeoutMs * 0.001)
			}):await()
		end
		if p1.mounted then
			p1:positionCamera()
			p1:loadIdleAnimation(HumanoidModelFromDescriptionAsync)
			p1:setState({ loading = false, loadingFailed = false })
			
			return
		end
	end)()
end

function HumanoidViewport.render(p1) --[[ Line: 201 ]]
	-- upvalues: RoactModule (copy), Skeleton (copy), EmptyState (copy), RobloxTranslatorModule (copy)
	local LoadingFailed = p1.props.loadingFailed or p1.state.loadingFailed
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, {
		AspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}),
		ShimmerFrame = not LoadingFailed and p1.state.loading and RoactModule.createElement(Skeleton, {
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}),
		LoadingFailed = LoadingFailed and RoactModule.createElement(EmptyState, {
			text = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.ItemsListLoadingFailed"),
			size = UDim2.fromScale(1, 1),
			onActivated = p1.onRetryLoading
		}),
		ViewportFrame = RoactModule.createElement("ViewportFrame", {
			BackgroundTransparency = 1,
			Visible = not (LoadingFailed or p1.state.loading),
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			LightColor = Color3.fromRGB(240, 240, 240),
			Ambient = Color3.fromRGB(240, 240, 240),
			CurrentCamera = p1.cameraRef
		}, {
			Camera = RoactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				FieldOfView = 70,
				CFrame = p1.cameraCFrameBinding,
				Focus = p1.cameraFocusBinding,
				[RoactModule.Ref] = p1.cameraRef
			}),
			WorldModel = RoactModule.createElement("WorldModel", { [RoactModule.Ref] = p1.worldModelRef })
		})
	})
end

function HumanoidViewport.didMount(p1) --[[ Line: 257 ]]
	p1.mounted = true
	
	if p1.props.humanoidDescription then
		p1:loadHumanoidModel()
	end
end

function HumanoidViewport.didUpdate(p1, p2) --[[ Line: 265 ]]
	if p1.worldModelRef:getValue() and p1.humanoidModel then
		p1.humanoidModel.Parent = p1.worldModelRef:getValue()
	end
	local IsNotHumanoidDescriptionMatch = p1.props.humanoidDescription ~= p2.humanoidDescription
	local IsNotRigTypeMatch = p1.props.rigType ~= p2.rigType
	
	if p1.props.rigType ~= nil and (p1.props.humanoidDescription ~= nil and (IsNotHumanoidDescriptionMatch or IsNotRigTypeMatch)) then
		p1:setState({ loading = true })
		
		if p1.props.humanoidDescription ~= nil then
			p1:loadHumanoidModel()
		end
	end
end

function HumanoidViewport.willUnmount(p1) --[[ Line: 287 ]]
	p1.mounted = false
end

return HumanoidViewport