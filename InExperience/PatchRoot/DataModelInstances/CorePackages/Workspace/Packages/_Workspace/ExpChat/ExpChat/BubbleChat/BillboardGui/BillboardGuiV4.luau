local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local roactModule = require(parent.Roact)
local reactModule = require(parent.React)
local roactRoduxModule = require(parent.RoactRodux)
local list = require(parent.llama).List
local otterModule = require(parent.Otter)
local tutilsModule = require(parent.tutils)
local sharedFlagsModule = require(parent.SharedFlags)
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local starterGuiService = game:GetService("StarterGui")
local VRService = game:GetService("VRService")
local createEffect = require(parent.Signals).createEffect
local var1 = expChatSharedModule.Logger:new("ExpChat/" .. script.Name)
local bubbleChat = script:FindFirstAncestor("BubbleChat")
local voiceIndicatorModule = require(bubbleChat.VoiceIndicator)
local blankBubbleModule = require(bubbleChat.BlankBubble)
local bubbleChatListModule = require(bubbleChat.BubbleChatList)
local chatBubbleDistantModule = require(bubbleChat.ChatBubbleDistant)
local globalFlagsModule = require(expChat.GlobalFlags)
local helpers = bubbleChat.Helpers
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local getChatConfigurationStoreModule = require(expChat.Stores.GetChatConfigurationStore)
local getSettingsForMessageModule = require(helpers.getSettingsForMessage)
local selfViewNoApi = game:DefineFastFlag("SelfViewNoApi", false)
local playerButtonsModule = require(bubbleChat.PlayerButtons)
local fFlagEasierUnmutingModule = require(expChat.Flags.FFlagEasierUnmuting)
local expChatMemoBillboardGui = game:DefineFastFlag("ExpChatMemoBillboardGui", false)
local stopBubbleChatReactWarning = game:DefineFastFlag("StopBubbleChatReactWarning", false)
local experienceChatHeartbeatIncrement = game:DefineFastInt("ExperienceChatHeartbeatIncrement", 5)
local fFlagExpChatUseAdorneeStore = sharedFlagsModule.FFlagExpChatUseAdorneeStore
local fFlagExpChatUseProximityStore = sharedFlagsModule.FFlagExpChatUseProximityStore
local expChatProximityStoreExtraRendersBeforeUnmount = game:DefineFastInt("ExpChatProximityStoreExtraRendersBeforeUnmount", 10)
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagExpChatUseChatConfigStore = sharedFlagsModule.FFlagExpChatUseChatConfigStore
local vector2 = Vector2.new(28, 28)

local function getRecentMessages(p1, p2, p3)
	-- upvalues: list (ref)
	local var2 = workspace:GetServerTimeNow() * 1000
	
	return list.filter(p1 or {}, function(p4, p5)
		-- upvalues: p1 (ref), p3 (ref), var2 (ref), p2 (ref)
		return if p4.isVisibleInBubbleChat then #p1 - p3 < p5 and var2 - p4.timestamp.UnixTimestampMillis < p2 else false
	end)
end

local bubbleChatBillboard = (if stopBubbleChatReactWarning then roactModule.Component else roactModule.PureComponent):extend("BubbleChatBillboard")
local t = { dampingRatio = 1, frequency = 4 }
local currentCamera = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: currentCamera (write)
	currentCamera = workspace.CurrentCamera
end)

