local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local starterGuiService = game:GetService("StarterGui")
local VRService = game:GetService("VRService")
local var7 = require(script.Parent.Parent.Logger)(script.Name)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local otterModule = require(corePackagesService.Packages.Otter)
local bubbleChatListModule = require(script.Parent.BubbleChatList)
local chatBubbleDistantModule = require(script.Parent.ChatBubbleDistant)
local voiceBubbleModule = require(script.Parent.VoiceBubble)
local voiceIndicatorModule = require(robloxGui.Modules.VoiceChat.Components.VoiceIndicator)
local typesModule = require(script.Parent.Parent.Types)
local constantsModule = require(script.Parent.Parent.Constants)
local getSettingsForMessageModule = require(script.Parent.Parent.Helpers.getSettingsForMessage)
local selfViewVisibilityUpdatedSignalModule = require(robloxGui.Modules.SelfView.selfViewVisibilityUpdatedSignal)
local enabled = require(corePackagesService.Workspace.Packages.Chrome).Enabled
local constantsModule_1 = require(robloxGui.Modules.VoiceChat.Constants)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local getFFlagMicConnectingToastModule = require(robloxGui.Modules.Flags.GetFFlagMicConnectingToast)
local getFFlagBubbleChatInexistantAdorneeFixModule = require(robloxGui.Modules.Flags.GetFFlagBubbleChatInexistantAdorneeFix)
local publicApiModule = require(robloxGui.Modules.SelfView.publicApi)
local bubbleVoiceTimeoutMillis = game:DefineFastInt("BubbleVoiceTimeoutMillis", 1000)
local debugAllowControlButtonsNoVoiceChat = game:DefineFastFlag("DebugAllowControlButtonsNoVoiceChat", false)
local IXPServiceWrapper = require(corePackagesService.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local easierUnmuting3 = game:DefineFastFlag("EasierUnmuting3", false)
local easierUnmutingBasedOnCamera = game:DefineFastFlag("EasierUnmutingBasedOnCamera", false)
local easierUnmutingHideIfMuted = game:DefineFastFlag("EasierUnmutingHideIfMuted", false)
local easierUnmutingDisplayDistance = game:DefineFastInt("EasierUnmutingDisplayDistance", 20)
local easierUnmutingIXPLayerName = game:DefineFastString("EasierUnmutingIXPLayerName", "Voice.UserAgency")
local easierUnmutingIXPLayerValue = game:DefineFastString("EasierUnmutingIXPLayerValue", "VoiceUserAgencyEnabled")
local bubbleChatBillboard = roactModule.PureComponent:extend("BubbleChatBillboard")
local t = { dampingRatio = 1, frequency = 4 }
bubbleChatBillboard.validateProps = tModule.strictInterface({
	userId = tModule.string,
	onFadeOut = tModule.optional(tModule.callback),
	voiceEnabled = tModule.optional(tModule.boolean),
	bubbleChatEnabled = tModule.optional(tModule.boolean),
	chatSettings = typesModule.IChatSettings,
	messageIds = tModule.optional(tModule.array(tModule.string)),
	lastMessage = tModule.optional(typesModule.IMessage),
	voiceState = tModule.optional(tModule.string)
})

function getEasierUnmutingDistance(p0)
	-- upvalues: playersService (ref), easierUnmutingBasedOnCamera (ref)
	if not p0 then
		return nil
	end
	local humanoidRootPart = playersService.LocalPlayer and (playersService.LocalPlayer.Character and playersService.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))
	local position = humanoidRootPart and (humanoidRootPart.CFrame and humanoidRootPart.CFrame.Position)
	local position_1 = workspace.CurrentCamera and workspace.CurrentCamera.CFrame.Position
	
	return if not (not easierUnmutingBasedOnCamera and position) then if position_1 then (p0 - position_1).Magnitude else nil else (p0 - position).Magnitude
end

