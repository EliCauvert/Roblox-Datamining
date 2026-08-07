local faceAnimatorService = game:GetService("FaceAnimatorService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local reactUtilsModule = require(parent.ReactUtils)
local dictionary = require(parent.llama).Dictionary
local sharedFlagsModule = require(parent.SharedFlags)
local eventConnection = reactUtilsModule.EventConnection
local configModule = require(expChat.Config)
local avatarChatUISettings = configModule.AvatarChatUISettings
local permissions = configModule.Permissions
local globalFlagsModule = require(expChat.GlobalFlags)
local fFlagExpChatUseProximityStore = sharedFlagsModule.FFlagExpChatUseProximityStore
local var8 = if fFlagExpChatUseProximityStore then require(parent.ReactIs) else nil
local controlBubbleModule = require(script.Parent.ControlBubble)
local getFFlagExpChatEnableVoiceReverseNudgeModule = require(expChat.Flags.GetFFlagExpChatEnableVoiceReverseNudge)
local getFFlagExpChatUseVoiceParticipantsStore = sharedFlagsModule.GetFFlagExpChatUseVoiceParticipantsStore
local preventMicToggleIfGameConsumedEvent = game:DefineFastFlag("PreventMicToggleIfGameConsumedEvent", false)
local playerButtons = roactModule.PureComponent:extend("PlayerButtons")
playerButtons.defaultProps = { LayoutOrder = 1 }

function playerButtons.init(p0) --[[ line: 41 ]]
	-- upvalues: faceAnimatorService (ref), preventMicToggleIfGameConsumedEvent (ref), getFFlagExpChatUseVoiceParticipantsStore (ref), permissions (ref)
	p0:setState({
		cameraEnabled = if faceAnimatorService then faceAnimatorService:IsStarted() and faceAnimatorService.VideoAnimationEnabled else false
	})
	
	function p0.toggleMic(p1, p2) --[[ line: 49 ]]
		-- upvalues: preventMicToggleIfGameConsumedEvent (copy), p0 (ref), getFFlagExpChatUseVoiceParticipantsStore (copy)
		if preventMicToggleIfGameConsumedEvent and p1 then
			return
		end
		p0.props.onClickedVoiceIndicator(p0.props.userId, if getFFlagExpChatUseVoiceParticipantsStore() then p2 else p0.props.voiceState)
	end
	
	function p0.onVideoButtonPressed() --[[ line: 61 ]]
		-- upvalues: p0 (ref), permissions (copy)
		if p0.props.hasCameraPermissions then
			p0:toggleVideo()
		else
			local var13 = function(p3, _) --[[ line: 64 ]]
				-- upvalues: p0 (copy)
				if p3 then
					p0:toggleVideo()
					
					if p0.props.setCameraPermissionStateFromControl then
						p0.props.setCameraPermissionStateFromControl(p3)
						
						return
					end
				elseif p0.props.displayCameraDeniedToast then
					p0.props.displayCameraDeniedToast()
				end
			end
			
			if p0.props.getPermissions then
				p0.props.getPermissions(var13, permissions.CAMERA_ACCESS)
				
				return
			end
		end
	end
	
	function p0.toggleVideo() --[[ line: 86 ]]
		-- upvalues: p0 (ref)
		p0.props.onClickedCameraIndicator()
	end
	
	function p0.updateVideo() --[[ line: 90 ]]
		-- upvalues: p0 (ref), faceAnimatorService (copy)
		p0:setState({
			cameraEnabled = faceAnimatorService.VideoAnimationEnabled
		})
	end
end

function playerButtons.shouldShowCameraIndicator(p4) --[[ line: 97 ]]
	return p4.props.isLocalPlayer and p4:getCameraButtonVisibleAtMount()
end

function playerButtons.shouldShowMicOffIndicator(p5) --[[ line: 101 ]]
	-- upvalues: globalFlagsModule (ref)
	if not p5.props.isLocalPlayer then
		return false
	end
	local var14 = if p5.props.voiceState ~= "Muted" then p5.props.voiceState == "LOCAL_MUTED" else true
	
	return if globalFlagsModule.JoinWithoutMicPermissions then var14 else var14 or not p5.props.hasMicPermissions
end

function playerButtons.getCameraButtonVisibleAtMount(p6) --[[ line: 114 ]]
	return if p6.props.isCameraOnlyUser and p6.props.isCameraOnlyUser() then false elseif p6.props.isCamEnabledForUserAndPlace then p6.props.isCamEnabledForUserAndPlace() else false
end

function playerButtons.render(p7) --[[ line: 130 ]]
	-- upvalues: globalFlagsModule (ref), getFFlagExpChatUseVoiceParticipantsStore (ref), avatarChatUISettings (ref), roactModule (ref), fFlagExpChatUseProximityStore (ref), var8 (ref), dictionary (ref), controlBubbleModule (ref), faceAnimatorService (ref), eventConnection (ref)
	local var15 = p7.props.hasMicPermissions or p7.props.voiceEnabled
	
	if globalFlagsModule.JoinWithoutMicPermissions then
		var15 = p7.props.voiceEnabled
	end
	local var16 = p7:shouldShowCameraIndicator()
	local var17 = if getFFlagExpChatUseVoiceParticipantsStore() then false else p7:shouldShowMicOffIndicator()
	local var15_1 = var16 and var15
	local chatSettings = p7.props.chatSettings
	local var19 = if var15_1 then avatarChatUISettings.DoubleIconCornerRadiusOffset else avatarChatUISettings.SingleIconCornerRadiusOffset
	local var20 = if var15_1 then avatarChatUISettings.DoubleIconButtonSize else avatarChatUISettings.SingleIconButtonSize
	local var21 = if p7.props.isLocalPlayer then "microphone" else "speaker"
	
	return roactModule.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.new(0.5, 0, 1, -8),
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.fromOffset(0, avatarChatUISettings.FrameHeight),
		LayoutOrder = p7.props.LayoutOrder,
		BackgroundTransparency = chatSettings.BackgroundTransparency,
		BackgroundColor3 = chatSettings.BackgroundColor3,
		Visible = if fFlagExpChatUseProximityStore and var8.isBinding(p7.props.Visible) then p7.props.Visible:map(function(p8) --[[ line: 163 ]]
			-- upvalues: var15 (write), var16 (ref)
			return if p8 then var15 else var16
		end) else var15 or var16
	}, {
		Scale = roactModule.createElement("UIScale", {
			Scale = if not p7.props.isInsideMaximizeDistance then 0.75 else 1
		}),
		UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var19) }),
		Container = roactModule.createElement("ImageLabel", dictionary.join({ BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, chatSettings.ImageLabel), {
			UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var19) }),
			UIListLayout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			MicrophoneBubble = var15 and roactModule.createElement(controlBubbleModule, {
				LayoutOrder = 1,
				onActivated = p7.toggleMic,
				chatSettings = chatSettings,
				controlBubbleSize = var20,
				cornerRadiusOffset = var19,
				iconAssetName = if var17 then "icons/controls/voice/microphone_off_light" else nil,
				iconSize = avatarChatUISettings.IconSize,
				iconTransparency = avatarChatUISettings.IconTransparency,
				voiceState = if getFFlagExpChatUseVoiceParticipantsStore() then nil else p7.props.voiceState,
				iconStyle = var21,
				isUserToxic = if getFFlagExpChatUseVoiceParticipantsStore() then nil else p7.props.isUserToxic,
				userId = if getFFlagExpChatUseVoiceParticipantsStore() then p7.props.userId else nil
			}),
			Divider = var15 and (var16 and roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 2,
				ZIndex = 1,
				Size = avatarChatUISettings.DividerSize,
				AnchorPoint = Vector2.new(0.5, 1),
				BackgroundColor3 = avatarChatUISettings.DividerColor
			})),
			CameraBubble = var16 and roactModule.createElement(controlBubbleModule, {
				LayoutOrder = 3,
				onActivated = p7.onVideoButtonPressed or p7.toggleVideo,
				chatSettings = chatSettings,
				cornerRadiusOffset = var19,
				controlBubbleSize = var20,
				iconAssetName = if p7.state.cameraEnabled and p7:getCameraButtonVisibleAtMount() then "icons/controls/voice/video_on_light" else "icons/controls/voice/video_off_light",
				iconSize = avatarChatUISettings.IconSize,
				iconTransparency = avatarChatUISettings.IconTransparency,
				iconStyle = var21,
				isUserToxic = if getFFlagExpChatUseVoiceParticipantsStore() then nil else p7.props.isUserToxic
			})
		}),
		Carat = chatSettings.TailVisible and roactModule.createElement("ImageLabel", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/InGameChat/Caret.png",
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 1, -1),
			Size = UDim2.fromOffset(12, 8),
			ImageColor3 = chatSettings.BackgroundColor3,
			ImageTransparency = chatSettings.BackgroundTransparency
		}, {
			CaratGradient = chatSettings.UIGradient and roactModule.createElement("UIGradient", chatSettings.UIGradient)
		}),
		BubbleGradient = chatSettings.UIGradient and roactModule.createElement("UIGradient", chatSettings.UIGradient),
		VideoEnabledChanged = faceAnimatorService and roactModule.createElement(eventConnection, {
			event = faceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"),
			callback = p7.updateVideo
		}) or nil
	})
end

return if getFFlagExpChatUseVoiceParticipantsStore() then playerButtons else roactRoduxModule.connect(function(p9, p10) --[[ line: 246 | named "mapStateToProps" ]]
	-- upvalues: getFFlagExpChatEnableVoiceReverseNudgeModule (ref)
	local userId = false
	
	if getFFlagExpChatEnableVoiceReverseNudgeModule() and p9.ReverseNudgeToxicUsers then
		userId = p9.ReverseNudgeToxicUsers[p10.userId]
		
		if userId == nil then
			userId = false
		end
	end
	return {
		voiceState = p9.Voice.participants[p10.userId],
		isUserToxic = userId
	}
end)(playerButtons)