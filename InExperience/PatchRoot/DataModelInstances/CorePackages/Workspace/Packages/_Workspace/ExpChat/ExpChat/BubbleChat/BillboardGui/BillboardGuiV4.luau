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
local var12 = expChatSharedModule.Logger:new("ExpChat/" .. script.Name)
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

local function getRecentMessages(p0, p1, p2) --[[ line: 53 ]]
	-- upvalues: list (ref)
	local var37 = workspace:GetServerTimeNow() * 1000
	
	return list.filter(p0 or {}, function(p3, p4) --[[ line: 57 ]]
		-- upvalues: p0 (ref), p2 (ref), var37 (ref), p1 (ref)
		return if p3.isVisibleInBubbleChat then #p0 - p2 < p4 and var37 - p3.timestamp.UnixTimestampMillis < p1 else false
	end)
end

local bubbleChatBillboard = (if stopBubbleChatReactWarning then roactModule.Component else roactModule.PureComponent):extend("BubbleChatBillboard")
local t = { dampingRatio = 1, frequency = 4 }
local currentCamera = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ line: 78 ]]
	-- upvalues: currentCamera (write)
	currentCamera = workspace.CurrentCamera
end)

function bubbleChatBillboard.init(p5) --[[ line: 82 ]]
	-- upvalues: globalFlagsModule (ref), selfViewNoApi (ref), starterGuiService (ref), fFlagExpChatUseProximityStore (ref), expChatSharedModule (ref), roactModule (ref), fFlagExpChatUseMessagesStore (ref), otterModule (ref), playersService (ref), voiceIndicatorModule (ref), getMessagesStoreModule (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref)
	local selfViewVisibility = nil
	local var39 = nil
	
	if globalFlagsModule.AvatarChatEnabled then
		selfViewVisibility = p5.props.selfViewListenerChanged.getSelfViewVisibility()
		var39 = selfViewNoApi or (starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.All) or starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView))
	end
	if fFlagExpChatUseProximityStore then
		local context = expChatSharedModule.context
		p5.ProximityStore = context and context.proximityStore
		local var40, var41 = roactModule.createBinding(100)
		p5.invisibleCount = var40
		p5.setInvisibleCount = var41
		local var42, var43 = roactModule.createBinding(false)
		p5.renderDistanceBinding = var42
		p5.updateRenderDistanceBinding = var43
		local var44, var45 = roactModule.createBinding(false)
		p5.maximizeDistanceBinding = var44
		p5.updateMaximizeDistanceBinding = var45
	end
	p5:setState({
		isInsideRenderDistance = false,
		isInsideMaximizeDistance = false,
		voiceTimedOut = false,
		voiceStateCounter = 0,
		lastVoiceState = nil,
		savedChatSettings = p5.props.chatSettings,
		selfViewOpen = selfViewVisibility,
		selfViewEnabled = var39,
		filteredMessages = if fFlagExpChatUseMessagesStore then {} else nil
	})
	p5.isMounted = false
	local var46, var47 = roactModule.createBinding(Vector3.new())
	p5.offset = var46
	p5.updateOffset = var47
	p5.offsetMotor = otterModule.createSingleMotor(0)
	p5.offsetMotor:onStep(function(p6) --[[ line: 117 ]]
		-- upvalues: p5 (ref)
		p5.updateOffset(Vector3.new(0, p6, 0))
	end)
	p5.offsetGoal = 0
	local var48, var49 = roactModule.createBinding(nil)
	p5.adorneeBinding = var48
	p5.updateAdorneeBinding = var49
	local var50, var51 = roactModule.createBinding(nil)
	p5.localAdorneeBinding = var50
	p5.updateLocalAdorneeBinding = var51
	
	if fFlagExpChatUseProximityStore then
		local var52, var53 = roactModule.createBinding(false)
		p5.voiceTimedOutBinding = var52
		p5.setVoiceTimedOutBinding = var53
	end
	p5.heartbeatCount = 0
	p5.lastDistanceUpdate = 0
	
	function p5.onLastBubbleFadeOut() --[[ line: 133 ]]
		-- upvalues: p5 (ref)
		if p5.props.onFadeOut and not p5.isFadingOut then
			p5.isFadingOut = true
			p5.props.onFadeOut(p5.props.userId)
		end
	end
	
	function p5.wrappedOnClickVoiceIndicator(p7, p8) --[[ line: 141 ]]
		-- upvalues: p5 (ref)
		return p5.props.onClickedVoiceIndicator(p7, p8, "bubblechat")
	end
	
	local localPlayer = playersService.LocalPlayer
	local var54 = if localPlayer then if p5.props.userId ~= tostring(localPlayer.UserId) then "MicDark" else "SpeakerDark" else "SpeakerDark"
	
	function p5.renderInsert() --[[ line: 149 ]]
		-- upvalues: roactModule (copy), voiceIndicatorModule (copy), p5 (ref), var54 (ref)
		return roactModule.createElement(voiceIndicatorModule, {
			userId = p5.props.userId,
			getIcon = p5.props.getIconVoiceIndicator,
			onClicked = p5.wrappedOnClickVoiceIndicator,
			iconStyle = var54
		})
	end
	
	if globalFlagsModule.AvatarChatEnabled then
		local getSelfViewVisibility = p5.props.selfViewListenerChanged.getSelfViewVisibility
		p5.selfViewConnection = p5.props.selfViewListenerChanged.selfViewVisibilityUpdatedSignal:connect(function() --[[ line: 162 | named "callback" ]]
			-- upvalues: p5 (ref), getSelfViewVisibility (ref)
			p5:setState({ selfViewOpen = getSelfViewVisibility() })
		end)
	end
	if fFlagExpChatUseMessagesStore then
		p5.MessagesStore = getMessagesStoreModule(false)
	end
	if fFlagExpChatUseChatConfigStore then
		p5.ChatConfigurationStore = getChatConfigurationStoreModule(false)
	end