function bubbleChatBillboard.init(p1)
	-- upvalues: publicApiModule (ref), starterGuiService (ref), easierUnmuting3 (ref), easierUnmutingHideIfMuted (ref), roactModule (ref), otterModule (ref), playersService (ref), constantsModule (ref), default (ref), getFFlagMicConnectingToastModule (ref), constantsModule_1 (ref), voiceIndicatorModule (ref), selfViewVisibilityUpdatedSignalModule (ref), IXPServiceWrapper (ref), easierUnmutingIXPLayerName (ref), easierUnmutingIXPLayerValue (ref)
	local ok
	p1:setState({
		adornee = nil,
		isInsideRenderDistance = false,
		isInsideMaximizeDistance = false,
		voiceTimedOut = false,
		voiceStateCounter = 0,
		lastVoiceState = nil,
		savedChatSettings = p1.props.chatSettings,
		selfViewOpen = publicApiModule.getSelfViewIsOpenAndVisible(),
		selfViewEnabled = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView),
		isInsideEasierUnmutingDistance = if easierUnmuting3 then false else nil,
		isMuted = if easierUnmuting3 and easierUnmutingHideIfMuted then false else nil,
		isInEasierUnmutingTreatment = if easierUnmuting3 then false else nil,
		haveLoggedUserExposure = if easierUnmuting3 then false else nil
	})
	p1.isMounted = false
	local var39, var40 = roactModule.createBinding(Vector3.new())
	p1.offset = var39
	p1.updateOffset = var40
	p1.offsetMotor = otterModule.createSingleMotor(0)
	p1.offsetMotor:onStep(function(p2)
		-- upvalues: p1 (ref)
		p1.updateOffset(Vector3.new(0, p2, 0))
	end)
	p1.offsetGoal = 0
	
	function p1.onSelfViewVisibilityUpdated()
		-- upvalues: p1 (ref), publicApiModule (copy)
		p1:setState({
			selfViewOpen = publicApiModule.getSelfViewIsOpenAndVisible()
		})
	end
	
	function p1.onLastBubbleFadeOut()
		-- upvalues: p1 (ref)
		if p1.props.onFadeOut and not p1.isFadingOut then
			p1.isFadingOut = true
			p1.props.onFadeOut(p1.props.userId)
		end
		if p1.state.hasMessage and p1.isMounted then
			p1:setState({ hasMessage = false })
		end
	end
	
	if p1.props.voiceEnabled then
		ok = if p1.props.userId == tostring(playersService.LocalPlayer.UserId) then function()
			-- upvalues: p1 (ref), constantsModule (copy), default (copy), getFFlagMicConnectingToastModule (copy)
			if p1.props.voiceState == constantsModule.VOICE_STATE.ERROR then
				default:RejoinPreviousChannel()
				
				return
			elseif getFFlagMicConnectingToastModule() and p1.props.voiceState == constantsModule.VOICE_STATE.CONNECTING then
				default:ShowVoiceChatLoadingMessage()
				
				return
			end
			default:ToggleMic("LegacyBubbleChat")
		end else function()
			-- upvalues: default (copy), p1 (ref), constantsModule_1 (copy)
			default:ToggleMutePlayer(tonumber(p1.props.userId), if p1:isShowingDueToEasierUnmuting() then constantsModule_1.VOICE_CONTEXT_TYPE.EASIER_UNMUTING else constantsModule_1.VOICE_CONTEXT_TYPE.BUBBLE_CHAT)
		end
		local userId = p1.props.userId
		local var42 = if userId ~= tostring(playersService.LocalPlayer.UserId) then "MicDark" else "SpeakerDark"
		
		function p1.renderInsert()
			-- upvalues: roactModule (copy), voiceIndicatorModule (copy), ok (write), userId (ref), var42 (ref)
			return roactModule.createElement(voiceIndicatorModule, { onClicked = ok, userId = userId, iconStyle = var42 })
		end
		
		p1.insertSize = Vector2.new(28, 28)
	end
	function p1.onCoreGuiChanged()
		-- upvalues: starterGuiService (copy), p1 (ref)
		local selfViewCoreGuiEnabled = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView)
		
		if p1.state.selfViewOpen ~= selfViewCoreGuiEnabled then
			p1:setState({ selfViewOpen = selfViewCoreGuiEnabled })
		end
	end
	
	p1.selfViewVisibilityUpdatedSignal = selfViewVisibilityUpdatedSignalModule:connect(function()
		-- upvalues: p1 (ref), publicApiModule (copy)
		p1:setState({
			selfViewOpen = publicApiModule.getSelfViewIsOpenAndVisible()
		})
	end)
	
	if easierUnmuting3 then
		ok, status = pcall(function()
			-- upvalues: IXPServiceWrapper (copy), easierUnmutingIXPLayerName (copy)
			return IXPServiceWrapper:GetLayerData(easierUnmutingIXPLayerName)
		end)
		
		if ok and status and status[easierUnmutingIXPLayerValue] then
			p1:setState({ isInEasierUnmutingTreatment = true })
		end
	end
	if easierUnmuting3 and p1.state.isInEasierUnmutingTreatment and easierUnmutingHideIfMuted then
		p1.participantsUpdateConnection = default.participantsUpdate.Event:Connect(function(p3)
			-- upvalues: p1 (ref)
			local userId = p3[p1.props.userId]
			
			if not userId then return end
			if userId.isMuted ~= p1.state.isMuted then
				p1:setState({ isMuted = userId.isMuted })
			end
		end)
	end
