local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local starterGuiService = game:GetService("StarterGui")
local VRService = game:GetService("VRService")
local var1 = require(script.Parent.Parent.Logger)(script.Name)
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

function getEasierUnmutingDistance(p1)
	-- upvalues: playersService (ref), easierUnmutingBasedOnCamera (ref)
	if not p1 then
		return nil
	end
	local humanoidRootPart = playersService.LocalPlayer and (playersService.LocalPlayer.Character and playersService.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))
	local position = humanoidRootPart and (humanoidRootPart.CFrame and humanoidRootPart.CFrame.Position)
	local position_1 = workspace.CurrentCamera and workspace.CurrentCamera.CFrame.Position
	
	return if not (not easierUnmutingBasedOnCamera and position) then if position_1 then (p1 - position_1).Magnitude else nil else (p1 - position).Magnitude
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
	local var2, var3 = roactModule.createBinding(Vector3.new())
	p1.offset = var2
	p1.updateOffset = var3
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
		local var4 = if userId ~= tostring(playersService.LocalPlayer.UserId) then "MicDark" else "SpeakerDark"
		
		function p1.renderInsert()
			-- upvalues: roactModule (copy), voiceIndicatorModule (copy), ok (write), userId (ref), var4 (ref)
			return roactModule.createElement(voiceIndicatorModule, { onClicked = ok, userId = userId, iconStyle = var4 })
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
		p1.participantsUpdateConnection = default.participantsUpdate.Event:Connect(function(p2)
			-- upvalues: p1 (ref)
			local userId = p2[p1.props.userId]
			
			if not userId then return end
			if userId.isMuted ~= p1.state.isMuted then
				p1:setState({ isMuted = userId.isMuted })
			end
		end)
	end
end

function bubbleChatBillboard.isShowingDueToEasierUnmuting(p1)
	-- upvalues: easierUnmuting3 (ref), constantsModule (ref), easierUnmutingHideIfMuted (ref)
	local var2 = easierUnmuting3
	
	if var2 then
		var2 = p1.state.isInEasierUnmutingTreatment
		
		if var2 then
			var2 = false
			
			if p1.props.voiceState == constantsModule.VOICE_STATE.LOCAL_MUTED then
				var2 = p1.state.isInsideEasierUnmutingDistance
				
				if var2 then
					var2 = not (easierUnmutingHideIfMuted and p1.state.isMuted)
				end
			end
		end
	end
	return var2
end

function bubbleChatBillboard.checkCounterForTimeout(p1, p2)
	-- upvalues: playersService (ref), constantsModule (ref), bubbleVoiceTimeoutMillis (ref)
	if p1.props.userId ~= tostring(playersService.LocalPlayer.UserId) and p1.state.lastVoiceState ~= constantsModule.VOICE_STATE.TALKING and p1.state.voiceStateCounter ~= p2 then
		local voiceStateCounter = p1.state.voiceStateCounter
		delay(bubbleVoiceTimeoutMillis / 1000, function()
			-- upvalues: p1 (ref), voiceStateCounter (ref)
			if p1.state.voiceStateCounter == voiceStateCounter and p1.isMounted then
				p1:setState({ voiceTimedOut = true })
			end
		end)
	end
end

function bubbleChatBillboard.checkCounterForTimeoutWithEasierUnmuting(p1, p2)
	-- upvalues: easierUnmuting3 (ref), playersService (ref), constantsModule (ref), bubbleVoiceTimeoutMillis (ref)
	local var2 = if p2 then p2.voiceStateCounter else nil
	
	if not easierUnmuting3 or not p1.state.isInEasierUnmutingTreatment then
		return p1:checkCounterForTimeout(var2)
	elseif p1.props.userId ~= tostring(playersService.LocalPlayer.UserId) and p1.state.voiceStateCounter ~= var2 and (p1.state.lastVoiceState ~= constantsModule.VOICE_STATE.TALKING and p1.state.lastVoiceState ~= constantsModule.VOICE_STATE.LOCAL_MUTED) then
		local voiceStateCounter = p1.state.voiceStateCounter
		delay(bubbleVoiceTimeoutMillis / 1000, function()
			-- upvalues: p1 (ref), voiceStateCounter (ref)
			if p1.state.voiceStateCounter == voiceStateCounter and p1.isMounted then
				p1:setState({ voiceTimedOut = true })
			end
		end)
	end
