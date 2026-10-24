local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = require(BuildExperience.Components.ModelPicker.ModelPickerTypes)
local FFlagBuildExperienceModelPickerModule = require(BuildExperience.Flags.FFlagBuildExperienceModelPicker)
local FFlagBuildExperienceLibrary = require(Parent.SharedFlags).FFlagBuildExperienceLibrary
local FoundationModule = require(Parent.Foundation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactFocusNavigation)
local ReactUtilsModule = require(Parent.ReactUtils)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local BuildEmptyStateModule = require(BuildExperience.Components.BuildEmptyState.BuildEmptyState)
local BuildPillMenuPortalModule = require(BuildExperience.Components.BuildPillMenu.BuildPillMenuPortal)
local BuyMoreRobuxCardModule = require(BuildExperience.Components.Chat.BuyMoreRobuxCard)
local _ = require(script.Parent.useChatSheetFundingRecovery)
local BuildPillMenuPageHostModule = require(BuildExperience.Components.BuildPillMenu.BuildPillMenuPageHost)
local ChatActionsModule = require(BuildExperience.Components.Chat.ChatActions)
local ChatCardEmphasisProviderModule = require(BuildExperience.Components.Chat.ChatCardEmphasis.ChatCardEmphasisProvider)
local ChatMessageListModule = require(BuildExperience.Components.Chat.ChatMessageList)
local ChatPermissionsContextModule = require(BuildExperience.Chat.ChatPermissionsContext)
local ChatScrollAnchorContextModule = require(BuildExperience.Chat.ChatScrollAnchorContext)
local _ = require(BuildExperience.Chat.chatTypes)
local ChatConstantsModule = require(BuildExperience.Chat.chatConstants)
local FFlagBuildExperienceAnswerFormModule = require(BuildExperience.Flags.FFlagBuildExperienceAnswerForm)
local AnswerFormContainerModule = if FFlagBuildExperienceAnswerFormModule then require(BuildExperience.Components.AnswerForm.AnswerFormContainer) else nil
local _ = require(BuildExperience.Chat.useChatSessionCore)
local FFlagBuildExperienceMonetizationNativeUIModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local FFlagBuildExperienceChatCardEmphasisModule = require(BuildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)
local FFlagBuildExperienceInGameShell = require(Parent.SharedFlags).FFlagBuildExperienceInGameShell
local FFlagBuildExperienceChatAccordionScrollAnchorModule = require(BuildExperience.Flags.FFlagBuildExperienceChatAccordionScrollAnchor)
local FFlagBuildExperienceChatSheetReversedContentModule = require(BuildExperience.Flags.FFlagBuildExperienceChatSheetReversedContent)
local FFlagBuildExperienceChatImageAttachmentsModule = require(BuildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local FFlagBuildCheckGamePermissionsModule = require(BuildExperience.Flags.FFlagBuildCheckGamePermissions)
local _ = require(BuildExperience.useGamePermissions)
local FFlagBuildExperienceChatResourceAttachments = require(Parent.SharedFlags).FFlagBuildExperienceChatResourceAttachments
local Sheet = if require(BuildExperience.Flags.FFlagBuildExperienceUseFoundationSheet) then FoundationModule.Sheet else require(BuildExperience.FoundationFork.Sheet)
local UseScrollPerformanceTrackerModule = require(BuildExperience.Telemetry.useScrollPerformanceTracker)
local DialogSize = FoundationModule.Enums.DialogSize
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local View = FoundationModule.View
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local UseTokensFunction = FoundationModule.Hooks.useTokens
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

local function ChatSheetContent(p1)
	-- upvalues: ReactModule (copy), FFlagBuildExperienceLibrary (copy), UseScrollPerformanceTrackerModule (copy), FFlagBuildExperienceChatSheetReversedContentModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local v1 = nil
	local Callback = nil
	
	if FFlagBuildExperienceLibrary then
		v1, Callback = ReactModule.useState(nil)
	end
	UseScrollPerformanceTrackerModule("LuaApp_Build_Chat_Scroll", UseRefResult)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), Callback (ref), p1 (copy)
		UseRefResult.current = Current
		
		if Callback ~= nil then
			Callback(Current)
		end
		p1.setScrollingFrame(Current)
	end, { p1.setScrollingFrame, Callback })
	
	if FFlagBuildExperienceLibrary then
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), v1 (ref)
			if p1.onFramesChanged ~= nil then
				p1.onFramesChanged(p1.sheet, v1)
			end
		end, { p1.onFramesChanged, p1.sheet, v1 })
	end
	return ReactModule.createElement(p1.sheetComponent.Content, {
		isReversed = if FFlagBuildExperienceChatSheetReversedContentModule then true else nil,
		scrollingFrameRef = UseResult
	}, p1.children)
