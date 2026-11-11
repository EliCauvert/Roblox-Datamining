local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local RoactModule = require(Parent.Roact)
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local List = require(Parent.llama).List
local OtterModule = require(Parent.Otter)
local TutilsModule = require(Parent.tutils)
local SharedFlagsModule = require(Parent.SharedFlags)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local VRService = game:GetService("VRService")
local CreateEffectFunction = require(Parent.Signals).createEffect
local NewResult = ExpChatSharedModule.Logger:new("ExpChat/" .. script.Name)
local BubbleChat = script:FindFirstAncestor("BubbleChat")
local VoiceIndicatorModule = require(BubbleChat.VoiceIndicator)
local BlankBubbleModule = require(BubbleChat.BlankBubble)
local BubbleChatListModule = require(BubbleChat.BubbleChatList)
local ChatBubbleDistantModule = require(BubbleChat.ChatBubbleDistant)
local GlobalFlagsModule = require(ExpChat.GlobalFlags)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local GetChatConfigurationStoreModule = require(ExpChat.Stores.GetChatConfigurationStore)
local GetSettingsForMessageModule = require(BubbleChat.Helpers.getSettingsForMessage)
local SelfViewNoApi = game:DefineFastFlag("SelfViewNoApi", false)
local PlayerButtonsModule = require(BubbleChat.PlayerButtons)
local FFlagEasierUnmutingModule = require(ExpChat.Flags.FFlagEasierUnmuting)
local ExpChatMemoBillboardGui = game:DefineFastFlag("ExpChatMemoBillboardGui", false)
local ExperienceChatHeartbeatIncrement = game:DefineFastInt("ExperienceChatHeartbeatIncrement", 5)
local FFlagExpChatUseAdorneeStore = SharedFlagsModule.FFlagExpChatUseAdorneeStore
local FFlagExpChatUseProximityStore = SharedFlagsModule.FFlagExpChatUseProximityStore
local ExpChatProximityStoreExtraRendersBeforeUnmount = game:DefineFastInt("ExpChatProximityStoreExtraRendersBeforeUnmount", 10)
local FFlagExpChatUseMessagesStore = SharedFlagsModule.FFlagExpChatUseMessagesStore
local FFlagExpChatUseChatConfigStore = SharedFlagsModule.FFlagExpChatUseChatConfigStore
local _Vector2 = Vector2.new(28, 28)

local function getRecentMessages(FilteredMessages, ScaledBubbleDuration, MaxBubbles)
	-- upvalues: List (copy)
	local ScaledServerTimeNow = workspace:GetServerTimeNow() * 1000
	
	return List.filter(FilteredMessages or {}, function(p1, p2): boolean
		-- upvalues: FilteredMessages (copy), MaxBubbles (copy), ScaledServerTimeNow (copy), ScaledBubbleDuration (copy)
		return if p1.isVisibleInBubbleChat then #FilteredMessages - MaxBubbles < p2 and ScaledServerTimeNow - p1.timestamp.UnixTimestampMillis < ScaledBubbleDuration else false
	end)
end

local BubbleChatBillboard = (if game:DefineFastFlag("StopBubbleChatReactWarning", false) then RoactModule.Component else RoactModule.PureComponent):extend("BubbleChatBillboard")
local config = { dampingRatio = 1, frequency = 4 }
local CurrentCamera = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: CurrentCamera (ref)
	CurrentCamera = workspace.CurrentCamera
end)

