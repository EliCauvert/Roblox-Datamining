local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local StarterGui = game:GetService("StarterGui")
local VRService = game:GetService("VRService")
local v1 = require(script.Parent.Parent.Logger)(script.Name)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local OtterModule = require(CorePackages.Packages.Otter)
local BubbleChatListModule = require(script.Parent.BubbleChatList)
local ChatBubbleDistantModule = require(script.Parent.ChatBubbleDistant)
local VoiceBubbleModule = require(script.Parent.VoiceBubble)
local VoiceIndicatorModule = require(RobloxGui.Modules.VoiceChat.Components.VoiceIndicator)
local TypesModule = require(script.Parent.Parent.Types)
local ConstantsModule = require(script.Parent.Parent.Constants)
local GetSettingsForMessageModule = require(script.Parent.Parent.Helpers.getSettingsForMessage)
local SelfViewVisibilityUpdatedSignalModule = require(RobloxGui.Modules.SelfView.selfViewVisibilityUpdatedSignal)
local EnabledFunction = require(CorePackages.Workspace.Packages.Chrome).Enabled
local ConstantsModule1 = require(RobloxGui.Modules.VoiceChat.Constants)
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local GetFFlagMicConnectingToastModule = require(RobloxGui.Modules.Flags.GetFFlagMicConnectingToast)
local GetFFlagBubbleChatInexistantAdorneeFixModule = require(RobloxGui.Modules.Flags.GetFFlagBubbleChatInexistantAdorneeFix)
local PublicApiModule = require(RobloxGui.Modules.SelfView.publicApi)
local BubbleVoiceTimeoutMillis = game:DefineFastInt("BubbleVoiceTimeoutMillis", 1000)
local DebugAllowControlButtonsNoVoiceChat = game:DefineFastFlag("DebugAllowControlButtonsNoVoiceChat", false)
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local EasierUnmuting3 = game:DefineFastFlag("EasierUnmuting3", false)
local EasierUnmutingBasedOnCamera = game:DefineFastFlag("EasierUnmutingBasedOnCamera", false)
local EasierUnmutingHideIfMuted = game:DefineFastFlag("EasierUnmutingHideIfMuted", false)
local EasierUnmutingDisplayDistance = game:DefineFastInt("EasierUnmutingDisplayDistance", 20)
local EasierUnmutingIXPLayerName = game:DefineFastString("EasierUnmutingIXPLayerName", "Voice.UserAgency")
local EasierUnmutingIXPLayerValue = game:DefineFastString("EasierUnmutingIXPLayerValue", "VoiceUserAgencyEnabled")
local BubbleChatBillboard = RoactModule.PureComponent:extend("BubbleChatBillboard")
local config = { dampingRatio = 1, frequency = 4 }
BubbleChatBillboard.validateProps = TModule.strictInterface({
	userId = TModule.string,
	onFadeOut = TModule.optional(TModule.callback),
	voiceEnabled = TModule.optional(TModule.boolean),
	bubbleChatEnabled = TModule.optional(TModule.boolean),
	chatSettings = TypesModule.IChatSettings,
	messageIds = TModule.optional(TModule.array(TModule.string)),
	lastMessage = TModule.optional(TypesModule.IMessage),
	voiceState = TModule.optional(TModule.string)
})

function getEasierUnmutingDistance(p1) --[[ Line: 72 ]]
	-- upvalues: Players (copy), EasierUnmutingBasedOnCamera (copy)
	if p1 then
		local HumanoidRootPart = Players.LocalPlayer and (Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))
		local Position = HumanoidRootPart and (HumanoidRootPart.CFrame and HumanoidRootPart.CFrame.Position)
		local Position1 = workspace.CurrentCamera and workspace.CurrentCamera.CFrame.Position
		
		return if EasierUnmutingBasedOnCamera or not Position then if Position1 then (p1 - Position1).Magnitude else nil else (p1 - Position).Magnitude
	else
		return nil
	end
end

