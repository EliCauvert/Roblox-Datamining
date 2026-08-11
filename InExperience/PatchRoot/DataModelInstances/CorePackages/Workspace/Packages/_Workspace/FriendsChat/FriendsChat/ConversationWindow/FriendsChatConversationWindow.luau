local playersService = game:GetService("Players")
local friendsChat = script:FindFirstAncestor("FriendsChat")
local parent = friendsChat.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local expChatSharedModule = require(parent.ExpChatShared)
local localizationModule = require(parent.Localization)
local localizationRoactContext = localizationModule.LocalizationRoactContext
local localizeStrings = localizationModule.localizeStrings
local conversationChannelsModule = require(parent.AppChat.ConversationChannels)
local getConversationMessageListStoreModule = require(parent.AppChat.GetConversationMessageListStore)
local fetchMessagePageModule = require(parent.AppChat.fetchMessagePage)
local getFFlagAppChatEnableRootedNavigationModule = require(parent.AppChat.getFFlagAppChatEnableRootedNavigation)
local useChatWindowModule = require(script.Parent.Parent.Bridge.useChatWindow)
local useMessageDisplayStoreModule = require(script.Parent.Parent.Message.MessageDisplayStore.useMessageDisplayStore)
local fFlagDebugFriendsChatModule = require(script.Parent.Parent.Flags.FFlagDebugFriendsChat)
local fStringDebugFriendsChatConversationIdModule = require(script.Parent.Parent.Flags.FStringDebugFriendsChatConversationId)
local useMessagePool = require(parent.ChatUIPrimitives).useMessagePool
local useInterpolatedClientSettingsModule = require(parent.ExpChatIntegration.useInterpolatedClientSettings)
local useChatWindowSettingsModule = require(parent.ExpChatIntegration.useChatWindowSettings)
local expChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local friendsChatTextMessageModule = require(script.Parent.Parent.Message.FriendsChatTextMessage)
local friendsChatConversationHeaderBarModule = require(script.Parent.Parent.HeaderBar.FriendsChatConversationHeaderBar)
local getFriendsChatHeaderPropsModule = require(script.Parent.Parent.HeaderBar.getFriendsChatHeaderProps)
local friendsChatInputBarHostModule = require(script.Parent.FriendsChatInputBarHost)
local getMessageFadeSequenceModule = require(script.Parent.getMessageFadeSequence)
local layoutConstantsModule = require(friendsChat.LayoutConstants)
local useFriendsChatConversationTelemetryModule = require(script.Parent.Parent.Telemetry.ChatConversation.useFriendsChatConversationTelemetry)
local name = expChatSharedModule.Logger:new(script.Name)
local UIListLayout = reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })

local function _(p0) --[[ line: 100 | named "toConversationModerationType" ]]
	-- upvalues: conversationChannelsModule (ref)
	return if p0 == conversationChannelsModule.ModerationType.TrustedComms or p0 == conversationChannelsModule.ModerationType.Moderated or (p0 == conversationChannelsModule.ModerationType.Invalid or p0 == conversationChannelsModule.ModerationType.UnknownType) then p0 else nil
end

local _ = function(p1, p2) --[[ line: 114 | named "resolveFade" ]]
	return if type(p2) == "number" then p1 + p2 * (1 - p1) elseif p2 == nil then p1 else p2:map(function(p3) --[[ line: 118 ]]
		-- upvalues: p1 (ref)
		return p1 + p3 * (1 - p1)
	end)
end

local function getHeaderOverlapPadding(p4) --[[ line: 125 ]]
	return p4:map(function(p5) --[[ line: 126 ]]
		return UDim.new(0, -p5)
	end)
end

local function getHeaderVisibleHeight(p6, p7) --[[ line: 131 ]]
	-- upvalues: reactModule (ref)
	if type(p7) == "number" then
		local var32 = 1 - math.clamp(p7, 0, 1)
		
		return p6:map(function(p8) --[[ line: 134 ]]
			-- upvalues: var32 (ref)
			return p8 * var32
		end)
	end
	return if p7 == nil then p6 else reactModule.joinBindings({ height = p6, fade = p7 }):map(function(p9) --[[ line: 141 ]]
		return p9.height * (1 - math.clamp(p9.fade, 0, 1))
	end)
end

local function getContentTopPadding(p10, p11, p12) --[[ line: 148 ]]
	-- upvalues: reactModule (ref)
	return reactModule.joinBindings({ height = p10, visibleHeight = p11, canvasY = p12 }):map(function(p13) --[[ line: 157 ]]
		return p13.height - math.min(p13.height - p13.visibleHeight, math.max(p13.height - p13.canvasY, 0))
	end)