function BubbleChatBillboard.init(p1)
	-- upvalues: GlobalFlagsModule (copy), SelfViewNoApi (copy), StarterGui (copy), FFlagExpChatUseProximityStore (copy), ExpChatSharedModule (copy), RoactModule (copy), FFlagExpChatUseMessagesStore (copy), OtterModule (copy), Players (copy), VoiceIndicatorModule (copy), GetMessagesStoreModule (copy), FFlagExpChatUseChatConfigStore (copy), GetChatConfigurationStoreModule (copy)
	local SelfViewVisibility = nil
	local SelfViewEnabled = nil
	
	if GlobalFlagsModule.AvatarChatEnabled then
		SelfViewVisibility = p1.props.selfViewListenerChanged.getSelfViewVisibility()
		SelfViewEnabled = SelfViewNoApi or (StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.All) or StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView))
	end
	if FFlagExpChatUseProximityStore then
		local Context = ExpChatSharedModule.context
		p1.ProximityStore = Context and Context.proximityStore
		p1.invisibleCount, p1.setInvisibleCount = RoactModule.createBinding(100)
		p1.renderDistanceBinding, p1.updateRenderDistanceBinding = RoactModule.createBinding(false)
		p1.maximizeDistanceBinding, p1.updateMaximizeDistanceBinding = RoactModule.createBinding(false)
	end
	p1:setState({
		isInsideRenderDistance = false,
		isInsideMaximizeDistance = false,
		voiceTimedOut = false,
		voiceStateCounter = 0,
		lastVoiceState = nil,
		savedChatSettings = p1.props.chatSettings,
		selfViewOpen = SelfViewVisibility,
		selfViewEnabled = SelfViewEnabled,
		filteredMessages = if FFlagExpChatUseMessagesStore then {} else nil
	})
	p1.isMounted = false
	p1.offset, p1.updateOffset = RoactModule.createBinding((Vector3.new()))
	p1.offsetMotor = OtterModule.createSingleMotor(0)
	p1.offsetMotor:onStep(function(Y)
		-- upvalues: p1 (copy)
		p1.updateOffset((Vector3.new(0, Y, 0)))
	end)
	p1.offsetGoal = 0
	p1.adorneeBinding, p1.updateAdorneeBinding = RoactModule.createBinding(nil)
	p1.localAdorneeBinding, p1.updateLocalAdorneeBinding = RoactModule.createBinding(nil)
	
	if FFlagExpChatUseProximityStore then
		p1.voiceTimedOutBinding, p1.setVoiceTimedOutBinding = RoactModule.createBinding(false)
	end
	p1.heartbeatCount = 0
	p1.lastDistanceUpdate = 0
	
	function p1.onLastBubbleFadeOut()
		-- upvalues: p1 (copy)
		if p1.props.onFadeOut and not p1.isFadingOut then
			p1.isFadingOut = true
			p1.props.onFadeOut(p1.props.userId)
		end
	end
	
	function p1.wrappedOnClickVoiceIndicator(p2, p3)
		-- upvalues: p1 (copy)
		return p1.props.onClickedVoiceIndicator(p2, p3, "bubblechat")
	end
	
	local LocalPlayer = Players.LocalPlayer
	local MicDark: string = if LocalPlayer and p1.props.userId == tostring(LocalPlayer.UserId) then "MicDark" else "SpeakerDark"
	
	function p1.renderInsert()
		-- upvalues: RoactModule (upval), VoiceIndicatorModule (upval), p1 (copy), MicDark (copy)
		return RoactModule.createElement(VoiceIndicatorModule, {
			userId = p1.props.userId,
			getIcon = p1.props.getIconVoiceIndicator,
			onClicked = p1.wrappedOnClickVoiceIndicator,
			iconStyle = MicDark
		})
	end
	
	if GlobalFlagsModule.AvatarChatEnabled then
		local GetSelfViewVisibilityFunction = p1.props.selfViewListenerChanged.getSelfViewVisibility
		p1.selfViewConnection = p1.props.selfViewListenerChanged.selfViewVisibilityUpdatedSignal:connect(function()
			-- upvalues: p1 (copy), GetSelfViewVisibilityFunction (copy)
			p1:setState({ selfViewOpen = GetSelfViewVisibilityFunction() })
		end)
	end
	if FFlagExpChatUseMessagesStore then
		p1.MessagesStore = GetMessagesStoreModule(false)
	end
	if FFlagExpChatUseChatConfigStore then
		p1.ChatConfigurationStore = GetChatConfigurationStoreModule(false)
	end
end

function BubbleChatBillboard.checkCounterForTimeout(p1, VoiceStateCounter)
	-- upvalues: Players (copy), FFlagExpChatUseProximityStore (copy)
	if Players.LocalPlayer and p1.props.userId ~= tostring(Players.LocalPlayer.UserId) and p1.state.lastVoiceState ~= "Talking" and p1.state.voiceStateCounter ~= VoiceStateCounter then
		local VoiceStateCounter1 = p1.state.voiceStateCounter
		delay(1, function()
			-- upvalues: p1 (copy), VoiceStateCounter1 (copy), FFlagExpChatUseProximityStore (upval)
			if p1.state.voiceStateCounter == VoiceStateCounter1 and p1.isMounted then
				if FFlagExpChatUseProximityStore then
					p1.setVoiceTimedOutBinding(true)
					
					return
				end
				p1:setState({ voiceTimedOut = true })
			end
		end)
	end
end

function BubbleChatBillboard.getVerticalOffset(p1)
	local EffectiveAdornee = p1:getEffectiveAdornee(false)
	
	if EffectiveAdornee and EffectiveAdornee:IsA("Model") then
		local BoundingCFrame, BoundingSize = EffectiveAdornee:GetBoundingBox()
		local AdorneeInstance = getAdorneeInstance(EffectiveAdornee, p1.state.savedChatSettings.AdorneeName)
		
		return if AdorneeInstance then if AdorneeInstance:IsA("BasePart") then BoundingSize.Y / 2 - BoundingCFrame:PointToObjectSpace(AdorneeInstance.Position).Y else 0 else BoundingSize.Y / 2
	else
		return if EffectiveAdornee and EffectiveAdornee:IsA("BasePart") then EffectiveAdornee.Size.Y / 2 else 0
	end
end

function getAdorneeInstance(Object, ChildName)
	if not Object then
		return nil
	end
	if Object:IsA("Model") then
		local ChildName1 = Object:FindFirstChild(ChildName, true) or Object.PrimaryPart
		
		if not ChildName1 or ChildName1:IsA("BasePart") or ChildName1:IsA("Attachment") then
			return ChildName1
		end
	elseif Object:IsA("BasePart") or Object:IsA("Attachment") then
		return Object
	end
	return nil
end

