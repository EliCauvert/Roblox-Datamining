local FaceAnimatorService = game:GetService("FaceAnimatorService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local RoactModule = require(Parent.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local Dictionary = require(Parent.llama).Dictionary
local SharedFlagsModule = require(Parent.SharedFlags)
local EventConnection = require(Parent.ReactUtils).EventConnection
local ConfigModule = require(ExpChat.Config)
local AvatarChatUISettings = ConfigModule.AvatarChatUISettings
local Permissions = ConfigModule.Permissions
local GlobalFlagsModule = require(ExpChat.GlobalFlags)
local FFlagExpChatUseProximityStore = SharedFlagsModule.FFlagExpChatUseProximityStore
local ReactIsModule = if FFlagExpChatUseProximityStore then require(Parent.ReactIs) else nil
local ControlBubbleModule = require(script.Parent.ControlBubble)
local GetFFlagExpChatEnableVoiceReverseNudgeModule = require(ExpChat.Flags.GetFFlagExpChatEnableVoiceReverseNudge)
local GetFFlagExpChatUseVoiceParticipantsStoreFunction = SharedFlagsModule.GetFFlagExpChatUseVoiceParticipantsStore
local PreventMicToggleIfGameConsumedEvent = game:DefineFastFlag("PreventMicToggleIfGameConsumedEvent", false)
local PlayerButtons = RoactModule.PureComponent:extend("PlayerButtons")
PlayerButtons.defaultProps = { LayoutOrder = 1 }

function PlayerButtons.init(p1)
	-- upvalues: FaceAnimatorService (copy), PreventMicToggleIfGameConsumedEvent (copy), GetFFlagExpChatUseVoiceParticipantsStoreFunction (copy), Permissions (copy)
	p1:setState({
		cameraEnabled = if FaceAnimatorService then FaceAnimatorService:IsStarted() and FaceAnimatorService.VideoAnimationEnabled else false
	})
	
	function p1.toggleMic(p2, p3)
		-- upvalues: PreventMicToggleIfGameConsumedEvent (upval), p1 (copy), GetFFlagExpChatUseVoiceParticipantsStoreFunction (upval)
		if not PreventMicToggleIfGameConsumedEvent or not p2 then
			p1.props.onClickedVoiceIndicator(p1.props.userId, if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then p3 else p1.props.voiceState)
			
			return
		end
	end
	
	function p1.onVideoButtonPressed()
		-- upvalues: p1 (copy), Permissions (upval)
		if p1.props.hasCameraPermissions then
			p1:toggleVideo()
		else
			local function v19(p2, _)
				-- upvalues: p1 (upval)
				if p2 then
					p1:toggleVideo()
					
					if p1.props.setCameraPermissionStateFromControl then
						p1.props.setCameraPermissionStateFromControl(p2)
						
						return
					end
				elseif p1.props.displayCameraDeniedToast then
					p1.props.displayCameraDeniedToast()
				end
			end
			
			if p1.props.getPermissions then
				p1.props.getPermissions(v19, Permissions.CAMERA_ACCESS)
				
				return
			end
		end
	end
	
	function p1.toggleVideo()
		-- upvalues: p1 (copy)
		p1.props.onClickedCameraIndicator()
	end
	
	function p1.updateVideo()
		-- upvalues: p1 (copy), FaceAnimatorService (upval)
		p1:setState({
			cameraEnabled = FaceAnimatorService.VideoAnimationEnabled
		})
	end
end

function PlayerButtons.shouldShowCameraIndicator(p1)
	return p1.props.isLocalPlayer and p1:getCameraButtonVisibleAtMount()
end

function PlayerButtons.shouldShowMicOffIndicator(p1): boolean
	-- upvalues: GlobalFlagsModule (copy)
	if p1.props.isLocalPlayer then
		local IsMuted: boolean = p1.props.voiceState == "Muted" or p1.props.voiceState == "LOCAL_MUTED"
		
		return if GlobalFlagsModule.JoinWithoutMicPermissions then IsMuted else IsMuted or not p1.props.hasMicPermissions
	else
		return false
	end
end

function PlayerButtons.getCameraButtonVisibleAtMount(p1)
	return (not p1.props.isCameraOnlyUser or not p1.props.isCameraOnlyUser()) and (if p1.props.isCamEnabledForUserAndPlace then p1.props.isCamEnabledForUserAndPlace() else false)
end

function PlayerButtons.render(p1)
	-- upvalues: GlobalFlagsModule (copy), GetFFlagExpChatUseVoiceParticipantsStoreFunction (copy), AvatarChatUISettings (copy), RoactModule (copy), FFlagExpChatUseProximityStore (copy), ReactIsModule (copy), Dictionary (copy), ControlBubbleModule (copy), FaceAnimatorService (copy), EventConnection (copy)
	local VoiceEnabled = if p1.props.hasMicPermissions then if GlobalFlagsModule.JoinWithoutMicPermissions then p1.props.voiceEnabled else p1.props.hasMicPermissions elseif GlobalFlagsModule.JoinWithoutMicPermissions then p1.props.voiceEnabled else p1.props.voiceEnabled
	local ShouldShowCameraIndicator = p1:shouldShowCameraIndicator()
	local ShouldShowMicOffIndicator = not GetFFlagExpChatUseVoiceParticipantsStoreFunction() and p1:shouldShowMicOffIndicator()
	local VoiceEnabled1 = ShouldShowCameraIndicator and VoiceEnabled
	local ChatSettings = p1.props.chatSettings
	local DoubleIconCornerRadiusOffset = VoiceEnabled1 and AvatarChatUISettings.DoubleIconCornerRadiusOffset or AvatarChatUISettings.SingleIconCornerRadiusOffset
	local DoubleIconButtonSize = VoiceEnabled1 and AvatarChatUISettings.DoubleIconButtonSize or AvatarChatUISettings.SingleIconButtonSize
	local Microphone: string = if p1.props.isLocalPlayer then "microphone" else "speaker"
	local VideoOnLight: string = if p1.state.cameraEnabled and p1:getCameraButtonVisibleAtMount() then "icons/controls/voice/video_on_light" else "icons/controls/voice/video_off_light"
	
	return RoactModule.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.new(0.5, 0, 1, -8),
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.fromOffset(0, AvatarChatUISettings.FrameHeight),
		LayoutOrder = p1.props.LayoutOrder,
		BackgroundTransparency = ChatSettings.BackgroundTransparency,
		BackgroundColor3 = ChatSettings.BackgroundColor3,
		Visible = if FFlagExpChatUseProximityStore and ReactIsModule.isBinding(p1.props.Visible) then p1.props.Visible:map(function(p2)
			-- upvalues: VoiceEnabled (ref), ShouldShowCameraIndicator (copy)
			return p2 and VoiceEnabled or ShouldShowCameraIndicator
		end) else VoiceEnabled or ShouldShowCameraIndicator
	}, {
		Scale = RoactModule.createElement("UIScale", {
			Scale = if p1.props.isInsideMaximizeDistance then 1 else 0.75
		}),
		UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, DoubleIconCornerRadiusOffset) }),
		Container = RoactModule.createElement("ImageLabel", Dictionary.join({ BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, ChatSettings.ImageLabel), {
			UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, DoubleIconCornerRadiusOffset) }),
			UIListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			MicrophoneBubble = VoiceEnabled and RoactModule.createElement(ControlBubbleModule, {
				LayoutOrder = 1,
				onActivated = p1.toggleMic,
				chatSettings = ChatSettings,
				controlBubbleSize = DoubleIconButtonSize,
				cornerRadiusOffset = DoubleIconCornerRadiusOffset,
				iconAssetName = if ShouldShowMicOffIndicator then "icons/controls/voice/microphone_off_light" else nil,
				iconSize = AvatarChatUISettings.IconSize,
				iconTransparency = AvatarChatUISettings.IconTransparency,
				voiceState = if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then nil else p1.props.voiceState,
				iconStyle = Microphone,
				isUserToxic = if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then nil else p1.props.isUserToxic,
				userId = if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then p1.props.userId else nil
			}),
			Divider = VoiceEnabled and (ShouldShowCameraIndicator and RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 2,
				ZIndex = 1,
				Size = AvatarChatUISettings.DividerSize,
				AnchorPoint = Vector2.new(0.5, 1),
				BackgroundColor3 = AvatarChatUISettings.DividerColor
			})),
			CameraBubble = ShouldShowCameraIndicator and RoactModule.createElement(ControlBubbleModule, {
				LayoutOrder = 3,
				onActivated = p1.onVideoButtonPressed or p1.toggleVideo,
				chatSettings = ChatSettings,
				cornerRadiusOffset = DoubleIconCornerRadiusOffset,
				controlBubbleSize = DoubleIconButtonSize,
				iconAssetName = VideoOnLight,
				iconSize = AvatarChatUISettings.IconSize,
				iconTransparency = AvatarChatUISettings.IconTransparency,
				iconStyle = Microphone,
				isUserToxic = if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then nil else p1.props.isUserToxic
			})
		}),
		Carat = ChatSettings.TailVisible and RoactModule.createElement("ImageLabel", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/InGameChat/Caret.png",
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 1, -1),
			Size = UDim2.fromOffset(12, 8),
			ImageColor3 = ChatSettings.BackgroundColor3,
			ImageTransparency = ChatSettings.BackgroundTransparency
		}, {
			CaratGradient = ChatSettings.UIGradient and RoactModule.createElement("UIGradient", ChatSettings.UIGradient)
		}),
		BubbleGradient = ChatSettings.UIGradient and RoactModule.createElement("UIGradient", ChatSettings.UIGradient),
		VideoEnabledChanged = FaceAnimatorService and RoactModule.createElement(EventConnection, {
			event = FaceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"),
			callback = p1.updateVideo
		}) or nil
	})
end

local function mapStateToProps(p1, p2)
	-- upvalues: GetFFlagExpChatEnableVoiceReverseNudgeModule (copy)
	local ReverseNudgeToxicUser = false
	
	if GetFFlagExpChatEnableVoiceReverseNudgeModule() and p1.ReverseNudgeToxicUsers then
		ReverseNudgeToxicUser = p1.ReverseNudgeToxicUsers[p2.userId]
		
		if ReverseNudgeToxicUser == nil then
			ReverseNudgeToxicUser = false
		end
	end
	return {
		voiceState = p1.Voice.participants[p2.userId],
		isUserToxic = ReverseNudgeToxicUser
	}
end

return if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then PlayerButtons else RoactRoduxModule.connect(mapStateToProps)(PlayerButtons)