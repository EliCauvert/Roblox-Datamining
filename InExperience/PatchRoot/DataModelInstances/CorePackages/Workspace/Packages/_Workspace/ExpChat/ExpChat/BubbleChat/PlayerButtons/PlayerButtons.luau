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
local var1 = if fFlagExpChatUseProximityStore then require(parent.ReactIs) else nil
local controlBubbleModule = require(script.Parent.ControlBubble)
local getFFlagExpChatEnableVoiceReverseNudgeModule = require(expChat.Flags.GetFFlagExpChatEnableVoiceReverseNudge)
local getFFlagExpChatUseVoiceParticipantsStore = sharedFlagsModule.GetFFlagExpChatUseVoiceParticipantsStore
local preventMicToggleIfGameConsumedEvent = game:DefineFastFlag("PreventMicToggleIfGameConsumedEvent", false)
local playerButtons = roactModule.PureComponent:extend("PlayerButtons")
playerButtons.defaultProps = { LayoutOrder = 1 }

function playerButtons.init(p1)
	-- upvalues: faceAnimatorService (ref), preventMicToggleIfGameConsumedEvent (ref), getFFlagExpChatUseVoiceParticipantsStore (ref), permissions (ref)
	p1:setState({
		cameraEnabled = if faceAnimatorService then faceAnimatorService:IsStarted() and faceAnimatorService.VideoAnimationEnabled else false
	})
	
	function p0.toggleMic(p2, p3)
		-- upvalues: preventMicToggleIfGameConsumedEvent (copy), p1 (ref), getFFlagExpChatUseVoiceParticipantsStore (copy)
		if preventMicToggleIfGameConsumedEvent and p2 then
			return
		end
		p1.props.onClickedVoiceIndicator(p1.props.userId, if getFFlagExpChatUseVoiceParticipantsStore() then p3 else p1.props.voiceState)
	end
	
	function p0.onVideoButtonPressed()
		-- upvalues: p1 (ref), permissions (copy)
		if p1.props.hasCameraPermissions then
			p1:toggleVideo()
		else
			local var2 = function(p2, _)
				-- upvalues: p1 (copy)
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
				p1.props.getPermissions(var2, permissions.CAMERA_ACCESS)
				
				return
			end
		end
	end
	
	function p0.toggleVideo()
		-- upvalues: p1 (ref)
		p1.props.onClickedCameraIndicator()
	end
	
	function p0.updateVideo()
		-- upvalues: p1 (ref), faceAnimatorService (copy)
		p1:setState({
			cameraEnabled = faceAnimatorService.VideoAnimationEnabled
		})
	end
end

function playerButtons.shouldShowCameraIndicator(p1)
	return p1.props.isLocalPlayer and p1:getCameraButtonVisibleAtMount()
end

function playerButtons.shouldShowMicOffIndicator(p1)
	-- upvalues: globalFlagsModule (ref)
	if not p1.props.isLocalPlayer then
		return false
	end
	local var2 = if p1.props.voiceState ~= "Muted" then p1.props.voiceState == "LOCAL_MUTED" else true
	
	return if globalFlagsModule.JoinWithoutMicPermissions then var2 else var2 or not p1.props.hasMicPermissions
end

function playerButtons.getCameraButtonVisibleAtMount(p1)
	return if p1.props.isCameraOnlyUser and p1.props.isCameraOnlyUser() then false elseif p1.props.isCamEnabledForUserAndPlace then p1.props.isCamEnabledForUserAndPlace() else false
end