end

function bubbleChatBillboard.isShowingDueToEasierUnmuting(p4)
	-- upvalues: easierUnmuting3 (ref), constantsModule (ref), easierUnmutingHideIfMuted (ref)
	local var44 = easierUnmuting3
	
	if var44 then
		var44 = p4.state.isInEasierUnmutingTreatment
		
		if var44 then
			var44 = false
			
			if p4.props.voiceState == constantsModule.VOICE_STATE.LOCAL_MUTED then
				var44 = p4.state.isInsideEasierUnmutingDistance
				
				if var44 then
					var44 = not (easierUnmutingHideIfMuted and p4.state.isMuted)
				end
			end
		end
	end
	return var44
end

function bubbleChatBillboard.checkCounterForTimeout(p5, p6)
	-- upvalues: playersService (ref), constantsModule (ref), bubbleVoiceTimeoutMillis (ref)
	if p5.props.userId ~= tostring(playersService.LocalPlayer.UserId) and p5.state.lastVoiceState ~= constantsModule.VOICE_STATE.TALKING and p5.state.voiceStateCounter ~= p6 then
		local voiceStateCounter = p5.state.voiceStateCounter
		delay(bubbleVoiceTimeoutMillis / 1000, function()
			-- upvalues: p5 (ref), voiceStateCounter (ref)
			if p5.state.voiceStateCounter == voiceStateCounter and p5.isMounted then
				p5:setState({ voiceTimedOut = true })
			end
		end)
	end
end

function bubbleChatBillboard.checkCounterForTimeoutWithEasierUnmuting(p7, p8)
	-- upvalues: easierUnmuting3 (ref), playersService (ref), constantsModule (ref), bubbleVoiceTimeoutMillis (ref)
	local var45 = if p8 then p8.voiceStateCounter else nil
	
	if not easierUnmuting3 or not p7.state.isInEasierUnmutingTreatment then
		return p7:checkCounterForTimeout(var45)
	elseif p7.props.userId ~= tostring(playersService.LocalPlayer.UserId) and p7.state.voiceStateCounter ~= var45 and (p7.state.lastVoiceState ~= constantsModule.VOICE_STATE.TALKING and p7.state.lastVoiceState ~= constantsModule.VOICE_STATE.LOCAL_MUTED) then
		local voiceStateCounter = p7.state.voiceStateCounter
		delay(bubbleVoiceTimeoutMillis / 1000, function()
			-- upvalues: p7 (ref), voiceStateCounter (ref)
			if p7.state.voiceStateCounter == voiceStateCounter and p7.isMounted then
				p7:setState({ voiceTimedOut = true })
			end
		end)
	end
