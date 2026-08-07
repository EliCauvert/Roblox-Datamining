local runService = game:GetService("RunService")
local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local _ = game:GetService("VideoCaptureService")
local faceAnimatorService = game:GetService("FaceAnimatorService")
local roactModule = require(corePackagesService.Packages.Roact)
local _ = require(corePackagesService.Packages.UIBlox)
local tModule = require(corePackagesService.Packages.t)
local eventConnection = require(corePackagesService.Packages.ReactUtils).EventConnection
local default = require(coreGuiService.RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local cameraDevicePermissionGrantedSignalModule = require(coreGuiService.RobloxGui.Modules.Settings.cameraDevicePermissionGrantedSignal)
local flashingDot = roactModule.PureComponent:extend("FlashingDot")

local function _(startValue, endValue, alpha) --[[ line: 29 | named "lerpNum" ]]
	return startValue + (endValue - startValue) * alpha
end

flashingDot.validateProps = tModule.strictInterface({})

function flashingDot.init(p0) --[[ line: 35 ]]
	-- upvalues: roactModule (ref), default (ref), faceAnimatorService (ref), cameraDevicePermissionGrantedSignalModule (ref)
	p0:setState({ Visible = false, isUsingMic = false })
	p0.prevTime = 1.570796326795
	p0.prevSinTime = 1
	local var8, var9 = roactModule.createBinding(0)
	p0.transparencyBinding = var8
	p0.updateTransparencyBinding = var9
	
	function p0.checkNewVisibility() --[[ line: 45 ]]
		-- upvalues: default (copy), faceAnimatorService (copy), p0 (ref)
		local var10 = default.localMuted ~= nil and not default.localMuted
		local var10_1 = var10 or faceAnimatorService:IsStarted() and faceAnimatorService.VideoAnimationEnabled
		
		if p0.state.Visible ~= var10_1 then
			p0:setState({ Visible = var10_1, isUsingMic = var10 })
		end
	end
	
	function p0.animationConnection(p1) --[[ line: 61 ]]
		-- upvalues: p0 (ref)
		local var12 = p0.prevTime + p1
		local var13 = math.sin(var12 * 3)
		p0.updateTransparencyBinding(math.abs(p0.prevSinTime) * -0.5 + 0.5)
		p0.prevTime = var12
		p0.prevSinTime = var13
	end
	
	function p0.teardownCameraPermissionGrantedListener() --[[ line: 71 ]]
		-- upvalues: p0 (ref)
		if p0.cameraPermissionGrantedListener then
			p0.cameraPermissionGrantedListener:disconnect()
			p0.cameraPermissionGrantedListener = nil
		end
	end
	
	p0.cameraPermissionGrantedListener = cameraDevicePermissionGrantedSignalModule:connect(function() --[[ line: 79 ]]
		-- upvalues: p0 (ref)
		p0.checkNewVisibility()
	end)
end

function flashingDot.didMount(p2) --[[ line: 84 ]]
	p2.checkNewVisibility()
end

function flashingDot.willUnmount(p3) --[[ line: 88 ]]
	if p3.teardownCameraPermissionGrantedListener then
		p3.teardownCameraPermissionGrantedListener()
	end
end

function flashingDot.render(p4) --[[ line: 94 ]]
	-- upvalues: roactModule (ref), eventConnection (ref), default (ref), faceAnimatorService (ref), runService (ref)
	return roactModule.createElement("Frame", {
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -4, 0, 3),
		Size = UDim2.fromOffset(4, 4),
		Visible = p4.state.Visible
	}, {
		FlashingDot = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/AnimationEditor/FaceCaptureUI/FlashingDot.png",
			LayoutOrder = 2,
			Size = UDim2.fromOffset(4, 4),
			ImageTransparency = p4.transparencyBinding
		}),
		MuteChangedEvent = roactModule.createElement(eventConnection, {
			event = default.muteChanged.Event,
			callback = p4.checkNewVisibility
		}),
		CameraChangedEvent = roactModule.createElement(eventConnection, {
			event = faceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"),
			callback = p4.checkNewVisibility
		}),
		AnimationConnection = if p4.state.Visible then roactModule.createElement(eventConnection, {
			event = runService.RenderStepped,
			callback = p4.animationConnection
		}) else nil
	})
end

return flashingDot