end

function bubbleChatBillboard.checkCounterForTimeout(p9, p10) --[[ line: 179 ]]
	-- upvalues: playersService (ref), fFlagExpChatUseProximityStore (ref)
	if playersService.LocalPlayer and p9.props.userId ~= tostring(playersService.LocalPlayer.UserId) and (p9.state.lastVoiceState ~= "Talking" and p9.state.voiceStateCounter ~= p10) then
		local voiceStateCounter = p9.state.voiceStateCounter
		delay(1, function() --[[ line: 189 ]]
			-- upvalues: p9 (ref), voiceStateCounter (ref), fFlagExpChatUseProximityStore (copy)
			if p9.state.voiceStateCounter == voiceStateCounter and p9.isMounted then
				if fFlagExpChatUseProximityStore then
					p9.setVoiceTimedOutBinding(true)
					
					return
				end
				p9:setState({ voiceTimedOut = true })
			end
		end)
	end
end

function bubbleChatBillboard.getVerticalOffset(value) --[[ line: 204 ]]
	local var55 = value:getEffectiveAdornee(false)
	
	if var55 and var55:IsA("Model") then
		local boundingBox, boundingBox_1 = var55:GetBoundingBox()
		local var58 = getAdorneeInstance(var55, value.state.savedChatSettings.AdorneeName)
		
		return if var58 then if var58:IsA("BasePart") then boundingBox_1.Y / 2 - boundingBox:PointToObjectSpace(var58.Position).Y else 0 else boundingBox_1.Y / 2
	end
	return if var55 and var55:IsA("BasePart") then var55.Size.Y / 2 else 0
end

function getAdorneeInstance(p11, p12) --[[ line: 228 ]]
	if not p11 then
		return nil
	elseif p11:IsA("Model") then
		local var59 = p11:FindFirstChild(p12, true) or p11.PrimaryPart
		
		if var59 and not var59:IsA("BasePart") and not var59:IsA("Attachment") then
		else
			return var59
		end
	else
		return if p11:IsA("BasePart") or p11:IsA("Attachment") then p11 else nil
	end
end

function bubbleChatBillboard.getEffectiveAdornee(p13, p14) --[[ line: 244 ]]
	-- upvalues: fFlagExpChatUseAdorneeStore (ref), expChatSharedModule (ref)
	if not fFlagExpChatUseAdorneeStore then
		return p13.props.adornee
	end
	local context = expChatSharedModule.context
	local adorneeStore = context and context.adorneeStore
	
	if adorneeStore and p13.props.userId then
		local adornee = adorneeStore.getAdornee(p13.props.userId)
		
		if adornee then
			local var62 = adornee(p14 or false)
			
			return var62 or p13.props.partOrModel
		end
	end
end

function bubbleChatBillboard.shouldRenderCaret(p15) --[[ line: 265 ]]
	-- upvalues: fFlagExpChatUseChatConfigStore (ref)
	return (if fFlagExpChatUseChatConfigStore then p15.ChatConfigurationStore.getBubbleChatSettings(false) else p15.state.savedChatSettings).TailVisible and not p15:shouldRenderPlayerButtons()
end

function bubbleChatBillboard.shouldRenderCaretNew(p16, p17) --[[ line: 273 ]]
	return p16.state.savedChatSettings.TailVisible and not p16:shouldRenderPlayerButtonsNew(p17)
