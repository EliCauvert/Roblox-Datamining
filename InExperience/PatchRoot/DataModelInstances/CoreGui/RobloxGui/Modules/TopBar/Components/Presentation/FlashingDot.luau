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

function flashingDot.init(p0)
	-- upvalues: roactModule (ref), default (ref), faceAnimatorService (ref), videoCaptureService (ref)
	p0:setState({
		Visible = false,
		isUsingMic = false,
		hasMicPermissions = false,
		hasCameraPermissions = false
	})
	p0.prevTime = 1.570796326795
	p0.prevSinTime = 1
	local var9, var10 = roactModule.createBinding(0)
	p0.transparencyBinding = var9
	p0.updateTransparencyBinding = var10
	
	function p0.checkNewVisibility()
		-- upvalues: p0 (ref), default (copy), faceAnimatorService (copy), videoCaptureService (copy)
		local var11 = p0.state.hasMicPermissions and (default.localMuted ~= nil and not default.localMuted)
		local var11_1 = var11 or p0.state.hasCameraPermissions and (faceAnimatorService.VideoAnimationEnabled and videoCaptureService.Active)
		
		if p0.state.Visible ~= var11_1 then
			p0:setState({ Visible = var11_1, isUsingMic = var11 })
		end
	end
	
	function p0.animationConnection(p1)
		-- upvalues: p0 (ref)
		local var13 = p0.prevTime + p1
		local var14 = math.sin(var13 * 3)
		p0.updateTransparencyBinding(math.abs(p0.prevSinTime) * -0.5 + 0.5)
		p0.prevTime = var13
		p0.prevSinTime = var14
	end
end

function flashingDot.didMount(p2)
	-- upvalues: getCamMicPermissionsModule (ref)
	p2.isMounted = true
	getCamMicPermissionsModule(function(p3)
		-- upvalues: p2 (ref)
		if p2.isMounted then
			p2:setState({
				hasCameraPermissions = p3.hasCameraPermissions,
				hasMicPermissions = p3.hasMicPermissions
			})
			
			return
		end
	end, nil, nil, "FlashingDot.didMount")
	p2.checkNewVisibility()
end

function flashingDot.didUpdate(p4, p5, _)
	if p4.state.hasMicPermissions ~= p5.hasMicPermissions or p4.state.hasCameraPermissions ~= p5.hasCameraPermissions then
		p4.checkNewVisibility()
	end
end

function flashingDot.render(p6)
	-- upvalues: roactModule (ref), eventConnection (ref), default (ref), faceAnimatorService (ref), runService (ref)
	return roactModule.createElement("Frame", {
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -4, 0, 3),
		Size = UDim2.fromOffset(4, 4),
		Visible = p6.state.Visible
	}, {
		FlashingDot = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/AnimationEditor/FaceCaptureUI/FlashingDot.png",
			LayoutOrder = 2,
			Size = UDim2.fromOffset(4, 4),
			ImageTransparency = p6.transparencyBinding
		}),
		MuteChangedEvent = roactModule.createElement(eventConnection, {
			event = default.muteChanged.Event,
			callback = p6.checkNewVisibility
		}),
		CameraChangedEvent = roactModule.createElement(eventConnection, {
			event = faceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"),
			callback = p6.checkNewVisibility
		}),
		AnimationConnection = if p6.state.Visible then roactModule.createElement(eventConnection, {
			event = runService.RenderStepped,
			callback = p6.animationConnection
		}) else nil
	})
end

function flashingDot.willUnmount(p7)
	p7.isMounted = false
end

return flashingDot