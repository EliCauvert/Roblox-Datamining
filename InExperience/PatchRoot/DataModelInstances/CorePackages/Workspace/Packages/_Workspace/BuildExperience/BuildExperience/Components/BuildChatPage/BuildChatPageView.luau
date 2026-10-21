local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
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
local IsEnabled = CreatorAgentChatModule.experimentOverride.isEnabled()
local AgentSpecDebugSheetModule = if IsEnabled then require(BuildExperience.Components.AgentSpecDebug.AgentSpecDebugSheet) else nil
local BuildOverflowMenuButtonModule = require(BuildExperience.Components.BuildPillMenu.BuildOverflowMenuButton)
local AgentDetailMenuModule = require(BuildExperience.Components.BuildPillMenu.AgentDetailMenu)
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
local SubagentStatusModule = require(BuildExperience.Components.SubagentStatus)
local _ = require(BuildExperience.Stores.GetBuildOverflowMenuStore)
local _ = require(BuildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local FFlagBuildExperienceLibrary = require(Parent.SharedFlags).FFlagBuildExperienceLibrary
local _ = require(BuildExperience.Chat.useChatSessionCore)
local FFlagBuildExperienceRemoveAgentTaskUiModule = require(BuildExperience.Flags.FFlagBuildExperienceRemoveAgentTaskUi)
local FFlagEnableBuildOverflowMenuForNewGamesModule = require(BuildExperience.Flags.FFlagEnableBuildOverflowMenuForNewGames)
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
local SubagentTaskStatus = CreatorAgentChatModule.SubagentTaskStatus

local function _(p1, Name)
	if p1 == nil or Name == nil then
		return nil
	end
	for _, group in p1.groups do
		if group.name == Name then
			return group
		end
	end
	return nil
end

local _ = function(p2)
	-- upvalues: SubagentTaskStatus (copy)
	return if p2.isLoading then SubagentTaskStatus.InProgress elseif p2.isComplete then SubagentTaskStatus.Done else SubagentTaskStatus.Pending
end

local function toTodoItems(p2)
	local t = {}
	
	if p2 == nil then
		return t
	end
	for i, _task in p2.tasks do
		t[i] = {
			title = _task.text,
			description = _task.description,
			status = _task.status,
			testId = `BuildChatPage.TodoBottomSheet.{p2.name}.{i}`
		}
	end
	return t
end

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

local function renderAdUpsells(p3, Tbl, ScrollingFrameRef, CongratsText)
	-- upvalues: FFlagBuildAdUpsellModule (copy), FFlagBuildAdUpsellPinnedModule (copy), ReactModule (copy), Text (copy), ChatConstantsModule (copy), groupAdUpsellCardsByAnchorIndex (copy), AdUpsellMilestoneContainerModule (copy), FFlagBuildAgentAdCampaignCardModule (copy), FFlagBuildExperienceChatCardEmphasisModule (copy), ChatCardEmphasisPositionProviderModule (copy), View (copy)
	local Copy = table.clone(Tbl)
	
	if FFlagBuildAdUpsellModule and FFlagBuildAdUpsellPinnedModule and p3.adUpsellCongratsAnchorIndex ~= nil then
		Copy.AdUpsellCongrats = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
			testId = "AdUpsellCongrats",
			LayoutOrder = p3.adUpsellCongratsAnchorIndex * ChatConstantsModule.MESSAGE_LAYOUT_ORDER_STRIDE + 1,
			Text = CongratsText
		})
	end
	if FFlagBuildAdUpsellModule and not FFlagBuildAdUpsellPinnedModule then
		for i, value in groupAdUpsellCardsByAnchorIndex(p3.adUpsellCards) do
			local Elements1 = {}
			local List = {}
			
			for _, value1 in value do
				table.insert(List, value1.id)
				Elements1[value1.id] = ReactModule.createElement(AdUpsellMilestoneContainerModule, {
					anchorId = value1.id,
					order = value1.order,
					isImpressed = value1.isImpressed,
					congratsText = CongratsText,
					freePromotionsRemaining = if FFlagBuildAgentAdCampaignCardModule then p3.adUpsellFreePromotionsRemaining else nil,
					isCreatePending = p3.isAdUpsellCreatePending,
					isCreateDisabled = p3.isAdUpsellCreateDisabled,
					isPageVisible = p3.isAdUpsellVisible,
					onCreate = p3.onAdUpsellCreate,
					onDismiss = p3.onAdUpsellDismiss,
					onImpression = p3.onAdUpsellImpression,
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
		for _, adUpsellCard in p3.adUpsellCards do
			Elements[adUpsellCard.id] = ReactModule.createElement(AdUpsellMilestoneContainerModule, {
				anchorId = adUpsellCard.id,
				order = adUpsellCard.order,
				isImpressed = adUpsellCard.isImpressed,
				freePromotionsRemaining = if FFlagBuildAgentAdCampaignCardModule then p3.adUpsellFreePromotionsRemaining else nil,
				isCreatePending = p3.isAdUpsellCreatePending,
				isCreateDisabled = p3.isAdUpsellCreateDisabled,
				isPageVisible = p3.isAdUpsellVisible,
				onCreate = p3.onAdUpsellCreate,
				onDismiss = p3.onAdUpsellDismiss,
				onImpression = p3.onAdUpsellImpression
			})
		end
	end
	return Copy, Elements
end

return function(p4)
	-- upvalues: FFlagBuildExperienceAnswerFormModule (copy), IsEnabled (copy), ReactModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagBuildAdUpsellModule (copy), UseTokensFunction (copy), UseScrollPerformanceTrackerModule (copy), FFlagBuildExperienceRemoveAgentTaskUiModule (copy), ChatMessageListModule (copy), BuildEmptyStateModule (copy), FFlagBuildAgentAdCampaignCardModule (copy), ChatConstantsModule (copy), PushNotificationsUpsellCardModule (copy), renderAdUpsells (copy), AnswerFormContainerModule (copy), FFlagBuildExperienceChatAccordionScrollAnchorModule (copy), ChatScrollAnchorContextModule (copy), FFlagBuildCheckGamePermissionsModule (copy), ChatPermissionsContextModule (copy), SubagentTaskStatus (copy), SubagentStatusModule (copy), View (copy), FFlagBuildAdUpsellPinnedModule (copy), BuyMoreRobuxCardModule (copy), ChatActionsModule (copy), FFlagBuildExperienceChatImageAttachmentsModule (copy), FFlagBuildExperienceChatResourceAttachments (copy), FFlagBuildExperienceLibrary (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), Text (copy), PlayButtonModule (copy), AgentDetailMenuModule (copy), IconVariant (copy), BuildOverflowMenuButtonModule (copy), FFlagEnableBuildOverflowMenuForNewGamesModule (copy), FFlagEnableBuildAdPromotionModule (copy), ScrollView (copy), FoundationModule (copy), Divider (copy), AgentSpecDebugSheetModule (copy), toTodoItems (copy), CreateAdCampaignSheetContainerModule (copy), FFlagBuildAdsManagerUniverseUrlModule (copy), AdCampaignCreatedToastModule (copy)
	local HasAnswerForm: boolean = FFlagBuildExperienceAnswerFormModule and p4.answerForm ~= nil
	local v1 = false
	local Callback = nil
	
	if IsEnabled then
		v1, Callback = ReactModule.useState(false)
	end
	local UseLocalizationResult = UseLocalizationFunction({
		composerPlaceholder = LocalizationStringsModule.CHAT_COMPOSER_PLACEHOLDER,
		adUpsellCongrats = if FFlagBuildAdUpsellModule then if p4.adUpsellFreePromotionsRemaining == 1 then LocalizationStringsModule.AD_UPSELL_CONGRATS_SINGULAR else {
			LocalizationStringsModule.AD_UPSELL_CONGRATS,
			promotionCount = p4.adUpsellFreePromotionsRemaining
		} else nil,
		adCampaignCreated = if FFlagBuildAdUpsellModule then LocalizationStringsModule.ADS_STATS_CREATE_SUCCESS else nil,
		adCampaignCreatedView = if FFlagBuildAdUpsellModule then LocalizationStringsModule.AD_CAMPAIGN_CARD_VIEW else nil
	})
	local UseTokensResult = UseTokensFunction()
	local UseRefResult = ReactModule.useRef(nil)
	UseScrollPerformanceTrackerModule("LuaApp_Build_Chat_Scroll", UseRefResult)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), p4 (copy)
		UseRefResult.current = Current
		p4.scrollingFrameRef(Current)
	end, { p4.scrollingFrameRef })
	local TaskState = p4.taskState
	local SelectedChipGroupName = p4.selectedChipGroupName
	local v2 = nil
	
	if TaskState == nil or SelectedChipGroupName == nil then
		v2 = nil
	else
		v2 = nil
		
		for _, group in TaskState.groups do
			if group.name == SelectedChipGroupName then
				v2 = group
				break
			end
		end
	end
	local NoFFlagBuildExperienceRemoveAgentTaskUiModule = not FFlagBuildExperienceRemoveAgentTaskUiModule
	local ChatMessageListModuleResult = ChatMessageListModule({
		isPageVisible = p4.isAdUpsellVisible,
		scrollingFrameRef = UseRefResult,
		isAgentAdCampaignCreateDisabled = p4.isAgentAdCampaignCreateDisabled,
		messages = p4.messages,
		clockBinding = p4.clockBinding,
		localToolActions = p4.localToolActions,
		emptyState = if HasAnswerForm then nil else ReactModule.createElement(BuildEmptyStateModule),
		isHistoryLoading = p4.isHistoryLoading,
		onPlaytest = p4.onPlaytest,
		onPublish = p4.onPublish,
		isPlaytestLoading = p4.isPlaytestLoading,
		onAgentAdCampaignOfferSelected = if FFlagBuildAgentAdCampaignCardModule then p4.onAgentAdCampaignOfferSelected else nil,
		getAgentAdCampaignCardState = if FFlagBuildAgentAdCampaignCardModule then p4.getAgentAdCampaignCardState else nil,
		onAgentAdCampaignActive = if FFlagBuildAgentAdCampaignCardModule then p4.onAgentAdCampaignActive else nil
	})
	local Flag = false
	
	for _, message in p4.messages do
		if message.kind == "user_message" then
			Flag = true
			break
		end
	end
	local MESSAGELAYOUTORDERSTRIDE = ChatConstantsModule.MESSAGE_LAYOUT_ORDER_STRIDE
	
	if p4.showPushNotificationsUpsell and Flag and p4.isAssistantResponding then
		ChatMessageListModuleResult.PushNotificationsUpsell = ReactModule.createElement(PushNotificationsUpsellCardModule, {
			LayoutOrder = (#p4.messages + 1) * MESSAGELAYOUTORDERSTRIDE,
			isRequestPending = p4.isPushNotificationsRequestPending,
			shouldOpenSettings = p4.shouldOpenPushNotificationsSettings,
			onNotifyMe = p4.onNotifyMe,
			onOpenSettings = p4.onOpenPushNotificationsSettings,
			onNotNow = p4.onNotNow
		})
	end
	local RenderAdUpsellsResult, RenderAdUpsellsResult2 = renderAdUpsells(p4, ChatMessageListModuleResult, UseRefResult, UseLocalizationResult.adUpsellCongrats)
	
	if HasAnswerForm then
		RenderAdUpsellsResult.AnswerForm = ReactModule.createElement(AnswerFormContainerModule, {
			LayoutOrder = (#p4.messages + 2) * ChatConstantsModule.MESSAGE_LAYOUT_ORDER_STRIDE,
			state = p4.answerForm,
			actions = p4.localToolActions,
			onSubmitText = p4.onSubmitAnswerText,
			onStop = p4.onStop,
			errorText = p4.composerErrorText,
			isReadOnly = p4.isChatReadOnly
		})
	end
	if FFlagBuildExperienceChatAccordionScrollAnchorModule then
		RenderAdUpsellsResult = {
			ScrollAnchor = ReactModule.createElement(ChatScrollAnchorContextModule.Provider, { value = p4.anchorScrollToInstance }, RenderAdUpsellsResult)
		}
	end
	if FFlagBuildCheckGamePermissionsModule then
		RenderAdUpsellsResult = {
			Permissions = ReactModule.createElement(ChatPermissionsContextModule.Provider, { value = p4.chatPermissions }, RenderAdUpsellsResult)
		}
	end
	local Elements = {}
	
	if NoFFlagBuildExperienceRemoveAgentTaskUiModule and p4.taskState ~= nil then
		for LayoutOrder, group1 in p4.taskState.groups do
			local InProgress = if group1.isLoading then SubagentTaskStatus.InProgress elseif group1.isComplete then SubagentTaskStatus.Done else SubagentTaskStatus.Pending
			Elements[`Group{LayoutOrder}`] = ReactModule.createElement(SubagentStatusModule.Root, {
				layoutOrder = LayoutOrder,
				text = group1.name,
				isChecked = group1.isComplete,
				onActivated = function()
					-- upvalues: p4 (copy), group1 (copy)
					p4.onChipActivated(group1.name)
				end,
				testId = `BuildChatPage.SubagentStatus.{group1.name}`
			}, {
				Indicator = if InProgress == SubagentTaskStatus.Pending then nil else ReactModule.createElement(SubagentStatusModule.LoadingIndicator, {
					status = InProgress,
					testId = `BuildChatPage.SubagentStatus.{group1.name}.Indicator`
				})
			})
		end
	end
	return ReactModule.createElement(View, {
		tag = "col align-x-center size-full bg-surface-0",
		onAbsolutePositionChanged = p4.onPageMetricsChanged,
		onAbsoluteSizeChanged = p4.onPageMetricsChanged,
		padding = { bottom = UDim.new(0, p4.paddingBottom) }
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
					isDisabled = p4.isLibraryDisabled,
					onActivated = p4.onOpenLibrary,
					size = InputSize.Large,
					variant = ButtonVariant.Utility
				}) else nil,
				Back = ReactModule.createElement(IconButton, {
					LayoutOrder = 1,
					isCircular = true,
					testId = "BuildChatPage.BackButton",
					icon = IconName.ChevronLargeLeft,
					onActivated = p4.onClose,
					size = InputSize.Large
				}),
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "fill text-heading-small text-align-x-left text-truncate-split content-emphasis",
					Text = if p4.isNewGameTarget then ChatConstantsModule.BUILD_CHAT_PAGE_TITLE else p4.target.experienceName
				}),
				Play = ReactModule.createElement(PlayButtonModule, {
					LayoutOrder = 3,
					isActive = true,
					activeIcon = IconName.PlaySmall,
					inActiveIcon = IconName.PlaySmall,
					isDisabled = p4.isNewGameTarget and not p4.hasPublishedTurn,
					isUnavailable = p4.isPlaytestDisabled,
					onActivated = p4.onPlayActivated,
					variant = ButtonVariant.Utility
				}),
				AgentDetail = if NoFFlagBuildExperienceRemoveAgentTaskUiModule then ReactModule.createElement(AgentDetailMenuModule, { layoutOrder = 4, onActivated = p4.onOpenAgentsPage }) else nil,
				AgentSpec = if IsEnabled then ReactModule.createElement(IconButton, {
					LayoutOrder = 5,
					isCircular = true,
					testId = "BuildChatPage.AgentSpecButton",
					icon = {
						name = IconName.LabBeaker,
						variant = if p4.agentSpecVersion == nil then IconVariant.Regular else IconVariant.Filled
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
					icon = IconName.ThreeDotsHorizontal,
					isDisabled = not FFlagEnableBuildOverflowMenuForNewGamesModule and p4.target.universeId == nil,
					hasPublishedTurn = p4.hasPublishedTurn,
					hasPublishedVersion = p4.hasPublishedVersion,
					target = {
						universeId = p4.target.universeId,
						placeId = p4.target.placeId,
						sessionId = p4.target.sessionId,
						isNewGameTarget = p4.isNewGameTarget
					},
					store = p4.buildOverflowMenuStore,
					onAction = p4.onOverflowMenuAction,
					onOpenCreatorCreditPage = p4.onOpenCreatorCreditPage,
					onOpenGetUsersPage = p4.onOpenGetUsersPage,
					isUniversePublic = if FFlagEnableBuildAdPromotionModule then p4.isUniversePublic else nil
				})
			}),
			SubagentStatus = if NoFFlagBuildExperienceRemoveAgentTaskUiModule and p4.hasTaskGroups then ReactModule.createElement(ScrollView, {
				LayoutOrder = 2,
				tag = "composition-content-header size-full-0 auto-y padding-bottom-small",
				testId = "BuildChatPage.SubagentStatus",
				layout = {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, p4.statusChipGap)
				},
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.X,
					AutomaticSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromOffset(0, 0),
					ScrollingDirection = Enum.ScrollingDirection.X,
					scrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility.None
				}
			}, Elements) else nil,
			Divider = ReactModule.createElement(Divider, {
				LayoutOrder = 3,
				testId = "BuildChatPage.HeaderDivider",
				Visible = p4.isChatScrollable
			})
		}),
		Messages = ReactModule.createElement(ScrollView, {
			LayoutOrder = 2,
			scrollingFrameRef = UseResult,
			onAbsoluteCanvasSizeChanged = p4.onChatViewportChanged,
			onAbsoluteWindowSizeChanged = p4.onChatViewportChanged,
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
					["size-full"] = p4.isChatEmpty and not HasAnswerForm,
					["size-full-0 auto-y padding-y-large"] = not p4.isChatEmpty or HasAnswerForm
				}
			}, RenderAdUpsellsResult)
		}),
		AgentSpecSheet = if IsEnabled and v1 then ReactModule.createElement(AgentSpecDebugSheetModule, {
			specVersion = p4.agentSpecVersion,
			onSave = p4.setAgentSpecVersion,
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
					["col gap-medium"] = p4.showBuyMoreRobuxCard or FFlagBuildAdUpsellPinnedModule and #p4.adUpsellCards > 0
				}
			}, {
				BuyMoreRobux = if p4.showBuyMoreRobuxCard then ReactModule.createElement(BuyMoreRobuxCardModule, {
					LayoutOrder = 1,
					title = p4.buyMoreRobuxCardTitle,
					description = p4.buyMoreRobuxCardDescription,
					primaryActionText = p4.buyMoreRobuxCardPrimaryActionText,
					onPrimaryAction = p4.onBuyMoreRobuxCardPrimaryAction,
					secondaryActionText = p4.buyMoreRobuxCardSecondaryActionText,
					onSecondaryAction = p4.onBuyMoreRobuxCardSecondaryAction
				}) else nil,
				AdUpsells = if FFlagBuildAdUpsellModule and FFlagBuildAdUpsellPinnedModule and #p4.adUpsellCards > 0 then ReactModule.createElement(View, {
					tag = "col gap-medium size-full-0 auto-y",
					testId = "BuildChatPage.AdUpsells",
					LayoutOrder = if p4.showBuyMoreRobuxCard then 2 else 1
				}, RenderAdUpsellsResult2) else nil,
				Footer = if HasAnswerForm then nil else ReactModule.createElement(ChatActionsModule, {
					LayoutOrder = if p4.showBuyMoreRobuxCard then if FFlagBuildAdUpsellPinnedModule and #p4.adUpsellCards > 0 then 3 else 2 elseif FFlagBuildAdUpsellPinnedModule and #p4.adUpsellCards > 0 then 2 else nil,
					composerText = p4.composerText,
					composerErrorText = p4.composerErrorText,
					onComposerChanged = p4.onComposerChanged,
					images = if FFlagBuildExperienceChatImageAttachmentsModule then p4.composerImages else nil,
					onImagesChanged = if FFlagBuildExperienceChatImageAttachmentsModule then p4.onComposerImagesChanged else nil,
					onRetryImage = if FFlagBuildExperienceChatImageAttachmentsModule then p4.onRetryComposerImage else nil,
					isSendBlocked = p4.isComposerSendBlocked,
					resourceAttachments = if FFlagBuildExperienceChatResourceAttachments then p4.composerResourceAttachments else nil,
					onRemoveResourceAttachment = if FFlagBuildExperienceChatResourceAttachments then p4.onRemoveComposerResourceAttachment else nil,
					placeholder = UseLocalizationResult.composerPlaceholder,
					textBoxRef = p4.textBoxRef,
					isAssistantResponding = p4.isAssistantResponding,
					canStopAssistantResponse = p4.canStopAssistantResponse,
					canSendWhileResponding = p4.canSendWhileResponding,
					isReadOnly = p4.isChatReadOnly,
					onSend = p4.onSend,
					onStop = p4.onStop
				})
			})
		}),
		TodoBottomSheet = if NoFFlagBuildExperienceRemoveAgentTaskUiModule then ReactModule.createElement(SubagentStatusModule.TodoBottomSheet, {
			title = if v2 == nil then "" else v2.name,
			items = toTodoItems(v2),
			isOpen = v2 ~= nil,
			onClose = p4.onChipBottomSheetClose
		}) else nil,
		AdCampaignSheet = if FFlagBuildAdUpsellModule and p4.isAdUpsellVisible then ReactModule.createElement(CreateAdCampaignSheetContainerModule, {
			waitForCreateResult = true,
			useLocalRunDates = true,
			universeId = if FFlagBuildAdsManagerUniverseUrlModule then p4.target.universeId else nil,
			isOpen = p4.isAdCampaignSheetOpen,
			onClose = p4.onAdCampaignSheetClose,
			onCreate = p4.onAdCampaignSheetCreate,
			isCreatePending = p4.isAdUpsellCreatePending,
			hasCreateError = p4.hasAdCampaignCreateError,
			createErrorKind = p4.adCampaignCreateErrorKind,
			campaignDurationDays = p4.adCampaignDurationDays,
			estimatedPriceRobux = p4.adCampaignEstimatedPriceRobux,
			campaignOffers = p4.adCampaignOffers,
			runStartTimeMs = p4.adCampaignRunStartTimeMs,
			runEndTimeMs = p4.adCampaignRunEndTimeMs
		}) else nil,
		AgentAdCampaignSheet = if FFlagBuildAgentAdCampaignCardModule then ReactModule.createElement(CreateAdCampaignSheetContainerModule, {
			waitForCreateResult = true,
			useLocalRunDates = true,
			universeId = if FFlagBuildAdsManagerUniverseUrlModule then p4.target.universeId else nil,
			isOpen = p4.isAgentAdCampaignSheetOpen,
			onClose = p4.onAgentAdCampaignSheetClose,
			onCreate = p4.onAgentAdCampaignSheetCreate,
			isCreatePending = p4.isAgentAdCampaignCreatePending,
			hasCreateError = p4.hasAgentAdCampaignCreateError,
			createErrorKind = p4.agentAdCampaignCreateErrorKind,
			campaignOffers = p4.agentAdCampaignOffers,
			attemptedOption = p4.agentAdCampaignAttemptedOption,
			runStartTimeMs = p4.agentAdCampaignRunStartTimeMs
		}) else nil,
		AdCampaignCreatedToast = if FFlagBuildAdUpsellModule and p4.isAdCampaignCreatedToastVisible and p4.isAdUpsellVisible then ReactModule.createElement(AdCampaignCreatedToastModule, {
			testId = "AdCampaignCreatedToast",
			actionText = if p4.onOpenGetUsersPage == nil then nil else UseLocalizationResult.adCampaignCreatedView,
			onActionActivated = p4.onOpenGetUsersPage,
			onClose = p4.onAdCampaignCreatedToastDismiss,
			title = UseLocalizationResult.adCampaignCreated
		}) else nil
	})
end