end

local function getHeaderInteractable(p14) --[[ line: 164 ]]
	return if type(p14) == "number" then p14 < 1 else p14 == nil or p14:map(function(p15) --[[ line: 168 ]]
		return p15 < 1
	end)
end

local _ = function(p16, p17) --[[ line: 175 | named "areArraysEqual" ]]
	if p16 == p17 then
		return true
	elseif p16 == nil or p17 == nil or #p16 ~= #p17 then
		return false
	end
	for i, v in p16 do
		if p17[i] ~= v then
			return false
		end
	end
	return true
end

local function areSelectedConversationHeaderFieldsEqual(p18, p19) --[[ line: 190 ]]
	if p18 == p19 then
		return true
	elseif p18 == nil or p19 == nil then
		return false
	end
	local var33 = false
	
	if p18.source == p19.source then
		var33 = false
		
		if p18.title == p19.title then
			var33 = false
			
			if p18.titleForViewer == p19.titleForViewer then
				local participants = p18.participants
				local participants_1 = p19.participants
				
				if participants == participants_1 then
					var33 = true
				elseif participants == nil or participants_1 == nil or #participants ~= #participants_1 then
					var33 = false
				else
					for i, v in participants do
						if participants_1[i] ~= v then
							var33 = false
						end
					end
					var33 = true
				end
				var33 = var33 and p18.moderationType == p19.moderationType
			end
		end
	end
	return var33
end