function BubbleChatBillboard.init(p1) --[[ Line: 98 ]]
	-- upvalues: PublicApiModule (copy), StarterGui (copy), EasierUnmuting3 (copy), EasierUnmutingHideIfMuted (copy), RoactModule (copy), OtterModule (copy), Players (copy), ConstantsModule (copy), Default (copy), GetFFlagMicConnectingToastModule (copy), ConstantsModule1 (copy), VoiceIndicatorModule (copy), SelfViewVisibilityUpdatedSignalModule (copy), IXPServiceWrapper (copy), EasierUnmutingIXPLayerName (copy), EasierUnmutingIXPLayerValue (copy)
	p1:setState({
		adornee = nil,
		isInsideRenderDistance = false,
		isInsideMaximizeDistance = false,
		voiceTimedOut = false,
		voiceStateCounter = 0,
		lastVoiceState = nil,
		savedChatSettings = p1.props.chatSettings,
		selfViewOpen = PublicApiModule.getSelfViewIsOpenAndVisible(),
		selfViewEnabled = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView),
		isInsideEasierUnmutingDistance = not EasierUnmuting3 and nil,
		isMuted = (not EasierUnmuting3 or not EasierUnmutingHideIfMuted) and nil,
		isInEasierUnmutingTreatment = not EasierUnmuting3 and nil,
		haveLoggedUserExposure = not EasierUnmuting3 and nil
	})
	p1.isMounted = false
	p1.offset, p1.updateOffset = RoactModule.createBinding((Vector3.new()))
	p1.offsetMotor = OtterModule.createSingleMotor(0)
	p1.offsetMotor:onStep(function(Y) --[[ Line: 121 ]]
		-- upvalues: p1 (copy)
		p1.updateOffset((Vector3.new(0, Y, 0)))
	end)
	p1.offsetGoal = 0
	
	function p1.onSelfViewVisibilityUpdated() --[[ Line: 126 ]]
		-- upvalues: p1 (copy), PublicApiModule (upval)
		p1:setState({
			selfViewOpen = PublicApiModule.getSelfViewIsOpenAndVisible()
		})
	end
	
	function p1.onLastBubbleFadeOut() --[[ Line: 132 ]]
		-- upvalues: p1 (copy)
		if p1.props.onFadeOut and not p1.isFadingOut then
			p1.isFadingOut = true
			p1.props.onFadeOut(p1.props.userId)
		end
		if p1.state.hasMessage and p1.isMounted then
			p1:setState({ hasMessage = false })
		end
	end
	
	if p1.props.voiceEnabled then
		local OnClicked = nil
		OnClicked = if p1.props.userId == tostring(Players.LocalPlayer.UserId) then function() --[[ Line: 148 ]]
			-- upvalues: p1 (copy), ConstantsModule (upval), Default (upval), GetFFlagMicConnectingToastModule (upval)
			if p1.props.voiceState == ConstantsModule.VOICE_STATE.ERROR then
				Default:RejoinPreviousChannel()
				
				return
			end
			if GetFFlagMicConnectingToastModule() and p1.props.voiceState == ConstantsModule.VOICE_STATE.CONNECTING then
				Default:ShowVoiceChatLoadingMessage()
				
				return
			else
				Default:ToggleMic("LegacyBubbleChat")
			end
		end else function() --[[ Line: 158 ]]
			-- upvalues: Default (upval), p1 (copy), ConstantsModule1 (upval)
			Default:ToggleMutePlayer(tonumber(p1.props.userId), if p1:isShowingDueToEasierUnmuting() then ConstantsModule1.VOICE_CONTEXT_TYPE.EASIER_UNMUTING else ConstantsModule1.VOICE_CONTEXT_TYPE.BUBBLE_CHAT)
		end
		local UserId = p1.props.userId
		local MicDark: string = if UserId == tostring(Players.LocalPlayer.UserId) then "MicDark" else "SpeakerDark"
		
		function p1.renderInsert() --[[ Line: 172 ]]
			-- upvalues: RoactModule (upval), VoiceIndicatorModule (upval), OnClicked (ref), UserId (copy), MicDark (copy)
			return RoactModule.createElement(VoiceIndicatorModule, {
				onClicked = OnClicked,
				userId = UserId,
				iconStyle = MicDark
			})
		end
		
		p1.insertSize = Vector2.new(28, 28)
	end
	function p1.onCoreGuiChanged() --[[ Line: 183 ]]
		-- upvalues: StarterGui (upval), p1 (copy)
		local CoreGuiEnabled = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView)
		
		if p1.state.selfViewOpen ~= CoreGuiEnabled then
			p1:setState({ selfViewOpen = CoreGuiEnabled })
		end
	end
	
	p1.selfViewVisibilityUpdatedSignal = SelfViewVisibilityUpdatedSignalModule:connect(function() --[[ Line: 192 ]]
		-- upvalues: p1 (copy), PublicApiModule (upval)
		p1:setState({
			selfViewOpen = PublicApiModule.getSelfViewIsOpenAndVisible()
		})
	end)
	
	if EasierUnmuting3 then
		local Success, Result = pcall(function() --[[ Line: 199 ]]
			-- upvalues: IXPServiceWrapper (upval), EasierUnmutingIXPLayerName (upval)
			return IXPServiceWrapper:GetLayerData(EasierUnmutingIXPLayerName)
		end)
		
		if Success and Result and Result[EasierUnmutingIXPLayerValue] then
			p1:setState({ isInEasierUnmutingTreatment = true })
		end
	end
	if EasierUnmuting3 and p1.state.isInEasierUnmutingTreatment and EasierUnmutingHideIfMuted then
		p1.participantsUpdateConnection = Default.participantsUpdate.Event:Connect(function(p2) --[[ Line: 216 ]]
			-- upvalues: p1 (copy)
			local v2 = p2[p1.props.userId]
			
			if not v2 then return end
			if v2.isMuted ~= p1.state.isMuted then
				p1:setState({ isMuted = v2.isMuted })
			end
		end)
	end