end

function bubbleChatBillboard.didMount(p9)
	-- upvalues: otterModule (ref), playersService (ref), runService (ref), easierUnmuting3 (ref), easierUnmutingDisplayDistance (ref), constantsModule (ref), t (ref)
	p9.isMounted = true
	local adornee = p9.props.lastMessage and p9.props.lastMessage.adornee
	p9:setState({ adornee = adornee })
	local var47 = p9:getVerticalOffset(adornee)
	p9.offsetGoal = var47
	p9.offsetMotor:setGoal(otterModule.instant(var47))
	local userIdPlayerByUserId = nil
	
	if adornee then
		userIdPlayerByUserId = playersService:GetPlayerFromCharacter(adornee)
	elseif tonumber(p9.props.userId) then
		userIdPlayerByUserId = playersService:GetPlayerByUserId(p9.props.userId)
	end
	if userIdPlayerByUserId then
		if userIdPlayerByUserId.Character then
			coroutine.wrap(function()
				-- upvalues: p9 (ref), userIdPlayerByUserId (write)
				p9:onCharacterAdded(userIdPlayerByUserId, userIdPlayerByUserId.Character)
			end)()
		end
		p9.characterConn = userIdPlayerByUserId.CharacterAdded:Connect(function(p10)
			-- upvalues: p9 (ref), userIdPlayerByUserId (write)
			p9:onCharacterAdded(userIdPlayerByUserId, p10)
		end)
	end
	p9.heartbeatConn = runService.Heartbeat:Connect(function()
		-- upvalues: p9 (ref), easierUnmuting3 (copy), easierUnmutingDisplayDistance (copy), constantsModule (copy), otterModule (copy), t (copy)
		local adorneeAdorneeInstance = p9:getAdorneeInstance(p9.state.adornee)
		
		if workspace.CurrentCamera and adorneeAdorneeInstance then
			local var50 = if adorneeAdorneeInstance:IsA("Attachment") then adorneeAdorneeInstance.WorldPosition else adorneeAdorneeInstance.Position
			local magnitude = (workspace.CurrentCamera.CFrame.Position - var50).Magnitude
			local var51 = magnitude < p9.state.savedChatSettings.MaxDistance
			local var52 = magnitude < p9.state.savedChatSettings.MinimizeDistance
			local var53 = false
			
			if easierUnmuting3 and p9.state.isInEasierUnmutingTreatment then
				local var54 = getEasierUnmutingDistance(var50)
				
				if var54 ~= nil then
					var53 = var54 < easierUnmutingDisplayDistance
				end
			end
			if var52 ~= p9.state.isInsideMaximizeDistance or var51 ~= p9.state.isInsideRenderDistance or easierUnmuting3 and p9.state.isInEasierUnmutingTreatment and var53 ~= p9.state.isInsideEasierUnmutingDistance then
				p9:setState({
					isInsideRenderDistance = var51,
					isInsideMaximizeDistance = var52,
					isInsideEasierUnmutingDistance = var53
				})
			end
		end
		local adorneeVerticalOffset = p9:getVerticalOffset(p9.state.adornee)
		
		if constantsModule.BILLBOARD_OFFSET_EPSILON < math.abs(adorneeVerticalOffset - p9.offsetGoal) then
			p9.offsetGoal = adorneeVerticalOffset
			p9.offsetMotor:setGoal(otterModule.spring(adorneeVerticalOffset, t))
		end
	end)
	
	if easierUnmuting3 and p9.state.isInEasierUnmutingTreatment then
		p9:checkCounterForTimeoutWithEasierUnmuting(nil)
	else
		p9:checkCounterForTimeout(nil)
	end
end