end

function bubbleChatBillboard.shouldRenderPlayerButtons(p18) --[[ line: 279 ]]
	-- upvalues: playersService (ref), fFlagExpChatUseProximityStore (ref), VRService (ref), globalFlagsModule (ref)
	local var63
	if not p18.props.voiceEnabled or not p18.props.isVoiceUIVisible then
		return false
	elseif playersService.LocalPlayer then
		var63 = p18.props.userId == tostring(playersService.LocalPlayer.UserId)
		var63 = nil
	else
		var63 = false
	end
	if fFlagExpChatUseProximityStore then
		if not var63 or p18.props.testMode then
		end
		return if VRService.VREnabled or globalFlagsModule.ChromeEnabled then false else p18.state.selfViewOpen
	else
		return if var63 then if VRService.VREnabled or globalFlagsModule.ChromeEnabled then false else p18.state.selfViewOpen else p18.props.voiceEnabled and not p18.state.voiceTimedOut
	end
end

function bubbleChatBillboard.shouldRenderPlayerButtonsNew(p19, p20) --[[ line: 323 ]]
	-- upvalues: playersService (ref), VRService (ref), globalFlagsModule (ref)
	local var64
	if not p19.props.voiceEnabled or not p19.props.isVoiceUIVisible then
		return false
	elseif playersService.LocalPlayer then
		var64 = p19.props.userId == tostring(playersService.LocalPlayer.UserId)
		var64 = nil
	else
		var64 = false
	end
	return if var64 then if VRService.VREnabled or globalFlagsModule.ChromeEnabled then false else p19.state.selfViewOpen elseif p20 == nil then p19.props.voiceEnabled and not p19.state.voiceTimedOut else p19.props.voiceEnabled and not p20
end

local function messagesHaveChanged(p21, p22) --[[ line: 354 ]]
	-- upvalues: fFlagExpChatUseMessagesStore (ref)
	local p21Count = #p21
	local p22Count = #p22
	
	if p21Count == 0 and p22Count == 0 then
		return false
	elseif p21Count ~= p22Count then
		return true
	end
	for i, v in p21 do
		if v.messageId == p22[i].messageId then
			if fFlagExpChatUseMessagesStore and v.text ~= p22[i].text then
				return true
			end
		end
		return true
	end
	return false
end

local t_1 = { filteredMessages = true }

function bubbleChatBillboard.shouldComponentUpdate(p23, p24, p25) --[[ line: 375 ]]
	-- upvalues: fFlagExpChatUseProximityStore (ref), messagesHaveChanged (ref), tutilsModule (ref), t_1 (ref)
	return not (not fFlagExpChatUseProximityStore and p23.state.isInsideRenderDistance ~= p25.isInsideRenderDistance and not p25.isInsideRenderDistance) and (if messagesHaveChanged(p23.state.filteredMessages, p25.filteredMessages) then true else not tutilsModule.shallowEqual(p24, p23.props, t_1) or not tutilsModule.shallowEqual(p25, p23.state, t_1))
end