end

function BubbleChatBillboard.isShowingDueToEasierUnmuting(p1): boolean --[[ Line: 233 ]]
	-- upvalues: EasierUnmuting3 (copy), ConstantsModule (copy), EasierUnmutingHideIfMuted (copy)
	return EasierUnmuting3 and (p1.state.isInEasierUnmutingTreatment and (p1.props.voiceState == ConstantsModule.VOICE_STATE.LOCAL_MUTED and (p1.state.isInsideEasierUnmutingDistance and not (EasierUnmutingHideIfMuted and p1.state.isMuted))))
end

function BubbleChatBillboard.checkCounterForTimeout(p1, VoiceStateCounter) --[[ Line: 241 ]]
	-- upvalues: Players (copy), ConstantsModule (copy), BubbleVoiceTimeoutMillis (copy)
	if p1.props.userId ~= tostring(Players.LocalPlayer.UserId) and p1.state.lastVoiceState ~= ConstantsModule.VOICE_STATE.TALKING and p1.state.voiceStateCounter ~= VoiceStateCounter then
		local VoiceStateCounter1 = p1.state.voiceStateCounter
		delay(BubbleVoiceTimeoutMillis / 1000, function() --[[ Line: 250 ]]
			-- upvalues: p1 (copy), VoiceStateCounter1 (copy)
			if p1.state.voiceStateCounter == VoiceStateCounter1 and p1.isMounted then
				p1:setState({ voiceTimedOut = true })
			end
		end)
	end
end

function BubbleChatBillboard.checkCounterForTimeoutWithEasierUnmuting(p1, p2) --[[ Line: 261 ]]
	-- upvalues: EasierUnmuting3 (copy), Players (copy), ConstantsModule (copy), BubbleVoiceTimeoutMillis (copy)
	local VoiceStateCounter = if p2 then p2.voiceStateCounter else nil
	
	if not EasierUnmuting3 or not p1.state.isInEasierUnmutingTreatment then
		return p1:checkCounterForTimeout(VoiceStateCounter)
	end
	local IsNotVoiceStateCounterMatch = p1.state.voiceStateCounter ~= VoiceStateCounter
	local IsNotLastVoiceStateMatch: boolean = p1.state.lastVoiceState ~= ConstantsModule.VOICE_STATE.TALKING and p1.state.lastVoiceState ~= ConstantsModule.VOICE_STATE.LOCAL_MUTED
	
	if p1.props.userId ~= tostring(Players.LocalPlayer.UserId) and IsNotVoiceStateCounterMatch and IsNotLastVoiceStateMatch then
		local VoiceStateCounter1 = p1.state.voiceStateCounter
		delay(BubbleVoiceTimeoutMillis / 1000, function() --[[ Line: 279 ]]
			-- upvalues: p1 (copy), VoiceStateCounter1 (copy)
			if p1.state.voiceStateCounter == VoiceStateCounter1 and p1.isMounted then
				p1:setState({ voiceTimedOut = true })
			end
		end)
	end
