local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = require(BuildExperience.Components.ModelPicker.ModelPickerTypes)
local FFlagBuildExperienceModelPickerModule = require(BuildExperience.Flags.FFlagBuildExperienceModelPicker)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildAdUpsellModule = require(BuildExperience.Flags.FFlagBuildAdUpsell)
local FFlagBuildAdUpsellPinnedModule = require(BuildExperience.Flags.FFlagBuildAdUpsellPinned)
local FFlagBuildAdsManagerUniverseUrlModule = require(BuildExperience.Flags.FFlagBuildAdsManagerUniverseUrl)
local FFlagBuildAgentAdCampaignCardModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local ChatConstantsModule = require(BuildExperience.Chat.chatConstants)
local ChatPermissionsContextModule = require(BuildExperience.Chat.ChatPermissionsContext)
local ChatScrollAnchorContextModule = require(BuildExperience.Chat.ChatScrollAnchorContext)
local _ = require(BuildExperience.Chat.chatTypes)
local ChatCardEmphasisPositionProviderModule = require(BuildExperience.Components.Chat.ChatCardEmphasis.ChatCardEmphasisPositionProvider)
local FFlagBuildExperienceChatCardEmphasisModule = require(BuildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)
local BuildEmptyStateModule = require(BuildExperience.Components.BuildEmptyState.BuildEmptyState)
local IsEnabled = require(Parent.DataHydration.CreatorAgentChat).experimentOverride.isEnabled()
local AgentSpecDebugSheetModule = if IsEnabled then require(BuildExperience.Components.AgentSpecDebug.AgentSpecDebugSheet) else nil
local BuildOverflowMenuButtonModule = require(BuildExperience.Components.BuildPillMenu.BuildOverflowMenuButton)
local PlayButtonModule = require(BuildExperience.Components.PlayButton.PlayButton)
local BuyMoreRobuxCardModule = require(BuildExperience.Components.Chat.BuyMoreRobuxCard)
local ChatActionsModule = require(BuildExperience.Components.Chat.ChatActions)
local ChatMessageListModule = require(BuildExperience.Components.Chat.ChatMessageList)
local FFlagBuildExperienceAnswerFormModule = require(BuildExperience.Flags.FFlagBuildExperienceAnswerForm)
local AnswerFormContainerModule = if FFlagBuildExperienceAnswerFormModule then require(BuildExperience.Components.AnswerForm.AnswerFormContainer) else nil
local PushNotificationsUpsellCardModule = require(BuildExperience.Components.Chat.PushNotificationsUpsellCard)
local AdUpsellMilestoneContainerModule = if FFlagBuildAdUpsellModule then require(BuildExperience.Components.Ads.AdUpsellMilestone.AdUpsellMilestoneContainer) else nil
local CreateAdCampaignSheetContainerModule = if FFlagBuildAdUpsellModule then require(BuildExperience.Components.Ads.CreateAdCampaignSheet.CreateAdCampaignSheetContainer) else nil
local AdCampaignCreatedToastModule = if FFlagBuildAdUpsellModule then require(BuildExperience.Components.Ads.AdCampaignCreatedToast) else nil
local _ = require(BuildExperience.Stores.GetBuildOverflowMenuStore)
local _ = require(BuildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local FFlagBuildExperienceLibrary = require(Parent.SharedFlags).FFlagBuildExperienceLibrary
local _ = require(BuildExperience.Chat.useChatSessionCore)
local FFlagEnableBuildAdPromotionModule = require(BuildExperience.Flags.FFlagEnableBuildAdPromotion)
local FFlagBuildExperienceChatAccordionScrollAnchorModule = require(BuildExperience.Flags.FFlagBuildExperienceChatAccordionScrollAnchor)
local FFlagBuildExperienceChatImageAttachmentsModule = require(BuildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local FFlagBuildCheckGamePermissionsModule = require(BuildExperience.Flags.FFlagBuildCheckGamePermissions)
local _ = require(BuildExperience.useGamePermissions)
local FFlagBuildExperienceChatResourceAttachments = require(Parent.SharedFlags).FFlagBuildExperienceChatResourceAttachments
local UseScrollPerformanceTrackerModule = require(BuildExperience.Telemetry.useScrollPerformanceTracker)
local Divider = FoundationModule.Divider
local IconButton = FoundationModule.IconButton
local ScrollView = FoundationModule.ScrollView
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local InputSize = FoundationModule.Enums.InputSize
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function groupAdUpsellCardsByAnchorIndex(AdUpsellCards)
	local t = {}
	
	for _, adUpsellCard in AdUpsellCards do
		if adUpsellCard.anchorIndex ~= nil then
			local List = t[adUpsellCard.anchorIndex] or {}
			table.insert(List, adUpsellCard)
			t[adUpsellCard.anchorIndex] = List
		end
	end
	return t
end

local function renderAdUpsells(p1, Tbl, ScrollingFrameRef, CongratsText)
	-- upvalues: FFlagBuildAdUpsellModule (copy), FFlagBuildAdUpsellPinnedModule (copy), ReactModule (copy), Text (copy), ChatConstantsModule (copy), groupAdUpsellCardsByAnchorIndex (copy), AdUpsellMilestoneContainerModule (copy), FFlagBuildAgentAdCampaignCardModule (copy), FFlagBuildExperienceChatCardEmphasisModule (copy), ChatCardEmphasisPositionProviderModule (copy), View (copy)
	local Copy = table.clone(Tbl)
	
	if FFlagBuildAdUpsellModule and FFlagBuildAdUpsellPinnedModule and p1.adUpsellCongratsAnchorIndex ~= nil then
		Copy.AdUpsellCongrats = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
			testId = "AdUpsellCongrats",
			LayoutOrder = p1.adUpsellCongratsAnchorIndex * ChatConstantsModule.MESSAGE_LAYOUT_ORDER_STRIDE + 1,
			Text = CongratsText
		})
	end
	if FFlagBuildAdUpsellModule and not FFlagBuildAdUpsellPinnedModule then
		for i, value in groupAdUpsellCardsByAnchorIndex(p1.adUpsellCards) do
			local Elements1 = {}
			local List = {}
			
			for _, value1 in value do
				table.insert(List, value1.id)
				Elements1[value1.id] = ReactModule.createElement(AdUpsellMilestoneContainerModule, {
					anchorId = value1.id,
					order = value1.order,
					isImpressed = value1.isImpressed,
					congratsText = CongratsText,
					freePromotionsRemaining = if FFlagBuildAgentAdCampaignCardModule then p1.adUpsellFreePromotionsRemaining else nil,
					isCreatePending = p1.isAdUpsellCreatePending,
					isCreateDisabled = p1.isAdUpsellCreateDisabled,
					isPageVisible = p1.isAdUpsellVisible,
					onCreate = p1.onAdUpsellCreate,
					onDismiss = p1.onAdUpsellDismiss,
					onImpression = p1.onAdUpsellImpression,
					scrollingFrameRef = ScrollingFrameRef
				})
				
				if FFlagBuildExperienceChatCardEmphasisModule then
					Elements1[value1.id] = ReactModule.createElement(ChatCardEmphasisPositionProviderModule, {
						messageOrder = i * ChatConstantsModule.MESSAGE_LAYOUT_ORDER_STRIDE + 1,
						segmentOrder = value1.order
					}, Elements1[value1.id])
				end
			end
			Copy[`AdUpsellGroup:{table.concat(List, "|")}`] = ReactModule.createElement(View, {
				tag = "col gap-medium size-full-0 auto-y",
				LayoutOrder = i * ChatConstantsModule.MESSAGE_LAYOUT_ORDER_STRIDE + 1,
				testId = `AdUpsellGroup.{i}`
			}, Elements1)
		end
	end
	local Elements = {}
	
	if FFlagBuildAdUpsellModule and FFlagBuildAdUpsellPinnedModule then
		for _, adUpsellCard in p1.adUpsellCards do
			Elements[adUpsellCard.id] = ReactModule.createElement(AdUpsellMilestoneContainerModule, {
				anchorId = adUpsellCard.id,
				order = adUpsellCard.order,
				isImpressed = adUpsellCard.isImpressed,
				freePromotionsRemaining = if FFlagBuildAgentAdCampaignCardModule then p1.adUpsellFreePromotionsRemaining else nil,
				isCreatePending = p1.isAdUpsellCreatePending,
				isCreateDisabled = p1.isAdUpsellCreateDisabled,
				isPageVisible = p1.isAdUpsellVisible,
				onCreate = p1.onAdUpsellCreate,
				onDismiss = p1.onAdUpsellDismiss,
				onImpression = p1.onAdUpsellImpression
			})
		end
	end
	return Copy, Elements