function bubbleChatBillboard.willUnmount(p11)
	-- upvalues: var7 (ref), easierUnmuting3 (ref), easierUnmutingHideIfMuted (ref)
	var7:trace("Unmounting billboards for {}", p11.state.shortId)
	p11.isMounted = false
	
	if p11.characterConn then
		p11.characterConn:Disconnect()
		p11.characterConn = nil
	end
	if p11.heartbeatConn then
		p11.heartbeatConn:Disconnect()
		p11.heartbeatConn = nil
	end
	if p11.humanoidDiedConn then
		p11.humanoidDiedConn:Disconnect()
		p11.humanoidDiedConn = nil
	end
	p11.offsetMotor:destroy()
	
	if p11.selfViewVisibilityUpdatedSignal then
		p11.selfViewVisibilityUpdatedSignal:disconnect()
		p11.selfViewVisibilityUpdatedSignal = nil
	end
	if easierUnmuting3 and p11.state.isInEasierUnmutingTreatment and (easierUnmutingHideIfMuted and p11.participantsUpdateConnection) then
		p11.participantsUpdateConnection:Disconnect()
		p11.participantsUpdateConnection = nil
	end
end

local function waitForFirst(...)
	local bindableEvent = Instance.new("BindableEvent")
	local list = { ... }
	
	local function fire(...)
		-- upvalues: list (ref), bindableEvent (ref)
		for i = 1, #list do
			list[i]:Disconnect()
		end
		return bindableEvent:Fire(...)
	end
	
	for i = 1, #list do
		list[i] = list[i]:Connect(fire)
	end
	return bindableEvent.Event:Wait()
end

local function findFirstChildByNameAndClass(p12, p13, p14)
	for i, v in ipairs(p12:GetChildren()) do
		if v.Name == p13 and v:IsA(p14) then
			return v
		end
	end
end

function bubbleChatBillboard.onCharacterAdded(p15, p16, p17)
	-- upvalues: waitForFirst (ref), var7 (ref), getFFlagBubbleChatInexistantAdorneeFixModule (ref), findFirstChildByNameAndClass (ref)
	if not p17.Parent then
		waitForFirst(p17.AncestryChanged, p16.CharacterAdded)
	end
	if p16.Character ~= p17 or not p17.Parent then
		var7:debug("Mismatched or unparented character in onCharacterAdded for {}", p15.state.shortId)
		
		return
	end
	local humanoid = p17:FindFirstChildOfClass("Humanoid")
	while p17:IsDescendantOf(game) and not humanoid do
		waitForFirst(p17.ChildAdded, p17.AncestryChanged, p16.CharacterAdded)
		humanoid = p17:FindFirstChildOfClass("Humanoid")
	end
	if p16.Character ~= p17 or not p17:IsDescendantOf(game) then
		var7:debug("Mismatched or unparented character in onCharacterAdded for {}", p15.state.shortId)
		
		return
	end
	local var60 = if getFFlagBubbleChatInexistantAdorneeFixModule() then p17.PrimaryPart else p17:FindFirstChild("HumanoidRootPart")
	while p17:IsDescendantOf(game) and not var60 do
		waitForFirst(p17.ChildAdded, p17.AncestryChanged, p16.CharacterAdded)
		var60 = if getFFlagBubbleChatInexistantAdorneeFixModule() then p17.PrimaryPart else p17:FindFirstChild("HumanoidRootPart")
	end
	if var60 and p17:IsDescendantOf(game) and (p16.Character == p17 and p15.isMounted) then
		p15:setState({
			adornee = if humanoid.Health == 0 then findFirstChildByNameAndClass(p17, "Head", "BasePart") else p17
		})
		
		if p15.humanoidDiedConn then
			p15.humanoidDiedConn:Disconnect()
			p15.humanoidDiedConn = nil
		end
		p15.humanoidDiedConn = humanoid.Died:Connect(function()
			-- upvalues: p15 (ref), findFirstChildByNameAndClass (copy), p17 (ref)
			p15:setState({
				adornee = findFirstChildByNameAndClass(p17, "Head", "BasePart") or p17
			})
		end)
	end
end