end

function BubbleChatBillboard.didMount(p1) --[[ Line: 292 ]]
	-- upvalues: OtterModule (copy), Players (copy), RunService (copy), EasierUnmuting3 (copy), EasierUnmutingDisplayDistance (copy), ConstantsModule (copy), config (copy)
	p1.isMounted = true
	local Adornee = p1.props.lastMessage and p1.props.lastMessage.adornee
	p1:setState({ adornee = Adornee })
	local VerticalOffset = p1:getVerticalOffset(Adornee)
	p1.offsetGoal = VerticalOffset
	p1.offsetMotor:setGoal(OtterModule.instant(VerticalOffset))
	local Player = nil
	
	if Adornee then
		Player = Players:GetPlayerFromCharacter(Adornee)
	elseif tonumber(p1.props.userId) then
		Player = Players:GetPlayerByUserId(p1.props.userId)
	end
	if Player then
		if Player.Character then
			coroutine.wrap(function() --[[ Line: 313 ]]
				-- upvalues: p1 (copy), Player (ref)
				p1:onCharacterAdded(Player, Player.Character)
			end)()
		end
		p1.characterConn = Player.CharacterAdded:Connect(function(Character) --[[ Line: 317 ]]
			-- upvalues: p1 (copy), Player (ref)
			p1:onCharacterAdded(Player, Character)
		end)
	end
	p1.heartbeatConn = RunService.Heartbeat:Connect(function() --[[ Line: 323 ]]
		-- upvalues: p1 (copy), EasierUnmuting3 (upval), EasierUnmutingDisplayDistance (upval), ConstantsModule (upval), OtterModule (upval), config (upval)
		local AdorneeInstance = p1:getAdorneeInstance(p1.state.adornee)
		
		if workspace.CurrentCamera and AdorneeInstance then
			local WorldPosition = AdorneeInstance:IsA("Attachment") and AdorneeInstance.WorldPosition or AdorneeInstance.Position
			local Distance = (workspace.CurrentCamera.CFrame.Position - WorldPosition).Magnitude
			local IsDistanceBelow = Distance < p1.state.savedChatSettings.MaxDistance
			local IsDistanceBelow1 = Distance < p1.state.savedChatSettings.MinimizeDistance
			local IsInsideEasierUnmutingDistance = false
			
			if EasierUnmuting3 and p1.state.isInEasierUnmutingTreatment then
				local EasierUnmutingDistance = getEasierUnmutingDistance(WorldPosition)
				
				if EasierUnmutingDistance ~= nil then
					IsInsideEasierUnmutingDistance = EasierUnmutingDistance < EasierUnmutingDisplayDistance
				end
			end
			if IsDistanceBelow1 ~= p1.state.isInsideMaximizeDistance or IsDistanceBelow ~= p1.state.isInsideRenderDistance or EasierUnmuting3 and p1.state.isInEasierUnmutingTreatment and IsInsideEasierUnmutingDistance ~= p1.state.isInsideEasierUnmutingDistance then
				p1:setState({
					isInsideRenderDistance = IsDistanceBelow,
					isInsideMaximizeDistance = IsDistanceBelow1,
					isInsideEasierUnmutingDistance = IsInsideEasierUnmutingDistance
				})
			end
		end
		local VerticalOffset = p1:getVerticalOffset(p1.state.adornee)
		
		if ConstantsModule.BILLBOARD_OFFSET_EPSILON < math.abs(VerticalOffset - p1.offsetGoal) then
			p1.offsetGoal = VerticalOffset
			p1.offsetMotor:setGoal(OtterModule.spring(VerticalOffset, config))
		end
	end)
	
	if EasierUnmuting3 and p1.state.isInEasierUnmutingTreatment then
		p1:checkCounterForTimeoutWithEasierUnmuting(nil)
	else
		p1:checkCounterForTimeout(nil)
	end
end