function bubbleChatBillboard.render(p26) --[[ line: 394 ]]
	-- upvalues: fFlagExpChatUseChatConfigStore (ref), fFlagExpChatUseAdorneeStore (ref), playersService (ref), var12 (ref), fFlagExpChatUseProximityStore (ref), expChatProximityStoreExtraRendersBeforeUnmount (ref), roactModule (ref), globalFlagsModule (ref), vector2 (ref), playerButtonsModule (ref), blankBubbleModule (ref), bubbleChatListModule (ref), chatBubbleDistantModule (ref)
	local var69
	local var67 = if fFlagExpChatUseChatConfigStore then p26.ChatConfigurationStore.getBubbleChatSettings(false) else p26.state.savedChatSettings
	local var68 = if fFlagExpChatUseAdorneeStore then p26.adorneeBinding:map(function(p27) --[[ line: 404 ]]
		-- upvalues: p26 (ref)
		return getAdorneeInstance(p27, p26.state.savedChatSettings.AdorneeName)
	end) else getAdorneeInstance(if fFlagExpChatUseAdorneeStore then p26.adorneeBinding else p26.props.adornee or p26.props.partOrModel, p26.state.savedChatSettings.AdorneeName)
	
	if playersService.LocalPlayer then
		var69 = p26.props.userId == tostring(playersService.LocalPlayer.UserId)
		var69 = nil
	else
		var69 = false
	end
	if not fFlagExpChatUseAdorneeStore and not var68 then
		var12:trace("No adornee for {}", p26.state.shortId)
		
		return
	elseif not fFlagExpChatUseProximityStore then
		if not p26.state.isInsideRenderDistance then return end
	elseif p26.renderDistanceBinding:getValue() or p26.props.testMode then
		p26.setInvisibleCount(0)
	elseif expChatProximityStoreExtraRendersBeforeUnmount < p26.invisibleCount:getValue() then return end
	p26.setInvisibleCount(p26.invisibleCount:getValue() + 1)
	local var70 = if fFlagExpChatUseProximityStore then roactModule.joinBindings({
		renderDistance = p26.renderDistanceBinding,
		maximizeDistance = p26.maximizeDistanceBinding
	}):map(function(p28) --[[ line: 450 ]]
		return {
			isInsideMaximizeDistance = p28.maximizeDistance,
			isDistant = not p28.maximizeDistance
		}
	end) else nil
	local t = {}
	local var72 = p26.state.filteredMessages and #p26.state.filteredMessages > 0
	local var73 = p26.props.voiceEnabled and not p26.state.voiceTimedOut
	
	if globalFlagsModule.AvatarChatEnabled and var69 then
		var73 = var73 and not p26.state.selfViewOpen
	end
	if globalFlagsModule.ChromeEnabled and var69 then
		var73 = false
	end
	local var74 = var73 and (not globalFlagsModule.AvatarChatEnabled and not globalFlagsModule.ChromeEnabled)
	local var75 = if var73 then p26.renderInsert else nil
	local var76 = if fFlagExpChatUseProximityStore then p26.voiceTimedOutBinding:map(function(p29) --[[ line: 481 ]]
		-- upvalues: p26 (ref), globalFlagsModule (copy), var69 (ref)
		local var79 = p26.props.voiceEnabled and not p29
		
		if globalFlagsModule.AvatarChatEnabled and var69 then
			var79 = var79 and not p26.state.selfViewOpen
		end
		if globalFlagsModule.ChromeEnabled and var69 then
			var79 = false
		end
		return var79
	end) else nil
	local clientSettings = p26.props.clientSettings
	
	if fFlagExpChatUseProximityStore then
		if p26.props.testMode or globalFlagsModule.AvatarChatEnabled or globalFlagsModule.ChromeEnabled then
			t.PlayerButtons = roactModule.createElement(playerButtonsModule, {
				LayoutOrder = 2,
				Visible = if fFlagExpChatUseProximityStore and not p26.props.testMode then p26.voiceTimedOutBinding:map(function(p30) --[[ line: 499 ]]
					-- upvalues: p26 (ref)
					return p26:shouldRenderPlayerButtonsNew(p30)
				end) else p26:shouldRenderPlayerButtons(),
				chatSettings = p26.props.chatSettings,
				isInsideMaximizeDistance = var70:map(function(p31) --[[ line: 504 ]]
					return p31.isInsideMaximizeDistance
				end),
				isLocalPlayer = var69,
				userId = p26.props.userId,
				getIcon = p26.props.getIconVoiceIndicator,
				hasCameraPermissions = p26.props.hasCameraPermissions,
				hasMicPermissions = p26.props.hasMicPermissions,
				onClickedVoiceIndicator = p26.wrappedOnClickVoiceIndicator,
				onClickedCameraIndicator = p26.props.onClickedCameraIndicator,
				voiceEnabled = p26.props.voiceEnabled,
				displayCameraDeniedToast = p26.props.displayCameraDeniedToast,
				isCamEnabledForUserAndPlace = p26.props.isCamEnabledForUserAndPlace,
				setCameraPermissionStateFromControl = p26.props.setCameraPermissionStateFromControl,
				getPermissions = p26.props.getPermissions,
				isCameraOnlyUser = p26.props.isCameraOnlyUser,
				isVoiceServiceInitialized = p26.props.isVoiceServiceInitialized
			})
			t.listLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				Padding = UDim.new(0, 8)
			})
			t.padding = roactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 8) })
		elseif var73 and var72 == false then
			t.VoiceBubble = roactModule.createElement(blankBubbleModule, {
				chatSettings = var67,
				userId = p26.props.userId,
				renderInsert = var75,
				insertSize = vector2,
				isDistant = not p26.state.isInsideMaximizeDistance,
				clientSettings = clientSettings
			})
		end
	elseif globalFlagsModule.AvatarChatEnabled or globalFlagsModule.ChromeEnabled then
		if p26:shouldRenderPlayerButtons() then
			t.PlayerButtons = roactModule.createElement(playerButtonsModule, {
				LayoutOrder = 2,
				chatSettings = p26.props.chatSettings,
				isInsideMaximizeDistance = p26.state.isInsideMaximizeDistance,
				isLocalPlayer = var69,
				userId = p26.props.userId,
				getIcon = p26.props.getIconVoiceIndicator,
				hasCameraPermissions = p26.props.hasCameraPermissions,
				hasMicPermissions = p26.props.hasMicPermissions,
				onClickedVoiceIndicator = p26.wrappedOnClickVoiceIndicator,
				onClickedCameraIndicator = p26.props.onClickedCameraIndicator,
				voiceEnabled = p26.props.voiceEnabled,
				displayCameraDeniedToast = p26.props.displayCameraDeniedToast,
				isCamEnabledForUserAndPlace = p26.props.isCamEnabledForUserAndPlace,
				setCameraPermissionStateFromControl = p26.props.setCameraPermissionStateFromControl,
				getPermissions = p26.props.getPermissions,
				isCameraOnlyUser = p26.props.isCameraOnlyUser,
				isVoiceServiceInitialized = p26.props.isVoiceServiceInitialized
			})
			t.listLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				Padding = UDim.new(0, 8)
			})
			t.padding = roactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 8) })
		end
	elseif var73 and var72 == false then
		t.VoiceBubble = roactModule.createElement(blankBubbleModule, {
			chatSettings = var67,
			userId = p26.props.userId,
			renderInsert = var75,
			insertSize = vector2,
			isDistant = not p26.state.isInsideMaximizeDistance,
			clientSettings = clientSettings
		})
	end
	local var77 = p26:shouldRenderCaret()
	
	if fFlagExpChatUseProximityStore then
		t.BubbleChatListContainer = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Visible = var70:map(function(p32) --[[ line: 607 ]]
				return p32.isInsideMaximizeDistance
			end)
		}, {
			BubbleChatList = roactModule.createElement(bubbleChatListModule, {
				userId = p26.props.userId,
				isVisible = var70:map(function(p33) --[[ line: 613 ]]
					return p33.isInsideMaximizeDistance
				end),
				onLastBubbleFadeOut = p26.onLastBubbleFadeOut,
				chatSettings = var67,
				renderFirstInsert = if var74 then var75 else nil,
				insertSize = vector2,
				messages = p26.state.filteredMessages,
				clientSettings = clientSettings,
				isTextChatServiceOn = p26.props.isTextChatServiceOn,
				showCaret = p26.voiceTimedOutBinding:map(function(p34) --[[ line: 623 ]]
					-- upvalues: p26 (ref)
					return p26:shouldRenderCaretNew(p34)
				end)
			})
		})
		
		if var72 then
			t.DistantBubbleContainer = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Visible = var70:map(function(p35) --[[ line: 633 ]]
					return not p35.isInsideMaximizeDistance
				end)
			}, {
				DistantBubble = roactModule.createElement(chatBubbleDistantModule, {
					fadingOut = not p26.state.filteredMessages or #p26.state.filteredMessages == 0,
					onFadeOut = p26.onLastBubbleFadeOut,
					chatSettings = var67,
					renderInsert = if var74 then var75 else nil,
					insertSize = vector2,
					clientSettings = clientSettings,
					showCaret = p26.voiceTimedOutBinding:map(function(p36) --[[ line: 644 ]]
						-- upvalues: p26 (ref)
						return p26:shouldRenderCaretNew(p36)
					end)
				})
			})
		end
	elseif p26.state.isInsideMaximizeDistance then
		t.BubbleChatList = roactModule.createElement(bubbleChatListModule, {
			userId = p26.props.userId,
			isVisible = p26.state.isInsideMaximizeDistance,
			onLastBubbleFadeOut = p26.onLastBubbleFadeOut,
			chatSettings = var67,
			renderFirstInsert = if var74 then var75 else nil,
			insertSize = vector2,
			messages = p26.state.filteredMessages,
			clientSettings = clientSettings,
			isTextChatServiceOn = p26.props.isTextChatServiceOn,
			showCaret = var77
		})
	elseif var72 then
		t.DistantBubble = roactModule.createElement(chatBubbleDistantModule, {
			fadingOut = not p26.state.filteredMessages or #p26.state.filteredMessages == 0,
			onFadeOut = p26.onLastBubbleFadeOut,
			chatSettings = var67,
			renderInsert = if var74 then var75 else nil,
			insertSize = vector2,
			clientSettings = clientSettings,
			showCaret = var77
		})
	end
	local var78 = if var69 then var67.LocalPlayerStudsOffset else Vector3.new(0, 1, 0.10000000149)
	
	return if fFlagExpChatUseProximityStore then roactModule.createElement("BillboardGui", {
		ResetOnSpawn = false,
		Adornee = var68,
		Active = if globalFlagsModule.AvatarChatEnabled then p26.voiceTimedOutBinding:map(function(p38) --[[ line: 687 ]]
			-- upvalues: p26 (ref)
			return p26:shouldRenderPlayerButtonsNew(p38)
		end) else var76:map(function(p37) --[[ line: 690 ]]
			return p37
		end),
		Size = UDim2.fromOffset(500, 200),
		SizeOffset = Vector2.new(0, 0.5),
		StudsOffset = var78 + Vector3.new(0, var67.VerticalStudsOffset, 0),
		StudsOffsetWorldSpace = p26.offset,
		MaxDistance = p26.renderDistanceBinding:map(function(p39) --[[ line: 698 ]]
			return if p39 then 1e999 else 0
		end)
	}, t) else roactModule.createElement("BillboardGui", {
		ResetOnSpawn = false,
		Adornee = var68,
		Active = if globalFlagsModule.AvatarChatEnabled then p26:shouldRenderPlayerButtons() else var73,
		Size = UDim2.fromOffset(500, 200),
		SizeOffset = Vector2.new(0, 0.5),
		StudsOffset = var78 + Vector3.new(0, var67.VerticalStudsOffset, 0),
		StudsOffsetWorldSpace = p26.offset
	}, t)
