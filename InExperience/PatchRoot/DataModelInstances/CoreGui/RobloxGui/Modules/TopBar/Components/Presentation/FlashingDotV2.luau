local RunService = game:GetService("RunService")
local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local _ = game:GetService("VideoCaptureService")
local FaceAnimatorService = game:GetService("FaceAnimatorService")
local RoactModule = require(CorePackages.Packages.Roact)
local _ = require(CorePackages.Packages.UIBlox)
local EventConnection = require(CorePackages.Packages.ReactUtils).EventConnection
local Default = require(CoreGui.RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local CameraDevicePermissionGrantedSignalModule = require(CoreGui.RobloxGui.Modules.Settings.cameraDevicePermissionGrantedSignal)
local FlashingDot = RoactModule.PureComponent:extend("FlashingDot")

local function _(p1, p2, p3) --[[ Line: 29 | Named "lerpNum" ]]
	return p1 + (p2 - p1) * p3
end

FlashingDot.validateProps = require(CorePackages.Packages.t).strictInterface({})

function FlashingDot.init(p1) --[[ Line: 35 ]]
	-- upvalues: RoactModule (copy), Default (copy), FaceAnimatorService (copy), CameraDevicePermissionGrantedSignalModule (copy)
	p1:setState({ Visible = false, isUsingMic = false })
	p1.prevTime = 1.5707963267948966
	p1.prevSinTime = 1
	p1.transparencyBinding, p1.updateTransparencyBinding = RoactModule.createBinding(0)
	
	function p1.checkNewVisibility() --[[ Line: 45 ]]
		-- upvalues: Default (upval), FaceAnimatorService (upval), p1 (copy)
		local NoLocalMuted: boolean = Default.localMuted ~= nil and not Default.localMuted
		local VideoAnimationEnabled = FaceAnimatorService:IsStarted() and FaceAnimatorService.VideoAnimationEnabled
		local NoLocalMuted1 = NoLocalMuted or VideoAnimationEnabled
		
		if p1.state.Visible ~= NoLocalMuted1 then
			p1:setState({ Visible = NoLocalMuted1, isUsingMic = NoLocalMuted })
		end
	end
	
	function p1.animationConnection(p2) --[[ Line: 61 ]]
		-- upvalues: p1 (copy)
		local NewPrevTime = p1.prevTime + p2
		local Sine = math.sin(NewPrevTime * 3)
		p1.updateTransparencyBinding(math.abs(p1.prevSinTime) * -0.5 + 0.5)
		p1.prevTime = NewPrevTime
		p1.prevSinTime = Sine
	end
	
	function p1.teardownCameraPermissionGrantedListener() --[[ Line: 71 ]]
		-- upvalues: p1 (copy)
		if p1.cameraPermissionGrantedListener then
			p1.cameraPermissionGrantedListener:disconnect()
			p1.cameraPermissionGrantedListener = nil
		end
	end
	
	p1.cameraPermissionGrantedListener = CameraDevicePermissionGrantedSignalModule:connect(function() --[[ Line: 79 ]]
		-- upvalues: p1 (copy)
		p1.checkNewVisibility()
	end)
end

function FlashingDot.didMount(p1) --[[ Line: 84 ]]
	p1.checkNewVisibility()
end

function FlashingDot.willUnmount(p1) --[[ Line: 88 ]]
	if p1.teardownCameraPermissionGrantedListener then
		p1.teardownCameraPermissionGrantedListener()
	end
end

function FlashingDot.render(p1) --[[ Line: 94 ]]
	-- upvalues: RoactModule (copy), EventConnection (copy), Default (copy), FaceAnimatorService (copy), RunService (copy)
	return RoactModule.createElement("Frame", {
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -4, 0, 3),
		Size = UDim2.fromOffset(4, 4),
		Visible = p1.state.Visible
	}, {
		FlashingDot = RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/AnimationEditor/FaceCaptureUI/FlashingDot.png",
			LayoutOrder = 2,
			Size = UDim2.fromOffset(4, 4),
			ImageTransparency = p1.transparencyBinding
		}),
		MuteChangedEvent = RoactModule.createElement(EventConnection, {
			event = Default.muteChanged.Event,
			callback = p1.checkNewVisibility
		}),
		CameraChangedEvent = RoactModule.createElement(EventConnection, {
			event = FaceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"),
			callback = p1.checkNewVisibility
		}),
		AnimationConnection = if p1.state.Visible then RoactModule.createElement(EventConnection, {
			event = RunService.RenderStepped,
			callback = p1.animationConnection
		}) else nil
	})
end

return FlashingDot