function BubbleChatBillboard.getEffectiveAdornee(p1, p2)
	-- upvalues: FFlagExpChatUseAdorneeStore (copy), ExpChatSharedModule (copy)
	if not FFlagExpChatUseAdorneeStore then
		return p1.props.adornee
	end
	local Context = ExpChatSharedModule.context
	local AdorneeStore = Context and Context.adorneeStore
	
	if AdorneeStore and p1.props.userId then
		local Adornee = AdorneeStore.getAdornee(p1.props.userId)
		
		if Adornee then
			local AdorneeResult = Adornee(p2 or false)
			
			if AdorneeResult then
				return AdorneeResult
			end
		end
	end
	return p1.props.partOrModel
end

function BubbleChatBillboard.shouldRenderCaret(p1): boolean
	-- upvalues: FFlagExpChatUseChatConfigStore (copy)
	return (if FFlagExpChatUseChatConfigStore then p1.ChatConfigurationStore.getBubbleChatSettings(false) else p1.state.savedChatSettings).TailVisible and not p1:shouldRenderPlayerButtons()
end

function BubbleChatBillboard.shouldRenderCaretNew(p1, p2): boolean
	return p1.state.savedChatSettings.TailVisible and not p1:shouldRenderPlayerButtonsNew(p2)
end

function BubbleChatBillboard.shouldRenderPlayerButtons(p1): boolean
	-- upvalues: Players (copy), FFlagExpChatUseProximityStore (copy), VRService (copy), GlobalFlagsModule (copy)
	if not p1.props.voiceEnabled or not p1.props.isVoiceUIVisible then
		return false
	end
	local IsUserIdMatch: boolean = if Players.LocalPlayer then p1.props.userId == tostring(Players.LocalPlayer.UserId) else false
	
	if FFlagExpChatUseProximityStore then
		if IsUserIdMatch and not p1.props.testMode then
			return not VRService.VREnabled and not GlobalFlagsModule.ChromeEnabled and not p1.state.selfViewOpen
		end
	elseif IsUserIdMatch then
		return not VRService.VREnabled and not GlobalFlagsModule.ChromeEnabled and not p1.state.selfViewOpen
	end
	return p1.props.voiceEnabled and not p1.state.voiceTimedOut
end

function BubbleChatBillboard.shouldRenderPlayerButtonsNew(p1, p2): boolean
	-- upvalues: Players (copy), VRService (copy), GlobalFlagsModule (copy)
	return if p1.props.voiceEnabled and p1.props.isVoiceUIVisible then if if Players.LocalPlayer then p1.props.userId == tostring(Players.LocalPlayer.UserId) else false then not VRService.VREnabled and not GlobalFlagsModule.ChromeEnabled and not p1.state.selfViewOpen elseif p2 == nil then p1.props.voiceEnabled and not p1.state.voiceTimedOut else p1.props.voiceEnabled and not p2 else false
end

local function messagesHaveChanged(FilteredMessages, FilteredMessages1): boolean
	-- upvalues: FFlagExpChatUseMessagesStore (copy)
	local CountFilteredMessages = #FilteredMessages
	local CountFilteredMessages1 = #FilteredMessages1
	
	if CountFilteredMessages == 0 and CountFilteredMessages1 == 0 then
		return false
	end
	if CountFilteredMessages ~= CountFilteredMessages1 then
		return true
	end
	for i, filteredMessage in FilteredMessages do
		if filteredMessage.messageId ~= FilteredMessages1[i].messageId then
			return true
		elseif FFlagExpChatUseMessagesStore and filteredMessage.text ~= FilteredMessages1[i].text then
			return true
		end
	end
	return false
end

local config1 = { filteredMessages = true }

function BubbleChatBillboard.shouldComponentUpdate(p1, p2, p3): boolean
	-- upvalues: FFlagExpChatUseProximityStore (copy), messagesHaveChanged (copy), TutilsModule (copy), config1 (copy)
	return if FFlagExpChatUseProximityStore or p1.state.isInsideRenderDistance == p3.isInsideRenderDistance or p3.isInsideRenderDistance then if messagesHaveChanged(p1.state.filteredMessages, p3.filteredMessages) then true else not TutilsModule.shallowEqual(p2, p1.props, config1) or not TutilsModule.shallowEqual(p3, p1.state, config1) else false
end