function BubbleChatBillboard.willUnmount(p1) --[[ Line: 368 ]]
	-- upvalues: v1 (copy), EasierUnmuting3 (copy), EasierUnmutingHideIfMuted (copy)
	v1:trace("Unmounting billboards for {}", p1.state.shortId)
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
	if EasierUnmuting3 and p1.state.isInEasierUnmutingTreatment and EasierUnmutingHideIfMuted and p1.participantsUpdateConnection then
		p1.participantsUpdateConnection:Disconnect()
		p1.participantsUpdateConnection = nil
	end
end

local function waitForFirst(...) --[[ Line: 396 ]]
	local BindableEvent = Instance.new("BindableEvent")
	local Connections = { ... }
	
	local function fire(...) --[[ Line: 400 ]]
		-- upvalues: Connections (copy), BindableEvent (copy)
		for i = 1, #Connections do
			Connections[i]:Disconnect()
		end
		return BindableEvent:Fire(...)
	end
	
	for i = 1, #Connections do
		Connections[i] = Connections[i]:Connect(fire)
	end
	return BindableEvent.Event:Wait()
end

local function findFirstChildByNameAndClass(Object, Name, ClassName) --[[ Line: 415 ]]
	for _, child in ipairs(Object:GetChildren()) do
		if child.Name == Name and child:IsA(ClassName) then
			return child
		end
	end
end

function BubbleChatBillboard.onCharacterAdded(p1, Player: Player, Object) --[[ Line: 424 ]]
	-- upvalues: waitForFirst (copy), v1 (copy), GetFFlagBubbleChatInexistantAdorneeFixModule (copy), findFirstChildByNameAndClass (copy)
	if not Object.Parent then
		waitForFirst(Object.AncestryChanged, Player.CharacterAdded)
	end
	if Player.Character ~= Object or not Object.Parent then
		v1:debug("Mismatched or unparented character in onCharacterAdded for {}", p1.state.shortId)
		
		return
	end
	local Humanoid = Object:FindFirstChildOfClass("Humanoid")
	while Object:IsDescendantOf(game) and not Humanoid do
		waitForFirst(Object.ChildAdded, Object.AncestryChanged, Player.CharacterAdded)
		Humanoid = Object:FindFirstChildOfClass("Humanoid")
	end
	if Player.Character ~= Object or not Object:IsDescendantOf(game) then
		v1:debug("Mismatched or unparented character in onCharacterAdded for {}", p1.state.shortId)
		
		return
	end
	local PrimaryPart = if GetFFlagBubbleChatInexistantAdorneeFixModule() then Object.PrimaryPart else Object:FindFirstChild("HumanoidRootPart")
	while Object:IsDescendantOf(game) and not PrimaryPart do
		waitForFirst(Object.ChildAdded, Object.AncestryChanged, Player.CharacterAdded)
		PrimaryPart = if GetFFlagBubbleChatInexistantAdorneeFixModule() then Object.PrimaryPart else Object:FindFirstChild("HumanoidRootPart")
	end
	if PrimaryPart and Object:IsDescendantOf(game) and Player.Character == Object and p1.isMounted then
		local Head = findFirstChildByNameAndClass(Object, "Head", "BasePart")
		p1:setState({ adornee = Humanoid.Health == 0 and Head or Object })
		
		if p1.humanoidDiedConn then
			p1.humanoidDiedConn:Disconnect()
			p1.humanoidDiedConn = nil
		end
		p1.humanoidDiedConn = Humanoid.Died:Connect(function() --[[ Line: 474 ]]
			-- upvalues: p1 (copy), findFirstChildByNameAndClass (upval), Object (copy)
			p1:setState({
				adornee = findFirstChildByNameAndClass(Object, "Head", "BasePart") or Object
			})
		end)
	end
end

function BubbleChatBillboard.getVerticalOffset(p2, Model: Model) --[[ Line: 484 ]]
	if Model and Model:IsA("Model") then
		local BoundingCFrame, BoundingSize = Model:GetBoundingBox()
		local AdorneeInstance = p2:getAdorneeInstance(Model)
		
		return if AdorneeInstance then if AdorneeInstance:IsA("BasePart") then BoundingSize.Y / 2 - BoundingCFrame:PointToObjectSpace(AdorneeInstance.Position).Y else 0 else BoundingSize.Y / 2
	else
		return if Model and Model:IsA("BasePart") then Model.Size.Y / 2 else 0
	end
