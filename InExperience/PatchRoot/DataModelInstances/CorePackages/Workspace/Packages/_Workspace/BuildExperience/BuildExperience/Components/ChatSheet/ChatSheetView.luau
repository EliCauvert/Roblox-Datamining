local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local fFlagBuildExperienceLibrary = require(parent.SharedFlags).FFlagBuildExperienceLibrary
local foundationModule = require(parent.Foundation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local _ = require(parent.ReactFocusNavigation)
local reactUtilsModule = require(parent.ReactUtils)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local buildEmptyStateModule = require(buildExperience.Components.BuildEmptyState.BuildEmptyState)
local buildPillMenuPortalModule = require(buildExperience.Components.BuildPillMenu.BuildPillMenuPortal)
local chatActionsModule = require(buildExperience.Components.Chat.ChatActions)
local chatCardEmphasisProviderModule = require(buildExperience.Components.Chat.ChatCardEmphasis.ChatCardEmphasisProvider)
local chatMessageListModule = require(buildExperience.Components.Chat.ChatMessageList)
local chatScrollAnchorContextModule = require(buildExperience.Chat.ChatScrollAnchorContext)
local _ = require(buildExperience.Chat.chatTypes)
local chatConstantsModule = require(buildExperience.Chat.chatConstants)
local fFlagBuildExperienceAnswerFormModule = require(buildExperience.Flags.FFlagBuildExperienceAnswerForm)
local var1 = if fFlagBuildExperienceAnswerFormModule then require(buildExperience.Components.AnswerForm.AnswerFormContainer) else nil
local _ = require(buildExperience.Chat.useChatSessionCore)
local fFlagBuildExperienceMonetizationNativeUIModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local fFlagBuildExperienceChatCardEmphasisModule = require(buildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)
local fFlagBuildExperienceInGameShell = require(parent.SharedFlags).FFlagBuildExperienceInGameShell
local fFlagBuildExperienceUseFoundationSheetModule = require(buildExperience.Flags.FFlagBuildExperienceUseFoundationSheet)
local fFlagBuildExperienceChatAccordionScrollAnchorModule = require(buildExperience.Flags.FFlagBuildExperienceChatAccordionScrollAnchor)
local fFlagBuildExperienceChatSheetReversedContentModule = require(buildExperience.Flags.FFlagBuildExperienceChatSheetReversedContent)
local fFlagBuildExperienceChatImageAttachmentsModule = require(buildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local fFlagBuildExperienceChatResourceAttachments = require(parent.SharedFlags).FFlagBuildExperienceChatResourceAttachments
local var2 = if fFlagBuildExperienceUseFoundationSheetModule then foundationModule.Sheet else require(buildExperience.FoundationFork.Sheet)
local useScrollPerformanceTrackerModule = require(buildExperience.Telemetry.useScrollPerformanceTracker)
local dialogSize = foundationModule.Enums.DialogSize
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local view = foundationModule.View
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local useTokens = foundationModule.Hooks.useTokens
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

local function ChatSheetContent(p1)
	-- upvalues: reactModule (ref), fFlagBuildExperienceLibrary (ref), useScrollPerformanceTrackerModule (ref), fFlagBuildExperienceChatSheetReversedContentModule (ref)
	local var3 = reactModule.useRef(nil)
	local var4 = nil
	local var5 = nil
	
	if fFlagBuildExperienceLibrary then
		local var6, var7 = reactModule.useState(nil)
		var4 = var6
		var5 = var7
	end
	useScrollPerformanceTrackerModule("LuaApp_Build_Chat_Scroll", var3)
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), var5 (write), p1 (ref)
		var3.current = p2
		
		if var5 ~= nil then
			var5(p2)
		end
		p1.setScrollingFrame(p2)
	end, { p1.setScrollingFrame, var5 })
	
	if fFlagBuildExperienceLibrary then
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var4 (write)
			if p1.onFramesChanged ~= nil then
				p1.onFramesChanged(p1.sheet, var4)
			end
		end, { p1.onFramesChanged, p1.sheet, var4 })
	end
	return reactModule.createElement(p1.sheetComponent.Content, {
		isReversed = if fFlagBuildExperienceChatSheetReversedContentModule then true else nil,
		scrollingFrameRef = var8
	}, p1.children)
end

