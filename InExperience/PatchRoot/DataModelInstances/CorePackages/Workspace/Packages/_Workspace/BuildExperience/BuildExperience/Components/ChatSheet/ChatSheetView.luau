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
local _ = require(buildExperience.Chat.useChatSessionCore)
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local fFlagBuildExperienceMonetizationNativeUIModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local fFlagBuildExperienceChatCardEmphasisModule = require(buildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)
local fFlagBuildExperienceInGameShell = require(parent.SharedFlags).FFlagBuildExperienceInGameShell
local fFlagBuildExperienceUseFoundationSheetModule = require(buildExperience.Flags.FFlagBuildExperienceUseFoundationSheet)
local fFlagBuildExperienceChatAccordionScrollAnchorModule = require(buildExperience.Flags.FFlagBuildExperienceChatAccordionScrollAnchor)
local fFlagBuildExperienceChatImageAttachmentsModule = require(buildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local fFlagBuildExperienceChatResourceAttachments = require(parent.SharedFlags).FFlagBuildExperienceChatResourceAttachments
local var1 = if fFlagBuildExperienceUseFoundationSheetModule then foundationModule.Sheet else require(buildExperience.FoundationFork.Sheet)
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

local function noopSheetRef(_) end

local function ChatSheetContent(p1)
	-- upvalues: reactModule (ref), fFlagBuildExperienceLibrary (ref), useScrollPerformanceTrackerModule (ref)
	local var2 = reactModule.useRef(nil)
	local var3 = nil
	local var4 = nil
	
	if fFlagBuildExperienceLibrary then
		local var5, var6 = reactModule.useState(nil)
		var3 = var5
		var4 = var6
	end
	useScrollPerformanceTrackerModule("LuaApp_Build_Chat_Scroll", var2)
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), var4 (write), p1 (ref)
		var2.current = p2
		
		if var4 ~= nil then
			var4(p2)
		end
		p1.setScrollingFrame(p2)
	end, { p1.setScrollingFrame, var4 })
	
	if fFlagBuildExperienceLibrary then
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var3 (write)
			if p1.onFramesChanged ~= nil then
				p1.onFramesChanged(p1.sheet, var3)
			end
		end, { p1.onFramesChanged, p1.sheet, var3 })
	end
	return reactModule.createElement(p1.sheetComponent.Content, { scrollingFrameRef = var7 }, p1.children)
end

return function(p1)
	-- upvalues: var1 (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), fFlagBuildDesktopReadinessModule (ref), fFlagBuildExperienceLibrary (ref), reactModule (ref), fFlagBuildExperienceMonetizationNativeUIModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref), reactUtilsModule (ref), noopSheetRef (ref), chatMessageListModule (ref), buildEmptyStateModule (ref), fFlagBuildExperienceChatAccordionScrollAnchorModule (ref), chatScrollAnchorContextModule (ref), view (ref), dialogSize (ref), ChatSheetContent (ref), chatActionsModule (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), fFlagBuildExperienceChatResourceAttachments (ref), fFlagBuildExperienceInGameShell (ref), buildPillMenuPortalModule (ref), fFlagBuildExperienceChatCardEmphasisModule (ref), chatCardEmphasisProviderModule (ref)
	local sheetComponent = p1.sheetComponent or var1
	local var2 = useLocalization({
		composerPlaceholder = localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER
	})
	local var3 = useTokens()
	local var4 = nil
	local var5 = nil
	
	if fFlagBuildDesktopReadinessModule or fFlagBuildExperienceLibrary then
		local var6, var7 = reactModule.useState(nil)
		var4 = var6
		var5 = var7
	end
	local var8 = var5
	
	if fFlagBuildExperienceMonetizationNativeUIModule then
		local onClose = p1.onClose
		var8 = reactUtilsModule.useComposedRef(var5 or noopSheetRef, useFocusRoot({
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
		emptyState = reactModule.createElement(buildEmptyStateModule),
		isHistoryLoading = p1.isHistoryLoading,
		onPlaytest = p1.onPlaytest,
		isPlaytestLoading = p1.isPlaytestLoading
	})
	
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
			Padding = UDim.new(0, var3.Size.Size_800)
		},
		padding = if fFlagBuildExperienceLibrary and p1.reservesHandleSpace == true then { top = UDim.new(0, var3.Size.Size_600) } else nil,
		tag = {
			["size-full"] = #p1.messages == 0,
			["size-full-0 auto-y"] = #p1.messages > 0
		}
	}, var9)
	local createElement_1 = reactModule.createElement
	createElement_1 = createElement_1(sheetComponent.Root, {
		ref = var8,
		isOpen = p1.isOpen,
		snapPoints = p1.snapPoints,
		defaultSnapPointIndex = p1.defaultSnapPointIndex,
		size = if fFlagBuildDesktopReadinessModule then dialogSize.Large else nil,
		onClose = p1.onClose
	}, {
		Content = reactModule.createElement(ChatSheetContent, {
			setScrollingFrame = p1.scrollingFrameRef,
			sheetComponent = sheetComponent,
			sheet = var4,
			onFramesChanged = p1.onFramesChanged
		}, { MessageList = createElement }),
		Actions = reactModule.createElement(sheetComponent.Actions, nil, {
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
				placeholder = var2.composerPlaceholder,
				textBoxRef = p1.textBoxRef,
				isAssistantResponding = p1.isAssistantResponding,
				canStopAssistantResponse = p1.canStopAssistantResponse,
				canSendWhileResponding = p1.canSendWhileResponding,
				allowsTypingWhileResponding = p1.allowsComposerTypingWhileResponding,
				onSend = p1.onSend,
				onStop = p1.onStop
			})
		}),
		TopBarPillMenu = if fFlagBuildExperienceInGameShell or p1.topBarPillMenuTarget == nil then nil else reactModule.createElement(buildPillMenuPortalModule, {
			testId = "build-pill-menu",
			sheet = var4,
			target = p1.topBarPillMenuTarget,
			onOpenChat = p1.onOpenChat
		})
	})
	
	return if fFlagBuildExperienceChatCardEmphasisModule then reactModule.createElement(chatCardEmphasisProviderModule, nil, createElement_1) else createElement_1
end