end

function BubbleChatBillboard.getAdorneeInstance(p2, Model) --[[ Line: 506 ]]
	-- upvalues: GetFFlagBubbleChatInexistantAdorneeFixModule (copy)
	if not Model then return end
	if Model:IsA("Model") then
		local AdorneeName = Model:FindFirstChild(p2.state.savedChatSettings.AdorneeName, true)
		
		if GetFFlagBubbleChatInexistantAdorneeFixModule() then
			AdorneeName = AdorneeName or Model.PrimaryPart
		end
		if not AdorneeName or AdorneeName:IsA("BasePart") or AdorneeName:IsA("Attachment") then
			return AdorneeName
		end
	elseif Model:IsA("BasePart") or Model:IsA("Attachment") then
		return Model
	end
end

function BubbleChatBillboard.getRenderVoiceAndCameraBubble(p2): boolean --[[ Line: 522 ]]
	-- upvalues: DebugAllowControlButtonsNoVoiceChat (copy), Players (copy), VRService (copy), EnabledFunction (copy)
	return if p2.props.voiceEnabled or DebugAllowControlButtonsNoVoiceChat then if p2.props.userId == tostring(Players.LocalPlayer.UserId) then not VRService.VREnabled and not EnabledFunction() and not p2.state.selfViewOpen else p2.props.voiceEnabled and not p2.state.voiceTimedOut else false
end

function BubbleChatBillboard.shouldRenderCarat(p2): boolean --[[ Line: 552 ]]
	return p2.props.chatSettings.TailVisible and not p2:getRenderVoiceAndCameraBubble()
end