end

function bubbleChatBillboard.didUpdate(p40, _, p41) --[[ line: 715 ]]
	-- upvalues: fFlagExpChatUseProximityStore (ref)
	if fFlagExpChatUseProximityStore then
		if (not p40.state.filteredMessages or #p40.state.filteredMessages == 0) and not p40.renderDistanceBinding:getValue() then
			p40.onLastBubbleFadeOut()
		end
	elseif (not p40.state.filteredMessages or #p40.state.filteredMessages == 0) and not p40.state.isInsideRenderDistance then
		p40.onLastBubbleFadeOut()
	end
	if p40.state.filteredMessages and #p40.state.filteredMessages > 0 then
		p40.isFadingOut = false
	end
	if fFlagExpChatUseProximityStore and p40.state.voiceStateCounter ~= p41.voiceStateCounter then
		p40.setVoiceTimedOutBinding(false)
	end
	p40:checkCounterForTimeout(p41.voiceStateCounter)
end

function bubbleChatBillboard.didMount(p42) --[[ line: 746 ]]
	-- upvalues: fFlagExpChatUseMessagesStore (ref), createEffect (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref), getRecentMessages (ref), otterModule (ref), fFlagExpChatUseAdorneeStore (ref), expChatSharedModule (ref), playersService (ref), fFlagEasierUnmutingModule (ref), fFlagExpChatUseProximityStore (ref), runService (ref), experienceChatHeartbeatIncrement (ref), currentCamera (write), t (ref)
	p42.isMounted = true
	
	if fFlagExpChatUseMessagesStore and p42.MessagesStore then
		p42.messagesEffect = createEffect(function(p43) --[[ line: 752 ]]
			-- upvalues: p42 (ref), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), getRecentMessages (copy)
			local userId = p42.props.userId
			
			if not userId and p42.props.partOrModel then
				userId = p42.MessagesStore.getPartOrModelToMockUserId(p43)[p42.props.partOrModel]
			end
			if userId then
				local var84 = if fFlagExpChatUseChatConfigStore then getChatConfigurationStoreModule(false).getBubbleChatSettings(p43) else p42.props.chatSettings
				p42:setState({
					filteredMessages = getRecentMessages(p42.MessagesStore.getUserBubbleMessages(userId)(p43), var84.BubbleDuration * 1000, var84.MaxBubbles)
				})
				
				return
			end
			p42:setState({ filteredMessages = {} })
		end)
	end
	if fFlagExpChatUseChatConfigStore then
		p42.chatConfigEffect = createEffect(function(p44) --[[ line: 785 ]]
			-- upvalues: getChatConfigurationStoreModule (copy), p42 (ref)
			p42:setState({
				savedChatSettings = getChatConfigurationStoreModule(false).getBubbleChatSettings(p44)
			})
		end)
	end
	local verticalOffset = p42:getVerticalOffset()
	p42.offsetGoal = verticalOffset
	p42.offsetMotor:setGoal(otterModule.instant(verticalOffset))
	
	if fFlagExpChatUseAdorneeStore then
		local context = expChatSharedModule.context
		local adorneeStore = context and context.adorneeStore
		local var82 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else -1
		
		if adorneeStore and p42.props.userId and createEffect then
			p42.adorneeEffect = createEffect(function(p45) --[[ line: 802 ]]
				-- upvalues: p42 (ref)
				p42.updateAdorneeBinding(p42:getEffectiveAdornee(p45))
			end)
			
			if fFlagEasierUnmutingModule then
				local adornee = adorneeStore.getAdornee(var82)
				
				if adornee then
					p42.localAdorneeEffect = createEffect(function(p46) --[[ line: 810 ]]
						-- upvalues: adornee (ref), p42 (ref)
						p42.updateLocalAdorneeBinding(adornee(p46))
					end)
				end
			end
		end
	end
	if fFlagExpChatUseProximityStore and p42.ProximityStore and p42.props.userId then
		p42.proximityEffect = createEffect(function(p47) --[[ line: 822 ]]
			-- upvalues: p42 (ref)
			local var85 = p42.ProximityStore.getUserProximityState(p42.props.userId)(p47)
			p42.updateRenderDistanceBinding(var85.isInsideRenderDistance)
			p42.updateMaximizeDistanceBinding(var85.isInsideMaximizeDistance)
		end)
	end
	p42.heartbeatConn = runService.Heartbeat:Connect(function(p48) --[[ line: 833 ]]
		-- upvalues: p42 (ref), experienceChatHeartbeatIncrement (copy), fFlagExpChatUseAdorneeStore (copy), currentCamera (copy), fFlagExpChatUseProximityStore (copy), otterModule (copy), t (copy), fFlagExpChatUseMessagesStore (copy), getRecentMessages (copy)
		if p42.props.billboardUpdateFrequency > 0 then
			p42.lastDistanceUpdate += p48
			
			if p42.lastDistanceUpdate < p42.props.billboardUpdateFrequency then return end
			p42.lastDistanceUpdate = 0
		elseif not p42.props.tests_skipHeartbeatCheck then
			if p42.heartbeatCount < experienceChatHeartbeatIncrement then
				p42.heartbeatCount += 1
				
				return
			end
			p42.heartbeatCount = 0
		end
		local var87
		local _ = nil
		local var86 = if fFlagExpChatUseAdorneeStore then getAdorneeInstance(p42.adorneeBinding:getValue(), p42.state.savedChatSettings.AdorneeName) else getAdorneeInstance(p42.props.adornee or p42.props.partOrModel, p42.state.savedChatSettings.AdorneeName)
		
		if currentCamera and var86 then
			local magnitude = (currentCamera.CFrame.Position - (if var86:IsA("Attachment") then var86.WorldPosition else var86.Position)).Magnitude
			var87 = magnitude < p42.state.savedChatSettings.MaxDistance
			local var88 = magnitude < p42.state.savedChatSettings.MinimizeDistance
			
			if fFlagExpChatUseProximityStore and p42.ProximityStore then
				if not p42._lastProximityState or p42._lastProximityState.isInsideRenderDistance ~= var87 or p42._lastProximityState.isInsideMaximizeDistance ~= var88 then
					p42.ProximityStore.updateProximity(p42.props.userId, var87, var88)
					p42._lastProximityState = {
						isInsideRenderDistance = var87,
						isInsideMaximizeDistance = var88
					}
				end
			elseif var88 ~= p42.state.isInsideMaximizeDistance or var87 ~= p42.state.isInsideRenderDistance then
				p42:setState({
					isInsideRenderDistance = var87,
					isInsideMaximizeDistance = var88
				})
			end
		end
		local verticalOffset = p42:getVerticalOffset()
		
		if math.abs(verticalOffset - p42.offsetGoal) > 0.5 then
			p42.offsetGoal = verticalOffset
			p42.offsetMotor:setGoal(otterModule.spring(verticalOffset, t))
		end
		local var90 = workspace:GetServerTimeNow() * 1000
		var87 = p42.state.savedChatSettings.BubbleDuration * 1000
		
		for i, v in p42.state.filteredMessages do
			if var87 <= var90 - v.timestamp.UnixTimestampMillis then
				if fFlagExpChatUseMessagesStore then
					p42:setState(function(p49) --[[ line: 915 ]]
						-- upvalues: var90 (ref), var87 (ref)
						local t = {}
						
						for i, v in ipairs(p49.filteredMessages) do
							if var90 - v.timestamp.UnixTimestampMillis < var87 then
								table.insert(t, v)
							end
						end
						return { filteredMessages = t }
					end)
					
					return
				end
				p42:setState(function(p50) --[[ line: 927 ]]
					-- upvalues: getRecentMessages (copy), var87 (ref), p42 (copy)
					return {
						filteredMessages = getRecentMessages(p50.filteredMessages, var87, p42.props.chatSettings.MaxBubbles)
					}
				end)
				
				return
			end
		end
	end)
	p42:checkCounterForTimeout(nil)
end

function bubbleChatBillboard.willUnmount(p51) --[[ line: 946 ]]
	-- upvalues: var12 (ref), fFlagExpChatUseProximityStore (ref), fFlagExpChatUseMessagesStore (ref), fFlagExpChatUseChatConfigStore (ref)
	var12:trace("Unmounting billboards for {}", p51.state.shortId)
	p51.isMounted = false
	
	if p51.characterConn then
		p51.characterConn:Disconnect()
		p51.characterConn = nil
	end
	if p51.heartbeatConn then
		p51.heartbeatConn:Disconnect()
		p51.heartbeatConn = nil
	end
	if p51.humanoidDiedConn then
		p51.humanoidDiedConn:Disconnect()
		p51.humanoidDiedConn = nil
	end
	if p51.selfViewConnection then
		p51.selfViewConnection:disconnect()
		p51.selfViewConnection = nil
	end
	if p51.adorneeEffect then
		p51.adorneeEffect()
		p51.adorneeEffect = nil
	end
	if p51.localAdorneeEffect then
		p51.localAdorneeEffect()
		p51.localAdorneeEffect = nil
	end
	if fFlagExpChatUseProximityStore and p51.proximityEffect then
		p51.proximityEffect()
		p51.proximityEffect = nil
	end
	if fFlagExpChatUseMessagesStore and p51.messagesEffect then
		p51.messagesEffect()
		p51.messagesEffect = nil
	end
	if fFlagExpChatUseChatConfigStore and p51.chatConfigEffect then
		p51.chatConfigEffect()
		p51.chatConfigEffect = nil
	end
	p51.offsetMotor:destroy()
end

function bubbleChatBillboard.getDerivedStateFromProps(p52, p53) --[[ line: 996 ]]
	-- upvalues: fFlagExpChatUseMessagesStore (ref), getRecentMessages (ref)
	local text = "..." .. string.sub(tostring(p52.userId), -4)
	local voiceState = nil
	local var93 = nil
	local var94 = nil
	
	if p53.lastVoiceState ~= p52.voiceState then
		var93 = (p53.voiceStateCounter or 0) + 1
		var94 = false
		voiceState = p52.voiceState
	end
	local _ = nil
	
	return {
		savedChatSettings = if fFlagExpChatUseMessagesStore then p52.chatSettings else p52.lastMessage and p52.chatSettings,
		shortId = text,
		filteredMessages = if fFlagExpChatUseMessagesStore then p53.filteredMessages else getRecentMessages(p52.messages, p53.savedChatSettings.BubbleDuration * 1000, p53.savedChatSettings.MaxBubbles),
		voiceStateCounter = var93,
		voiceTimedOut = var94,
		lastVoiceState = voiceState
	}
end

local function mapStateToProps(p54, p55) --[[ line: 1037 ]]
	-- upvalues: playersService (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref), getSettingsForMessageModule (ref), fFlagExpChatUseMessagesStore (ref), fFlagExpChatUseAdorneeStore (ref), fFlagEasierUnmutingModule (ref)
	local userId = p54.Messages.messagesBySenderId[p55.userId]
	local var95 = if userId ~= nil then nil else userId[#userId]
	
	return {
		messages = if fFlagExpChatUseMessagesStore then nil else userId,
		lastMessage = if fFlagExpChatUseMessagesStore then nil else var95,
		chatSettings = if p55.isTextChatServiceOn then if fFlagExpChatUseChatConfigStore then getChatConfigurationStoreModule(false).getBubbleChatSettings(false) else p54.BubbleChatSettings else getSettingsForMessageModule(p54.LegacyBubbleChatSettings, var95),
		adornee = if fFlagExpChatUseAdorneeStore then nil else p54.Adornees[p55.userId] or p55.partOrModel,
		localAdornee = if fFlagExpChatUseAdorneeStore then nil elseif fFlagEasierUnmutingModule then p54.Adornees[if playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else ""] else nil,
		clientSettings = p54.ClientSettings,
		isVoiceUIVisible = p54.Voice.isVoiceUIVisible
	}
end

if fFlagExpChatUseAdorneeStore then
	local var36 = roactRoduxModule.connect(mapStateToProps)(bubbleChatBillboard)
	
	return if expChatMemoBillboardGui then reactModule.memo(var36) else var36
end
return if expChatMemoBillboardGui then reactModule.memo(roactRoduxModule.connect(mapStateToProps)(bubbleChatBillboard)) else roactRoduxModule.connect(mapStateToProps)(bubbleChatBillboard)