function BubbleChatBillboard.render(p1)
	-- upvalues: FFlagExpChatUseChatConfigStore (copy), FFlagExpChatUseAdorneeStore (copy), Players (copy), NewResult (copy), FFlagExpChatUseProximityStore (copy), ExpChatProximityStoreExtraRendersBeforeUnmount (copy), RoactModule (copy), GlobalFlagsModule (copy), _Vector2 (copy), PlayerButtonsModule (copy), BlankBubbleModule (copy), BubbleChatListModule (copy), ChatBubbleDistantModule (copy)
	local BubbleChatSettings = if FFlagExpChatUseChatConfigStore then p1.ChatConfigurationStore.getBubbleChatSettings(false) else p1.state.savedChatSettings
	local AdorneeBinding = if FFlagExpChatUseAdorneeStore then p1.adorneeBinding else p1.props.adornee or p1.props.partOrModel
	local MapResult = if FFlagExpChatUseAdorneeStore then p1.adorneeBinding:map(function(p2)
		-- upvalues: p1 (copy)
		return getAdorneeInstance(p2, p1.state.savedChatSettings.AdorneeName)
	end) else getAdorneeInstance(AdorneeBinding, p1.state.savedChatSettings.AdorneeName)
	local IsUserIdMatch: boolean = if Players.LocalPlayer then p1.props.userId == tostring(Players.LocalPlayer.UserId) else false
	
	if not FFlagExpChatUseAdorneeStore and not MapResult then
		NewResult:trace("No adornee for {}", p1.state.shortId)
		
		return
	end
	if FFlagExpChatUseProximityStore then
		if p1.renderDistanceBinding:getValue() or p1.props.testMode then
			p1.setInvisibleCount(0)
		else
			if ExpChatProximityStoreExtraRendersBeforeUnmount < p1.invisibleCount:getValue() then return end
			p1.setInvisibleCount(p1.invisibleCount:getValue() + 1)
		end
	elseif not p1.state.isInsideRenderDistance then return end
	local MapResult1 = if FFlagExpChatUseProximityStore then RoactModule.joinBindings({
		renderDistance = p1.renderDistanceBinding,
		maximizeDistance = p1.maximizeDistanceBinding
	}):map(function(p2)
		return {
			isInsideMaximizeDistance = p2.maximizeDistance,
			isDistant = not p2.maximizeDistance
		}
	end) else nil
	local t = {}
	local v1: boolean = p1.state.filteredMessages and #p1.state.filteredMessages > 0
	local NoVoiceTimedOut: boolean = p1.props.voiceEnabled and not p1.state.voiceTimedOut
	
	if GlobalFlagsModule.AvatarChatEnabled and IsUserIdMatch then
		NoVoiceTimedOut = NoVoiceTimedOut and not p1.state.selfViewOpen
	end
	if GlobalFlagsModule.ChromeEnabled and IsUserIdMatch then
		NoVoiceTimedOut = false
	end
	local NoChromeEnabled: boolean = NoVoiceTimedOut and (not GlobalFlagsModule.AvatarChatEnabled and not GlobalFlagsModule.ChromeEnabled)
	local RenderInsert = if NoVoiceTimedOut then p1.renderInsert else nil
	local MapResult2 = if FFlagExpChatUseProximityStore then p1.voiceTimedOutBinding:map(function(p2): boolean
		-- upvalues: p1 (copy), GlobalFlagsModule (upval), IsUserIdMatch (copy)
		local NoP29: boolean = p1.props.voiceEnabled and not p2
		
		if GlobalFlagsModule.AvatarChatEnabled and IsUserIdMatch then
			NoP29 = NoP29 and not p1.state.selfViewOpen
		end
		if GlobalFlagsModule.ChromeEnabled and IsUserIdMatch then
			NoP29 = false
		end
		return NoP29
	end) else nil
	local ClientSettings = p1.props.clientSettings
	
	if FFlagExpChatUseProximityStore then
		if p1.props.testMode or GlobalFlagsModule.AvatarChatEnabled or GlobalFlagsModule.ChromeEnabled then
			t.PlayerButtons = RoactModule.createElement(PlayerButtonsModule, {
				LayoutOrder = 2,
				Visible = if FFlagExpChatUseProximityStore and not p1.props.testMode then p1.voiceTimedOutBinding:map(function(p2)
					-- upvalues: p1 (copy)
					return p1:shouldRenderPlayerButtonsNew(p2)
				end) else p1:shouldRenderPlayerButtons(),
				chatSettings = p1.props.chatSettings,
				isInsideMaximizeDistance = MapResult1:map(function(p2)
					return p2.isInsideMaximizeDistance
				end),
				isLocalPlayer = IsUserIdMatch,
				userId = p1.props.userId,
				getIcon = p1.props.getIconVoiceIndicator,
				hasCameraPermissions = p1.props.hasCameraPermissions,
				hasMicPermissions = p1.props.hasMicPermissions,
				onClickedVoiceIndicator = p1.wrappedOnClickVoiceIndicator,
				onClickedCameraIndicator = p1.props.onClickedCameraIndicator,
				voiceEnabled = p1.props.voiceEnabled,
				displayCameraDeniedToast = p1.props.displayCameraDeniedToast,
				isCamEnabledForUserAndPlace = p1.props.isCamEnabledForUserAndPlace,
				setCameraPermissionStateFromControl = p1.props.setCameraPermissionStateFromControl,
				getPermissions = p1.props.getPermissions,
				isCameraOnlyUser = p1.props.isCameraOnlyUser,
				isVoiceServiceInitialized = p1.props.isVoiceServiceInitialized
			})
			t.listLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				Padding = UDim.new(0, 8)
			})
			t.padding = RoactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 8) })
		elseif NoVoiceTimedOut and v1 == false then
			t.VoiceBubble = RoactModule.createElement(BlankBubbleModule, {
				chatSettings = BubbleChatSettings,
				userId = p1.props.userId,
				renderInsert = RenderInsert,
				insertSize = _Vector2,
				isDistant = not p1.state.isInsideMaximizeDistance,
				clientSettings = ClientSettings
			})
		end
	elseif GlobalFlagsModule.AvatarChatEnabled or GlobalFlagsModule.ChromeEnabled then
		if p1:shouldRenderPlayerButtons() then
			t.PlayerButtons = RoactModule.createElement(PlayerButtonsModule, {
				LayoutOrder = 2,
				chatSettings = p1.props.chatSettings,
				isInsideMaximizeDistance = p1.state.isInsideMaximizeDistance,
				isLocalPlayer = IsUserIdMatch,
				userId = p1.props.userId,
				getIcon = p1.props.getIconVoiceIndicator,
				hasCameraPermissions = p1.props.hasCameraPermissions,
				hasMicPermissions = p1.props.hasMicPermissions,
				onClickedVoiceIndicator = p1.wrappedOnClickVoiceIndicator,
				onClickedCameraIndicator = p1.props.onClickedCameraIndicator,
				voiceEnabled = p1.props.voiceEnabled,
				displayCameraDeniedToast = p1.props.displayCameraDeniedToast,
				isCamEnabledForUserAndPlace = p1.props.isCamEnabledForUserAndPlace,
				setCameraPermissionStateFromControl = p1.props.setCameraPermissionStateFromControl,
				getPermissions = p1.props.getPermissions,
				isCameraOnlyUser = p1.props.isCameraOnlyUser,
				isVoiceServiceInitialized = p1.props.isVoiceServiceInitialized
			})
			t.listLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				Padding = UDim.new(0, 8)
			})
			t.padding = RoactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 8) })
		end
	elseif NoVoiceTimedOut and v1 == false then
		t.VoiceBubble = RoactModule.createElement(BlankBubbleModule, {
			chatSettings = BubbleChatSettings,
			userId = p1.props.userId,
			renderInsert = RenderInsert,
			insertSize = _Vector2,
			isDistant = not p1.state.isInsideMaximizeDistance,
			clientSettings = ClientSettings
		})
	end
	local ShouldRenderCaret = p1:shouldRenderCaret()
	
	if FFlagExpChatUseProximityStore then
		t.BubbleChatListContainer = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Visible = MapResult1:map(function(p2)
				return p2.isInsideMaximizeDistance
			end)
		}, {
			BubbleChatList = RoactModule.createElement(BubbleChatListModule, {
				userId = p1.props.userId,
				isVisible = MapResult1:map(function(p2)
					return p2.isInsideMaximizeDistance
				end),
				onLastBubbleFadeOut = p1.onLastBubbleFadeOut,
				chatSettings = BubbleChatSettings,
				renderFirstInsert = if NoChromeEnabled then RenderInsert else nil,
				insertSize = _Vector2,
				messages = p1.state.filteredMessages,
				clientSettings = ClientSettings,
				isTextChatServiceOn = p1.props.isTextChatServiceOn,
				showCaret = p1.voiceTimedOutBinding:map(function(p2)
					-- upvalues: p1 (copy)
					return p1:shouldRenderCaretNew(p2)
				end)
			})
		})
		
		if v1 then
			t.DistantBubbleContainer = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Visible = MapResult1:map(function(p2): boolean
					return not p2.isInsideMaximizeDistance
				end)
			}, {
				DistantBubble = RoactModule.createElement(ChatBubbleDistantModule, {
					fadingOut = not p1.state.filteredMessages or #p1.state.filteredMessages == 0,
					onFadeOut = p1.onLastBubbleFadeOut,
					chatSettings = BubbleChatSettings,
					renderInsert = if NoChromeEnabled then RenderInsert else nil,
					insertSize = _Vector2,
					clientSettings = ClientSettings,
					showCaret = p1.voiceTimedOutBinding:map(function(p2)
						-- upvalues: p1 (copy)
						return p1:shouldRenderCaretNew(p2)
					end)
				})
			})
		end
	elseif p1.state.isInsideMaximizeDistance then
		t.BubbleChatList = RoactModule.createElement(BubbleChatListModule, {
			userId = p1.props.userId,
			isVisible = p1.state.isInsideMaximizeDistance,
			onLastBubbleFadeOut = p1.onLastBubbleFadeOut,
			chatSettings = BubbleChatSettings,
			renderFirstInsert = if NoChromeEnabled then RenderInsert else nil,
			insertSize = _Vector2,
			messages = p1.state.filteredMessages,
			clientSettings = ClientSettings,
			isTextChatServiceOn = p1.props.isTextChatServiceOn,
			showCaret = ShouldRenderCaret
		})
	elseif v1 then
		t.DistantBubble = RoactModule.createElement(ChatBubbleDistantModule, {
			fadingOut = not p1.state.filteredMessages or #p1.state.filteredMessages == 0,
			onFadeOut = p1.onLastBubbleFadeOut,
			chatSettings = BubbleChatSettings,
			renderInsert = if NoChromeEnabled then RenderInsert else nil,
			insertSize = _Vector2,
			clientSettings = ClientSettings,
			showCaret = ShouldRenderCaret
		})
	end
	local LocalPlayerStudsOffset = IsUserIdMatch and BubbleChatSettings.LocalPlayerStudsOffset or vector.create(0, 1, 0.10000000149011612)
	
	return if FFlagExpChatUseProximityStore then RoactModule.createElement("BillboardGui", {
		ResetOnSpawn = false,
		Adornee = MapResult,
		Active = if GlobalFlagsModule.AvatarChatEnabled then p1.voiceTimedOutBinding:map(function(p2)
			-- upvalues: p1 (copy)
			return p1:shouldRenderPlayerButtonsNew(p2)
		end) else MapResult2:map(function(p2)
			return p2
		end),
		Size = UDim2.fromOffset(500, 200),
		SizeOffset = Vector2.new(0, 0.5),
		StudsOffset = LocalPlayerStudsOffset + Vector3.new(0, BubbleChatSettings.VerticalStudsOffset, 0),
		StudsOffsetWorldSpace = p1.offset,
		MaxDistance = p1.renderDistanceBinding:map(function(p2): number
			return if p2 then 1e999 else 0
		end)
	}, t) else RoactModule.createElement("BillboardGui", {
		ResetOnSpawn = false,
		Adornee = MapResult,
		Active = if GlobalFlagsModule.AvatarChatEnabled then p1:shouldRenderPlayerButtons() else NoVoiceTimedOut,
		Size = UDim2.fromOffset(500, 200),
		SizeOffset = Vector2.new(0, 0.5),
		StudsOffset = LocalPlayerStudsOffset + Vector3.new(0, BubbleChatSettings.VerticalStudsOffset, 0),
		StudsOffsetWorldSpace = p1.offset
	}, t)