end

function bubbleChatBillboard.didMount(p1)
	-- upvalues: otterModule (ref), playersService (ref), runService (ref), easierUnmuting3 (ref), easierUnmutingDisplayDistance (ref), constantsModule (ref), t (ref)
	p1.isMounted = true
	local adornee = p1.props.lastMessage and p1.props.lastMessage.adornee
	p1:setState({ adornee = adornee })
	local var2 = p1:getVerticalOffset(adornee)
	p1.offsetGoal = var2
	p1.offsetMotor:setGoal(otterModule.instant(var2))
	local userIdPlayerByUserId = nil
	
	if adornee then
		userIdPlayerByUserId = playersService:GetPlayerFromCharacter(adornee)
	elseif tonumber(p1.props.userId) then
		userIdPlayerByUserId = playersService:GetPlayerByUserId(p1.props.userId)
	end
	if userIdPlayerByUserId then
		if userIdPlayerByUserId.Character then
			coroutine.wrap(function()
				-- upvalues: p1 (ref), userIdPlayerByUserId (write)
				p1:onCharacterAdded(userIdPlayerByUserId, userIdPlayerByUserId.Character)
			end)()
		end
		p1.characterConn = userIdPlayerByUserId.CharacterAdded:Connect(function(p2)
			-- upvalues: p1 (ref), userIdPlayerByUserId (write)
			p1:onCharacterAdded(userIdPlayerByUserId, p2)
		end)
	end
	p1.heartbeatConn = runService.Heartbeat:Connect(function()
		-- upvalues: p1 (ref), easierUnmuting3 (copy), easierUnmutingDisplayDistance (copy), constantsModule (copy), otterModule (copy), t (copy)
		local adorneeAdorneeInstance = p1:getAdorneeInstance(p1.state.adornee)
		
		if workspace.CurrentCamera and adorneeAdorneeInstance then
			local var3 = if adorneeAdorneeInstance:IsA("Attachment") then adorneeAdorneeInstance.WorldPosition else adorneeAdorneeInstance.Position
			local magnitude = (workspace.CurrentCamera.CFrame.Position - var3).Magnitude
			local var4 = magnitude < p1.state.savedChatSettings.MaxDistance
			local var5 = magnitude < p1.state.savedChatSettings.MinimizeDistance
			local var6 = false
			
			if easierUnmuting3 and p1.state.isInEasierUnmutingTreatment then
				local var7 = getEasierUnmutingDistance(var3)
				
				if var7 ~= nil then
					var6 = var7 < easierUnmutingDisplayDistance
				end
			end
			if var5 ~= p1.state.isInsideMaximizeDistance or var4 ~= p1.state.isInsideRenderDistance or easierUnmuting3 and p1.state.isInEasierUnmutingTreatment and var6 ~= p1.state.isInsideEasierUnmutingDistance then
				p1:setState({
					isInsideRenderDistance = var4,
					isInsideMaximizeDistance = var5,
					isInsideEasierUnmutingDistance = var6
				})
			end
		end
		local adorneeVerticalOffset = p1:getVerticalOffset(p1.state.adornee)
		
		if constantsModule.BILLBOARD_OFFSET_EPSILON < math.abs(adorneeVerticalOffset - p1.offsetGoal) then
			p1.offsetGoal = adorneeVerticalOffset
			p1.offsetMotor:setGoal(otterModule.spring(adorneeVerticalOffset, t))
		end
	end)
	
	if easierUnmuting3 and p1.state.isInEasierUnmutingTreatment then
		p1:checkCounterForTimeoutWithEasierUnmuting(nil)
	else
		p1:checkCounterForTimeout(nil)
	end
