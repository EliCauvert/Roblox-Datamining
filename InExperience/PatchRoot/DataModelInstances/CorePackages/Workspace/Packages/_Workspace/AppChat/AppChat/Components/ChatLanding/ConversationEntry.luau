local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local httpService = game:GetService("HttpService")
local reactModule = require(parent.React)
local memo = reactModule.memo
local useMemo = reactModule.useMemo
local useIsUserPendingModule = require(appChat.Hooks.useIsUserPending)
local useRelativeTimestampBindingModule = require(appChat.Hooks.useRelativeTimestampBinding)
local useChatPagePaddingModule = require(appChat.Contexts.ChatPagePadding.useChatPagePadding)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local useTextSizeOffset = UIBloxModule.Core.Style.useTextSizeOffset
local text = require(parent.AppCommonLib).Text
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local getBoldTextThemeModule = require(script.Parent.Utils.getBoldTextTheme)
local conversationCell = require(appChat.Components.Cells).ConversationCell
local conversationRelativeTimestampModule = require(script.Parent.ConversationRelativeTimestamp)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local squadJoinButtonModule = require(parent.Squads.SquadJoinButton)
local squadButtonSourceEnum = require(parent.Squads.Enums).SquadButtonSourceEnum
local squadComponentAccessWrapperModule = require(parent.Squads.SquadComponentAccessWrapper)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useNavigation = require(parent.Navigation).useNavigation
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local getFFlagDebugAppChatModule = require(appChat.Flags.getFFlagDebugAppChat)
local fFlagAppChatSquadJoinButtonU13OSAModule = require(appChat.Flags.FFlagAppChatSquadJoinButtonU13OSA)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local fFlagAppChatTimestampInSubtitleModule = require(appChat.Flags.FFlagAppChatTimestampInSubtitle)
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local chatLandingTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local constantsModule = require(appChat.Constants)
local removedConversationModule = require(appChat.Conversations.Actions.RemovedConversation)
local enumScreensModule = require(appChat.EnumScreens)
local conversationModule = require(appChat.Models.Conversation)
local shouldShowOSAForConversationModule = require(appChat.Utils.shouldShowOSAForConversation)
local shouldShowU13ChatOptInForConversationModule = require(appChat.Utils.shouldShowU13ChatOptInForConversation)
local getOverlayStoreModule = require(appChat.Stores.GetOverlayStore)
local overlayTypesModule = require(appChat.Stores.GetOverlayStore.OverlayTypes)
local useChatPlacementContext = require(appChat.Contexts.ChatPlacementContext).useChatPlacementContext
local useCanAccessPartyModule = require(parent.Squads.useCanAccessParty)
local _ = require(appChat.types)
local t = {
	entryHeight = 64,
	boldTitle = true,
	onSquadJoinButtonActivated = function() --[[ line: 73 ]] end
}