function bubbleChatBillboard.init(p1)
	-- upvalues: globalFlagsModule (ref), selfViewNoApi (ref), starterGuiService (ref), fFlagExpChatUseProximityStore (ref), expChatSharedModule (ref), roactModule (ref), fFlagExpChatUseMessagesStore (ref), otterModule (ref), playersService (ref), voiceIndicatorModule (ref), getMessagesStoreModule (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref)
	local selfViewVisibility = nil
	local var2 = nil
	
	if globalFlagsModule.AvatarChatEnabled then
		selfViewVisibility = p1.props.selfViewListenerChanged.getSelfViewVisibility()
		var2 = selfViewNoApi or (starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.All) or starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView))
	end
	if fFlagExpChatUseProximityStore then
		local context = expChatSharedModule.context
		p1.ProximityStore = context and context.proximityStore
		local var3, var4 = roactModule.createBinding(100)
		p1.invisibleCount = var3
		p1.setInvisibleCount = var4
		local var5, var6 = roactModule.createBinding(false)
		p1.renderDistanceBinding = var5
		p1.updateRenderDistanceBinding = var6
		local var7, var8 = roactModule.createBinding(false)
		p1.maximizeDistanceBinding = var7
		p1.updateMaximizeDistanceBinding = var8
	end
	p1:setState({
		isInsideRenderDistance = false,
		isInsideMaximizeDistance = false,
		voiceTimedOut = false,
		voiceStateCounter = 0,
		lastVoiceState = nil,
		savedChatSettings = p1.props.chatSettings,
		selfViewOpen = selfViewVisibility,
		selfViewEnabled = var2,
		filteredMessages = if fFlagExpChatUseMessagesStore then {} else nil
	})
	p1.isMounted = false
	local var9, var10 = roactModule.createBinding(Vector3.new())
	p1.offset = var9
	p1.updateOffset = var10
	p1.offsetMotor = otterModule.createSingleMotor(0)
	p1.offsetMotor:onStep(function(p2)
		-- upvalues: p1 (ref)
		p1.updateOffset(Vector3.new(0, p2, 0))
	end)
	p1.offsetGoal = 0
	local var11, var12 = roactModule.createBinding(nil)
	p1.adorneeBinding = var11
	p1.updateAdorneeBinding = var12
	local var13, var14 = roactModule.createBinding(nil)
	p1.localAdorneeBinding = var13
	p1.updateLocalAdorneeBinding = var14
	
	if fFlagExpChatUseProximityStore then
		local var15, var16 = roactModule.createBinding(false)
		p1.voiceTimedOutBinding = var15
		p1.setVoiceTimedOutBinding = var16
	end
	p1.heartbeatCount = 0
	p1.lastDistanceUpdate = 0
	
	function p5.onLastBubbleFadeOut()
		-- upvalues: p1 (ref)
		if p1.props.onFadeOut and not p1.isFadingOut then
			p1.isFadingOut = true
			p1.props.onFadeOut(p1.props.userId)
		end
	end
	
	function p5.wrappedOnClickVoiceIndicator(p2, p3)
		-- upvalues: p1 (ref)
		return p1.props.onClickedVoiceIndicator(p2, p3, "bubblechat")
	end
	
	local localPlayer = playersService.LocalPlayer
	local var17 = if localPlayer then if p1.props.userId ~= tostring(localPlayer.UserId) then "MicDark" else "SpeakerDark" else "SpeakerDark"
	
	function p5.renderInsert()
		-- upvalues: roactModule (copy), voiceIndicatorModule (copy), p1 (ref), var17 (ref)
		return roactModule.createElement(voiceIndicatorModule, {
			userId = p1.props.userId,
			getIcon = p1.props.getIconVoiceIndicator,
			onClicked = p1.wrappedOnClickVoiceIndicator,
			iconStyle = var17
		})
	end
	
	if globalFlagsModule.AvatarChatEnabled then
		local getSelfViewVisibility = p1.props.selfViewListenerChanged.getSelfViewVisibility
		p1.selfViewConnection = p1.props.selfViewListenerChanged.selfViewVisibilityUpdatedSignal:connect(function()
			-- upvalues: p1 (ref), getSelfViewVisibility (ref)
			p1:setState({ selfViewOpen = getSelfViewVisibility() })
		end)
	end
	if fFlagExpChatUseMessagesStore then
		p1.MessagesStore = getMessagesStoreModule(false)
	end
	if fFlagExpChatUseChatConfigStore then
		p1.ChatConfigurationStore = getChatConfigurationStoreModule(false)
	end
end

function bubbleChatBillboard.checkCounterForTimeout(p1, p2)
	-- upvalues: playersService (ref), fFlagExpChatUseProximityStore (ref)
	if playersService.LocalPlayer and p1.props.userId ~= tostring(playersService.LocalPlayer.UserId) and (p1.state.lastVoiceState ~= "Talking" and p1.state.voiceStateCounter ~= p2) then
		local voiceStateCounter = p1.state.voiceStateCounter
		delay(1, function()
			-- upvalues: p1 (ref), voiceStateCounter (ref), fFlagExpChatUseProximityStore (copy)
			if p1.state.voiceStateCounter == voiceStateCounter and p1.isMounted then
				if fFlagExpChatUseProximityStore then
					p1.setVoiceTimedOutBinding(true)
					
					return
				end
				p1:setState({ voiceTimedOut = true })
			end
		end)
	end
end

function bubbleChatBillboard.getVerticalOffset(value)
	local var2 = value:getEffectiveAdornee(false)
	
	if var2 and var2:IsA("Model") then
		local boundingBox, boundingBox_1 = var2:GetBoundingBox()
		local var3 = getAdorneeInstance(var2, value.state.savedChatSettings.AdorneeName)
		
		return if var3 then if var3:IsA("BasePart") then boundingBox_1.Y / 2 - boundingBox:PointToObjectSpace(var3.Position).Y else 0 else boundingBox_1.Y / 2
	end
	return if var2 and var2:IsA("BasePart") then var2.Size.Y / 2 else 0
end