end

function bubbleChatBillboard.willUnmount(p1)
	-- upvalues: var1 (ref), easierUnmuting3 (ref), easierUnmutingHideIfMuted (ref)
	var1:trace("Unmounting billboards for {}", p1.state.shortId)
	p1.isMounted = false
	
	if p1.characterConn then
		p1.characterConn:Disconnect()
		p1.characterConn = nil
	end
	if p1.heartbeatConn then
		p1.heartbeatConn:Disconnect()
		p1.heartbeatConn = nil
	end
	if p1.humanoidDiedConn then
		p1.humanoidDiedConn:Disconnect()
		p1.humanoidDiedConn = nil
	end
	p1.offsetMotor:destroy()
	
	if p1.selfViewVisibilityUpdatedSignal then
		p1.selfViewVisibilityUpdatedSignal:disconnect()
		p1.selfViewVisibilityUpdatedSignal = nil
	end
	if easierUnmuting3 and p1.state.isInEasierUnmutingTreatment and (easierUnmutingHideIfMuted and p1.participantsUpdateConnection) then
		p1.participantsUpdateConnection:Disconnect()
		p1.participantsUpdateConnection = nil
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

local function findFirstChildByNameAndClass(p1, p2, p3)
	for i, v in ipairs(p1:GetChildren()) do
		if v.Name == p2 and v:IsA(p3) then
			return v
		end
	end
end

function bubbleChatBillboard.onCharacterAdded(p4, p5, p6)
	-- upvalues: waitForFirst (ref), var1 (ref), getFFlagBubbleChatInexistantAdorneeFixModule (ref), findFirstChildByNameAndClass (ref)
	if not p6.Parent then
		waitForFirst(p6.AncestryChanged, p5.CharacterAdded)
	end
	if p5.Character ~= p6 or not p6.Parent then
		var1:debug("Mismatched or unparented character in onCharacterAdded for {}", p4.state.shortId)
		
		return
	end
	local humanoid = p6:FindFirstChildOfClass("Humanoid")
	while p6:IsDescendantOf(game) and not humanoid do
		waitForFirst(p6.ChildAdded, p6.AncestryChanged, p5.CharacterAdded)
		humanoid = p6:FindFirstChildOfClass("Humanoid")
	end
	if p5.Character ~= p6 or not p6:IsDescendantOf(game) then
		var1:debug("Mismatched or unparented character in onCharacterAdded for {}", p4.state.shortId)
		
		return
	end
	local var2 = if getFFlagBubbleChatInexistantAdorneeFixModule() then p6.PrimaryPart else p6:FindFirstChild("HumanoidRootPart")
	while p6:IsDescendantOf(game) and not var2 do
		waitForFirst(p6.ChildAdded, p6.AncestryChanged, p5.CharacterAdded)
		var2 = if getFFlagBubbleChatInexistantAdorneeFixModule() then p6.PrimaryPart else p6:FindFirstChild("HumanoidRootPart")
	end
	if var2 and p6:IsDescendantOf(game) and (p5.Character == p6 and p4.isMounted) then
		p4:setState({
			adornee = if humanoid.Health == 0 then findFirstChildByNameAndClass(p6, "Head", "BasePart") else p6
		})
		
		if p4.humanoidDiedConn then
			p4.humanoidDiedConn:Disconnect()
			p4.humanoidDiedConn = nil
		end
		p4.humanoidDiedConn = humanoid.Died:Connect(function()
			-- upvalues: p4 (ref), findFirstChildByNameAndClass (copy), p6 (ref)
			p4:setState({
				adornee = findFirstChildByNameAndClass(p6, "Head", "BasePart") or p6
			})
		end)
	end
end

