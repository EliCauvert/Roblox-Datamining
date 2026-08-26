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
	onSquadJoinButtonActivated = function() end
}

return memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useTokens (ref), useTextSizeOffset (ref), useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), useIsUserPendingModule (ref), getBoldTextThemeModule (ref), useDispatch (ref), useChatPlacementContext (ref), useChatPagePaddingModule (ref), useRelativeTimestampBindingModule (ref), useMemo (ref), text (ref), fFlagAppChatTimestampInSubtitleModule (ref), reactModule (ref), useNavigation (ref), getOverlayStoreModule (ref), enumScreensModule (ref), overlayTypesModule (ref), conversationModule (ref), removedConversationModule (ref), shouldShowU13ChatOptInForConversationModule (ref), constantsModule (ref), shouldShowOSAForConversationModule (ref), httpService (ref), fFlagAppChatSquadJoinButtonU13OSAModule (ref), reactFocusNavigationModule (ref), useCanAccessPartyModule (ref), squadComponentAccessWrapperModule (ref), squadJoinButtonModule (ref), squadButtonSourceEnum (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), conversationCell (ref), getFFlagDebugAppChatModule (ref), conversationRelativeTimestampModule (ref), foundationModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useStyle()
	local var3 = useTokens()
	local var4 = useTextSizeOffset()
	local var5 = useTelemetryModule(chatLandingTelemetryLayerModule.Context)
	local conversation = var1.conversation
	local hasGroupUp = conversation.hasGroupUp
	local var6 = conversation.hasUnreadMessages and not useIsUserPendingModule(conversation)
	local var7 = var6 and not var6
	local var8 = if var7 then getBoldTextThemeModule(var2) else var2
	local var9 = useDispatch()
	local var10 = useChatPlacementContext()
	local var11 = useChatPagePaddingModule()
	local captionSubHeader = var8.Font.CaptionSubHeader
	local var12 = var8.Font.BaseSize * captionSubHeader.RelativeSize
	local shortRelativeTime = var1.conversation.shortRelativeTime or ""
	local var13 = useRelativeTimestampBindingModule(var1.conversation.unixTime)
	local var14 = useMemo(function()
		-- upvalues: text (copy), shortRelativeTime (ref), captionSubHeader (ref), var12 (ref)
		return text.GetTextWidth(shortRelativeTime, captionSubHeader.Font, var12)
	end, { shortRelativeTime, captionSubHeader.Font, var12, var4 })
	local var15 = if fFlagAppChatTimestampInSubtitleModule then var13 else nil
	local var16 = reactModule.useRef(nil)
	local var17 = useNavigation()
	local wideMode = false
	
	if var17.getScreenProps then
		wideMode = var17.getScreenProps("wideMode", wideMode)
	end
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		var1.fireImpressionEvent(var1.conversation)
	end, {})
	local var18 = nil
	local _ = nil
	local var19 = getOverlayStoreModule(false)
	local var20 = reactModule.useCallback(function(p2)
		-- upvalues: var17 (ref), enumScreensModule (copy)
		var17.navigate(enumScreensModule.ChatConversation, { isNavigatedFromGroupOSAJoin = true, conversationId = p2 })
	end, { var17 })
	local var21 = reactModule.useCallback(function(p2, p3, p4, p5, p6)
		-- upvalues: var19 (ref), overlayTypesModule (copy), var20 (ref), conversationModule (copy), var9 (ref), removedConversationModule (copy)
		var19.showOverlay(overlayTypesModule.GroupOSADialog, {
			conversationId = p2,
			impressionId = p3,
			modalVariant = p4,
			onJoin = function()
				-- upvalues: var19 (copy), p6 (ref), p2 (ref), var20 (copy)
				var19.dismissOverlay()
				
				if p6 then
					p6(p2)
					
					return
				end
				var20(p2)
			end,
			onDecline = function()
				-- upvalues: p2 (ref), p5 (ref), conversationModule (copy), var9 (copy), removedConversationModule (copy), var19 (copy)
				if p2 and p5 == conversationModule.Type.MULTI_USER_CONVERSATION then
					var9(removedConversationModule(p2))
				end
				var19.dismissOverlay()
			end
		})
	end, { var20, var9 })
	local var22 = reactModule.useCallback(function(p2)
		-- upvalues: shouldShowU13ChatOptInForConversationModule (copy), constantsModule (copy), shouldShowOSAForConversationModule (copy), httpService (copy), var21 (write), var1 (ref), var5 (ref)
		local var23 = nil
		local osaContextCard = nil
		
		if shouldShowU13ChatOptInForConversationModule(p2) then
			osaContextCard = constantsModule.OptInVariant.ChatOptInInfoCard
		elseif shouldShowOSAForConversationModule(p2) then
			osaContextCard = constantsModule.OptInVariant.OsaContextCard
		end
		if osaContextCard then
			var23 = httpService:GenerateGUID(false)
			var21(p2.id, var23, osaContextCard, p2.conversationType)
		elseif var1.onActivated then
			var1.onActivated(p2)
		end
		var1.fireClickEvent(p2, var5, var23)
	end, { var21, var1.onActivated, var1.fireClickEvent, var5 })
	local _ = nil
	local onSquadJoinButtonActivated = var1.onSquadJoinButtonActivated
	local var23 = reactModule.useCallback(function(p2)
		-- upvalues: shouldShowOSAForConversationModule (copy), conversation (ref), constantsModule (copy), fFlagAppChatSquadJoinButtonU13OSAModule (copy), shouldShowU13ChatOptInForConversationModule (copy), conversationModule (copy), var21 (write), httpService (copy), onSquadJoinButtonActivated (ref)
		local chatOptInInfoCard = nil
		
		if shouldShowOSAForConversationModule(conversation) then
			chatOptInInfoCard = constantsModule.OptInVariant.OsaContextCard
		elseif fFlagAppChatSquadJoinButtonU13OSAModule and shouldShowU13ChatOptInForConversationModule(conversation) and conversation.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION then
			chatOptInInfoCard = constantsModule.OptInVariant.ChatOptInInfoCard
		end
		if chatOptInInfoCard and var21 then
			var21(p2, httpService:GenerateGUID(false), chatOptInInfoCard, conversation.conversationType, onSquadJoinButtonActivated)
			
			return
		elseif onSquadJoinButtonActivated then
			onSquadJoinButtonActivated(p2)
		end
	end, { var21, conversation, onSquadJoinButtonActivated })
	local var24 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	reactModule.useEffect(function()
		-- upvalues: wideMode (write), var22 (ref), var24 (ref), var16 (ref), conversation (ref)
		if wideMode and var22 and var24 then
			local var25 = var24.focusedGuiObject:subscribe(function(p2)
				-- upvalues: var16 (copy), var22 (copy), conversation (copy)
				if var16.current and p2 == var16.current.cell then
					var22(conversation)
				end
			end)
			
			return function()
				-- upvalues: var25 (ref)
				var25:unsubscribe()
			end
		end
		return function() end
	end, { var22, wideMode, var24 })
	local children = var1.children or {}
	local size1900 = var3.Size.Size_1900
	local _ = nil
	local var25 = useCanAccessPartyModule()
	local right = var11.right
	local var26 = if var25 and hasGroupUp and conversation.id then reactModule.createElement(squadComponentAccessWrapperModule, { parentChannelId = conversation.id }, {
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
				onActivated = var23,
				squadLocation = var10.chatPlacement,
				squadButtonSource = squadButtonSourceEnum.ConversationEntry,
				testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingConversationEntrySquadButton(conversation.title) else nil
			})
		})
	}) else nil
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var1.entryHeight),
		ref = var16
	}, {
		cell = reactModule.createElement(conversationCell, {
			hideLeftAvatarPadding = true,
			Size = UDim2.new(1, 0, 0, var1.entryHeight),
			conversation = var1.conversation,
			childWidth = if var25 and hasGroupUp then right + size1900 elseif fFlagAppChatTimestampInSubtitleModule then if var6 then var3.Gap.Medium + var3.Size.Size_200 else 0 else var14 + (if var6 then var3.Size.Size_200 + var3.Gap.XSmall else 0) + right,
			subTitleText = if getFFlagDebugAppChatModule() then var1.conversation.id else var1.conversation.lastMessageContent,
			subTitleTimestamp = var15,
			onActivated = var22,
			style = var8,
			boldTitle = var7,
			onSquadJoinButtonActivated = var1.onSquadJoinButtonActivated,
			paddingLeft = var11.left,
			paddingRight = var11.right,
			testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingConversationEntry(conversation.title) else nil
		}, cryoModule.Dictionary.join(children, {
			timeStamp = if var26 or fFlagAppChatTimestampInSubtitleModule then nil else reactModule.createElement(conversationRelativeTimestampModule, { timestampText = var13, hasUnreadMessages = var6 }),
			unreadDot = if fFlagAppChatTimestampInSubtitleModule and not var26 and var6 then reactModule.createElement(foundationModule.View, { tag = "size-200-200 radius-circle bg-action-emphasis" }) else nil,
			squadButton = var26
		}))
	})
end)