end

return function(p2)
	-- upvalues: FFlagBuildExperienceAnswerFormModule (copy), IsEnabled (copy), ReactModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagBuildAdUpsellModule (copy), UseTokensFunction (copy), UseScrollPerformanceTrackerModule (copy), ChatMessageListModule (copy), BuildEmptyStateModule (copy), FFlagBuildAgentAdCampaignCardModule (copy), ChatConstantsModule (copy), PushNotificationsUpsellCardModule (copy), renderAdUpsells (copy), AnswerFormContainerModule (copy), FFlagBuildExperienceChatAccordionScrollAnchorModule (copy), ChatScrollAnchorContextModule (copy), FFlagBuildCheckGamePermissionsModule (copy), ChatPermissionsContextModule (copy), View (copy), FFlagBuildAdUpsellPinnedModule (copy), BuyMoreRobuxCardModule (copy), ChatActionsModule (copy), FFlagBuildExperienceModelPickerModule (copy), FFlagBuildExperienceChatImageAttachmentsModule (copy), FFlagBuildExperienceChatResourceAttachments (copy), FFlagBuildExperienceLibrary (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), Text (copy), PlayButtonModule (copy), IconVariant (copy), BuildOverflowMenuButtonModule (copy), FFlagEnableBuildAdPromotionModule (copy), Divider (copy), ScrollView (copy), AgentSpecDebugSheetModule (copy), CreateAdCampaignSheetContainerModule (copy), FFlagBuildAdsManagerUniverseUrlModule (copy), AdCampaignCreatedToastModule (copy)
	local HasAnswerForm: boolean = FFlagBuildExperienceAnswerFormModule and p2.answerForm ~= nil
	local v1 = false
	local Callback = nil
	
	if IsEnabled then
		v1, Callback = ReactModule.useState(false)
	end
	local UseLocalizationResult = UseLocalizationFunction({
		composerPlaceholder = LocalizationStringsModule.CHAT_COMPOSER_PLACEHOLDER,
		adUpsellCongrats = if FFlagBuildAdUpsellModule then if p2.adUpsellFreePromotionsRemaining == 1 then LocalizationStringsModule.AD_UPSELL_CONGRATS_SINGULAR else {
			LocalizationStringsModule.AD_UPSELL_CONGRATS,
			promotionCount = p2.adUpsellFreePromotionsRemaining
		} else nil,
		adCampaignCreated = if FFlagBuildAdUpsellModule then LocalizationStringsModule.ADS_STATS_CREATE_SUCCESS else nil,
		adCampaignCreatedView = if FFlagBuildAdUpsellModule then LocalizationStringsModule.AD_CAMPAIGN_CARD_VIEW else nil
	})
	local UseTokensResult = UseTokensFunction()
	local UseRefResult = ReactModule.useRef(nil)
	UseScrollPerformanceTrackerModule("LuaApp_Build_Chat_Scroll", UseRefResult)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), p2 (copy)
		UseRefResult.current = Current
		p2.scrollingFrameRef(Current)
	end, { p2.scrollingFrameRef })
	local ChatMessageListModuleResult = ChatMessageListModule({
		isPageVisible = p2.isAdUpsellVisible,
		scrollingFrameRef = UseRefResult,
		isAgentAdCampaignCreateDisabled = p2.isAgentAdCampaignCreateDisabled,
		messages = p2.messages,
		clockBinding = p2.clockBinding,
		localToolActions = p2.localToolActions,
		emptyState = if HasAnswerForm then nil else ReactModule.createElement(BuildEmptyStateModule),
		isHistoryLoading = p2.isHistoryLoading,
		onPlaytest = p2.onPlaytest,
		onPublish = p2.onPublish,
		isPlaytestLoading = p2.isPlaytestLoading,
		onAgentAdCampaignOfferSelected = if FFlagBuildAgentAdCampaignCardModule then p2.onAgentAdCampaignOfferSelected else nil,
		getAgentAdCampaignCardState = if FFlagBuildAgentAdCampaignCardModule then p2.getAgentAdCampaignCardState else nil,
		onAgentAdCampaignActive = if FFlagBuildAgentAdCampaignCardModule then p2.onAgentAdCampaignActive else nil
	})
	local Flag = false
	
	for _, message in p2.messages do
		if message.kind == "user_message" then
			Flag = true
			break
		end
	end
	local MESSAGELAYOUTORDERSTRIDE = ChatConstantsModule.MESSAGE_LAYOUT_ORDER_STRIDE
	
	if p2.showPushNotificationsUpsell and Flag and p2.isAssistantResponding then
		ChatMessageListModuleResult.PushNotificationsUpsell = ReactModule.createElement(PushNotificationsUpsellCardModule, {
			LayoutOrder = (#p2.messages + 1) * MESSAGELAYOUTORDERSTRIDE,
			isRequestPending = p2.isPushNotificationsRequestPending,
			shouldOpenSettings = p2.shouldOpenPushNotificationsSettings,
			onNotifyMe = p2.onNotifyMe,
			onOpenSettings = p2.onOpenPushNotificationsSettings,
			onNotNow = p2.onNotNow
		})
	end
	local RenderAdUpsellsResult, RenderAdUpsellsResult2 = renderAdUpsells(p2, ChatMessageListModuleResult, UseRefResult, UseLocalizationResult.adUpsellCongrats)
	
	if HasAnswerForm then
		RenderAdUpsellsResult.AnswerForm = ReactModule.createElement(AnswerFormContainerModule, {
			LayoutOrder = (#p2.messages + 2) * ChatConstantsModule.MESSAGE_LAYOUT_ORDER_STRIDE,
			state = p2.answerForm,
			actions = p2.localToolActions,
			onSubmitText = p2.onSubmitAnswerText,
			onStop = p2.onStop,
			errorText = p2.composerErrorText,
			isReadOnly = p2.isChatReadOnly
		})
	end
	if FFlagBuildExperienceChatAccordionScrollAnchorModule then
		RenderAdUpsellsResult = {
			ScrollAnchor = ReactModule.createElement(ChatScrollAnchorContextModule.Provider, { value = p2.anchorScrollToInstance }, RenderAdUpsellsResult)
		}
	end
	if FFlagBuildCheckGamePermissionsModule then
		RenderAdUpsellsResult = {
			Permissions = ReactModule.createElement(ChatPermissionsContextModule.Provider, { value = p2.chatPermissions }, RenderAdUpsellsResult)
		}
	end
	return ReactModule.createElement(View, {
		tag = "col align-x-center size-full bg-surface-0",
		onAbsolutePositionChanged = p2.onPageMetricsChanged,
		onAbsoluteSizeChanged = p2.onPageMetricsChanged,
		padding = { bottom = UDim.new(0, p2.paddingBottom) }
	}, {
		Header = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col align-x-center size-full-0 auto-y bg-surface-0"
		}, {
			HeaderBar = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "composition-content-header row align-y-center gap-small size-full-0 auto-y padding-y-medium",
				testId = "BuildChatPage.HeaderBar"
			}, {
				Library = if FFlagBuildExperienceLibrary then ReactModule.createElement(IconButton, {
					LayoutOrder = 5,
					isCircular = true,
					testId = "BuildChatPage.LibraryButton",
					icon = IconName.SquaresGridPlus,
					isDisabled = p2.isLibraryDisabled,
					onActivated = p2.onOpenLibrary,
					size = InputSize.Large,
					variant = ButtonVariant.Utility
				}) else nil,
				Back = ReactModule.createElement(IconButton, {
					LayoutOrder = 1,
					isCircular = true,
					testId = "BuildChatPage.BackButton",
					icon = IconName.ChevronLargeLeft,
					onActivated = p2.onClose,
					size = InputSize.Large
				}),
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "fill text-heading-small text-align-x-left text-truncate-split content-emphasis",
					Text = if p2.isNewGameTarget then ChatConstantsModule.BUILD_CHAT_PAGE_TITLE else p2.target.experienceName
				}),
				Play = ReactModule.createElement(PlayButtonModule, {
					LayoutOrder = 3,
					isActive = true,
					activeIcon = IconName.PlaySmall,
					inActiveIcon = IconName.PlaySmall,
					isDisabled = p2.isNewGameTarget and not p2.hasPublishedTurn,
					isUnavailable = p2.isPlaytestDisabled,
					onActivated = p2.onPlayActivated,
					variant = ButtonVariant.Utility
				}),
				AgentSpec = if IsEnabled and (not FFlagBuildExperienceModelPickerModule or p2.modelPicker == nil) then ReactModule.createElement(IconButton, {
					LayoutOrder = 5,
					isCircular = true,
					testId = "BuildChatPage.AgentSpecButton",
					icon = {
						name = IconName.LabBeaker,
						variant = if p2.agentSpecVersion == nil then IconVariant.Regular else IconVariant.Filled
					},
					onActivated = function()
						-- upvalues: Callback (ref)
						Callback(true)
					end,
					size = InputSize.Large,
					variant = ButtonVariant.Utility
				}) else nil,
				Overflow = ReactModule.createElement(BuildOverflowMenuButtonModule, {
					layoutOrder = 6,
					isDisabled = false,
					icon = IconName.ThreeDotsHorizontal,
					hasPublishedTurn = p2.hasPublishedTurn,
					hasPublishedVersion = p2.hasPublishedVersion,
					target = {
						universeId = p2.target.universeId,
						placeId = p2.target.placeId,
						sessionId = p2.target.sessionId,
						isNewGameTarget = p2.isNewGameTarget
					},
					store = p2.buildOverflowMenuStore,
					onAction = p2.onOverflowMenuAction,
					onOpenCreatorCreditPage = p2.onOpenCreatorCreditPage,
					onOpenGetUsersPage = p2.onOpenGetUsersPage,
					isUniversePublic = if FFlagEnableBuildAdPromotionModule then p2.isUniversePublic else nil
				})
			}),
			Divider = ReactModule.createElement(Divider, {
				LayoutOrder = 3,
				testId = "BuildChatPage.HeaderDivider",
				Visible = p2.isChatScrollable
			})
		}),
		Messages = ReactModule.createElement(ScrollView, {
			LayoutOrder = 2,
			scrollingFrameRef = UseResult,
			onAbsoluteCanvasSizeChanged = p2.onChatViewportChanged,
			onAbsoluteWindowSizeChanged = p2.onChatViewportChanged,
			tag = {
				["composition-layout-detail"] = true,
				["fill size-full-0"] = true
			},
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, {
			MessageColumn = ReactModule.createElement(View, {
				testId = "BuildChatPage.MessageBody",
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, UseTokensResult.Size.Size_800)
				},
				tag = {
					["composition-content-body"] = true,
					["size-full"] = p2.isChatEmpty and not HasAnswerForm,
					["size-full-0 auto-y padding-y-large"] = not p2.isChatEmpty or HasAnswerForm
				}
			}, RenderAdUpsellsResult)
		}),
		AgentSpecSheet = if IsEnabled and v1 then ReactModule.createElement(AgentSpecDebugSheetModule, {
			specVersion = p2.agentSpecVersion,
			onSave = p2.setAgentSpecVersion,
			onClose = function()
				-- upvalues: Callback (ref)
				Callback(false)
			end
		}) else nil,
		Actions = ReactModule.createElement(View, {
			LayoutOrder = 3,
			testId = "BuildChatPage.ActionLayout",
			tag = {
				["composition-layout-detail"] = true,
				["size-full-0 auto-y"] = true
			}
		}, {
			ActionBody = ReactModule.createElement(View, {
				testId = "BuildChatPage.ActionBody",
				tag = {
					["composition-content-body size-full-0 auto-y"] = true,
					["col gap-medium"] = p2.showBuyMoreRobuxCard or FFlagBuildAdUpsellPinnedModule and #p2.adUpsellCards > 0
				}
			}, {
				BuyMoreRobux = if p2.showBuyMoreRobuxCard then ReactModule.createElement(BuyMoreRobuxCardModule, {
					LayoutOrder = 1,
					title = p2.buyMoreRobuxCardTitle,
					description = p2.buyMoreRobuxCardDescription,
					primaryActionText = p2.buyMoreRobuxCardPrimaryActionText,
					onPrimaryAction = p2.onBuyMoreRobuxCardPrimaryAction,
					secondaryActionText = p2.buyMoreRobuxCardSecondaryActionText,
					onSecondaryAction = p2.onBuyMoreRobuxCardSecondaryAction
				}) else nil,
				AdUpsells = if FFlagBuildAdUpsellModule and FFlagBuildAdUpsellPinnedModule and #p2.adUpsellCards > 0 then ReactModule.createElement(View, {
					tag = "col gap-medium size-full-0 auto-y",
					testId = "BuildChatPage.AdUpsells",
					LayoutOrder = if p2.showBuyMoreRobuxCard then 2 else 1
				}, RenderAdUpsellsResult2) else nil,
				Footer = if HasAnswerForm then nil else ReactModule.createElement(ChatActionsModule, {
					LayoutOrder = if p2.showBuyMoreRobuxCard then if FFlagBuildAdUpsellPinnedModule and #p2.adUpsellCards > 0 then 3 else 2 elseif FFlagBuildAdUpsellPinnedModule and #p2.adUpsellCards > 0 then 2 else nil,
					modelPicker = if FFlagBuildExperienceModelPickerModule then p2.modelPicker else nil,
					composerText = p2.composerText,
					composerErrorText = p2.composerErrorText,
					onComposerChanged = p2.onComposerChanged,
					promptChips = p2.promptChips,
					isPromptChipsLoading = p2.isPromptChipsLoading,
					onPromptChipActivated = p2.onPromptChipActivated,
					images = if FFlagBuildExperienceChatImageAttachmentsModule then p2.composerImages else nil,
					onImagesChanged = if FFlagBuildExperienceChatImageAttachmentsModule then p2.onComposerImagesChanged else nil,
					onRetryImage = if FFlagBuildExperienceChatImageAttachmentsModule then p2.onRetryComposerImage else nil,
					isSendBlocked = p2.isComposerSendBlocked,
					resourceAttachments = if FFlagBuildExperienceChatResourceAttachments then p2.composerResourceAttachments else nil,
					onRemoveResourceAttachment = if FFlagBuildExperienceChatResourceAttachments then p2.onRemoveComposerResourceAttachment else nil,
					placeholder = UseLocalizationResult.composerPlaceholder,
					textBoxRef = p2.textBoxRef,
					isAssistantResponding = p2.isAssistantResponding,
					canStopAssistantResponse = p2.canStopAssistantResponse,
					canSendWhileResponding = p2.canSendWhileResponding,
					isReadOnly = p2.isChatReadOnly,
					onSend = p2.onSend,
					onStop = p2.onStop
				})
			})
		}),
		AdCampaignSheet = if FFlagBuildAdUpsellModule and p2.isAdUpsellVisible then ReactModule.createElement(CreateAdCampaignSheetContainerModule, {
			waitForCreateResult = true,
			useLocalRunDates = true,
			universeId = if FFlagBuildAdsManagerUniverseUrlModule then p2.target.universeId else nil,
			isOpen = p2.isAdCampaignSheetOpen,
			onClose = p2.onAdCampaignSheetClose,
			onCreate = p2.onAdCampaignSheetCreate,
			isCreatePending = p2.isAdUpsellCreatePending,
			hasCreateError = p2.hasAdCampaignCreateError,
			createErrorKind = p2.adCampaignCreateErrorKind,
			campaignDurationDays = p2.adCampaignDurationDays,
			estimatedPriceRobux = p2.adCampaignEstimatedPriceRobux,
			campaignOffers = p2.adCampaignOffers,
			runStartTimeMs = p2.adCampaignRunStartTimeMs,
			runEndTimeMs = p2.adCampaignRunEndTimeMs
		}) else nil,
		AgentAdCampaignSheet = if FFlagBuildAgentAdCampaignCardModule then ReactModule.createElement(CreateAdCampaignSheetContainerModule, {
			waitForCreateResult = true,
			useLocalRunDates = true,
			universeId = if FFlagBuildAdsManagerUniverseUrlModule then p2.target.universeId else nil,
			isOpen = p2.isAgentAdCampaignSheetOpen,
			onClose = p2.onAgentAdCampaignSheetClose,
			onCreate = p2.onAgentAdCampaignSheetCreate,
			isCreatePending = p2.isAgentAdCampaignCreatePending,
			hasCreateError = p2.hasAgentAdCampaignCreateError,
			createErrorKind = p2.agentAdCampaignCreateErrorKind,
			campaignOffers = p2.agentAdCampaignOffers,
			attemptedOption = p2.agentAdCampaignAttemptedOption,
			runStartTimeMs = p2.agentAdCampaignRunStartTimeMs
		}) else nil,
		AdCampaignCreatedToast = if FFlagBuildAdUpsellModule and p2.isAdCampaignCreatedToastVisible and p2.isAdUpsellVisible then ReactModule.createElement(AdCampaignCreatedToastModule, {
			testId = "AdCampaignCreatedToast",
			actionText = if p2.onOpenGetUsersPage == nil then nil else UseLocalizationResult.adCampaignCreatedView,
			onActionActivated = p2.onOpenGetUsersPage,
			onClose = p2.onAdCampaignCreatedToastDismiss,
			title = UseLocalizationResult.adCampaignCreated
		}) else nil
	})
end