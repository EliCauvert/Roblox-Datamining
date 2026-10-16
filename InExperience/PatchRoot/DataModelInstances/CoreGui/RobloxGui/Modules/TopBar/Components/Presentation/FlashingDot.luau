local RunService = game:GetService("RunService")
local CorePackages = game:GetService("CorePackages")
local VideoCaptureService = game:GetService("VideoCaptureService")
local FaceAnimatorService = game:GetService("FaceAnimatorService")
local RoactModule = require(CorePackages.Packages.Roact)
local EventConnection = require(CorePackages.Packages.ReactUtils).EventConnection
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Default = require(Modules.VoiceChat.VoiceChatServiceManager).default
local GetCamMicPermissionsModule = require(Modules.Settings.getCamMicPermissions)
local FlashingDot = RoactModule.PureComponent:extend("FlashingDot")

local function _(p1, p2, p3) --[[ Line: 26 | Named "lerpNum" ]]
	return p1 + (p2 - p1) * p3
end

FlashingDot.validateProps = require(CorePackages.Packages.t).strictInterface({})

function FlashingDot.init(p1) --[[ Line: 32 ]]
	-- upvalues: RoactModule (copy), Default (copy), FaceAnimatorService (copy), VideoCaptureService (copy)
	p1:setState({
		Visible = false,
		isUsingMic = false,
		hasMicPermissions = false,
		hasCameraPermissions = false
	})
	p1.prevTime = 1.5707963267948966
	p1.prevSinTime = 1
	p1.transparencyBinding, p1.updateTransparencyBinding = RoactModule.createBinding(0)
	
	function p1.checkNewVisibility() --[[ Line: 44 ]]
		-- upvalues: p1 (copy), Default (upval), FaceAnimatorService (upval), VideoCaptureService (upval)
		local NoLocalMuted: boolean = p1.state.hasMicPermissions and (Default.localMuted ~= nil and not Default.localMuted)
		local Active = p1.state.hasCameraPermissions and (FaceAnimatorService.VideoAnimationEnabled and VideoCaptureService.Active)
		local NoLocalMuted1 = NoLocalMuted or Active
		
		if p1.state.Visible ~= NoLocalMuted1 then
			p1:setState({ Visible = NoLocalMuted1, isUsingMic = NoLocalMuted })
		end
	end
	
	function p1.animationConnection(p2) --[[ Line: 66 ]]
		-- upvalues: p1 (copy)
		local NewPrevTime = p1.prevTime + p2
		local Sine = math.sin(NewPrevTime * 3)
		p1.updateTransparencyBinding(math.abs(p1.prevSinTime) * -0.5 + 0.5)
		p1.prevTime = NewPrevTime
		p1.prevSinTime = Sine
	end
end

function FlashingDot.didMount(p1) --[[ Line: 77 ]]
	-- upvalues: GetCamMicPermissionsModule (copy)
	p1.isMounted = true
	GetCamMicPermissionsModule(function(p2) --[[ Line: 79 ]]
		-- upvalues: p1 (copy)
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

function FlashingDot.didUpdate(p1, p2, _) --[[ Line: 93 ]]
	if p1.state.hasMicPermissions ~= p2.hasMicPermissions or p1.state.hasCameraPermissions ~= p2.hasCameraPermissions then
		p1.checkNewVisibility()
	end
end

function FlashingDot.render(p1) --[[ Line: 102 ]]
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

function FlashingDot.willUnmount(p1) --[[ Line: 138 ]]
	p1.isMounted = false
end

return FlashingDot