function bubbleChatBillboard.getVerticalOffset(value, p18)
	if p18 and p18:IsA("Model") then
		local boundingBox, boundingBox_1 = p18:GetBoundingBox()
		local var63 = value:getAdorneeInstance(p18)
		
		return if var63 then if var63:IsA("BasePart") then boundingBox_1.Y / 2 - boundingBox:PointToObjectSpace(var63.Position).Y else 0 else boundingBox_1.Y / 2
	end
	return if p18 and p18:IsA("BasePart") then p18.Size.Y / 2 else 0
end

function bubbleChatBillboard.getAdorneeInstance(p19, p20)
	-- upvalues: getFFlagBubbleChatInexistantAdorneeFixModule (ref)
	if not p20 then return end
	if p20:IsA("Model") then
		local adorneeName = p20:FindFirstChild(p19.state.savedChatSettings.AdorneeName, true)
		
		if getFFlagBubbleChatInexistantAdorneeFixModule() then
			adorneeName = adorneeName or p20.PrimaryPart
		end
		if adorneeName and not adorneeName:IsA("BasePart") and not adorneeName:IsA("Attachment") then
			return
		else
			return adorneeName
		end
	elseif p20:IsA("BasePart") or p20:IsA("Attachment") then
		return p20
	end
end

function bubbleChatBillboard.getRenderVoiceAndCameraBubble(p21)
	-- upvalues: debugAllowControlButtonsNoVoiceChat (ref), playersService (ref), VRService (ref), enabled (ref)
	return not (not p21.props.voiceEnabled and not debugAllowControlButtonsNoVoiceChat) and (if p21.props.userId == tostring(playersService.LocalPlayer.UserId) then if VRService.VREnabled or enabled() then false else p21.state.selfViewOpen else p21.props.voiceEnabled and not p21.state.voiceTimedOut)
end

function bubbleChatBillboard.shouldRenderCarat(p22)
	return p22.props.chatSettings.TailVisible and not p22:getRenderVoiceAndCameraBubble()
end