end

return function(p1)
	-- upvalues: FFlagBuildExperienceAnswerFormModule (copy), Sheet (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseTokensFunction (copy), ReactModule (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), ReactUtilsModule (copy), ChatMessageListModule (copy), BuildEmptyStateModule (copy), FFlagBuildExperienceModelPickerModule (copy), BuyMoreRobuxCardModule (copy), AnswerFormContainerModule (copy), ChatConstantsModule (copy), FFlagBuildExperienceChatAccordionScrollAnchorModule (copy), ChatScrollAnchorContextModule (copy), FFlagBuildCheckGamePermissionsModule (copy), ChatPermissionsContextModule (copy), View (copy), FFlagBuildExperienceLibrary (copy), ChatActionsModule (copy), FFlagBuildExperienceChatImageAttachmentsModule (copy), FFlagBuildExperienceChatResourceAttachments (copy), DialogSize (copy), ChatSheetContent (copy), BuildPillMenuPageHostModule (copy), FFlagBuildExperienceInGameShell (copy), BuildPillMenuPortalModule (copy), FFlagBuildExperienceChatCardEmphasisModule (copy), ChatCardEmphasisProviderModule (copy)
	local HasAnswerForm: boolean = FFlagBuildExperienceAnswerFormModule and p1.answerForm ~= nil
	local SheetComponent = p1.sheetComponent or Sheet
	local UseLocalizationResult = UseLocalizationFunction({
		composerPlaceholder = LocalizationStringsModule.CHAT_COMPOSER_PLACEHOLDER
	})
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseComposedRefResult = UseStateResult2
	
	if FFlagBuildExperienceMonetizationNativeUIModule then
		local OnCloseFunction = p1.onClose
		UseComposedRefResult = ReactUtilsModule.useComposedRef(UseStateResult2, (UseFocusRootFunction({
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
			eventMap = EventMap,
			eventHandlers = ReactModule.useMemo(function()
				-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), OnCloseFunction (copy)
				return {
					[FocusNavigationEventNameEnum.NavigateBack] = {
						handler = InputHandlersModule.onRelease(function(p2)
							-- upvalues: OnCloseFunction (upval)
							OnCloseFunction()
							p2:cancel()
						end)
					}
				}
			end, { OnCloseFunction }),
			isFocusable = p1.isOpen
		})))
	end
	local ChatMessageListModuleResult = ChatMessageListModule({
		messages = p1.messages,
		clockBinding = p1.clockBinding,
		localToolActions = p1.localToolActions,
		emptyState = if HasAnswerForm then nil else ReactModule.createElement(BuildEmptyStateModule),
		isHistoryLoading = p1.isHistoryLoading,
		onPlaytest = p1.onPlaytest,
		isPlaytestLoading = p1.isPlaytestLoading
	})
	local CreatorCreditRecovery = if FFlagBuildExperienceModelPickerModule then p1.creatorCreditRecovery else nil
	local Element = nil
	
	if CreatorCreditRecovery ~= nil and CreatorCreditRecovery.card.showBuyMoreRobuxCard then
		local Card = CreatorCreditRecovery.card
		Element = ReactModule.createElement(BuyMoreRobuxCardModule, {
			LayoutOrder = 1,
			title = Card.buyMoreRobuxCardTitle,
			description = Card.buyMoreRobuxCardDescription,
			primaryActionText = Card.buyMoreRobuxCardPrimaryActionText,
			onPrimaryAction = Card.onBuyMoreRobuxCardPrimaryAction,
			secondaryActionText = Card.buyMoreRobuxCardSecondaryActionText,
			onSecondaryAction = Card.onBuyMoreRobuxCardSecondaryAction
		})
	end
	if HasAnswerForm then
		ChatMessageListModuleResult.AnswerForm = ReactModule.createElement(AnswerFormContainerModule, {
			LayoutOrder = (#p1.messages + 2) * ChatConstantsModule.MESSAGE_LAYOUT_ORDER_STRIDE,
			state = p1.answerForm,
			actions = p1.localToolActions,
			onSubmitText = p1.onSubmitAnswerText,
			onStop = p1.onStop,
			errorText = p1.composerErrorText,
			isReadOnly = p1.isChatReadOnly
		})
	end
	if FFlagBuildExperienceChatAccordionScrollAnchorModule then
		ChatMessageListModuleResult = {
			ScrollAnchor = ReactModule.createElement(ChatScrollAnchorContextModule.Provider, { value = p1.anchorScrollToInstance }, ChatMessageListModuleResult)
		}
	end
	if FFlagBuildCheckGamePermissionsModule then
		ChatMessageListModuleResult = {
			Permissions = ReactModule.createElement(ChatPermissionsContextModule.Provider, { value = p1.chatPermissions }, ChatMessageListModuleResult)
		}
	end
	local Element1 = ReactModule.createElement(ChatActionsModule, {
		LayoutOrder = if Element == nil then nil else 2,
		modelPicker = if FFlagBuildExperienceModelPickerModule then p1.modelPicker else nil,
		composerText = p1.composerText,
		composerErrorText = p1.composerErrorText,
		onComposerChanged = p1.onComposerChanged,
		images = if FFlagBuildExperienceChatImageAttachmentsModule then p1.composerImages else nil,
		onImagesChanged = if FFlagBuildExperienceChatImageAttachmentsModule then p1.onComposerImagesChanged else nil,
		onRetryImage = if FFlagBuildExperienceChatImageAttachmentsModule then p1.onRetryComposerImage else nil,
		isSendBlocked = p1.isComposerSendBlocked,
		tracksExternalText = p1.tracksExternalComposerText,
		resourceAttachments = if FFlagBuildExperienceChatResourceAttachments then p1.composerResourceAttachments else nil,
		onRemoveResourceAttachment = if FFlagBuildExperienceChatResourceAttachments then p1.onRemoveComposerResourceAttachment else nil,
		onActivateResourceAttachment = p1.onActivateComposerResourceAttachment,
		placeholder = UseLocalizationResult.composerPlaceholder,
		textBoxRef = p1.textBoxRef,
		isAssistantResponding = p1.isAssistantResponding,
		canStopAssistantResponse = p1.canStopAssistantResponse,
		canSendWhileResponding = p1.canSendWhileResponding,
		allowsTypingWhileResponding = p1.allowsComposerTypingWhileResponding,
		isReadOnly = p1.isChatReadOnly,
		onSend = p1.onSend,
		onStop = p1.onStop
	})
	local Element2 = ReactModule.createElement(SheetComponent.Root, {
		ref = UseComposedRefResult,
		isOpen = p1.isOpen,
		snapPoints = p1.snapPoints,
		defaultSnapPointIndex = p1.defaultSnapPointIndex,
		onSnapPointChanged = p1.onSnapPointChanged,
		size = DialogSize.Large,
		onClose = p1.onClose
	}, {
		Content = ReactModule.createElement(ChatSheetContent, {
			setScrollingFrame = p1.scrollingFrameRef,
			sheetComponent = SheetComponent,
			sheet = UseStateResult,
			onFramesChanged = p1.onFramesChanged
		}, {
			MessageList = ReactModule.createElement(View, {
				testId = "ChatSheet.MessageList",
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, UseTokensResult.Size.Size_800)
				},
				padding = if FFlagBuildExperienceLibrary and p1.reservesHandleSpace == true then { top = UDim.new(0, UseTokensResult.Size.Size_600) } else nil,
				tag = {
					["size-full"] = #p1.messages == 0 and not HasAnswerForm,
					["size-full-0 auto-y"] = #p1.messages > 0 or HasAnswerForm
				}
			}, ChatMessageListModuleResult)
		}),
		Actions = if HasAnswerForm then nil else ReactModule.createElement(SheetComponent.Actions, nil, {
			Footer = if Element == nil then Element1 else ReactModule.createElement(View, { tag = "col gap-medium size-full-0 auto-y" }, { FundingRecovery = Element, Composer = Element1 })
		}),
		CreatorCreditPage = if CreatorCreditRecovery == nil or CreatorCreditRecovery.page == nil then nil else ReactModule.createElement(BuildPillMenuPageHostModule, CreatorCreditRecovery.page),
		TopBarPillMenu = if FFlagBuildExperienceInGameShell or p1.topBarPillMenuTarget == nil then nil else ReactModule.createElement(BuildPillMenuPortalModule, {
			testId = "build-pill-menu",
			sheet = UseStateResult,
			target = p1.topBarPillMenuTarget,
			onOpenChat = p1.onOpenChat
		})
	})
	
	return if FFlagBuildExperienceChatCardEmphasisModule then ReactModule.createElement(ChatCardEmphasisProviderModule, nil, Element2) else Element2
end