return function(p1)
	-- upvalues: fFlagBuildExperienceAnswerFormModule (ref), var2 (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), reactModule (ref), fFlagBuildExperienceMonetizationNativeUIModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref), reactUtilsModule (ref), chatMessageListModule (ref), buildEmptyStateModule (ref), var1 (ref), chatConstantsModule (ref), fFlagBuildExperienceChatAccordionScrollAnchorModule (ref), chatScrollAnchorContextModule (ref), view (ref), fFlagBuildExperienceLibrary (ref), dialogSize (ref), ChatSheetContent (ref), chatActionsModule (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), fFlagBuildExperienceChatResourceAttachments (ref), fFlagBuildExperienceInGameShell (ref), buildPillMenuPortalModule (ref), fFlagBuildExperienceChatCardEmphasisModule (ref), chatCardEmphasisProviderModule (ref)
	local var3 = fFlagBuildExperienceAnswerFormModule and p1.answerForm ~= nil
	local sheetComponent = p1.sheetComponent or var2
	local var4 = useLocalization({
		composerPlaceholder = localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER
	})
	local var5 = useTokens()
	local var6, var7 = reactModule.useState(nil)
	local var8 = var7
	
	if fFlagBuildExperienceMonetizationNativeUIModule then
		local onClose = p1.onClose
		var8 = reactUtilsModule.useComposedRef(var7, useFocusRoot({
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
			eventMap = t,
			eventHandlers = reactModule.useMemo(function()
				-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), onClose (ref)
				return {
					[focusNavigationEventNameEnum.NavigateBack] = {
						handler = inputHandlersModule.onRelease(function(p2)
							-- upvalues: onClose (copy)
							onClose()
							p2:cancel()
						end)
					}
				}
			end, { onClose }),
			isFocusable = p1.isOpen
		}))
	end
	local var9 = chatMessageListModule({
		messages = p1.messages,
		clockBinding = p1.clockBinding,
		localToolActions = p1.localToolActions,
		emptyState = if not var3 then reactModule.createElement(buildEmptyStateModule) else nil,
		isHistoryLoading = p1.isHistoryLoading,
		onPlaytest = p1.onPlaytest,
		isPlaytestLoading = p1.isPlaytestLoading
	})
	
	if var3 then
		var9.AnswerForm = reactModule.createElement(var1, {
			LayoutOrder = (#p1.messages + 2) * chatConstantsModule.MESSAGE_LAYOUT_ORDER_STRIDE,
			state = p1.answerForm,
			actions = p1.localToolActions,
			onSubmitText = p1.onSubmitAnswerText,
			onStop = p1.onStop,
			errorText = p1.composerErrorText
		})
	end
	if fFlagBuildExperienceChatAccordionScrollAnchorModule then
		var9 = {
			ScrollAnchor = reactModule.createElement(chatScrollAnchorContextModule.Provider, { value = p1.anchorScrollToInstance }, var9)
		}
	end
	local createElement = reactModule.createElement
	createElement = createElement(view, {
		testId = "ChatSheet.MessageList",
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, var5.Size.Size_800)
		},
		padding = if fFlagBuildExperienceLibrary and p1.reservesHandleSpace == true then { top = UDim.new(0, var5.Size.Size_600) } else nil,
		tag = {
			["size-full"] = #p1.messages == 0 and not var3,
			["size-full-0 auto-y"] = if #p1.messages <= 0 then var3 else true
		}
	}, var9)
	local createElement_1 = reactModule.createElement
	createElement_1 = createElement_1(sheetComponent.Root, {
		ref = var8,
		isOpen = p1.isOpen,
		snapPoints = p1.snapPoints,
		defaultSnapPointIndex = p1.defaultSnapPointIndex,
		onSnapPointChanged = p1.onSnapPointChanged,
		size = dialogSize.Large,
		onClose = p1.onClose
	}, {
		Content = reactModule.createElement(ChatSheetContent, {
			setScrollingFrame = p1.scrollingFrameRef,
			sheetComponent = sheetComponent,
			sheet = var6,
			onFramesChanged = p1.onFramesChanged
		}, { MessageList = createElement }),
		Actions = if not var3 then reactModule.createElement(sheetComponent.Actions, nil, {
			Footer = reactModule.createElement(chatActionsModule, {
				composerText = p1.composerText,
				composerErrorText = p1.composerErrorText,
				onComposerChanged = p1.onComposerChanged,
				images = if fFlagBuildExperienceChatImageAttachmentsModule then p1.composerImages else nil,
				onImagesChanged = if fFlagBuildExperienceChatImageAttachmentsModule then p1.onComposerImagesChanged else nil,
				onRetryImage = if fFlagBuildExperienceChatImageAttachmentsModule then p1.onRetryComposerImage else nil,
				isSendBlocked = p1.isComposerSendBlocked,
				tracksExternalText = p1.tracksExternalComposerText,
				resourceAttachments = if fFlagBuildExperienceChatResourceAttachments then p1.composerResourceAttachments else nil,
				onRemoveResourceAttachment = if fFlagBuildExperienceChatResourceAttachments then p1.onRemoveComposerResourceAttachment else nil,
				onActivateResourceAttachment = p1.onActivateComposerResourceAttachment,
				placeholder = var4.composerPlaceholder,
				textBoxRef = p1.textBoxRef,
				isAssistantResponding = p1.isAssistantResponding,
				canStopAssistantResponse = p1.canStopAssistantResponse,
				canSendWhileResponding = p1.canSendWhileResponding,
				allowsTypingWhileResponding = p1.allowsComposerTypingWhileResponding,
				onSend = p1.onSend,
				onStop = p1.onStop
			})
		}) else nil,
		TopBarPillMenu = if fFlagBuildExperienceInGameShell or p1.topBarPillMenuTarget == nil then nil else reactModule.createElement(buildPillMenuPortalModule, {
			testId = "build-pill-menu",
			sheet = var6,
			target = p1.topBarPillMenuTarget,
			onOpenChat = p1.onOpenChat
		})
	})
	
	return if fFlagBuildExperienceChatCardEmphasisModule then reactModule.createElement(chatCardEmphasisProviderModule, nil, createElement_1) else createElement_1
end