function bubbleChatBillboard.getVerticalOffset(value, p7)
	if p7 and p7:IsA("Model") then
		local boundingBox, boundingBox_1 = p7:GetBoundingBox()
		local var3 = value:getAdorneeInstance(p7)
		
		return if var3 then if var3:IsA("BasePart") then boundingBox_1.Y / 2 - boundingBox:PointToObjectSpace(var3.Position).Y else 0 else boundingBox_1.Y / 2
	end
	return if p7 and p7:IsA("BasePart") then p7.Size.Y / 2 else 0
end

function bubbleChatBillboard.getAdorneeInstance(p7, p8)
	-- upvalues: getFFlagBubbleChatInexistantAdorneeFixModule (ref)
	if not p8 then return end
	if p8:IsA("Model") then
		local adorneeName = p8:FindFirstChild(p7.state.savedChatSettings.AdorneeName, true)
		
		if getFFlagBubbleChatInexistantAdorneeFixModule() then
			adorneeName = adorneeName or p8.PrimaryPart
		end
		if adorneeName and not adorneeName:IsA("BasePart") and not adorneeName:IsA("Attachment") then
			return
		else
			return adorneeName
		end
	elseif p8:IsA("BasePart") or p8:IsA("Attachment") then
		return p8
	end
end

function bubbleChatBillboard.getRenderVoiceAndCameraBubble(p7)
	-- upvalues: debugAllowControlButtonsNoVoiceChat (ref), playersService (ref), VRService (ref), enabled (ref)
	return not (not p7.props.voiceEnabled and not debugAllowControlButtonsNoVoiceChat) and (if p7.props.userId == tostring(playersService.LocalPlayer.UserId) then if VRService.VREnabled or enabled() then false else p7.state.selfViewOpen else p7.props.voiceEnabled and not p7.state.voiceTimedOut)
end

function bubbleChatBillboard.shouldRenderCarat(p7)
	return p7.props.chatSettings.TailVisible and not p7:getRenderVoiceAndCameraBubble()
end