function getAdorneeInstance(p1, p2)
	if not p1 then
		return nil
	elseif p1:IsA("Model") then
		local var2 = p1:FindFirstChild(p2, true) or p1.PrimaryPart
		
		if var2 and not var2:IsA("BasePart") and not var2:IsA("Attachment") then
		else
			return var2
		end
	else
		return if p1:IsA("BasePart") or p1:IsA("Attachment") then p1 else nil
	end
end

function bubbleChatBillboard.getEffectiveAdornee(p1, p2)
	-- upvalues: fFlagExpChatUseAdorneeStore (ref), expChatSharedModule (ref)
	if not fFlagExpChatUseAdorneeStore then
		return p1.props.adornee
	end
	local context = expChatSharedModule.context
	local adorneeStore = context and context.adorneeStore
	
	if adorneeStore and p1.props.userId then
		local adornee = adorneeStore.getAdornee(p1.props.userId)
		
		if adornee then
			local var2 = adornee(p2 or false)
			
			return var2 or p1.props.partOrModel
		end
	end
end

function bubbleChatBillboard.shouldRenderCaret(p1)
	-- upvalues: fFlagExpChatUseChatConfigStore (ref)
	return (if fFlagExpChatUseChatConfigStore then p1.ChatConfigurationStore.getBubbleChatSettings(false) else p1.state.savedChatSettings).TailVisible and not p1:shouldRenderPlayerButtons()
end

function bubbleChatBillboard.shouldRenderCaretNew(p1, p2)
	return p1.state.savedChatSettings.TailVisible and not p1:shouldRenderPlayerButtonsNew(p2)
end

function bubbleChatBillboard.shouldRenderPlayerButtons(p1)
	-- upvalues: playersService (ref), fFlagExpChatUseProximityStore (ref), VRService (ref), globalFlagsModule (ref)
	local var2
	if not p1.props.voiceEnabled or not p1.props.isVoiceUIVisible then
		return false
	elseif playersService.LocalPlayer then
		var2 = p1.props.userId == tostring(playersService.LocalPlayer.UserId)
		var2 = nil
	else
		var2 = false
	end
	if fFlagExpChatUseProximityStore then
		if not var2 or p1.props.testMode then
		end
		return if VRService.VREnabled or globalFlagsModule.ChromeEnabled then false else p1.state.selfViewOpen
	else
		return if var2 then if VRService.VREnabled or globalFlagsModule.ChromeEnabled then false else p1.state.selfViewOpen else p1.props.voiceEnabled and not p1.state.voiceTimedOut
	end
end

function bubbleChatBillboard.shouldRenderPlayerButtonsNew(p1, p2)
	-- upvalues: playersService (ref), VRService (ref), globalFlagsModule (ref)
	local var2
	if not p1.props.voiceEnabled or not p1.props.isVoiceUIVisible then
		return false
	elseif playersService.LocalPlayer then
		var2 = p1.props.userId == tostring(playersService.LocalPlayer.UserId)
		var2 = nil
	else
		var2 = false
	end
	return if var2 then if VRService.VREnabled or globalFlagsModule.ChromeEnabled then false else p1.state.selfViewOpen elseif p2 == nil then p1.props.voiceEnabled and not p1.state.voiceTimedOut else p1.props.voiceEnabled and not p2
end

local function messagesHaveChanged(p1, p2)
	-- upvalues: fFlagExpChatUseMessagesStore (ref)
	local p21Count = #p1
	local p22Count = #p2
	
	if p21Count == 0 and p22Count == 0 then
		return false
	elseif p21Count ~= p22Count then
		return true
	end
	for i, v in p1 do
		if v.messageId == p2[i].messageId then
			if fFlagExpChatUseMessagesStore and v.text ~= p2[i].text then
				return true
			end
		end
		return true
	end
	return false
end

local t_1 = { filteredMessages = true }

function bubbleChatBillboard.shouldComponentUpdate(p3, p4, p5)
	-- upvalues: fFlagExpChatUseProximityStore (ref), messagesHaveChanged (ref), tutilsModule (ref), t_1 (ref)
	return not (not fFlagExpChatUseProximityStore and p3.state.isInsideRenderDistance ~= p5.isInsideRenderDistance and not p5.isInsideRenderDistance) and (if messagesHaveChanged(p3.state.filteredMessages, p5.filteredMessages) then true else not tutilsModule.shallowEqual(p4, p3.props, t_1) or not tutilsModule.shallowEqual(p5, p3.state, t_1))
end