function BubbleChatBillboard.render(p2) --[[ Line: 556 ]]
	-- upvalues: Players (copy), v1 (copy), EasierUnmuting3 (copy), ConstantsModule (copy), EasierUnmutingHideIfMuted (copy), VRService (copy), EnabledFunction (copy), RoactModule (copy), VoiceBubbleModule (copy), BubbleChatListModule (copy), ChatBubbleDistantModule (copy)
	local AdorneeInstance = p2:getAdorneeInstance(p2.state.adornee)
	local IsUserIdMatch = p2.props.userId == tostring(Players.LocalPlayer.UserId)
	local SavedChatSettings = p2.state.savedChatSettings
	
	if not AdorneeInstance then
		v1:trace("No adornee for {}", p2.state.shortId)
		
		return
	end
	if not p2.state.isInsideRenderDistance then
		v1:trace("Not in range for {}", p2.state.shortId)
		
		return
	end
	if EasierUnmuting3 and p2.state.isInEasierUnmutingTreatment and p2.props.voiceState == ConstantsModule.VOICE_STATE.LOCAL_MUTED and (not p2.state.isInsideEasierUnmutingDistance or EasierUnmutingHideIfMuted and p2.state.isMuted) then
		v1:trace("Unmute toggle not applicable for {}", p2.state.shortId)
		
		return
	end
	local t = {}
	local NoVoiceTimedOut: boolean = p2.props.voiceEnabled and not p2.state.voiceTimedOut
	
	if (VRService.VREnabled or EnabledFunction()) and IsUserIdMatch then
		NoVoiceTimedOut = false
	end
	if NoVoiceTimedOut and (not p2.props.bubbleChatEnabled or not p2.props.messageIds or #p2.props.messageIds == 0) then
		t.VoiceBubble = RoactModule.createElement(VoiceBubbleModule, {
			chatSettings = SavedChatSettings,
			renderInsert = p2.renderInsert,
			insertSize = p2.insertSize,
			isDistant = not p2.state.isInsideMaximizeDistance
		})
	end
	if p2.state.hasMessage then
		if p2.state.isInsideMaximizeDistance then
			t.BubbleChatList = RoactModule.createElement(BubbleChatListModule, {
				userId = p2.props.userId,
				isVisible = p2.state.isInsideMaximizeDistance,
				onLastBubbleFadeOut = p2.onLastBubbleFadeOut,
				chatSettings = SavedChatSettings,
				renderFirstInsert = if NoVoiceTimedOut then p2.renderInsert else nil,
				insertSize = p2.insertSize,
				showCarat = p2:shouldRenderCarat()
			})
		else
			t.DistantBubble = RoactModule.createElement(ChatBubbleDistantModule, {
				fadingOut = not p2.props.messageIds or #p2.props.messageIds == 0,
				onFadeOut = p2.onLastBubbleFadeOut,
				chatSettings = SavedChatSettings,
				renderInsert = NoVoiceTimedOut and p2.renderInsert,
				insertSize = p2.insertSize
			})
		end
	end
	return RoactModule.createElement("BillboardGui", {
		ResetOnSpawn = false,
		Adornee = AdorneeInstance,
		Active = NoVoiceTimedOut,
		Size = UDim2.fromOffset(500, 200),
		SizeOffset = Vector2.new(0, 0.5),
		StudsOffset = (IsUserIdMatch and SavedChatSettings.LocalPlayerStudsOffset or vector.create(0, 1, 0.10000000149011612)) + Vector3.new(0, SavedChatSettings.VerticalStudsOffset, 0),
		StudsOffsetWorldSpace = p2.offset
	}, t)
end

function BubbleChatBillboard.didUpdate(p2, _, p3) --[[ Line: 652 ]]
	-- upvalues: EasierUnmuting3 (copy), Players (copy), ConstantsModule (copy), IXPServiceWrapper (copy), EasierUnmutingIXPLayerName (copy)
	if (not p2.props.messageIds or #p2.props.messageIds == 0) and not p2.state.isInsideRenderDistance then
		p2.onLastBubbleFadeOut()
	end
	if p2.props.messageIds and #p2.props.messageIds > 0 then
		p2.isFadingOut = false
	end
	if EasierUnmuting3 and p2.state.isInEasierUnmutingTreatment then
		p2:checkCounterForTimeoutWithEasierUnmuting(p3)
	else
		p2:checkCounterForTimeout(p3.voiceStateCounter)
	end
	local IsUserIdMatch = p2.props.userId == tostring(Players.LocalPlayer.UserId)
	
	if EasierUnmuting3 and IsUserIdMatch and not p2.state.haveLoggedUserExposure and (p2.props.voiceState == ConstantsModule.VOICE_STATE.INACTIVE or p2.props.voiceState == ConstantsModule.VOICE_STATE.TALKING or p2.props.voiceState == ConstantsModule.VOICE_STATE.MUTED) then
		IXPServiceWrapper:LogUserLayerExposure(EasierUnmutingIXPLayerName)
		p2:setState({ haveLoggedUserExposure = true })
	end
end

function BubbleChatBillboard.getDerivedStateFromProps(p2, DerivedStateFromProps) --[[ Line: 689 ]]
	local Text = "..." .. string.sub(tostring(p2.userId), -4)
	local v2: boolean = not DerivedStateFromProps.hasMessage and (p2.messageIds and #p2.messageIds > 0)
	local VoiceState = nil
	local VoiceStateCounter: number? = nil
	local VoiceTimedOut: boolean? = nil
	
	if DerivedStateFromProps.lastVoiceState ~= p2.voiceState then
		VoiceStateCounter = (DerivedStateFromProps.voiceStateCounter or 0) + 1
		VoiceTimedOut = false
		VoiceState = p2.voiceState
	end
	return {
		hasMessage = v2 or nil,
		savedChatSettings = p2.lastMessage and p2.chatSettings,
		shortId = Text,
		voiceStateCounter = VoiceStateCounter,
		voiceTimedOut = VoiceTimedOut,
		lastVoiceState = VoiceState
	}
end

return RoactRoduxModule.connect(function(p2, p3) --[[ Line: 719 | Named "mapStateToProps" ]]
	-- upvalues: GetSettingsForMessageModule (copy)
	local UserMessage = p2.userMessages[p3.userId]
	local UserMessageEntry = UserMessage and (#UserMessage >= 1 and UserMessage[#UserMessage])
	local Message = UserMessageEntry and p2.messages[UserMessageEntry]
	
	return {
		chatSettings = GetSettingsForMessageModule(p2.chatSettings, Message),
		messageIds = UserMessage,
		lastMessage = Message,
		voiceState = p2.voiceState[p3.userId]
	}
end)(BubbleChatBillboard)