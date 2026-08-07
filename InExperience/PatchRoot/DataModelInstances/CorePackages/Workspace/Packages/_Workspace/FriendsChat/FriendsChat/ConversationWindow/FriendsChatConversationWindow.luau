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

local function _(p0) --[[ line: 99 | named "toConversationModerationType" ]]
	-- upvalues: conversationChannelsModule (ref)
	return if p0 == conversationChannelsModule.ModerationType.TrustedComms or p0 == conversationChannelsModule.ModerationType.Moderated or (p0 == conversationChannelsModule.ModerationType.Invalid or p0 == conversationChannelsModule.ModerationType.UnknownType) then p0 else nil
end

local _ = function(p1, p2) --[[ line: 113 | named "resolveFade" ]]
	return if type(p2) == "number" then p1 + p2 * (1 - p1) elseif p2 == nil then p1 else p2:map(function(p3) --[[ line: 117 ]]
		-- upvalues: p1 (ref)
		return p1 + p3 * (1 - p1)
	end)
end

local function getHeaderOverlapPadding(p4) --[[ line: 124 ]]
	return p4:map(function(p5) --[[ line: 125 ]]
		return UDim.new(0, -p5)
	end)
end

local function getHeaderVisibleHeight(p6, p7) --[[ line: 130 ]]
	-- upvalues: reactModule (ref)
	if type(p7) == "number" then
		local var31 = 1 - math.clamp(p7, 0, 1)
		
		return p6:map(function(p8) --[[ line: 133 ]]
			-- upvalues: var31 (ref)
			return p8 * var31
		end)
	end
	return if p7 == nil then p6 else reactModule.joinBindings({ height = p6, fade = p7 }):map(function(p9) --[[ line: 140 ]]
		return p9.height * (1 - math.clamp(p9.fade, 0, 1))
	end)
end

local function getContentTopPadding(p10, p11, p12) --[[ line: 147 ]]
	-- upvalues: reactModule (ref)
	return reactModule.joinBindings({ height = p10, visibleHeight = p11, canvasY = p12 }):map(function(p13) --[[ line: 156 ]]
		return p13.height - math.min(p13.height - p13.visibleHeight, math.max(p13.height - p13.canvasY, 0))
	end)
end

local function getHeaderInteractable(p14) --[[ line: 163 ]]
	return if type(p14) == "number" then p14 < 1 else p14 == nil or p14:map(function(p15) --[[ line: 167 ]]
		return p15 < 1
	end)
end

local _ = function(p16, p17) --[[ line: 174 | named "areArraysEqual" ]]
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

local function areSelectedConversationHeaderFieldsEqual(p18, p19) --[[ line: 189 ]]
	if p18 == p19 then
		return true
	elseif p18 == nil or p19 == nil then
		return false
	end
	local var32 = false
	
	if p18.source == p19.source then
		var32 = false
		
		if p18.title == p19.title then
			var32 = false
			
			if p18.titleForViewer == p19.titleForViewer then
				local participants = p18.participants
				local participants_1 = p19.participants
				
				if participants == participants_1 then
					var32 = true
				elseif participants == nil or participants_1 == nil or #participants ~= #participants_1 then
					var32 = false
				else
					for i, v in participants do
						if participants_1[i] ~= v then
							var32 = false
						end
					end
					var32 = true
				end
				var32 = var32 and p18.moderationType == p19.moderationType
			end
		end
	end
	return var32
end