function bubbleChatBillboard.render(p3)
	-- upvalues: fFlagExpChatUseChatConfigStore (ref), fFlagExpChatUseAdorneeStore (ref), playersService (ref), var1 (ref), fFlagExpChatUseProximityStore (ref), expChatProximityStoreExtraRendersBeforeUnmount (ref), roactModule (ref), globalFlagsModule (ref), vector2 (ref), playerButtonsModule (ref), blankBubbleModule (ref), bubbleChatListModule (ref), chatBubbleDistantModule (ref)
	local var2
	local var3 = if fFlagExpChatUseChatConfigStore then p3.ChatConfigurationStore.getBubbleChatSettings(false) else p3.state.savedChatSettings
	local var4 = if fFlagExpChatUseAdorneeStore then p3.adorneeBinding:map(function(p4)
		-- upvalues: p3 (ref)
		return getAdorneeInstance(p4, p3.state.savedChatSettings.AdorneeName)
	end) else getAdorneeInstance(if fFlagExpChatUseAdorneeStore then p3.adorneeBinding else p3.props.adornee or p3.props.partOrModel, p3.state.savedChatSettings.AdorneeName)
	
	if playersService.LocalPlayer then
		var2 = p3.props.userId == tostring(playersService.LocalPlayer.UserId)
		var2 = nil
	else
		var2 = false
	end
	if not fFlagExpChatUseAdorneeStore and not var4 then
		var1:trace("No adornee for {}", p3.state.shortId)
		
		return
	elseif not fFlagExpChatUseProximityStore then
		if not p3.state.isInsideRenderDistance then return end
	elseif p3.renderDistanceBinding:getValue() or p3.props.testMode then
		p3.setInvisibleCount(0)
	elseif expChatProximityStoreExtraRendersBeforeUnmount < p3.invisibleCount:getValue() then return end
	p3.setInvisibleCount(p3.invisibleCount:getValue() + 1)
	local var5 = if fFlagExpChatUseProximityStore then roactModule.joinBindings({
		renderDistance = p3.renderDistanceBinding,
		maximizeDistance = p3.maximizeDistanceBinding
	}):map(function(p4)
		return {
			isInsideMaximizeDistance = p4.maximizeDistance,
			isDistant = not p4.maximizeDistance
		}
	end) else nil
	local t = {}
	local var6 = p3.state.filteredMessages and #p3.state.filteredMessages > 0
	local var7 = p3.props.voiceEnabled and not p3.state.voiceTimedOut
	
	if globalFlagsModule.AvatarChatEnabled and var2 then
		var7 = var7 and not p3.state.selfViewOpen
	end
	if globalFlagsModule.ChromeEnabled and var2 then
		var7 = false
	end
	local var8 = var7 and (not globalFlagsModule.AvatarChatEnabled and not globalFlagsModule.ChromeEnabled)
	local var9 = if var7 then p3.renderInsert else nil
	local var10 = if fFlagExpChatUseProximityStore then p3.voiceTimedOutBinding:map(function(p4)
		-- upvalues: p3 (ref), globalFlagsModule (copy), var2 (ref)
		local var11 = p3.props.voiceEnabled and not p4
		
		if globalFlagsModule.AvatarChatEnabled and var2 then
			var11 = var11 and not p3.state.selfViewOpen
		end
		if globalFlagsModule.ChromeEnabled and var2 then
			var11 = false
		end
		return var11
	end) else nil
	local clientSettings = p3.props.clientSettings
	
	if fFlagExpChatUseProximityStore then
		if p3.props.testMode or globalFlagsModule.AvatarChatEnabled or globalFlagsModule.ChromeEnabled then
			t.PlayerButtons = roactModule.createElement(playerButtonsModule, {
				LayoutOrder = 2,
				Visible = if fFlagExpChatUseProximityStore and not p3.props.testMode then p3.voiceTimedOutBinding:map(function(p4)
					-- upvalues: p3 (ref)
					return p3:shouldRenderPlayerButtonsNew(p4)
				end) else p3:shouldRenderPlayerButtons(),
				chatSettings = p3.props.chatSettings,
				isInsideMaximizeDistance = var5:map(function(p4)
					return p4.isInsideMaximizeDistance
				end),
				isLocalPlayer = var2,
				userId = p3.props.userId,
				getIcon = p3.props.getIconVoiceIndicator,
				hasCameraPermissions = p3.props.hasCameraPermissions,
				hasMicPermissions = p3.props.hasMicPermissions,
				onClickedVoiceIndicator = p3.wrappedOnClickVoiceIndicator,
				onClickedCameraIndicator = p3.props.onClickedCameraIndicator,
				voiceEnabled = p3.props.voiceEnabled,
				displayCameraDeniedToast = p3.props.displayCameraDeniedToast,
				isCamEnabledForUserAndPlace = p3.props.isCamEnabledForUserAndPlace,
				setCameraPermissionStateFromControl = p3.props.setCameraPermissionStateFromControl,
				getPermissions = p3.props.getPermissions,
				isCameraOnlyUser = p3.props.isCameraOnlyUser,
				isVoiceServiceInitialized = p3.props.isVoiceServiceInitialized
			})
			t.listLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				Padding = UDim.new(0, 8)
			})
			t.padding = roactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 8) })
		elseif var7 and var6 == false then
			t.VoiceBubble = roactModule.createElement(blankBubbleModule, {
				chatSettings = var3,
				userId = p3.props.userId,
				renderInsert = var9,
				insertSize = vector2,
				isDistant = not p3.state.isInsideMaximizeDistance,
				clientSettings = clientSettings
			})
		end
	elseif globalFlagsModule.AvatarChatEnabled or globalFlagsModule.ChromeEnabled then
		if p3:shouldRenderPlayerButtons() then
			t.PlayerButtons = roactModule.createElement(playerButtonsModule, {
				LayoutOrder = 2,
				chatSettings = p3.props.chatSettings,
				isInsideMaximizeDistance = p3.state.isInsideMaximizeDistance,
				isLocalPlayer = var2,
				userId = p3.props.userId,
				getIcon = p3.props.getIconVoiceIndicator,
				hasCameraPermissions = p3.props.hasCameraPermissions,
				hasMicPermissions = p3.props.hasMicPermissions,
				onClickedVoiceIndicator = p3.wrappedOnClickVoiceIndicator,
				onClickedCameraIndicator = p3.props.onClickedCameraIndicator,
				voiceEnabled = p3.props.voiceEnabled,
				displayCameraDeniedToast = p3.props.displayCameraDeniedToast,
				isCamEnabledForUserAndPlace = p3.props.isCamEnabledForUserAndPlace,
				setCameraPermissionStateFromControl = p3.props.setCameraPermissionStateFromControl,
				getPermissions = p3.props.getPermissions,
				isCameraOnlyUser = p3.props.isCameraOnlyUser,
				isVoiceServiceInitialized = p3.props.isVoiceServiceInitialized
			})
			t.listLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				Padding = UDim.new(0, 8)
			})
			t.padding = roactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 8) })
		end
	elseif var7 and var6 == false then
		t.VoiceBubble = roactModule.createElement(blankBubbleModule, {
			chatSettings = var3,
			userId = p3.props.userId,
			renderInsert = var9,
			insertSize = vector2,
			isDistant = not p3.state.isInsideMaximizeDistance,
			clientSettings = clientSettings
		})
	end
	local var11 = p3:shouldRenderCaret()
	
	if fFlagExpChatUseProximityStore then
		t.BubbleChatListContainer = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Visible = var5:map(function(p4)
				return p4.isInsideMaximizeDistance
			end)
		}, {
			BubbleChatList = roactModule.createElement(bubbleChatListModule, {
				userId = p3.props.userId,
				isVisible = var5:map(function(p4)
					return p4.isInsideMaximizeDistance
				end),
				onLastBubbleFadeOut = p3.onLastBubbleFadeOut,
				chatSettings = var3,
				renderFirstInsert = if var8 then var9 else nil,
				insertSize = vector2,
				messages = p3.state.filteredMessages,
				clientSettings = clientSettings,
				isTextChatServiceOn = p3.props.isTextChatServiceOn,
				showCaret = p3.voiceTimedOutBinding:map(function(p4)
					-- upvalues: p3 (ref)
					return p3:shouldRenderCaretNew(p4)
				end)
			})
		})
		
		if var6 then
			t.DistantBubbleContainer = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Visible = var5:map(function(p4)
					return not p4.isInsideMaximizeDistance
				end)
			}, {
				DistantBubble = roactModule.createElement(chatBubbleDistantModule, {
					fadingOut = not p3.state.filteredMessages or #p3.state.filteredMessages == 0,
					onFadeOut = p3.onLastBubbleFadeOut,
					chatSettings = var3,
					renderInsert = if var8 then var9 else nil,
					insertSize = vector2,
					clientSettings = clientSettings,
					showCaret = p3.voiceTimedOutBinding:map(function(p4)
						-- upvalues: p3 (ref)
						return p3:shouldRenderCaretNew(p4)
					end)
				})
			})
		end
	elseif p3.state.isInsideMaximizeDistance then
		t.BubbleChatList = roactModule.createElement(bubbleChatListModule, {
			userId = p3.props.userId,
			isVisible = p3.state.isInsideMaximizeDistance,
			onLastBubbleFadeOut = p3.onLastBubbleFadeOut,
			chatSettings = var3,
			renderFirstInsert = if var8 then var9 else nil,
			insertSize = vector2,
			messages = p3.state.filteredMessages,
			clientSettings = clientSettings,
			isTextChatServiceOn = p3.props.isTextChatServiceOn,
			showCaret = var11
		})
	elseif var6 then
		t.DistantBubble = roactModule.createElement(chatBubbleDistantModule, {
			fadingOut = not p3.state.filteredMessages or #p3.state.filteredMessages == 0,
			onFadeOut = p3.onLastBubbleFadeOut,
			chatSettings = var3,
			renderInsert = if var8 then var9 else nil,
			insertSize = vector2,
			clientSettings = clientSettings,
			showCaret = var11
		})
	end
	local var12 = if var2 then var3.LocalPlayerStudsOffset else Vector3.new(0, 1, 0.10000000149)
	
	return if fFlagExpChatUseProximityStore then roactModule.createElement("BillboardGui", {
		ResetOnSpawn = false,
		Adornee = var4,
		Active = if globalFlagsModule.AvatarChatEnabled then p3.voiceTimedOutBinding:map(function(p4)
			-- upvalues: p3 (ref)
			return p3:shouldRenderPlayerButtonsNew(p4)
		end) else var10:map(function(p4)
			return p4
		end),
		Size = UDim2.fromOffset(500, 200),
		SizeOffset = Vector2.new(0, 0.5),
		StudsOffset = var12 + Vector3.new(0, var3.VerticalStudsOffset, 0),
		StudsOffsetWorldSpace = p3.offset,
		MaxDistance = p3.renderDistanceBinding:map(function(p4)
			return if p4 then 1e999 else 0
		end)
	}, t) else roactModule.createElement("BillboardGui", {
		ResetOnSpawn = false,
		Adornee = var4,
		Active = if globalFlagsModule.AvatarChatEnabled then p3:shouldRenderPlayerButtons() else var7,
		Size = UDim2.fromOffset(500, 200),
		SizeOffset = Vector2.new(0, 0.5),
		StudsOffset = var12 + Vector3.new(0, var3.VerticalStudsOffset, 0),
		StudsOffsetWorldSpace = p3.offset
	}, t)