return memo(function(p0) --[[ line: 77 | named "ConversationEntry" ]]
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useTokens (ref), useTextSizeOffset (ref), useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), useIsUserPendingModule (ref), getBoldTextThemeModule (ref), useDispatch (ref), useChatPlacementContext (ref), useChatPagePaddingModule (ref), useRelativeTimestampBindingModule (ref), useMemo (ref), text (ref), fFlagAppChatTimestampInSubtitleModule (ref), reactModule (ref), useNavigation (ref), getOverlayStoreModule (ref), enumScreensModule (ref), overlayTypesModule (ref), conversationModule (ref), removedConversationModule (ref), shouldShowU13ChatOptInForConversationModule (ref), constantsModule (ref), shouldShowOSAForConversationModule (ref), httpService (ref), fFlagAppChatSquadJoinButtonU13OSAModule (ref), reactFocusNavigationModule (ref), useCanAccessPartyModule (ref), squadComponentAccessWrapperModule (ref), squadJoinButtonModule (ref), squadButtonSourceEnum (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), conversationCell (ref), getFFlagDebugAppChatModule (ref), conversationRelativeTimestampModule (ref), foundationModule (ref)
	local var31 = cryoModule.Dictionary.join(t, p0)
	local var32 = useStyle()
	local var33 = useTokens()
	local var34 = useTextSizeOffset()
	local var35 = useTelemetryModule(chatLandingTelemetryLayerModule.Context)
	local conversation = var31.conversation
	local hasGroupUp = conversation.hasGroupUp
	local var36 = conversation.hasUnreadMessages and not useIsUserPendingModule(conversation)
	local var37 = var36 and not var36
	local var38 = if var37 then getBoldTextThemeModule(var32) else var32
	local var39 = useDispatch()
	local var40 = useChatPlacementContext()
	local var41 = useChatPagePaddingModule()
	local captionSubHeader = var38.Font.CaptionSubHeader
	local var42 = var38.Font.BaseSize * captionSubHeader.RelativeSize
	local shortRelativeTime = var31.conversation.shortRelativeTime or ""
	local var44 = useRelativeTimestampBindingModule(var31.conversation.unixTime)
	local var45 = useMemo(function() --[[ line: 102 ]]
		-- upvalues: text (copy), shortRelativeTime (ref), captionSubHeader (ref), var42 (ref)
		return text.GetTextWidth(shortRelativeTime, captionSubHeader.Font, var42)
	end, { shortRelativeTime, captionSubHeader.Font, var42, var34 })
	local var46 = if fFlagAppChatTimestampInSubtitleModule then var44 else nil
	local var47 = reactModule.useRef(nil)
	local var48 = useNavigation()
	local wideMode = false
	
	if var48.getScreenProps then
		wideMode = var48.getScreenProps("wideMode", wideMode)
	end
	reactModule.useEffect(function() --[[ line: 113 ]]
		-- upvalues: var31 (ref)
		var31.fireImpressionEvent(var31.conversation)
	end, {})
	local var50 = nil
	local _ = nil
	local var51 = getOverlayStoreModule(false)
	local var52 = reactModule.useCallback(function(p1) --[[ line: 121 ]]
		-- upvalues: var48 (ref), enumScreensModule (copy)
		var48.navigate(enumScreensModule.ChatConversation, { isNavigatedFromGroupOSAJoin = true, conversationId = p1 })
	end, { var48 })
	local var53 = reactModule.useCallback(function(p2, p3, p4, p5, p6) --[[ line: 129 ]]
		-- upvalues: var51 (ref), overlayTypesModule (copy), var52 (ref), conversationModule (copy), var39 (ref), removedConversationModule (copy)
		var51.showOverlay(overlayTypesModule.GroupOSADialog, {
			conversationId = p2,
			impressionId = p3,
			modalVariant = p4,
			onJoin = function() --[[ line: 140 ]]
				-- upvalues: var51 (copy), p6 (ref), p2 (ref), var52 (copy)
				var51.dismissOverlay()
				
				if p6 then
					p6(p2)
					
					return
				end
				var52(p2)
			end,
			onDecline = function() --[[ line: 148 ]]
				-- upvalues: p2 (ref), p5 (ref), conversationModule (copy), var39 (copy), removedConversationModule (copy), var51 (copy)
				if p2 and p5 == conversationModule.Type.MULTI_USER_CONVERSATION then
					var39(removedConversationModule(p2))
				end
				var51.dismissOverlay()
			end
		})
	end, { var52, var39 })
	local var54 = reactModule.useCallback(function(p7) --[[ line: 163 ]]
		-- upvalues: shouldShowU13ChatOptInForConversationModule (copy), constantsModule (copy), shouldShowOSAForConversationModule (copy), httpService (copy), var53 (write), var31 (ref), var35 (ref)
		local var60 = nil
		local osaContextCard = nil
		
		if shouldShowU13ChatOptInForConversationModule(p7) then
			osaContextCard = constantsModule.OptInVariant.ChatOptInInfoCard
		elseif shouldShowOSAForConversationModule(p7) then
			osaContextCard = constantsModule.OptInVariant.OsaContextCard
		end
		if osaContextCard then
			var60 = httpService:GenerateGUID(false)
			var53(p7.id, var60, osaContextCard, p7.conversationType)
		elseif var31.onActivated then
			var31.onActivated(p7)
		end
		var31.fireClickEvent(p7, var35, var60)
	end, { var53, var31.onActivated, var31.fireClickEvent, var35 })
	local _ = nil
	local onSquadJoinButtonActivated = var31.onSquadJoinButtonActivated
	local var55 = reactModule.useCallback(function(p8) --[[ line: 192 ]]
		-- upvalues: shouldShowOSAForConversationModule (copy), conversation (ref), constantsModule (copy), fFlagAppChatSquadJoinButtonU13OSAModule (copy), shouldShowU13ChatOptInForConversationModule (copy), conversationModule (copy), var53 (write), httpService (copy), onSquadJoinButtonActivated (ref)
		local chatOptInInfoCard = nil
		
		if shouldShowOSAForConversationModule(conversation) then
			chatOptInInfoCard = constantsModule.OptInVariant.OsaContextCard
		elseif fFlagAppChatSquadJoinButtonU13OSAModule and shouldShowU13ChatOptInForConversationModule(conversation) and conversation.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION then
			chatOptInInfoCard = constantsModule.OptInVariant.ChatOptInInfoCard
		end
		if chatOptInInfoCard and var53 then
			var53(p8, httpService:GenerateGUID(false), chatOptInInfoCard, conversation.conversationType, onSquadJoinButtonActivated)
			
			return
		elseif onSquadJoinButtonActivated then
			onSquadJoinButtonActivated(p8)
		end
	end, { var53, conversation, onSquadJoinButtonActivated })
	local var56 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	reactModule.useEffect(function() --[[ line: 226 ]]
		-- upvalues: wideMode (write), var54 (ref), var56 (ref), var47 (ref), conversation (ref)
		if wideMode and var54 and var56 then
			local var61 = var56.focusedGuiObject:subscribe(function(p9) --[[ line: 228 ]]
				-- upvalues: var47 (copy), var54 (copy), conversation (copy)
				if var47.current and p9 == var47.current.cell then
					var54(conversation)
				end
			end)
			
			return function() --[[ line: 233 ]]
				-- upvalues: var61 (ref)
				var61:unsubscribe()
			end
		end
		return function() --[[ line: 237 ]] end
	end, { var54, wideMode, var56 })
	local children = var31.children or {}
	local size1900 = var33.Size.Size_1900
	local _ = nil
	local var58 = useCanAccessPartyModule()
	local right = var41.right
	local var59 = if var58 and hasGroupUp and conversation.id then reactModule.createElement(squadComponentAccessWrapperModule, { parentChannelId = conversation.id }, {
		reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, size1900, 1, 0)
		}, {}, {
			layout = reactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			padding = reactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 0) }),
			button = reactModule.createElement(squadJoinButtonModule, {
				isFullWidth = false,
				isInCard = false,
				layoutOrder = 0,
				Selectable = false,
				shouldAnimate = false,
				conversationId = conversation.id,
				onActivated = var55,
				squadLocation = var40.chatPlacement,
				squadButtonSource = squadButtonSourceEnum.ConversationEntry,
				testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingConversationEntrySquadButton(conversation.title) else nil
			})
		})
	}) else nil
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var31.entryHeight),
		ref = var47
	}, {
		cell = reactModule.createElement(conversationCell, {
			hideLeftAvatarPadding = true,
			Size = UDim2.new(1, 0, 0, var31.entryHeight),
			conversation = var31.conversation,
			childWidth = if var58 and hasGroupUp then right + size1900 elseif fFlagAppChatTimestampInSubtitleModule then if var36 then var33.Gap.Medium + var33.Size.Size_200 else 0 else var45 + (if var36 then var33.Size.Size_200 + var33.Gap.XSmall else 0) + right,
			subTitleText = if getFFlagDebugAppChatModule() then var31.conversation.id else var31.conversation.lastMessageContent,
			subTitleTimestamp = var46,
			onActivated = var54,
			style = var38,
			boldTitle = var37,
			onSquadJoinButtonActivated = var31.onSquadJoinButtonActivated,
			paddingLeft = var41.left,
			paddingRight = var41.right,
			testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingConversationEntry(conversation.title) else nil
		}, cryoModule.Dictionary.join(children, {
			timeStamp = if var59 or fFlagAppChatTimestampInSubtitleModule then nil else reactModule.createElement(conversationRelativeTimestampModule, { timestampText = var44, hasUnreadMessages = var36 }),
			unreadDot = if fFlagAppChatTimestampInSubtitleModule and not var59 and var36 then reactModule.createElement(foundationModule.View, { tag = "size-200-200 radius-circle bg-action-emphasis" }) else nil,
			squadButton = var59
		}))
	})
end)