return function(p20) --[[ line: 207 | named "FriendsChatConversationWindow" ]]
	-- upvalues: useChatWindowModule (ref), useChatWindowSettingsModule (ref), reactModule (ref), useInterpolatedClientSettingsModule (ref), fFlagDebugFriendsChatModule (ref), fStringDebugFriendsChatConversationIdModule (ref), playersService (ref), expChatConversationListAdapterModule (ref), signalsModule (ref), conversationChannelsModule (ref), areSelectedConversationHeaderFieldsEqual (ref), signalsReactModule (ref), getFriendsChatHeaderPropsModule (ref), getFFlagAppChatEnableRootedNavigationModule (ref), getConversationMessageListStoreModule (ref), localizationRoactContext (ref), localizeStrings (ref), useMessageDisplayStoreModule (ref), friendsChatTextMessageModule (ref), useMessagePool (ref), UIListLayout (ref), fetchMessagePageModule (ref), name (ref), useFriendsChatConversationTelemetryModule (ref), getHeaderOverlapPadding (ref), getHeaderVisibleHeight (ref), getContentTopPadding (ref), getMessageFadeSequenceModule (ref), getHeaderInteractable (ref), friendsChatConversationHeaderBarModule (ref), layoutConstantsModule (ref), friendsChatInputBarHostModule (ref)
	local var34 = useChatWindowModule()
	local var35 = useChatWindowSettingsModule()
	local chatWindowSettings = p20.chatWindowSettings or reactModule.useMemo(function() --[[ line: 212 ]]
		-- upvalues: var35 (ref)
		return {
			BackgroundColor3 = var35.ChatWindowBackgroundColor3,
			BackgroundTransparency = var35.ChatWindowBackgroundTransparency
		}
	end, { var35 })
	local var37 = useInterpolatedClientSettingsModule(chatWindowSettings)
	local conversationId = p20.conversationId or ""
	
	if conversationId == "" and fFlagDebugFriendsChatModule then
		conversationId = fStringDebugFriendsChatConversationIdModule
	end
	local var39 = conversationId ~= ""
	local localPlayer = playersService.LocalPlayer
	local var40 = if localPlayer then localPlayer.UserId else 0
	local conversationStore = expChatConversationListAdapterModule.getConversationStore()
	local var42 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 231 ]]
		-- upvalues: signalsModule (copy), var39 (ref), conversationStore (ref), conversationId (write), conversationChannelsModule (copy), areSelectedConversationHeaderFieldsEqual (copy)
		return signalsModule.createComputed(function(p21) --[[ line: 232 ]]
			-- upvalues: var39 (copy), conversationStore (copy), conversationId (copy), conversationChannelsModule (copy)
			if not var39 then
				return nil
			end
			local conversation = conversationStore.getConversation(conversationId, p21)
			
			if conversation == nil then
				return nil
			end
			local t = {
				source = conversation.source,
				title = conversation.title,
				titleForViewer = conversation.titleForViewer,
				participants = conversation.participants
			}
			local moderationType = conversation.moderationType
			t.moderationType = if moderationType == conversationChannelsModule.ModerationType.TrustedComms or moderationType == conversationChannelsModule.ModerationType.Moderated or (moderationType == conversationChannelsModule.ModerationType.Invalid or moderationType == conversationChannelsModule.ModerationType.UnknownType) then moderationType else nil
			
			return t
		end, areSelectedConversationHeaderFieldsEqual)
	end, { conversationStore, conversationId, var39 }))
	local var43 = reactModule.useMemo(function() --[[ line: 250 ]]
		-- upvalues: var42 (ref), getFriendsChatHeaderPropsModule (copy), var40 (ref)
		return if var42 == nil then nil else getFriendsChatHeaderPropsModule(var42, var40)
	end, { var42, var40 })
	local var44 = expChatConversationListAdapterModule.isFriendPlaceholder(conversationId)
	local var45 = var39 and not var44
	local var46 = var39 and not var44
	
	if getFFlagAppChatEnableRootedNavigationModule() then
		local var47 = reactModule.useRef(false)
		reactModule.useEffect(function() --[[ line: 266 ]]
			-- upvalues: var47 (ref)
			var47.current = false
		end, { conversationId })
		reactModule.useEffect(function() --[[ line: 269 ]]
			-- upvalues: var42 (ref), var47 (ref), p20 (ref)
			if var42 ~= nil then
				var47.current = true
				
				return
			elseif var47.current and p20.onBack then
				var47.current = false
				p20.onBack()
			end
		end, { var42, p20.onBack })
	end
	reactModule.useEffect(function() --[[ line: 279 ]]
		-- upvalues: var39 (ref), expChatConversationListAdapterModule (copy), conversationId (write)
		if var39 then
			expChatConversationListAdapterModule.markConversationRead(conversationId)
		end
	end, { conversationId, var39 })
	local var48 = reactModule.useMemo(function() --[[ line: 290 ]]
		-- upvalues: var46 (ref), getConversationMessageListStoreModule (copy), conversationId (write)
		return if var46 then function(p22) --[[ line: 296 ]]
			-- upvalues: getConversationMessageListStoreModule (copy), conversationId (copy)
			return getConversationMessageListStoreModule(p22).getOrderedIds(conversationId, p22)
		end else function() --[[ line: 292 ]]
			return {}
		end
	end, { conversationId, var46 })
	local var49 = reactModule.useContext(localizationRoactContext)
	local var50 = reactModule.useCallback(function(p23) --[[ line: 303 ]]
		-- upvalues: var49 (ref), localizeStrings (copy)
		if var49 == nil then
			return ""
		end
		local ok, status = pcall(function() --[[ line: 307 ]]
			-- upvalues: localizeStrings (copy), var49 (copy), p23 (ref)
			return localizeStrings(var49, { value = p23 }).value
		end)
		
		return if ok and typeof(status) == "string" then status else ""
	end, { var49 })
	local var51 = useMessageDisplayStoreModule(var48, conversationId)
	local var52 = useMessagePool({
		maxSlots = 50,
		messageIdsSignal = var51.getDisplayIds,
		createSlotElement = reactModule.useCallback(function(p24) --[[ line: 322 ]]
			-- upvalues: reactModule (copy), friendsChatTextMessageModule (copy), var51 (ref), p20 (ref), var50 (ref)
			return reactModule.createElement(friendsChatTextMessageModule, {
				getDisplayId = p24.getMessageId,
				getDisplayFromId = var51.getDisplayFromId,
				getLayoutOrder = p24.getLayoutOrder,
				chatWindowSettings = p20.chatWindowSettings,
				textTransparency = p20.textTransparency,
				isSpatialUIEnabled = p20.isSpatialUIEnabled,
				localize = var50
			})
		end, {
			var51,
			p20.chatWindowSettings,
			p20.textTransparency,
			p20.isSpatialUIEnabled,
			var50
		})
	})
	local var53 = reactModule.useMemo(function() --[[ line: 345 ]]
		-- upvalues: signalsModule (copy), var52 (ref), UIListLayout (copy)
		return signalsModule.createComputed(function(p25) --[[ line: 346 ]]
			-- upvalues: var52 (copy), UIListLayout (copy)
			local cloned = table.clone(var52(p25))
			cloned["$layout"] = UIListLayout
			
			return cloned
		end)
	end, { var52 })
	reactModule.useEffect(function() --[[ line: 354 ]]
		-- upvalues: var46 (ref), fetchMessagePageModule (copy), conversationId (write), name (copy)
		if var46 then
			local var80 = false
			fetchMessagePageModule(conversationId, nil):catch(function(p26) --[[ line: 369 ]]
				-- upvalues: var80 (write), name (copy), conversationId (copy)
				if var80 then
					return
				end
				name:warning(`Failed to fetch conversation messages for {conversationId}: {tostring(p26)}`)
			end)
			
			return function() --[[ line: 376 ]]
				-- upvalues: var80 (write)
				var80 = true
			end
		end
	end, { conversationId, var46 })
	local var54 = useFriendsChatConversationTelemetryModule({
		conversationId = conversationId,
		getLoadedMessageCount = reactModule.useCallback(function() --[[ line: 385 ]]
			-- upvalues: var39 (ref), getConversationMessageListStoreModule (copy), conversationId (write)
			return if var39 then #getConversationMessageListStoreModule(false).getOrderedIds(conversationId, false) else 0
		end, { conversationId, var39 })
	})
	local parentLayoutOrder = p20.parentLayoutOrder or 1
	local var56 = reactModule.useCallback(function() --[[ line: 405 ]]
		-- upvalues: name (copy)
		name:warning("resetTargetChannel called on FriendsChatConversationWindow; not supported")
	end, {})
	local var57 = reactModule.useCallback(function() --[[ line: 408 ]]
		-- upvalues: name (copy)
		name:warning("activateWhisperMode called on FriendsChatConversationWindow; not supported")
	end, {})
	local onOpenDetails = p20.onOpenDetails
	local fireInfoButtonClicked = var54.fireInfoButtonClicked
	local var58 = reactModule.useCallback(function() --[[ line: 413 ]]
		-- upvalues: fireInfoButtonClicked (ref), onOpenDetails (ref), conversationId (write)
		fireInfoButtonClicked()
		onOpenDetails(conversationId)
	end, { fireInfoButtonClicked, onOpenDetails, conversationId })
	local var59, var60 = reactModule.useBinding(0)
	local var61, var62 = reactModule.useBinding(0)
	local var63 = reactModule.useCallback(function(p27) --[[ line: 421 ]]
		-- upvalues: var60 (ref)
		var60(p27.AbsoluteSize.Y)
	end, {})
	local var64 = reactModule.useMemo(function() --[[ line: 424 ]]
		-- upvalues: getHeaderOverlapPadding (copy), var59 (ref)
		return getHeaderOverlapPadding(var59)
	end, { var59 })
	local var65 = reactModule.useMemo(function() --[[ line: 427 ]]
		-- upvalues: getHeaderVisibleHeight (copy), var59 (ref), p20 (ref)
		return getHeaderVisibleHeight(var59, p20.transparencyValue)
	end, { var59, p20.transparencyValue })
	local var66 = reactModule.useMemo(function() --[[ line: 430 ]]
		-- upvalues: getContentTopPadding (copy), var59 (ref), var65 (ref), var61 (ref)
		return getContentTopPadding(var59, var65, var61)
	end, { var59, var65, var61 })
	local var67, var68 = reactModule.useBinding(0)
	local var69 = reactModule.useCallback(function(p28) --[[ line: 434 ]]
		-- upvalues: var68 (ref)
		var68(p28.AbsoluteSize.Y)
	end, {})
	local var70 = reactModule.useMemo(function() --[[ line: 437 ]]
		-- upvalues: reactModule (copy), var59 (ref), var65 (ref), var67 (ref), getMessageFadeSequenceModule (copy)
		return reactModule.joinBindings({
			headerHeight = var59,
			headerVisibleHeight = var65,
			viewportHeight = var67
		}):map(function(p29) --[[ line: 442 ]]
			-- upvalues: getMessageFadeSequenceModule (copy)
			return getMessageFadeSequenceModule(p29.headerHeight, p29.viewportHeight, if p29.headerHeight > 0 then p29.headerVisibleHeight / p29.headerHeight else 0)
		end)
	end, { var59, var65, var67 })
	local var71 = reactModule.useMemo(function() --[[ line: 449 ]]
		-- upvalues: getHeaderInteractable (copy), p20 (ref)
		return getHeaderInteractable(p20.transparencyValue)
	end, { p20.transparencyValue })
	local var72 = reactModule.useCallback(function(p30, p31) --[[ line: 452 ]]
		-- upvalues: var62 (ref)
		var62(math.clamp(p30.Y, 0, p31))
	end, {})
	reactModule.useEffect(function() --[[ line: 455 ]]
		-- upvalues: var62 (ref)
		var62(0)
	end, { conversationId })
	local createElement = reactModule.createElement
	createElement = createElement(friendsChatConversationHeaderBarModule, {
		layoutOrder = 1,
		suppressBackground = true,
		zIndex = 2,
		localUserId = var40,
		participantUserIds = if var43 then var43.participantUserIds else nil,
		titleText = if var43 then var43.titleText else nil,
		chatWindowSettings = chatWindowSettings,
		transparencyValue = p20.transparencyValue,
		onHovered = p20.onHovered,
		onUnhovered = p20.onUnhovered,
		onBack = p20.onBack,
		onActivated = if p20.onOpenDetails and var45 then var58 else nil,
		onAbsoluteSizeChanged = var63,
		interactable = var71
	})
	local createElement_1 = reactModule.createElement
	local fragment = reactModule.Fragment
	local var73 = nil
	local t = {}
	local createElement_2 = reactModule.createElement
	local var75 = "Frame"
	local t_1 = {
		Name = "FriendsChatHeaderWindow",
		BorderSizePixel = 0,
		LayoutOrder = parentLayoutOrder,
		BackgroundColor3 = var37.BackgroundColor3 or (var37.BackgroundColor or var35.ChatWindowBackgroundColor3)
	}
	local backgroundTransparency = var37.BackgroundTransparency
	local transparencyValue = p20.transparencyValue
	t_1.BackgroundTransparency = if type(transparencyValue) == "number" then backgroundTransparency + transparencyValue * (1 - backgroundTransparency) elseif transparencyValue ~= nil then backgroundTransparency else transparencyValue:map(function(p32) --[[ line: 118 ]]
		-- upvalues: backgroundTransparency (ref)
		return backgroundTransparency + p32 * (1 - backgroundTransparency)
	end)
	t_1.Size = UDim2.new(1, 0, 1, layoutConstantsModule.PanelTopSpacerHeight)
	t.friendsChatHeaderWindow = createElement_2(var75, t_1, {
		layout = reactModule.createElement("UIListLayout", {
			Name = "FriendsChatHeaderWindowLayout",
			FillDirection = Enum.FillDirection.Vertical,
			Padding = var64,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		header = createElement,
		windowSlot = reactModule.createElement("Frame", {
			Name = "FriendsChatWindowSlot",
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 0)
		}, {
			flex = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			messageMask = reactModule.createElement("CanvasGroup", {
				Name = "FriendsChatMessageMask",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClipsDescendants = true,
				GroupTransparency = 0,
				Size = UDim2.fromScale(1, 1),
				[reactModule.Change.AbsoluteSize] = var69
			}, {
				fade = reactModule.createElement("UIGradient", { Rotation = 90, Transparency = var70 }),
				window = reactModule.createElement(var34, {
					suppressBackground = true,
					disableLineReporting = true,
					size = UDim2.fromScale(1, 1),
					isChannelBarVisible = p20.isChannelBarVisible,
					scrollResetKey = "FriendsChat:" .. conversationId,
					onCanvasPositionChanged = var72,
					contentTopPadding = var66,
					messageComponentsSignal = var53,
					chatWindowSettings = chatWindowSettings,
					transparencyValue = p20.transparencyValue,
					textTransparency = p20.textTransparency,
					isSpatialUIEnabled = p20.isSpatialUIEnabled,
					onHovered = p20.onHovered,
					onUnhovered = p20.onUnhovered,
					onAbsoluteSizeChanged = p20.onAbsoluteSizeChanged,
					onAbsolutePositionChanged = p20.onAbsolutePositionChanged,
					resetTargetChannel = var56,
					activateWhisperMode = var57
				})
			})
		})
	})
	t.friendsChatInput = reactModule.createElement(friendsChatInputBarHostModule, {
		LayoutOrder = parentLayoutOrder + 1,
		conversationId = conversationId,
		conversationModerationType = if var42 then var42.moderationType else nil,
		onFriendPlaceholderConversationCreated = p20.onFriendPlaceholderConversationCreated,
		chatWindowSettings = p20.chatWindowSettings,
		transparencyValue = p20.transparencyValue,
		isSpatialUIEnabled = p20.isSpatialUIEnabled,
		onHovered = p20.onHovered,
		onUnhovered = p20.onUnhovered
	})
	
	return createElement_1(fragment, var73, t)
end