end

function bubbleChatBillboard.didUpdate(p3, _, p4)
	-- upvalues: fFlagExpChatUseProximityStore (ref)
	if fFlagExpChatUseProximityStore then
		if (not p3.state.filteredMessages or #p3.state.filteredMessages == 0) and not p3.renderDistanceBinding:getValue() then
			p3.onLastBubbleFadeOut()
		end
	elseif (not p3.state.filteredMessages or #p3.state.filteredMessages == 0) and not p3.state.isInsideRenderDistance then
		p3.onLastBubbleFadeOut()
	end
	if p3.state.filteredMessages and #p3.state.filteredMessages > 0 then
		p3.isFadingOut = false
	end
	if fFlagExpChatUseProximityStore and p3.state.voiceStateCounter ~= p4.voiceStateCounter then
		p3.setVoiceTimedOutBinding(false)
	end
	p3:checkCounterForTimeout(p4.voiceStateCounter)
end

function bubbleChatBillboard.didMount(p3)
	-- upvalues: fFlagExpChatUseMessagesStore (ref), createEffect (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref), getRecentMessages (ref), otterModule (ref), fFlagExpChatUseAdorneeStore (ref), expChatSharedModule (ref), playersService (ref), fFlagEasierUnmutingModule (ref), fFlagExpChatUseProximityStore (ref), runService (ref), experienceChatHeartbeatIncrement (ref), currentCamera (write), t (ref)
	p3.isMounted = true
	
	if fFlagExpChatUseMessagesStore and p3.MessagesStore then
		p3.messagesEffect = createEffect(function(p4)
			-- upvalues: p3 (ref), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), getRecentMessages (copy)
			local userId = p3.props.userId
			
			if not userId and p3.props.partOrModel then
				userId = p3.MessagesStore.getPartOrModelToMockUserId(p4)[p3.props.partOrModel]
			end
			if userId then
				local var2 = if fFlagExpChatUseChatConfigStore then getChatConfigurationStoreModule(false).getBubbleChatSettings(p4) else p3.props.chatSettings
				p3:setState({
					filteredMessages = getRecentMessages(p3.MessagesStore.getUserBubbleMessages(userId)(p4), var2.BubbleDuration * 1000, var2.MaxBubbles)
				})
				
				return
			end
			p3:setState({ filteredMessages = {} })
		end)
	end
	if fFlagExpChatUseChatConfigStore then
		p3.chatConfigEffect = createEffect(function(p4)
			-- upvalues: getChatConfigurationStoreModule (copy), p3 (ref)
			p3:setState({
				savedChatSettings = getChatConfigurationStoreModule(false).getBubbleChatSettings(p4)
			})
		end)
	end
	local verticalOffset = p3:getVerticalOffset()
	p3.offsetGoal = verticalOffset
	p3.offsetMotor:setGoal(otterModule.instant(verticalOffset))
	
	if fFlagExpChatUseAdorneeStore then
		local context = expChatSharedModule.context
		local adorneeStore = context and context.adorneeStore
		local var2 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else -1
		
		if adorneeStore and p3.props.userId and createEffect then
			p3.adorneeEffect = createEffect(function(p4)
				-- upvalues: p3 (ref)
				p3.updateAdorneeBinding(p3:getEffectiveAdornee(p4))
			end)
			
			if fFlagEasierUnmutingModule then
				local adornee = adorneeStore.getAdornee(var2)
				
				if adornee then
					p3.localAdorneeEffect = createEffect(function(p4)
						-- upvalues: adornee (ref), p3 (ref)
						p3.updateLocalAdorneeBinding(adornee(p4))
					end)
				end
			end
		end
	end
	if fFlagExpChatUseProximityStore and p3.ProximityStore and p3.props.userId then
		p3.proximityEffect = createEffect(function(p4)
			-- upvalues: p3 (ref)
			local var3 = p3.ProximityStore.getUserProximityState(p3.props.userId)(p4)
			p3.updateRenderDistanceBinding(var3.isInsideRenderDistance)
			p3.updateMaximizeDistanceBinding(var3.isInsideMaximizeDistance)
		end)
	end
	p3.heartbeatConn = runService.Heartbeat:Connect(function(p4)
		-- upvalues: p3 (ref), experienceChatHeartbeatIncrement (copy), fFlagExpChatUseAdorneeStore (copy), currentCamera (copy), fFlagExpChatUseProximityStore (copy), otterModule (copy), t (copy), fFlagExpChatUseMessagesStore (copy), getRecentMessages (copy)
		if p3.props.billboardUpdateFrequency > 0 then
			p3.lastDistanceUpdate += p4
			
			if p3.lastDistanceUpdate < p3.props.billboardUpdateFrequency then return end
			p3.lastDistanceUpdate = 0
		elseif not p3.props.tests_skipHeartbeatCheck then
			if p3.heartbeatCount < experienceChatHeartbeatIncrement then
				p3.heartbeatCount += 1
				
				return
			end
			p3.heartbeatCount = 0
		end
		local var3
		local _ = nil
		local var4 = if fFlagExpChatUseAdorneeStore then getAdorneeInstance(p3.adorneeBinding:getValue(), p3.state.savedChatSettings.AdorneeName) else getAdorneeInstance(p3.props.adornee or p3.props.partOrModel, p3.state.savedChatSettings.AdorneeName)
		
		if currentCamera and var4 then
			local magnitude = (currentCamera.CFrame.Position - (if var4:IsA("Attachment") then var4.WorldPosition else var4.Position)).Magnitude
			var3 = magnitude < p3.state.savedChatSettings.MaxDistance
			local var5 = magnitude < p3.state.savedChatSettings.MinimizeDistance
			
			if fFlagExpChatUseProximityStore and p3.ProximityStore then
				if not p3._lastProximityState or p3._lastProximityState.isInsideRenderDistance ~= var3 or p3._lastProximityState.isInsideMaximizeDistance ~= var5 then
					p3.ProximityStore.updateProximity(p3.props.userId, var3, var5)
					p3._lastProximityState = {
						isInsideRenderDistance = var3,
						isInsideMaximizeDistance = var5
					}
				end
			elseif var5 ~= p3.state.isInsideMaximizeDistance or var3 ~= p3.state.isInsideRenderDistance then
				p3:setState({
					isInsideRenderDistance = var3,
					isInsideMaximizeDistance = var5
				})
			end
		end
		local verticalOffset = p3:getVerticalOffset()
		
		if math.abs(verticalOffset - p3.offsetGoal) > 0.5 then
			p3.offsetGoal = verticalOffset
			p3.offsetMotor:setGoal(otterModule.spring(verticalOffset, t))
		end
		local var6 = workspace:GetServerTimeNow() * 1000
		var3 = p3.state.savedChatSettings.BubbleDuration * 1000
		
		for i, v in p3.state.filteredMessages do
			if var3 <= var6 - v.timestamp.UnixTimestampMillis then
				if fFlagExpChatUseMessagesStore then
					p3:setState(function(p5)
						-- upvalues: var6 (ref), var3 (ref)
						local t = {}
						
						for i, v in ipairs(p5.filteredMessages) do
							if var6 - v.timestamp.UnixTimestampMillis < var3 then
								table.insert(t, v)
							end
						end
						return { filteredMessages = t }
					end)
					
					return
				end
				p3:setState(function(p5)
					-- upvalues: getRecentMessages (copy), var3 (ref), p3 (copy)
					return {
						filteredMessages = getRecentMessages(p5.filteredMessages, var3, p3.props.chatSettings.MaxBubbles)
					}
				end)
				
				return
			end
		end
	end)
	p3:checkCounterForTimeout(nil)
end

function bubbleChatBillboard.willUnmount(p5)
	-- upvalues: var1 (ref), fFlagExpChatUseProximityStore (ref), fFlagExpChatUseMessagesStore (ref), fFlagExpChatUseChatConfigStore (ref)
	var1:trace("Unmounting billboards for {}", p5.state.shortId)
	p5.isMounted = false
	
	if p5.characterConn then
		p5.characterConn:Disconnect()
		p5.characterConn = nil
	end
	if p5.heartbeatConn then
		p5.heartbeatConn:Disconnect()
		p5.heartbeatConn = nil
	end
	if p5.humanoidDiedConn then
		p5.humanoidDiedConn:Disconnect()
		p5.humanoidDiedConn = nil
	end
	if p5.selfViewConnection then
		p5.selfViewConnection:disconnect()
		p5.selfViewConnection = nil
	end
	if p5.adorneeEffect then
		p5.adorneeEffect()
		p5.adorneeEffect = nil
	end
	if p5.localAdorneeEffect then
		p5.localAdorneeEffect()
		p5.localAdorneeEffect = nil
	end
	if fFlagExpChatUseProximityStore and p5.proximityEffect then
		p5.proximityEffect()
		p5.proximityEffect = nil
	end
	if fFlagExpChatUseMessagesStore and p5.messagesEffect then
		p5.messagesEffect()
		p5.messagesEffect = nil
	end
	if fFlagExpChatUseChatConfigStore and p5.chatConfigEffect then
		p5.chatConfigEffect()
		p5.chatConfigEffect = nil
	end
	p5.offsetMotor:destroy()
end

function bubbleChatBillboard.getDerivedStateFromProps(p5, p6)
	-- upvalues: fFlagExpChatUseMessagesStore (ref), getRecentMessages (ref)
	local text = "..." .. string.sub(tostring(p5.userId), -4)
	local voiceState = nil
	local var7 = nil
	local var8 = nil
	
	if p6.lastVoiceState ~= p5.voiceState then
		var7 = (p6.voiceStateCounter or 0) + 1
		var8 = false
		voiceState = p5.voiceState
	end
	local _ = nil
	
	return {
		savedChatSettings = if fFlagExpChatUseMessagesStore then p5.chatSettings else p5.lastMessage and p5.chatSettings,
		shortId = text,
		filteredMessages = if fFlagExpChatUseMessagesStore then p6.filteredMessages else getRecentMessages(p5.messages, p6.savedChatSettings.BubbleDuration * 1000, p6.savedChatSettings.MaxBubbles),
		voiceStateCounter = var7,
		voiceTimedOut = var8,
		lastVoiceState = voiceState
	}
end

local function mapStateToProps(p5, p6)
	-- upvalues: playersService (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref), getSettingsForMessageModule (ref), fFlagExpChatUseMessagesStore (ref), fFlagExpChatUseAdorneeStore (ref), fFlagEasierUnmutingModule (ref)
	local userId = p5.Messages.messagesBySenderId[p6.userId]
	local var7 = if userId ~= nil then nil else userId[#userId]
	
	return {
		messages = if fFlagExpChatUseMessagesStore then nil else userId,
		lastMessage = if fFlagExpChatUseMessagesStore then nil else var7,
		chatSettings = if p6.isTextChatServiceOn then if fFlagExpChatUseChatConfigStore then getChatConfigurationStoreModule(false).getBubbleChatSettings(false) else p5.BubbleChatSettings else getSettingsForMessageModule(p5.LegacyBubbleChatSettings, var7),
		adornee = if fFlagExpChatUseAdorneeStore then nil else p5.Adornees[p6.userId] or p6.partOrModel,
		localAdornee = if fFlagExpChatUseAdorneeStore then nil elseif fFlagEasierUnmutingModule then p5.Adornees[if playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else ""] else nil,
		clientSettings = p5.ClientSettings,
		isVoiceUIVisible = p5.Voice.isVoiceUIVisible
	}
end

if fFlagExpChatUseAdorneeStore then
	local var8 = roactRoduxModule.connect(mapStateToProps)(bubbleChatBillboard)
	
	return if expChatMemoBillboardGui then reactModule.memo(var8) else var8
end
return if expChatMemoBillboardGui then reactModule.memo(roactRoduxModule.connect(mapStateToProps)(bubbleChatBillboard)) else roactRoduxModule.connect(mapStateToProps)(bubbleChatBillboard)