local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildAdUpsellModule = require(buildExperience.Flags.FFlagBuildAdUpsell)
local fFlagBuildAgentAdCampaignCardModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local chatConstantsModule = require(buildExperience.Chat.chatConstants)
local chatScrollAnchorContextModule = require(buildExperience.Chat.ChatScrollAnchorContext)
local _ = require(buildExperience.Chat.chatTypes)
local chatCardEmphasisPositionProviderModule = require(buildExperience.Components.Chat.ChatCardEmphasis.ChatCardEmphasisPositionProvider)
local fFlagBuildExperienceChatCardEmphasisModule = require(buildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)
local buildEmptyStateModule = require(buildExperience.Components.BuildEmptyState.BuildEmptyState)
local var1 = creatorAgentChatModule.experimentOverride.isEnabled()
local var2 = if var1 then require(buildExperience.Components.AgentSpecDebug.AgentSpecDebugSheet) else nil
local buildOverflowMenuButtonModule = require(buildExperience.Components.BuildPillMenu.BuildOverflowMenuButton)
local agentDetailMenuModule = require(buildExperience.Components.BuildPillMenu.AgentDetailMenu)
local playButtonModule = require(buildExperience.Components.PlayButton.PlayButton)
local buyMoreRobuxCardModule = require(buildExperience.Components.Chat.BuyMoreRobuxCard)
local chatActionsModule = require(buildExperience.Components.Chat.ChatActions)
local chatMessageListModule = require(buildExperience.Components.Chat.ChatMessageList)
local pushNotificationsUpsellCardModule = require(buildExperience.Components.Chat.PushNotificationsUpsellCard)
local var3 = if fFlagBuildAdUpsellModule then require(buildExperience.Components.Ads.AdUpsellMilestone.AdUpsellMilestoneContainer) else nil
local var4 = if fFlagBuildAdUpsellModule then require(buildExperience.Components.Ads.CreateAdCampaignSheet.CreateAdCampaignSheetContainer) else nil
local var5 = if fFlagBuildAdUpsellModule then require(buildExperience.Components.Ads.AdCampaignCreatedToast) else nil
local subagentStatusModule = require(buildExperience.Components.SubagentStatus)
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore)
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local fFlagBuildExperienceLibrary = require(parent.SharedFlags).FFlagBuildExperienceLibrary
local _ = require(buildExperience.Chat.useChatSessionCore)
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local fFlagBuildExperienceRemoveAgentTaskUiModule = require(buildExperience.Flags.FFlagBuildExperienceRemoveAgentTaskUi)
local fFlagEnableBuildOverflowMenuForNewGamesModule = require(buildExperience.Flags.FFlagEnableBuildOverflowMenuForNewGames)
local fFlagEnableBuildAdPromotionModule = require(buildExperience.Flags.FFlagEnableBuildAdPromotion)
local fFlagBuildExperienceChatAccordionScrollAnchorModule = require(buildExperience.Flags.FFlagBuildExperienceChatAccordionScrollAnchor)
local fFlagBuildExperienceChatImageAttachmentsModule = require(buildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local fFlagBuildExperienceChatResourceAttachments = require(parent.SharedFlags).FFlagBuildExperienceChatResourceAttachments
local useScrollPerformanceTrackerModule = require(buildExperience.Telemetry.useScrollPerformanceTracker)
local divider = foundationModule.Divider
local iconButton = foundationModule.IconButton
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local iconVariant = foundationModule.Enums.IconVariant
local inputSize = foundationModule.Enums.InputSize
local useTokens = foundationModule.Hooks.useTokens
local subagentTaskStatus = creatorAgentChatModule.SubagentTaskStatus

local function _(p1, p2)
	if p1 == nil or p2 == nil then
		return nil
	end
	for i, v in p1.groups do
		if v.name == p2 then
			return v
		end
	end
	return nil
end

local _ = function(p3)
	-- upvalues: subagentTaskStatus (ref)
	return if p3.isLoading then subagentTaskStatus.InProgress elseif p3.isComplete then subagentTaskStatus.Done else subagentTaskStatus.Pending
end

local function toTodoItems(p3)
	local t = {}
	
	if p3 == nil then
		return t
	end
	for i, v in p3.tasks do
		t[i] = {
			title = v.text,
			description = v.description,
			status = v.status,
			testId = `BuildChatPage.TodoBottomSheet.{p3.name}.{i}`
		}
	end
	return t
end

local function groupAdUpsellCardsByAnchorIndex(p4)
	local t = {}
	
	for i, v in p4 do
		local anchorIndex = t[v.anchorIndex] or {}
		table.insert(anchorIndex, v)
		t[v.anchorIndex] = anchorIndex
	end
	return t
end

return function(p5)
	-- upvalues: var1 (ref), reactModule (ref), useLocalization (ref), localizationStringsModule (ref), fFlagBuildAdUpsellModule (ref), useTokens (ref), useScrollPerformanceTrackerModule (ref), fFlagBuildExperienceRemoveAgentTaskUiModule (ref), chatMessageListModule (ref), buildEmptyStateModule (ref), fFlagBuildAgentAdCampaignCardModule (ref), chatConstantsModule (ref), pushNotificationsUpsellCardModule (ref), groupAdUpsellCardsByAnchorIndex (ref), var3 (ref), fFlagBuildExperienceChatCardEmphasisModule (ref), chatCardEmphasisPositionProviderModule (ref), view (ref), fFlagBuildExperienceChatAccordionScrollAnchorModule (ref), chatScrollAnchorContextModule (ref), subagentTaskStatus (ref), subagentStatusModule (ref), fFlagBuildDesktopReadinessModule (ref), buyMoreRobuxCardModule (ref), chatActionsModule (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), fFlagBuildExperienceChatResourceAttachments (ref), fFlagBuildExperienceLibrary (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), text (ref), playButtonModule (ref), agentDetailMenuModule (ref), iconVariant (ref), buildOverflowMenuButtonModule (ref), fFlagEnableBuildOverflowMenuForNewGamesModule (ref), fFlagEnableBuildAdPromotionModule (ref), scrollView (ref), foundationModule (ref), divider (ref), var2 (ref), toTodoItems (ref), var4 (ref), var5 (ref)
	local var6 = false
	local var7 = nil
	
	if var1 then
		local var8, var9 = reactModule.useState(false)
		var6 = var8
		var7 = var9
	end
	local var10, v
	local var11 = useLocalization({
		composerPlaceholder = localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER,
		adUpsellCongrats = if fFlagBuildAdUpsellModule then if p5.adUpsellFreePromotionsRemaining == 1 then localizationStringsModule.AD_UPSELL_CONGRATS_SINGULAR else {
			localizationStringsModule.AD_UPSELL_CONGRATS,
			promotionCount = p5.adUpsellFreePromotionsRemaining
		} else nil,
		adCampaignCreated = if fFlagBuildAdUpsellModule then localizationStringsModule.ADS_STATS_CREATE_SUCCESS else nil,
		adCampaignCreatedView = if fFlagBuildAdUpsellModule then localizationStringsModule.AD_CAMPAIGN_CARD_VIEW else nil
	})
	local var12 = useTokens()
	local var13 = reactModule.useRef(nil)
	useScrollPerformanceTrackerModule("LuaApp_Build_Chat_Scroll", var13)
	local var14 = reactModule.useCallback(function(p6)
		-- upvalues: var13 (ref), p5 (ref)
		var13.current = p6
		p5.scrollingFrameRef(p6)
	end, { p5.scrollingFrameRef })
	local taskState = p5.taskState
	local selectedChipGroupName = p5.selectedChipGroupName
	
	if taskState == nil or selectedChipGroupName == nil then
		var10 = nil
	else
		for i, v in taskState.groups do
			if v.name == selectedChipGroupName then
				var10 = v
			end
		end
		var10 = nil
	end
	taskState = not fFlagBuildExperienceRemoveAgentTaskUiModule
	selectedChipGroupName = chatMessageListModule({
		isPageVisible = p5.isAdUpsellVisible,
		scrollingFrameRef = var13,
		isAgentAdCampaignCreateDisabled = p5.isAgentAdCampaignCreateDisabled,
		messages = p5.messages,
		clockBinding = p5.clockBinding,
		localToolActions = p5.localToolActions,
		emptyState = reactModule.createElement(buildEmptyStateModule),
		isHistoryLoading = p5.isHistoryLoading,
		onPlaytest = p5.onPlaytest,
		onPublish = p5.onPublish,
		isPlaytestLoading = p5.isPlaytestLoading,
		onAgentAdCampaignOfferSelected = if fFlagBuildAgentAdCampaignCardModule then p5.onAgentAdCampaignOfferSelected else nil,
		getAgentAdCampaignCardState = if fFlagBuildAgentAdCampaignCardModule then p5.getAgentAdCampaignCardState else nil,
		onAgentAdCampaignActive = if fFlagBuildAgentAdCampaignCardModule then p5.onAgentAdCampaignActive else nil
	})
	local var15 = false
	
	for v, v in p5.messages do
		if v.kind == "user_message" then
			var15 = true
			break
		end
	end
	local MESSAGE_LAYOUT_ORDER_STRIDE = chatConstantsModule.MESSAGE_LAYOUT_ORDER_STRIDE
	
	if p5.showPushNotificationsUpsell and var15 and p5.isAssistantResponding then
		selectedChipGroupName.PushNotificationsUpsell = reactModule.createElement(pushNotificationsUpsellCardModule, {
			LayoutOrder = (#p5.messages + 1) * MESSAGE_LAYOUT_ORDER_STRIDE,
			isRequestPending = p5.isPushNotificationsRequestPending,
			shouldOpenSettings = p5.shouldOpenPushNotificationsSettings,
			onNotifyMe = p5.onNotifyMe,
			onOpenSettings = p5.onOpenPushNotificationsSettings,
			onNotNow = p5.onNotNow
		})
	end
	if fFlagBuildAdUpsellModule then
		for i_1, v_1 in groupAdUpsellCardsByAnchorIndex(p5.adUpsellCards) do
			local t = {}
			local t_1 = {}
			
			for i_2, v_2 in v_1 do
				table.insert(t_1, v_2.id)
				t[v_2.id] = reactModule.createElement(var3, {
					anchorId = v_2.id,
					order = v_2.order,
					isImpressed = v_2.isImpressed,
					congratsText = var11.adUpsellCongrats,
					freePromotionsRemaining = if fFlagBuildAgentAdCampaignCardModule then p5.adUpsellFreePromotionsRemaining else nil,
					isCreatePending = p5.isAdUpsellCreatePending,
					isPageVisible = p5.isAdUpsellVisible,
					onCreate = p5.onAdUpsellCreate,
					onDismiss = p5.onAdUpsellDismiss,
					onImpression = p5.onAdUpsellImpression,
					scrollingFrameRef = var13
				})
				
				if fFlagBuildExperienceChatCardEmphasisModule then
					t[v_2.id] = reactModule.createElement(chatCardEmphasisPositionProviderModule, {
						messageOrder = i_1 * MESSAGE_LAYOUT_ORDER_STRIDE + 1,
						segmentOrder = v_2.order
					}, t[v_2.id])
				end
			end
			selectedChipGroupName[`AdUpsellGroup:{table.concat(t_1, "|")}`] = reactModule.createElement(view, {
				tag = "col gap-medium size-full-0 auto-y",
				LayoutOrder = i_1 * MESSAGE_LAYOUT_ORDER_STRIDE + 1,
				testId = `AdUpsellGroup.{i_1}`
			}, t)
		end
	end
	if fFlagBuildExperienceChatAccordionScrollAnchorModule then
		selectedChipGroupName = {
			ScrollAnchor = reactModule.createElement(chatScrollAnchorContextModule.Provider, { value = p5.anchorScrollToInstance }, selectedChipGroupName)
		}
	end
	local t = {}
	
	if taskState and p5.taskState ~= nil then
		for i_1, v_1 in p5.taskState.groups do
			local var16 = if v_1.isLoading then subagentTaskStatus.InProgress elseif v_1.isComplete then subagentTaskStatus.Done else subagentTaskStatus.Pending
			t[`Group{i_1}`] = reactModule.createElement(subagentStatusModule.Root, {
				layoutOrder = i_1,
				text = v_1.name,
				isChecked = v_1.isComplete,
				onActivated = function()
					-- upvalues: p5 (ref), v_1 (ref)
					p5.onChipActivated(v_1.name)
				end,
				testId = `BuildChatPage.SubagentStatus.{v_1.name}`
			}, {
				Indicator = if var16 ~= subagentTaskStatus.Pending then nil else reactModule.createElement(subagentStatusModule.LoadingIndicator, {
					status = var16,
					testId = `BuildChatPage.SubagentStatus.{v_1.name}.Indicator`
				})
			})
		end
	end
	local var17 = reactModule.createElement(view, {
		testId = "BuildChatPage.ActionBody",
		LayoutOrder = if fFlagBuildDesktopReadinessModule then nil else 3,
		tag = {
			["composition-content-body size-full-0 auto-y"] = true,
			["col gap-medium"] = p5.showBuyMoreRobuxCard
		}
	}, {
		BuyMoreRobux = if p5.showBuyMoreRobuxCard then reactModule.createElement(buyMoreRobuxCardModule, {
			LayoutOrder = 1,
			title = p5.buyMoreRobuxCardTitle,
			description = p5.buyMoreRobuxCardDescription,
			primaryActionText = p5.buyMoreRobuxCardPrimaryActionText,
			onPrimaryAction = p5.onBuyMoreRobuxCardPrimaryAction,
			secondaryActionText = p5.buyMoreRobuxCardSecondaryActionText,
			onSecondaryAction = p5.onBuyMoreRobuxCardSecondaryAction
		}) else nil,
		Footer = reactModule.createElement(chatActionsModule, {
			LayoutOrder = if p5.showBuyMoreRobuxCard then 2 else nil,
			composerText = p5.composerText,
			composerErrorText = p5.composerErrorText,
			onComposerChanged = p5.onComposerChanged,
			images = if fFlagBuildExperienceChatImageAttachmentsModule then p5.composerImages else nil,
			onImagesChanged = if fFlagBuildExperienceChatImageAttachmentsModule then p5.onComposerImagesChanged else nil,
			onRetryImage = if fFlagBuildExperienceChatImageAttachmentsModule then p5.onRetryComposerImage else nil,
			isSendBlocked = p5.isComposerSendBlocked,
			resourceAttachments = if fFlagBuildExperienceChatResourceAttachments then p5.composerResourceAttachments else nil,
			onRemoveResourceAttachment = if fFlagBuildExperienceChatResourceAttachments then p5.onRemoveComposerResourceAttachment else nil,
			placeholder = var11.composerPlaceholder,
			textBoxRef = p5.textBoxRef,
			isAssistantResponding = p5.isAssistantResponding,
			canStopAssistantResponse = p5.canStopAssistantResponse,
			canSendWhileResponding = p5.canSendWhileResponding,
			onSend = p5.onSend,
			onStop = p5.onStop
		})
	})
	v = reactModule.createElement
	
	return v(view, {
		tag = "col align-x-center size-full bg-surface-0",
		onAbsolutePositionChanged = p5.onPageMetricsChanged,
		onAbsoluteSizeChanged = p5.onPageMetricsChanged,
		padding = { bottom = UDim.new(0, p5.paddingBottom) }
	}, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col align-x-center size-full-0 auto-y bg-surface-0"
		}, {
			HeaderBar = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "composition-content-header row align-y-center gap-small size-full-0 auto-y padding-y-medium",
				testId = "BuildChatPage.HeaderBar"
			}, {
				Library = if fFlagBuildExperienceLibrary then reactModule.createElement(iconButton, {
					LayoutOrder = 5,
					isCircular = true,
					testId = "BuildChatPage.LibraryButton",
					icon = iconName.SquaresGridPlus,
					isDisabled = p5.isLibraryDisabled,
					onActivated = p5.onOpenLibrary,
					size = if fFlagBuildDesktopReadinessModule then inputSize.Large else inputSize.Medium,
					variant = buttonVariant.Utility
				}) else nil,
				Back = reactModule.createElement(iconButton, {
					LayoutOrder = 1,
					isCircular = true,
					testId = "BuildChatPage.BackButton",
					icon = iconName.ChevronLargeLeft,
					onActivated = p5.onClose,
					size = if fFlagBuildDesktopReadinessModule then inputSize.Large else inputSize.Medium
				}),
				Title = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "fill text-heading-small text-align-x-left text-truncate-split content-emphasis",
					Text = if p5.isNewGameTarget then chatConstantsModule.BUILD_CHAT_PAGE_TITLE else p5.target.experienceName
				}),
				Play = reactModule.createElement(playButtonModule, {
					LayoutOrder = 3,
					isActive = true,
					activeIcon = iconName.PlaySmall,
					inActiveIcon = iconName.PlaySmall,
					isDisabled = p5.isNewGameTarget and not p5.hasPublishedTurn,
					onActivated = p5.onPlayActivated,
					variant = buttonVariant.Utility
				}),
				AgentDetail = if taskState then reactModule.createElement(agentDetailMenuModule, { layoutOrder = 4, onActivated = p5.onOpenAgentsPage }) else nil,
				AgentSpec = if var1 then reactModule.createElement(iconButton, {
					LayoutOrder = 5,
					isCircular = true,
					testId = "BuildChatPage.AgentSpecButton",
					icon = {
						name = iconName.LabBeaker,
						variant = if p5.agentSpecVersion ~= nil then iconVariant.Regular else iconVariant.Filled
					},
					onActivated = function()
						-- upvalues: var7 (write)
						var7(true)
					end,
					size = if fFlagBuildDesktopReadinessModule then inputSize.Large else inputSize.Medium,
					variant = buttonVariant.Utility
				}) else nil,
				Overflow = reactModule.createElement(buildOverflowMenuButtonModule, {
					layoutOrder = 6,
					icon = iconName.ThreeDotsHorizontal,
					isDisabled = not fFlagEnableBuildOverflowMenuForNewGamesModule and p5.target.universeId == nil,
					hasPublishedTurn = p5.hasPublishedTurn,
					hasPublishedVersion = p5.hasPublishedVersion,
					target = {
						universeId = p5.target.universeId,
						placeId = p5.target.placeId,
						sessionId = p5.target.sessionId,
						isNewGameTarget = p5.isNewGameTarget
					},
					store = p5.buildOverflowMenuStore,
					onAction = p5.onOverflowMenuAction,
					onOpenCreatorCreditPage = p5.onOpenCreatorCreditPage,
					onOpenGetUsersPage = p5.onOpenGetUsersPage,
					isUniversePublic = if fFlagEnableBuildAdPromotionModule then p5.isUniversePublic else nil
				})
			}),
			SubagentStatus = if taskState and p5.hasTaskGroups then reactModule.createElement(scrollView, {
				LayoutOrder = 2,
				tag = "composition-content-header size-full-0 auto-y padding-bottom-small",
				testId = "BuildChatPage.SubagentStatus",
				layout = {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, p5.statusChipGap)
				},
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.X,
					AutomaticSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromOffset(0, 0),
					ScrollingDirection = Enum.ScrollingDirection.X,
					scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility.None
				}
			}, t) else nil,
			Divider = reactModule.createElement(divider, {
				LayoutOrder = 3,
				testId = "BuildChatPage.HeaderDivider",
				Visible = p5.isChatScrollable
			})
		}),
		Messages = reactModule.createElement(scrollView, {
			LayoutOrder = 2,
			scrollingFrameRef = var14,
			onAbsoluteCanvasSizeChanged = p5.onChatViewportChanged,
			onAbsoluteWindowSizeChanged = p5.onChatViewportChanged,
			tag = {
				["composition-layout-detail"] = fFlagBuildDesktopReadinessModule,
				["fill size-full-0"] = true
			},
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, {
			MessageColumn = reactModule.createElement(view, {
				testId = "BuildChatPage.MessageBody",
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, var12.Size.Size_800)
				},
				tag = {
					["composition-content-body"] = true,
					["size-full"] = p5.isChatEmpty,
					["size-full-0 auto-y padding-y-large"] = not p5.isChatEmpty
				}
			}, selectedChipGroupName)
		}),
		AgentSpecSheet = if var1 and var6 then reactModule.createElement(var2, {
			specVersion = p5.agentSpecVersion,
			onSave = p5.setAgentSpecVersion,
			onClose = function()
				-- upvalues: var7 (write)
				var7(false)
			end
		}) else nil,
		Actions = if fFlagBuildDesktopReadinessModule then reactModule.createElement(view, {
			LayoutOrder = 3,
			testId = "BuildChatPage.ActionLayout",
			tag = {
				["composition-layout-detail"] = true,
				["size-full-0 auto-y"] = true
			}
		}, { ActionBody = var17 }) else var17,
		TodoBottomSheet = if taskState then reactModule.createElement(subagentStatusModule.TodoBottomSheet, {
			title = if var10 ~= nil then "" else var10.name,
			items = toTodoItems(var10),
			isOpen = var10 ~= nil,
			onClose = p5.onChipBottomSheetClose
		}) else nil,
		AdCampaignSheet = if fFlagBuildAdUpsellModule and p5.isAdUpsellVisible then reactModule.createElement(var4, {
			waitForCreateResult = true,
			useLocalRunDates = true,
			isOpen = p5.isAdCampaignSheetOpen,
			onClose = p5.onAdCampaignSheetClose,
			onCreate = p5.onAdCampaignSheetCreate,
			isCreatePending = p5.isAdUpsellCreatePending,
			hasCreateError = p5.hasAdCampaignCreateError,
			createErrorKind = p5.adCampaignCreateErrorKind,
			campaignDurationDays = p5.adCampaignDurationDays,
			estimatedPriceRobux = p5.adCampaignEstimatedPriceRobux,
			campaignOffers = p5.adCampaignOffers,
			runStartTimeMs = p5.adCampaignRunStartTimeMs,
			runEndTimeMs = p5.adCampaignRunEndTimeMs
		}) else nil,
		AgentAdCampaignSheet = if fFlagBuildAgentAdCampaignCardModule then reactModule.createElement(var4, {
			waitForCreateResult = true,
			useLocalRunDates = true,
			isOpen = p5.isAgentAdCampaignSheetOpen,
			onClose = p5.onAgentAdCampaignSheetClose,
			onCreate = p5.onAgentAdCampaignSheetCreate,
			isCreatePending = p5.isAgentAdCampaignCreatePending,
			hasCreateError = p5.hasAgentAdCampaignCreateError,
			createErrorKind = p5.agentAdCampaignCreateErrorKind,
			campaignOffers = p5.agentAdCampaignOffers,
			attemptedOption = p5.agentAdCampaignAttemptedOption,
			runStartTimeMs = p5.agentAdCampaignRunStartTimeMs
		}) else nil,
		AdCampaignCreatedToast = if fFlagBuildAdUpsellModule and p5.isAdCampaignCreatedToastVisible and p5.isAdUpsellVisible then reactModule.createElement(var5, {
			testId = "AdCampaignCreatedToast",
			actionText = if p5.onOpenGetUsersPage ~= nil then nil else var11.adCampaignCreatedView,
			onActionActivated = p5.onOpenGetUsersPage,
			onClose = p5.onAdCampaignCreatedToastDismiss,
			title = var11.adCampaignCreated
		}) else nil
	})
end