function bubbleChatBillboard.render(p23)
	-- upvalues: playersService (ref), var7 (ref), easierUnmuting3 (ref), constantsModule (ref), easierUnmutingHideIfMuted (ref), VRService (ref), enabled (ref), roactModule (ref), voiceBubbleModule (ref), bubbleChatListModule (ref), chatBubbleDistantModule (ref)
	local adorneeAdorneeInstance = p23:getAdorneeInstance(p23.state.adornee)
	local var66 = p23.props.userId == tostring(playersService.LocalPlayer.UserId)
	local savedChatSettings = p23.state.savedChatSettings
	
	if not adorneeAdorneeInstance then
		var7:trace("No adornee for {}", p23.state.shortId)
		
		return
	elseif not p23.state.isInsideRenderDistance then
		var7:trace("Not in range for {}", p23.state.shortId)
		
		return
	elseif easierUnmuting3 and p23.state.isInEasierUnmutingTreatment and p23.props.voiceState == constantsModule.VOICE_STATE.LOCAL_MUTED and (not p23.state.isInsideEasierUnmutingDistance or easierUnmutingHideIfMuted and p23.state.isMuted) then
		var7:trace("Unmute toggle not applicable for {}", p23.state.shortId)
		
		return
	end
	local t = {}
	local _ = nil
	local var68 = if (VRService.VREnabled or enabled()) and var66 then false else p23.props.voiceEnabled and not p23.state.voiceTimedOut
	
	if var68 and (not p23.props.bubbleChatEnabled or not p23.props.messageIds or #p23.props.messageIds == 0) then
		t.VoiceBubble = roactModule.createElement(voiceBubbleModule, {
			chatSettings = savedChatSettings,
			renderInsert = p23.renderInsert,
			insertSize = p23.insertSize,
			isDistant = not p23.state.isInsideMaximizeDistance
		})
	end
	if p23.state.hasMessage then
		if p23.state.isInsideMaximizeDistance then
			t.BubbleChatList = roactModule.createElement(bubbleChatListModule, {
				userId = p23.props.userId,
				isVisible = p23.state.isInsideMaximizeDistance,
				onLastBubbleFadeOut = p23.onLastBubbleFadeOut,
				chatSettings = savedChatSettings,
				renderFirstInsert = if var68 then p23.renderInsert else nil,
				insertSize = p23.insertSize,
				showCarat = p23:shouldRenderCarat()
			})
		else
			t.DistantBubble = roactModule.createElement(chatBubbleDistantModule, {
				fadingOut = not p23.props.messageIds or #p23.props.messageIds == 0,
				onFadeOut = p23.onLastBubbleFadeOut,
				chatSettings = savedChatSettings,
				renderInsert = var68 and p23.renderInsert,
				insertSize = p23.insertSize
			})
		end
	end
	return roactModule.createElement("BillboardGui", {
		ResetOnSpawn = false,
		Adornee = adorneeAdorneeInstance,
		Active = var68,
		Size = UDim2.fromOffset(500, 200),
		SizeOffset = Vector2.new(0, 0.5),
		StudsOffset = (if var66 then savedChatSettings.LocalPlayerStudsOffset else Vector3.new(0, 1, 0.10000000149)) + Vector3.new(0, savedChatSettings.VerticalStudsOffset, 0),
		StudsOffsetWorldSpace = p23.offset
	}, t)
end

function bubbleChatBillboard.didUpdate(p24, _, p25)
	-- upvalues: easierUnmuting3 (ref), playersService (ref), constantsModule (ref), IXPServiceWrapper (ref), easierUnmutingIXPLayerName (ref)
	if (not p24.props.messageIds or #p24.props.messageIds == 0) and not p24.state.isInsideRenderDistance then
		p24.onLastBubbleFadeOut()
	end
	if p24.props.messageIds and #p24.props.messageIds > 0 then
		p24.isFadingOut = false
	end
	if easierUnmuting3 and p24.state.isInEasierUnmutingTreatment then
		p24:checkCounterForTimeoutWithEasierUnmuting(p25)
	else
		p24:checkCounterForTimeout(p25.voiceStateCounter)
	end
	if easierUnmuting3 and p24.props.userId == tostring(playersService.LocalPlayer.UserId) and not p24.state.haveLoggedUserExposure and (p24.props.voiceState == constantsModule.VOICE_STATE.INACTIVE or p24.props.voiceState == constantsModule.VOICE_STATE.TALKING or p24.props.voiceState == constantsModule.VOICE_STATE.MUTED) then
		IXPServiceWrapper:LogUserLayerExposure(easierUnmutingIXPLayerName)
		p24:setState({ haveLoggedUserExposure = true })
	end
end

function bubbleChatBillboard.getDerivedStateFromProps(p26, p27)
	local text = "..." .. string.sub(tostring(p26.userId), -4)
	local var70 = not p27.hasMessage and (p26.messageIds and #p26.messageIds > 0)
	local voiceState = nil
	local var71 = nil
	local var72 = nil
	
	if p27.lastVoiceState ~= p26.voiceState then
		var71 = (p27.voiceStateCounter or 0) + 1
		var72 = false
		voiceState = p26.voiceState
	end
	return {
		hasMessage = var70 or nil,
		savedChatSettings = p26.lastMessage and p26.chatSettings,
		shortId = text,
		voiceStateCounter = var71,
		voiceTimedOut = var72,
		lastVoiceState = voiceState
	}
end

return roactRoduxModule.connect(function(p28, p29)
	-- upvalues: getSettingsForMessageModule (ref)
	local userId = p28.userMessages[p29.userId]
	local var73 = userId and (#userId >= 1 and userId[#userId])
	local var74 = var73 and p28.messages[var73]
	
	return {
		chatSettings = getSettingsForMessageModule(p28.chatSettings, var74),
		messageIds = userId,
		lastMessage = var74,
		voiceState = p28.voiceState[p29.userId]
	}
end)(bubbleChatBillboard)