function bubbleChatBillboard.render(p7)
	-- upvalues: playersService (ref), var1 (ref), easierUnmuting3 (ref), constantsModule (ref), easierUnmutingHideIfMuted (ref), VRService (ref), enabled (ref), roactModule (ref), voiceBubbleModule (ref), bubbleChatListModule (ref), chatBubbleDistantModule (ref)
	local adorneeAdorneeInstance = p7:getAdorneeInstance(p7.state.adornee)
	local var3 = p7.props.userId == tostring(playersService.LocalPlayer.UserId)
	local savedChatSettings = p7.state.savedChatSettings
	
	if not adorneeAdorneeInstance then
		var1:trace("No adornee for {}", p7.state.shortId)
		
		return
	elseif not p7.state.isInsideRenderDistance then
		var1:trace("Not in range for {}", p7.state.shortId)
		
		return
	elseif easierUnmuting3 and p7.state.isInEasierUnmutingTreatment and p7.props.voiceState == constantsModule.VOICE_STATE.LOCAL_MUTED and (not p7.state.isInsideEasierUnmutingDistance or easierUnmutingHideIfMuted and p7.state.isMuted) then
		var1:trace("Unmute toggle not applicable for {}", p7.state.shortId)
		
		return
	end
	local t = {}
	local _ = nil
	local var4 = if (VRService.VREnabled or enabled()) and var3 then false else p7.props.voiceEnabled and not p7.state.voiceTimedOut
	
	if var4 and (not p7.props.bubbleChatEnabled or not p7.props.messageIds or #p7.props.messageIds == 0) then
		t.VoiceBubble = roactModule.createElement(voiceBubbleModule, {
			chatSettings = savedChatSettings,
			renderInsert = p7.renderInsert,
			insertSize = p7.insertSize,
			isDistant = not p7.state.isInsideMaximizeDistance
		})
	end
	if p7.state.hasMessage then
		if p7.state.isInsideMaximizeDistance then
			t.BubbleChatList = roactModule.createElement(bubbleChatListModule, {
				userId = p7.props.userId,
				isVisible = p7.state.isInsideMaximizeDistance,
				onLastBubbleFadeOut = p7.onLastBubbleFadeOut,
				chatSettings = savedChatSettings,
				renderFirstInsert = if var4 then p7.renderInsert else nil,
				insertSize = p7.insertSize,
				showCarat = p7:shouldRenderCarat()
			})
		else
			t.DistantBubble = roactModule.createElement(chatBubbleDistantModule, {
				fadingOut = not p7.props.messageIds or #p7.props.messageIds == 0,
				onFadeOut = p7.onLastBubbleFadeOut,
				chatSettings = savedChatSettings,
				renderInsert = var4 and p7.renderInsert,
				insertSize = p7.insertSize
			})
		end
	end
	return roactModule.createElement("BillboardGui", {
		ResetOnSpawn = false,
		Adornee = adorneeAdorneeInstance,
		Active = var4,
		Size = UDim2.fromOffset(500, 200),
		SizeOffset = Vector2.new(0, 0.5),
		StudsOffset = (if var3 then savedChatSettings.LocalPlayerStudsOffset else Vector3.new(0, 1, 0.10000000149)) + Vector3.new(0, savedChatSettings.VerticalStudsOffset, 0),
		StudsOffsetWorldSpace = p7.offset
	}, t)
end

function bubbleChatBillboard.didUpdate(p7, _, p8)
	-- upvalues: easierUnmuting3 (ref), playersService (ref), constantsModule (ref), IXPServiceWrapper (ref), easierUnmutingIXPLayerName (ref)
	if (not p7.props.messageIds or #p7.props.messageIds == 0) and not p7.state.isInsideRenderDistance then
		p7.onLastBubbleFadeOut()
	end
	if p7.props.messageIds and #p7.props.messageIds > 0 then
		p7.isFadingOut = false
	end
	if easierUnmuting3 and p7.state.isInEasierUnmutingTreatment then
		p7:checkCounterForTimeoutWithEasierUnmuting(p8)
	else
		p7:checkCounterForTimeout(p8.voiceStateCounter)
	end
	if easierUnmuting3 and p7.props.userId == tostring(playersService.LocalPlayer.UserId) and not p7.state.haveLoggedUserExposure and (p7.props.voiceState == constantsModule.VOICE_STATE.INACTIVE or p7.props.voiceState == constantsModule.VOICE_STATE.TALKING or p7.props.voiceState == constantsModule.VOICE_STATE.MUTED) then
		IXPServiceWrapper:LogUserLayerExposure(easierUnmutingIXPLayerName)
		p7:setState({ haveLoggedUserExposure = true })
	end
end

function bubbleChatBillboard.getDerivedStateFromProps(p7, p8)
	local text = "..." .. string.sub(tostring(p7.userId), -4)
	local var3 = not p8.hasMessage and (p7.messageIds and #p7.messageIds > 0)
	local voiceState = nil
	local var4 = nil
	local var5 = nil
	
	if p8.lastVoiceState ~= p7.voiceState then
		var4 = (p8.voiceStateCounter or 0) + 1
		var5 = false
		voiceState = p7.voiceState
	end
	return {
		hasMessage = var3 or nil,
		savedChatSettings = p7.lastMessage and p7.chatSettings,
		shortId = text,
		voiceStateCounter = var4,
		voiceTimedOut = var5,
		lastVoiceState = voiceState
	}
end

return roactRoduxModule.connect(function(p7, p8)
	-- upvalues: getSettingsForMessageModule (ref)
	local userId = p7.userMessages[p8.userId]
	local var3 = userId and (#userId >= 1 and userId[#userId])
	local var4 = var3 and p7.messages[var3]
	
	return {
		chatSettings = getSettingsForMessageModule(p7.chatSettings, var4),
		messageIds = userId,
		lastMessage = var4,
		voiceState = p7.voiceState[p8.userId]
	}
end)(bubbleChatBillboard)