return function(p20) --[[ line: 206 | named "FriendsChatConversationWindow" ]]
	-- upvalues: useChatWindowModule (ref), useChatWindowSettingsModule (ref), reactModule (ref), useInterpolatedClientSettingsModule (ref), fFlagDebugFriendsChatModule (ref), fStringDebugFriendsChatConversationIdModule (ref), playersService (ref), expChatConversationListAdapterModule (ref), signalsModule (ref), conversationChannelsModule (ref), areSelectedConversationHeaderFieldsEqual (ref), signalsReactModule (ref), getFriendsChatHeaderPropsModule (ref), getConversationMessageListStoreModule (ref), localizationRoactContext (ref), localizeStrings (ref), useMessageDisplayStoreModule (ref), friendsChatTextMessageModule (ref), useMessagePool (ref), UIListLayout (ref), fetchMessagePageModule (ref), name (ref), useFriendsChatConversationTelemetryModule (ref), getHeaderOverlapPadding (ref), getHeaderVisibleHeight (ref), getContentTopPadding (ref), getMessageFadeSequenceModule (ref), getHeaderInteractable (ref), friendsChatConversationHeaderBarModule (ref), layoutConstantsModule (ref), friendsChatInputBarHostModule (ref)
	local var33 = useChatWindowModule()
	local var34 = useChatWindowSettingsModule()
	local chatWindowSettings = p20.chatWindowSettings or reactModule.useMemo(function() --[[ line: 211 ]]
		-- upvalues: var34 (ref)
		return {
			BackgroundColor3 = var34.ChatWindowBackgroundColor3,
			BackgroundTransparency = var34.ChatWindowBackgroundTransparency
		}
	end, { var34 })
	local var36 = useInterpolatedClientSettingsModule(chatWindowSettings)
	local conversationId = p20.conversationId or ""
	
	if conversationId == "" and fFlagDebugFriendsChatModule then
		conversationId = fStringDebugFriendsChatConversationIdModule
	end
	local var38 = conversationId ~= ""
	local localPlayer = playersService.LocalPlayer
	local var39 = if localPlayer then localPlayer.UserId else 0
	local conversationStore = expChatConversationListAdapterModule.getConversationStore()
	local var41 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 230 ]]
		-- upvalues: signalsModule (copy), var38 (ref), conversationStore (ref), conversationId (write), conversationChannelsModule (copy), areSelectedConversationHeaderFieldsEqual (copy)
		return signalsModule.createComputed(function(p21) --[[ line: 231 ]]
			-- upvalues: var38 (copy), conversationStore (copy), conversationId (copy), conversationChannelsModule (copy)
			if not var38 then
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
	end, { conversationStore, conversationId, var38 }))
	local var42 = reactModule.useMemo(function() --[[ line: 249 ]]
		-- upvalues: var41 (ref), getFriendsChatHeaderPropsModule (copy), var39 (ref)
		return if var41 == nil then nil else getFriendsChatHeaderPropsModule(var41, var39)
	end, { var41, var39 })
	local var43 = expChatConversationListAdapterModule.isFriendPlaceholder(conversationId)
	local var44 = var38 and not var43
	local var45 = var38 and not var43
	reactModule.useEffect(function() --[[ line: 259 ]]
		-- upvalues: var38 (ref), expChatConversationListAdapterModule (copy), conversationId (write)
		if var38 then
			expChatConversationListAdapterModule.markConversationRead(conversationId)
		end
	end, { conversationId, var38 })
	local var46 = reactModule.useMemo(function() --[[ line: 270 ]]
		-- upvalues: var45 (ref), getConversationMessageListStoreModule (copy), conversationId (write)
		return if var45 then function(p22) --[[ line: 276 ]]
			-- upvalues: getConversationMessageListStoreModule (copy), conversationId (copy)
			return getConversationMessageListStoreModule(p22).getOrderedIds(conversationId, p22)
		end else function() --[[ line: 272 ]]
			return {}
		end
	end, { conversationId, var45 })
	local var47 = reactModule.useContext(localizationRoactContext)
	local var48 = reactModule.useCallback(function(p23) --[[ line: 283 ]]
		-- upvalues: var47 (ref), localizeStrings (copy)
		if var47 == nil then
			return ""
		end
		local ok, status = pcall(function() --[[ line: 287 ]]
			-- upvalues: localizeStrings (copy), var47 (copy), p23 (ref)
			return localizeStrings(var47, { value = p23 }).value
		end)
		
		return if ok and typeof(status) == "string" then status else ""
	end, { var47 })
	local var49 = useMessageDisplayStoreModule(var46, conversationId)
	local var50 = useMessagePool({
		maxSlots = 50,
		messageIdsSignal = var49.getDisplayIds,
		createSlotElement = reactModule.useCallback(function(p24) --[[ line: 302 ]]
			-- upvalues: reactModule (copy), friendsChatTextMessageModule (copy), var49 (ref), p20 (ref), var48 (ref)
			return reactModule.createElement(friendsChatTextMessageModule, {
				getDisplayId = p24.getMessageId,
				getDisplayFromId = var49.getDisplayFromId,
				getLayoutOrder = p24.getLayoutOrder,
				chatWindowSettings = p20.chatWindowSettings,
				textTransparency = p20.textTransparency,
				isSpatialUIEnabled = p20.isSpatialUIEnabled,
				localize = var48
			})
		end, {
			var49,
			p20.chatWindowSettings,
			p20.textTransparency,
			p20.isSpatialUIEnabled,
			var48
		})
	})
	local var51 = reactModule.useMemo(function() --[[ line: 325 ]]
		-- upvalues: signalsModule (copy), var50 (ref), UIListLayout (copy)
		return signalsModule.createComputed(function(p25) --[[ line: 326 ]]
			-- upvalues: var50 (copy), UIListLayout (copy)
			local cloned = table.clone(var50(p25))
			cloned["$layout"] = UIListLayout
			
			return cloned
		end)
	end, { var50 })
	reactModule.useEffect(function() --[[ line: 334 ]]
		-- upvalues: var45 (ref), fetchMessagePageModule (copy), conversationId (write), name (copy)
		if var45 then
			local var78 = false
			fetchMessagePageModule(conversationId, nil):catch(function(p26) --[[ line: 349 ]]
				-- upvalues: var78 (write), name (copy), conversationId (copy)
				if var78 then
					return
				end
				name:warning(`Failed to fetch conversation messages for {conversationId}: {tostring(p26)}`)
			end)
			
			return function() --[[ line: 356 ]]
				-- upvalues: var78 (write)
				var78 = true
			end
		end
	end, { conversationId, var45 })
	local var52 = useFriendsChatConversationTelemetryModule({
		conversationId = conversationId,
		getLoadedMessageCount = reactModule.useCallback(function() --[[ line: 365 ]]
			-- upvalues: var38 (ref), getConversationMessageListStoreModule (copy), conversationId (write)
			return if var38 then #getConversationMessageListStoreModule(false).getOrderedIds(conversationId, false) else 0
		end, { conversationId, var38 })
	})
	local parentLayoutOrder = p20.parentLayoutOrder or 1
	local var54 = reactModule.useCallback(function() --[[ line: 385 ]]
		-- upvalues: name (copy)
		name:warning("resetTargetChannel called on FriendsChatConversationWindow; not supported")
	end, {})
	local var55 = reactModule.useCallback(function() --[[ line: 388 ]]
		-- upvalues: name (copy)
		name:warning("activateWhisperMode called on FriendsChatConversationWindow; not supported")
	end, {})
	local onOpenDetails = p20.onOpenDetails
	local fireInfoButtonClicked = var52.fireInfoButtonClicked
	local var56 = reactModule.useCallback(function() --[[ line: 393 ]]
		-- upvalues: fireInfoButtonClicked (ref), onOpenDetails (ref), conversationId (write)
		fireInfoButtonClicked()
		onOpenDetails(conversationId)
	end, { fireInfoButtonClicked, onOpenDetails, conversationId })
	local var57, var58 = reactModule.useBinding(0)
	local var59, var60 = reactModule.useBinding(0)
	local var61 = reactModule.useCallback(function(p27) --[[ line: 401 ]]
		-- upvalues: var58 (ref)
		var58(p27.AbsoluteSize.Y)
	end, {})
	local var62 = reactModule.useMemo(function() --[[ line: 404 ]]
		-- upvalues: getHeaderOverlapPadding (copy), var57 (ref)
		return getHeaderOverlapPadding(var57)
	end, { var57 })
	local var63 = reactModule.useMemo(function() --[[ line: 407 ]]
		-- upvalues: getHeaderVisibleHeight (copy), var57 (ref), p20 (ref)
		return getHeaderVisibleHeight(var57, p20.transparencyValue)
	end, { var57, p20.transparencyValue })
	local var64 = reactModule.useMemo(function() --[[ line: 410 ]]
		-- upvalues: getContentTopPadding (copy), var57 (ref), var63 (ref), var59 (ref)
		return getContentTopPadding(var57, var63, var59)
	end, { var57, var63, var59 })
	local var65, var66 = reactModule.useBinding(0)
	local var67 = reactModule.useCallback(function(p28) --[[ line: 414 ]]
		-- upvalues: var66 (ref)
		var66(p28.AbsoluteSize.Y)
	end, {})
	local var68 = reactModule.useMemo(function() --[[ line: 417 ]]
		-- upvalues: reactModule (copy), var57 (ref), var63 (ref), var65 (ref), getMessageFadeSequenceModule (copy)
		return reactModule.joinBindings({
			headerHeight = var57,
			headerVisibleHeight = var63,
			viewportHeight = var65
		}):map(function(p29) --[[ line: 422 ]]
			-- upvalues: getMessageFadeSequenceModule (copy)
			return getMessageFadeSequenceModule(p29.headerHeight, p29.viewportHeight, if p29.headerHeight > 0 then p29.headerVisibleHeight / p29.headerHeight else 0)
		end)
	end, { var57, var63, var65 })
	local var69 = reactModule.useMemo(function() --[[ line: 429 ]]
		-- upvalues: getHeaderInteractable (copy), p20 (ref)
		return getHeaderInteractable(p20.transparencyValue)
	end, { p20.transparencyValue })
	local var70 = reactModule.useCallback(function(p30, p31) --[[ line: 432 ]]
		-- upvalues: var60 (ref)
		var60(math.clamp(p30.Y, 0, p31))
	end, {})
	reactModule.useEffect(function() --[[ line: 435 ]]
		-- upvalues: var60 (ref)
		var60(0)
	end, { conversationId })
	local createElement = reactModule.createElement
	createElement = createElement(friendsChatConversationHeaderBarModule, {
		layoutOrder = 1,
		suppressBackground = true,
		zIndex = 2,
		localUserId = var39,
		participantUserIds = if var42 then var42.participantUserIds else nil,
		titleText = if var42 then var42.titleText else nil,
		chatWindowSettings = chatWindowSettings,
		transparencyValue = p20.transparencyValue,
		onHovered = p20.onHovered,
		onUnhovered = p20.onUnhovered,
		onBack = p20.onBack,
		onActivated = if p20.onOpenDetails and var44 then var56 else nil,
		onAbsoluteSizeChanged = var61,
		interactable = var69
	})
	local createElement_1 = reactModule.createElement
	local fragment = reactModule.Fragment
	local var71 = nil
	local t = {}
	local createElement_2 = reactModule.createElement
	local var73 = "Frame"
	local t_1 = {
		Name = "FriendsChatHeaderWindow",
		BorderSizePixel = 0,
		LayoutOrder = parentLayoutOrder,
		BackgroundColor3 = var36.BackgroundColor3 or (var36.BackgroundColor or var34.ChatWindowBackgroundColor3)
	}
	local backgroundTransparency = var36.BackgroundTransparency
	local transparencyValue = p20.transparencyValue
	t_1.BackgroundTransparency = if type(transparencyValue) == "number" then backgroundTransparency + transparencyValue * (1 - backgroundTransparency) elseif transparencyValue ~= nil then backgroundTransparency else transparencyValue:map(function(p32) --[[ line: 117 ]]
		-- upvalues: backgroundTransparency (ref)
		return backgroundTransparency + p32 * (1 - backgroundTransparency)
	end)
	t_1.Size = UDim2.new(1, 0, 1, layoutConstantsModule.PanelTopSpacerHeight)
	t.friendsChatHeaderWindow = createElement_2(var73, t_1, {
		layout = reactModule.createElement("UIListLayout", {
			Name = "FriendsChatHeaderWindowLayout",
			FillDirection = Enum.FillDirection.Vertical,
			Padding = var62,
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
				[reactModule.Change.AbsoluteSize] = var67
			}, {
				fade = reactModule.createElement("UIGradient", { Rotation = 90, Transparency = var68 }),
				window = reactModule.createElement(var33, {
					suppressBackground = true,
					disableLineReporting = true,
					size = UDim2.fromScale(1, 1),
					isChannelBarVisible = p20.isChannelBarVisible,
					scrollResetKey = "FriendsChat:" .. conversationId,
					onCanvasPositionChanged = var70,
					contentTopPadding = var64,
					messageComponentsSignal = var51,
					chatWindowSettings = chatWindowSettings,
					transparencyValue = p20.transparencyValue,
					textTransparency = p20.textTransparency,
					isSpatialUIEnabled = p20.isSpatialUIEnabled,
					onHovered = p20.onHovered,
					onUnhovered = p20.onUnhovered,
					onAbsoluteSizeChanged = p20.onAbsoluteSizeChanged,
					onAbsolutePositionChanged = p20.onAbsolutePositionChanged,
					resetTargetChannel = var54,
					activateWhisperMode = var55
				})
			})
		})
	})
	t.friendsChatInput = reactModule.createElement(friendsChatInputBarHostModule, {
		LayoutOrder = parentLayoutOrder + 1,
		conversationId = conversationId,
		conversationModerationType = if var41 then var41.moderationType else nil,
		onFriendPlaceholderConversationCreated = p20.onFriendPlaceholderConversationCreated,
		chatWindowSettings = p20.chatWindowSettings,
		transparencyValue = p20.transparencyValue,
		isSpatialUIEnabled = p20.isSpatialUIEnabled,
		onHovered = p20.onHovered,
		onUnhovered = p20.onUnhovered
	})
	
	return createElement_1(fragment, var71, t)
end