function playerButtons.render(p1)
	-- upvalues: globalFlagsModule (ref), getFFlagExpChatUseVoiceParticipantsStore (ref), avatarChatUISettings (ref), roactModule (ref), fFlagExpChatUseProximityStore (ref), var1 (ref), dictionary (ref), controlBubbleModule (ref), faceAnimatorService (ref), eventConnection (ref)
	local var2 = p1.props.hasMicPermissions or p1.props.voiceEnabled
	
	if globalFlagsModule.JoinWithoutMicPermissions then
		var2 = p1.props.voiceEnabled
	end
	local var3 = p1:shouldShowCameraIndicator()
	local var4 = if getFFlagExpChatUseVoiceParticipantsStore() then false else p1:shouldShowMicOffIndicator()
	local var5 = var3 and var2
	local chatSettings = p1.props.chatSettings
	local var6 = if var5 then avatarChatUISettings.DoubleIconCornerRadiusOffset else avatarChatUISettings.SingleIconCornerRadiusOffset
	local var7 = if var5 then avatarChatUISettings.DoubleIconButtonSize else avatarChatUISettings.SingleIconButtonSize
	local var8 = if p1.props.isLocalPlayer then "microphone" else "speaker"
	
	return roactModule.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.new(0.5, 0, 1, -8),
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.fromOffset(0, avatarChatUISettings.FrameHeight),
		LayoutOrder = p1.props.LayoutOrder,
		BackgroundTransparency = chatSettings.BackgroundTransparency,
		BackgroundColor3 = chatSettings.BackgroundColor3,
		Visible = if fFlagExpChatUseProximityStore and var1.isBinding(p1.props.Visible) then p1.props.Visible:map(function(p2)
			-- upvalues: var2 (write), var3 (ref)
			return if p2 then var2 else var3
		end) else var2 or var3
	}, {
		Scale = roactModule.createElement("UIScale", {
			Scale = if not p1.props.isInsideMaximizeDistance then 0.75 else 1
		}),
		UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var6) }),
		Container = roactModule.createElement("ImageLabel", dictionary.join({ BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, chatSettings.ImageLabel), {
			UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var6) }),
			UIListLayout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			MicrophoneBubble = var2 and roactModule.createElement(controlBubbleModule, {
				LayoutOrder = 1,
				onActivated = p1.toggleMic,
				chatSettings = chatSettings,
				controlBubbleSize = var7,
				cornerRadiusOffset = var6,
				iconAssetName = if var4 then "icons/controls/voice/microphone_off_light" else nil,
				iconSize = avatarChatUISettings.IconSize,
				iconTransparency = avatarChatUISettings.IconTransparency,
				voiceState = if getFFlagExpChatUseVoiceParticipantsStore() then nil else p1.props.voiceState,
				iconStyle = var8,
				isUserToxic = if getFFlagExpChatUseVoiceParticipantsStore() then nil else p1.props.isUserToxic,
				userId = if getFFlagExpChatUseVoiceParticipantsStore() then p1.props.userId else nil
			}),
			Divider = var2 and (var3 and roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 2,
				ZIndex = 1,
				Size = avatarChatUISettings.DividerSize,
				AnchorPoint = Vector2.new(0.5, 1),
				BackgroundColor3 = avatarChatUISettings.DividerColor
			})),
			CameraBubble = var3 and roactModule.createElement(controlBubbleModule, {
				LayoutOrder = 3,
				onActivated = p1.onVideoButtonPressed or p1.toggleVideo,
				chatSettings = chatSettings,
				cornerRadiusOffset = var6,
				controlBubbleSize = var7,
				iconAssetName = if p1.state.cameraEnabled and p1:getCameraButtonVisibleAtMount() then "icons/controls/voice/video_on_light" else "icons/controls/voice/video_off_light",
				iconSize = avatarChatUISettings.IconSize,
				iconTransparency = avatarChatUISettings.IconTransparency,
				iconStyle = var8,
				isUserToxic = if getFFlagExpChatUseVoiceParticipantsStore() then nil else p1.props.isUserToxic
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
			callback = p1.updateVideo
		}) or nil
	})
end

return if getFFlagExpChatUseVoiceParticipantsStore() then playerButtons else roactRoduxModule.connect(function(p1, p2)
	-- upvalues: getFFlagExpChatEnableVoiceReverseNudgeModule (ref)
	local userId = false
	
	if getFFlagExpChatEnableVoiceReverseNudgeModule() and p1.ReverseNudgeToxicUsers then
		userId = p1.ReverseNudgeToxicUsers[p2.userId]
		
		if userId == nil then
			userId = false
		end
	end
	return {
		voiceState = p1.Voice.participants[p2.userId],
		isUserToxic = userId
	}
end)(playerButtons)