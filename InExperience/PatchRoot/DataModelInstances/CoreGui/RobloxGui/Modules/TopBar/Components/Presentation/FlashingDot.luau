local runService = game:GetService("RunService")
local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local videoCaptureService = game:GetService("VideoCaptureService")
local faceAnimatorService = game:GetService("FaceAnimatorService")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local eventConnection = require(corePackagesService.Packages.ReactUtils).EventConnection
local modules = coreGuiService.RobloxGui.Modules
local default = require(modules.VoiceChat.VoiceChatServiceManager).default
local getCamMicPermissionsModule = require(modules.Settings.getCamMicPermissions)
local flashingDot = roactModule.PureComponent:extend("FlashingDot")

local function _(startValue, endValue, alpha)
	return startValue + (endValue - startValue) * alpha
end

flashingDot.validateProps = tModule.strictInterface({})

function flashingDot.init(p1)
	-- upvalues: roactModule (ref), default (ref), faceAnimatorService (ref), videoCaptureService (ref)
	p1:setState({
		Visible = false,
		isUsingMic = false,
		hasMicPermissions = false,
		hasCameraPermissions = false
	})
	p1.prevTime = 1.570796326795
	p1.prevSinTime = 1
	local var1, var2 = roactModule.createBinding(0)
	p1.transparencyBinding = var1
	p1.updateTransparencyBinding = var2
	
	function p0.checkNewVisibility()
		-- upvalues: p1 (ref), default (copy), faceAnimatorService (copy), videoCaptureService (copy)
		local var3 = p1.state.hasMicPermissions and (default.localMuted ~= nil and not default.localMuted)
		local var4 = var3 or p1.state.hasCameraPermissions and (faceAnimatorService.VideoAnimationEnabled and videoCaptureService.Active)
		
		if p1.state.Visible ~= var4 then
			p1:setState({ Visible = var4, isUsingMic = var3 })
		end
	end
	
	function p0.animationConnection(p2)
		-- upvalues: p1 (ref)
		local var3 = p1.prevTime + p2
		local var4 = math.sin(var3 * 3)
		p1.updateTransparencyBinding(math.abs(p1.prevSinTime) * -0.5 + 0.5)
		p1.prevTime = var3
		p1.prevSinTime = var4
	end
end

function flashingDot.didMount(p1)
	-- upvalues: getCamMicPermissionsModule (ref)
	p1.isMounted = true
	getCamMicPermissionsModule(function(p2)
		-- upvalues: p1 (ref)
		if p1.isMounted then
			p1:setState({
				hasCameraPermissions = p2.hasCameraPermissions,
				hasMicPermissions = p2.hasMicPermissions
			})
			
			return
		end
	end, nil, nil, "FlashingDot.didMount")
	p1.checkNewVisibility()
end

function flashingDot.didUpdate(p1, p2, _)
	if p1.state.hasMicPermissions ~= p2.hasMicPermissions or p1.state.hasCameraPermissions ~= p2.hasCameraPermissions then
		p1.checkNewVisibility()
	end
end

function flashingDot.render(p1)
	-- upvalues: roactModule (ref), eventConnection (ref), default (ref), faceAnimatorService (ref), runService (ref)
	return roactModule.createElement("Frame", {
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -4, 0, 3),
		Size = UDim2.fromOffset(4, 4),
		Visible = p1.state.Visible
	}, {
		FlashingDot = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/AnimationEditor/FaceCaptureUI/FlashingDot.png",
			LayoutOrder = 2,
			Size = UDim2.fromOffset(4, 4),
			ImageTransparency = p1.transparencyBinding
		}),
		MuteChangedEvent = roactModule.createElement(eventConnection, {
			event = default.muteChanged.Event,
			callback = p1.checkNewVisibility
		}),
		CameraChangedEvent = roactModule.createElement(eventConnection, {
			event = faceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"),
			callback = p1.checkNewVisibility
		}),
		AnimationConnection = if p1.state.Visible then roactModule.createElement(eventConnection, {
			event = runService.RenderStepped,
			callback = p1.animationConnection
		}) else nil
	})
end

function flashingDot.willUnmount(p1)
	p1.isMounted = false
end

return flashingDot