end

function BubbleChatBillboard.didUpdate(p1, _, p2)
	-- upvalues: FFlagExpChatUseProximityStore (copy)
	if FFlagExpChatUseProximityStore then
		if (not p1.state.filteredMessages or #p1.state.filteredMessages == 0) and not p1.renderDistanceBinding:getValue() then
			p1.onLastBubbleFadeOut()
		end
	elseif (not p1.state.filteredMessages or #p1.state.filteredMessages == 0) and not p1.state.isInsideRenderDistance then
		p1.onLastBubbleFadeOut()
	end
	if p1.state.filteredMessages and #p1.state.filteredMessages > 0 then
		p1.isFadingOut = false
	end
	if FFlagExpChatUseProximityStore and p1.state.voiceStateCounter ~= p2.voiceStateCounter then
		p1.setVoiceTimedOutBinding(false)
	end
	p1:checkCounterForTimeout(p2.voiceStateCounter)
end

function BubbleChatBillboard.didMount(p1)
	-- upvalues: FFlagExpChatUseMessagesStore (copy), CreateEffectFunction (copy), FFlagExpChatUseChatConfigStore (copy), GetChatConfigurationStoreModule (copy), getRecentMessages (copy), OtterModule (copy), FFlagExpChatUseAdorneeStore (copy), ExpChatSharedModule (copy), Players (copy), FFlagEasierUnmutingModule (copy), FFlagExpChatUseProximityStore (copy), RunService (copy), ExperienceChatHeartbeatIncrement (copy), CurrentCamera (ref), config (copy)
	p1.isMounted = true
	
	if FFlagExpChatUseMessagesStore and p1.MessagesStore then
		p1.messagesEffect = CreateEffectFunction(function(p2)
			-- upvalues: p1 (copy), FFlagExpChatUseChatConfigStore (upval), GetChatConfigurationStoreModule (upval), getRecentMessages (upval)
			local UserId = p1.props.userId
			
			if not UserId and p1.props.partOrModel then
				UserId = p1.MessagesStore.getPartOrModelToMockUserId(p2)[p1.props.partOrModel]
			end
			if UserId then
				local BubbleChatSettings = if FFlagExpChatUseChatConfigStore then GetChatConfigurationStoreModule(false).getBubbleChatSettings(p2) else p1.props.chatSettings
				p1:setState({
					filteredMessages = getRecentMessages(p1.MessagesStore.getUserBubbleMessages(UserId)(p2), BubbleChatSettings.BubbleDuration * 1000, BubbleChatSettings.MaxBubbles)
				})
				
				return
			else
				p1:setState({ filteredMessages = {} })
			end
		end)
	end
	if FFlagExpChatUseChatConfigStore then
		p1.chatConfigEffect = CreateEffectFunction(function(p2)
			-- upvalues: GetChatConfigurationStoreModule (upval), p1 (copy)
			p1:setState({
				savedChatSettings = GetChatConfigurationStoreModule(false).getBubbleChatSettings(p2)
			})
		end)
	end
	local VerticalOffset = p1:getVerticalOffset()
	p1.offsetGoal = VerticalOffset
	p1.offsetMotor:setGoal(OtterModule.instant(VerticalOffset))
	
	if FFlagExpChatUseAdorneeStore then
		local Context = ExpChatSharedModule.context
		local AdorneeStore = Context and Context.adorneeStore
		local UserId = if Players.LocalPlayer then Players.LocalPlayer.UserId else -1
		
		if AdorneeStore and p1.props.userId and CreateEffectFunction then
			p1.adorneeEffect = CreateEffectFunction(function(p2)
				-- upvalues: p1 (copy)
				p1.updateAdorneeBinding((p1:getEffectiveAdornee(p2)))
			end)
			
			if FFlagEasierUnmutingModule then
				local Adornee = AdorneeStore.getAdornee(UserId)
				
				if Adornee then
					p1.localAdorneeEffect = CreateEffectFunction(function(p2)
						-- upvalues: Adornee (copy), p1 (copy)
						p1.updateLocalAdorneeBinding((Adornee(p2)))
					end)
				end
			end
		end
	end
	if FFlagExpChatUseProximityStore and p1.ProximityStore and p1.props.userId then
		p1.proximityEffect = CreateEffectFunction(function(p2)
			-- upvalues: p1 (copy)
			local _lastProximityState = p1.ProximityStore.getUserProximityState(p1.props.userId)(p2)
			p1.updateRenderDistanceBinding(_lastProximityState.isInsideRenderDistance)
			p1.updateMaximizeDistanceBinding(_lastProximityState.isInsideMaximizeDistance)
		end)
	end
	p1.heartbeatConn = RunService.Heartbeat:Connect(function(DeltaTime)
		-- upvalues: p1 (copy), ExperienceChatHeartbeatIncrement (upval), FFlagExpChatUseAdorneeStore (upval), CurrentCamera (upval), FFlagExpChatUseProximityStore (upval), OtterModule (upval), config (upval), FFlagExpChatUseMessagesStore (upval), getRecentMessages (upval)
		if p1.props.billboardUpdateFrequency > 0 then
			p1.lastDistanceUpdate += DeltaTime
			
			if p1.lastDistanceUpdate < p1.props.billboardUpdateFrequency then return end
			p1.lastDistanceUpdate = 0
		elseif not p1.props.tests_skipHeartbeatCheck then
			if p1.heartbeatCount < ExperienceChatHeartbeatIncrement then
				p1.heartbeatCount += 1
				
				return
			end
			p1.heartbeatCount = 0
		end
		local AdorneeInstance = if FFlagExpChatUseAdorneeStore then getAdorneeInstance(p1.adorneeBinding:getValue(), p1.state.savedChatSettings.AdorneeName) else getAdorneeInstance(p1.props.adornee or p1.props.partOrModel, p1.state.savedChatSettings.AdorneeName)
		
		if CurrentCamera and AdorneeInstance then
			local Distance = (CurrentCamera.CFrame.Position - (if AdorneeInstance:IsA("Attachment") then AdorneeInstance.WorldPosition else AdorneeInstance.Position)).Magnitude
			local IsDistanceBelow = Distance < p1.state.savedChatSettings.MaxDistance
			local IsDistanceBelow1 = Distance < p1.state.savedChatSettings.MinimizeDistance
			
			if FFlagExpChatUseProximityStore and p1.ProximityStore then
				if not p1._lastProximityState or p1._lastProximityState.isInsideRenderDistance ~= IsDistanceBelow or p1._lastProximityState.isInsideMaximizeDistance ~= IsDistanceBelow1 then
					p1.ProximityStore.updateProximity(p1.props.userId, IsDistanceBelow, IsDistanceBelow1)
					p1._lastProximityState = {
						isInsideRenderDistance = IsDistanceBelow,
						isInsideMaximizeDistance = IsDistanceBelow1
					}
				end
			elseif IsDistanceBelow1 ~= p1.state.isInsideMaximizeDistance or IsDistanceBelow ~= p1.state.isInsideRenderDistance then
				p1:setState({
					isInsideRenderDistance = IsDistanceBelow,
					isInsideMaximizeDistance = IsDistanceBelow1
				})
			end
		end
		local VerticalOffset = p1:getVerticalOffset()
		
		if math.abs(VerticalOffset - p1.offsetGoal) > 0.5 then
			p1.offsetGoal = VerticalOffset
			p1.offsetMotor:setGoal(OtterModule.spring(VerticalOffset, config))
		end
		local ScaledServerTimeNow = workspace:GetServerTimeNow() * 1000
		local ScaledBubbleDuration = p1.state.savedChatSettings.BubbleDuration * 1000
		
		for _, filteredMessage in p1.state.filteredMessages do
			if ScaledBubbleDuration <= ScaledServerTimeNow - filteredMessage.timestamp.UnixTimestampMillis then
				if FFlagExpChatUseMessagesStore then
					p1:setState(function(p2)
						-- upvalues: ScaledServerTimeNow (copy), ScaledBubbleDuration (copy)
						local FilteredMessages = {}
						
						for _, filteredMessage in ipairs(p2.filteredMessages) do
							if ScaledServerTimeNow - filteredMessage.timestamp.UnixTimestampMillis < ScaledBubbleDuration then
								table.insert(FilteredMessages, filteredMessage)
							end
						end
						return { filteredMessages = FilteredMessages }
					end)
					break
				else
					p1:setState(function(p3)
						-- upvalues: getRecentMessages (upval), ScaledBubbleDuration (copy), p1 (upval)
						return {
							filteredMessages = getRecentMessages(p3.filteredMessages, ScaledBubbleDuration, p1.props.chatSettings.MaxBubbles)
						}
					end)
					break
				end
			end
		end
	end)
	p1:checkCounterForTimeout(nil)
end

function BubbleChatBillboard.willUnmount(p2)
	-- upvalues: NewResult (copy), FFlagExpChatUseProximityStore (copy), FFlagExpChatUseMessagesStore (copy), FFlagExpChatUseChatConfigStore (copy)
	NewResult:trace("Unmounting billboards for {}", p2.state.shortId)
	p2.isMounted = false
	
	if p2.characterConn then
		p2.characterConn:Disconnect()
		p2.characterConn = nil
	end
	if p2.heartbeatConn then
		p2.heartbeatConn:Disconnect()
		p2.heartbeatConn = nil
	end
	if p2.humanoidDiedConn then
		p2.humanoidDiedConn:Disconnect()
		p2.humanoidDiedConn = nil
	end
	if p2.selfViewConnection then
		p2.selfViewConnection:disconnect()
		p2.selfViewConnection = nil
	end
	if p2.adorneeEffect then
		p2.adorneeEffect()
		p2.adorneeEffect = nil
	end
	if p2.localAdorneeEffect then
		p2.localAdorneeEffect()
		p2.localAdorneeEffect = nil
	end
	if FFlagExpChatUseProximityStore and p2.proximityEffect then
		p2.proximityEffect()
		p2.proximityEffect = nil
	end
	if FFlagExpChatUseMessagesStore and p2.messagesEffect then
		p2.messagesEffect()
		p2.messagesEffect = nil
	end
	if FFlagExpChatUseChatConfigStore and p2.chatConfigEffect then
		p2.chatConfigEffect()
		p2.chatConfigEffect = nil
	end
	p2.offsetMotor:destroy()
end

function BubbleChatBillboard.getDerivedStateFromProps(p2, DerivedStateFromProps)
	-- upvalues: FFlagExpChatUseMessagesStore (copy), getRecentMessages (copy)
	local Text = "..." .. string.sub(tostring(p2.userId), -4)
	local VoiceState = nil
	local VoiceStateCounter: number? = nil
	local VoiceTimedOut: boolean? = nil
	
	if DerivedStateFromProps.lastVoiceState ~= p2.voiceState then
		VoiceStateCounter = (DerivedStateFromProps.voiceStateCounter or 0) + 1
		VoiceTimedOut = false
		VoiceState = p2.voiceState
	end
	local ScaledBubbleDuration = DerivedStateFromProps.savedChatSettings.BubbleDuration * 1000
	
	return {
		savedChatSettings = if FFlagExpChatUseMessagesStore then p2.chatSettings else p2.lastMessage and p2.chatSettings,
		shortId = Text,
		filteredMessages = if FFlagExpChatUseMessagesStore then DerivedStateFromProps.filteredMessages else getRecentMessages(p2.messages, ScaledBubbleDuration, DerivedStateFromProps.savedChatSettings.MaxBubbles),
		voiceStateCounter = VoiceStateCounter,
		voiceTimedOut = VoiceTimedOut,
		lastVoiceState = VoiceState
	}
end

local function mapStateToProps(p2, p3)
	-- upvalues: Players (copy), FFlagExpChatUseChatConfigStore (copy), GetChatConfigurationStoreModule (copy), GetSettingsForMessageModule (copy), FFlagExpChatUseMessagesStore (copy), FFlagExpChatUseAdorneeStore (copy), FFlagEasierUnmutingModule (copy)
	local MessagesBySenderIdEntry = p2.Messages.messagesBySenderId[p3.userId]
	local MessagesBySenderIdEntry1 = if MessagesBySenderIdEntry == nil then nil else MessagesBySenderIdEntry[#MessagesBySenderIdEntry]
	local Text: string = if Players.LocalPlayer then tostring(Players.LocalPlayer.UserId) else ""
	
	return {
		messages = if FFlagExpChatUseMessagesStore then nil else MessagesBySenderIdEntry,
		lastMessage = if FFlagExpChatUseMessagesStore then nil else MessagesBySenderIdEntry1,
		chatSettings = if p3.isTextChatServiceOn then if FFlagExpChatUseChatConfigStore then GetChatConfigurationStoreModule(false).getBubbleChatSettings(false) else p2.BubbleChatSettings else GetSettingsForMessageModule(p2.LegacyBubbleChatSettings, MessagesBySenderIdEntry1),
		adornee = if FFlagExpChatUseAdorneeStore then nil else p2.Adornees[p3.userId] or p3.partOrModel,
		localAdornee = if FFlagExpChatUseAdorneeStore then nil elseif FFlagEasierUnmutingModule then p2.Adornees[Text] else nil,
		clientSettings = p2.ClientSettings,
		isVoiceUIVisible = p2.Voice.isVoiceUIVisible
	}
end

if FFlagExpChatUseAdorneeStore then
	local v1 = RoactRoduxModule.connect(mapStateToProps)(BubbleChatBillboard)
	
	return if ExpChatMemoBillboardGui then ReactModule.memo(v1) else v1
else
	return if ExpChatMemoBillboardGui then ReactModule.memo(RoactRoduxModule.connect(mapStateToProps)(BubbleChatBillboard)) else RoactRoduxModule.connect(mapStateToProps)(BubbleChatBillboard)
end