local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagBuildAdUpsellModule = require(buildExperience.Flags.FFlagBuildAdUpsell)
local chatConstantsModule = require(buildExperience.Chat.chatConstants)
local _ = require(buildExperience.Chat.chatTypes)
local buildEmptyStateModule = require(buildExperience.Components.BuildEmptyState.BuildEmptyState)
local buildOverflowMenuButtonModule = require(buildExperience.Components.BuildPillMenu.BuildOverflowMenuButton)
local agentDetailMenuModule = require(buildExperience.Components.BuildPillMenu.AgentDetailMenu)
local playButtonModule = require(buildExperience.Components.PlayButton.PlayButton)
local buyMoreRobuxCardModule = require(buildExperience.Components.Chat.BuyMoreRobuxCard)
local chatActionsModule = require(buildExperience.Components.Chat.ChatActions)
local chatMessageListModule = require(buildExperience.Components.Chat.ChatMessageList)
local pushNotificationsUpsellCardModule = require(buildExperience.Components.Chat.PushNotificationsUpsellCard)
local var1 = if fFlagBuildAdUpsellModule then require(buildExperience.Components.Ads.AdUpsellMilestone.AdUpsellMilestoneContainer) else nil
local var2 = if fFlagBuildAdUpsellModule then require(buildExperience.Components.Ads.CreateAdCampaignSheet.CreateAdCampaignSheetContainer) else nil
local var3 = if fFlagBuildAdUpsellModule then require(buildExperience.Components.Ads.AdCampaignCreatedToast) else nil
local subagentStatusModule = require(buildExperience.Components.SubagentStatus)
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore)
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local _ = require(buildExperience.Chat.useChatSessionCore)
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local fFlagBuildExperienceAssetLibraryModule = require(buildExperience.Flags.FFlagBuildExperienceAssetLibrary)
local fFlagBuildExperienceRemoveAgentTaskUiModule = require(buildExperience.Flags.FFlagBuildExperienceRemoveAgentTaskUi)
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(buildExperience.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local fFlagEnableBuildOverflowMenuForNewGamesModule = require(buildExperience.Flags.FFlagEnableBuildOverflowMenuForNewGames)
local fFlagEnableBuildAdPromotionModule = require(buildExperience.Flags.FFlagEnableBuildAdPromotion)
local fFlagBuildExperienceChatImageAttachmentsModule = require(buildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local var4 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(buildExperience.Telemetry.useScrollPerformanceTracker) else nil
local divider = foundationModule.Divider
local iconButton = foundationModule.IconButton
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
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

return function(p4)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), fFlagBuildAdUpsellModule (ref), useTokens (ref), reactModule (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var4 (ref), fFlagBuildExperienceRemoveAgentTaskUiModule (ref), chatMessageListModule (ref), buildEmptyStateModule (ref), chatConstantsModule (ref), pushNotificationsUpsellCardModule (ref), var1 (ref), view (ref), subagentTaskStatus (ref), subagentStatusModule (ref), fFlagBuildDesktopReadinessModule (ref), buyMoreRobuxCardModule (ref), chatActionsModule (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), iconButton (ref), iconName (ref), inputSize (ref), text (ref), playButtonModule (ref), buttonVariant (ref), agentDetailMenuModule (ref), fFlagBuildExperienceAssetLibraryModule (ref), buildOverflowMenuButtonModule (ref), fFlagEnableBuildOverflowMenuForNewGamesModule (ref), fFlagEnableBuildAdPromotionModule (ref), scrollView (ref), foundationModule (ref), divider (ref), toTodoItems (ref), var2 (ref), var3 (ref)
	local var5 = if fFlagBuildLocalization then useLocalization({
		composerPlaceholder = localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER,
		adUpsellCongrats = if fFlagBuildAdUpsellModule then if p4.adUpsellFreePromotionsRemaining == 1 then localizationStringsModule.AD_UPSELL_CONGRATS_SINGULAR else {
			localizationStringsModule.AD_UPSELL_CONGRATS,
			promotionCount = p4.adUpsellFreePromotionsRemaining
		} else nil,
		adCampaignCreated = if fFlagBuildAdUpsellModule then localizationStringsModule.ADS_STATS_CREATE_SUCCESS else nil,
		adCampaignCreatedView = if fFlagBuildAdUpsellModule then localizationStringsModule.AD_CAMPAIGN_CARD_VIEW else nil
	}) else nil
	local var6 = useTokens()
	local var7 = reactModule.useRef(nil)
	
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var4("LuaApp_Build_Chat_Scroll", var7)
	end
	local var8, v
	local var9 = reactModule.useCallback(function(p5)
		-- upvalues: var7 (ref), p4 (ref)
		var7.current = p5
		p4.scrollingFrameRef(p5)
	end, { p4.scrollingFrameRef })
	local taskState = p4.taskState
	local selectedChipGroupName = p4.selectedChipGroupName
	
	if taskState == nil or selectedChipGroupName == nil then
		var8 = nil
	else
		for i, v in taskState.groups do
			if v.name == selectedChipGroupName then
				var8 = v
			end
		end
		var8 = nil
	end
	taskState = not fFlagBuildExperienceRemoveAgentTaskUiModule
	selectedChipGroupName = chatMessageListModule({
		messages = p4.messages,
		clockBinding = p4.clockBinding,
		localToolActions = p4.localToolActions,
		emptyState = reactModule.createElement(buildEmptyStateModule),
		isHistoryLoading = p4.isHistoryLoading,
		onPlaytest = p4.onPlaytest,
		isPlaytestLoading = p4.isPlaytestLoading
	})
	local var10 = false
	
	for v, v in p4.messages do
		if v.kind == "user_message" then
			var10 = true
			break
		end
	end
	local MESSAGE_LAYOUT_ORDER_STRIDE = chatConstantsModule.MESSAGE_LAYOUT_ORDER_STRIDE
	
	if p4.showPushNotificationsUpsell and var10 and p4.isAssistantResponding then
		selectedChipGroupName.PushNotificationsUpsell = reactModule.createElement(pushNotificationsUpsellCardModule, {
			LayoutOrder = (#p4.messages + 1) * MESSAGE_LAYOUT_ORDER_STRIDE,
			isRequestPending = p4.isPushNotificationsRequestPending,
			shouldOpenSettings = p4.shouldOpenPushNotificationsSettings,
			onNotifyMe = p4.onNotifyMe,
			onOpenSettings = p4.onOpenPushNotificationsSettings,
			onNotNow = p4.onNotNow
		})
	end
	if fFlagBuildAdUpsellModule then
		local t = {}
		
		for i_1, v_1 in p4.adUpsellCards do
			local anchorIndex = t[v_1.anchorIndex] or {}
			table.insert(anchorIndex, v_1)
			t[v_1.anchorIndex] = anchorIndex
		end
		for i_2, v_2 in t do
			local t_1 = {}
			local t_2 = {}
			
			for i_3, v_3 in v_2 do
				table.insert(t_2, v_3.id)
				t_1[v_3.id] = reactModule.createElement(var1, {
					anchorId = v_3.id,
					order = v_3.order,
					isImpressed = v_3.isImpressed,
					congratsText = if fFlagBuildLocalization then var5.adUpsellCongrats else localizationStringsModule.formatAdUpsellCongrats(p4.adUpsellFreePromotionsRemaining),
					isCreatePending = p4.isAdUpsellCreatePending,
					isPageVisible = p4.isAdUpsellVisible,
					onCreate = p4.onAdUpsellCreate,
					onDismiss = p4.onAdUpsellDismiss,
					onImpression = p4.onAdUpsellImpression,
					scrollingFrameRef = var7
				})
			end
			selectedChipGroupName[`AdUpsellGroup:{table.concat(t_2, "|")}`] = reactModule.createElement(view, {
				tag = "col gap-medium size-full-0 auto-y",
				LayoutOrder = i_2 * MESSAGE_LAYOUT_ORDER_STRIDE + 1,
				testId = `AdUpsellGroup.{i_2}`
			}, t_1)
		end
	end
	local t = {}
	
	if taskState and p4.taskState ~= nil then
		for i_1, v_1 in p4.taskState.groups do
			local var11 = if v_1.isLoading then subagentTaskStatus.InProgress elseif v_1.isComplete then subagentTaskStatus.Done else subagentTaskStatus.Pending
			t[`Group{i_1}`] = reactModule.createElement(subagentStatusModule.Root, {
				layoutOrder = i_1,
				text = v_1.name,
				isChecked = v_1.isComplete,
				onActivated = function()
					-- upvalues: p4 (ref), v_1 (ref)
					p4.onChipActivated(v_1.name)
				end,
				testId = `BuildChatPage.SubagentStatus.{v_1.name}`
			}, {
				Indicator = if var11 ~= subagentTaskStatus.Pending then nil else reactModule.createElement(subagentStatusModule.LoadingIndicator, {
					status = var11,
					testId = `BuildChatPage.SubagentStatus.{v_1.name}.Indicator`
				})
			})
		end
	end
	local var12 = reactModule.createElement(view, {
		testId = "BuildChatPage.ActionBody",
		LayoutOrder = if fFlagBuildDesktopReadinessModule then nil else 3,
		tag = {
			["composition-content-body size-full-0 auto-y"] = true,
			["col gap-medium"] = p4.showBuyMoreRobuxCard
		}
	}, {
		BuyMoreRobux = if p4.showBuyMoreRobuxCard then reactModule.createElement(buyMoreRobuxCardModule, {
			LayoutOrder = 1,
			title = p4.buyMoreRobuxCardTitle,
			description = p4.buyMoreRobuxCardDescription,
			primaryActionText = p4.buyMoreRobuxCardPrimaryActionText,
			onPrimaryAction = p4.onBuyMoreRobuxCardPrimaryAction,
			secondaryActionText = p4.buyMoreRobuxCardSecondaryActionText,
			onSecondaryAction = p4.onBuyMoreRobuxCardSecondaryAction
		}) else nil,
		Footer = reactModule.createElement(chatActionsModule, {
			LayoutOrder = if p4.showBuyMoreRobuxCard then 2 else nil,
			composerText = p4.composerText,
			composerErrorText = p4.composerErrorText,
			onComposerChanged = p4.onComposerChanged,
			images = if fFlagBuildExperienceChatImageAttachmentsModule then p4.composerImages else nil,
			onImagesChanged = if fFlagBuildExperienceChatImageAttachmentsModule then p4.onComposerImagesChanged else nil,
			onRetryImage = if fFlagBuildExperienceChatImageAttachmentsModule then p4.onRetryComposerImage else nil,
			isImageSendBlocked = if fFlagBuildExperienceChatImageAttachmentsModule then p4.isComposerSendBlocked else nil,
			placeholder = if fFlagBuildLocalization then var5.composerPlaceholder else localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER,
			textBoxRef = p4.textBoxRef,
			isAssistantResponding = p4.isAssistantResponding,
			canStopAssistantResponse = p4.canStopAssistantResponse,
			canSendWhileResponding = p4.canSendWhileResponding,
			onSend = p4.onSend,
			onStop = p4.onStop
		})
	})
	v = reactModule.createElement
	
	return v(view, {
		tag = "col align-x-center size-full bg-surface-0",
		onAbsolutePositionChanged = p4.onPageMetricsChanged,
		onAbsoluteSizeChanged = p4.onPageMetricsChanged,
		padding = { bottom = UDim.new(0, p4.paddingBottom) }
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
				Back = reactModule.createElement(iconButton, {
					LayoutOrder = 1,
					isCircular = true,
					testId = "BuildChatPage.BackButton",
					icon = iconName.ChevronLargeLeft,
					onActivated = p4.onClose,
					size = if fFlagBuildDesktopReadinessModule then inputSize.Large else inputSize.Medium
				}),
				Title = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "fill text-heading-small text-align-x-left text-truncate-split content-emphasis",
					Text = if p4.isNewGameTarget then chatConstantsModule.BUILD_CHAT_PAGE_TITLE else p4.target.experienceName
				}),
				Play = reactModule.createElement(playButtonModule, {
					LayoutOrder = 3,
					isActive = true,
					activeIcon = iconName.PlaySmall,
					inActiveIcon = iconName.PlaySmall,
					isDisabled = p4.isNewGameTarget and not p4.hasPublishedTurn,
					onActivated = p4.onPlayActivated,
					variant = buttonVariant.Utility
				}),
				AgentDetail = if taskState then reactModule.createElement(agentDetailMenuModule, { layoutOrder = 4, onActivated = p4.onOpenAgentsPage }) else nil,
				AssetLibrary = if fFlagBuildExperienceAssetLibraryModule then reactModule.createElement(iconButton, {
					LayoutOrder = 5,
					isCircular = true,
					testId = "build-header-asset-library-menu",
					icon = iconName.SquaresGridPlus,
					isDisabled = p4.isAgentDetailDisabled,
					onActivated = p4.onOpenAssetLibraryPage,
					size = inputSize.Medium,
					variant = buttonVariant.Utility
				}) else nil,
				Overflow = reactModule.createElement(buildOverflowMenuButtonModule, {
					layoutOrder = 6,
					icon = iconName.ThreeDotsHorizontal,
					isDisabled = not fFlagEnableBuildOverflowMenuForNewGamesModule and p4.target.universeId == nil,
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
					isUniversePublic = if fFlagEnableBuildAdPromotionModule then p4.isUniversePublic else nil
				})
			}),
			SubagentStatus = if taskState and p4.hasTaskGroups then reactModule.createElement(scrollView, {
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
					scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility.None
				}
			}, t) else nil,
			Divider = reactModule.createElement(divider, {
				LayoutOrder = 3,
				testId = "BuildChatPage.HeaderDivider",
				Visible = p4.isChatScrollable
			})
		}),
		Messages = reactModule.createElement(scrollView, {
			LayoutOrder = 2,
			scrollingFrameRef = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule or fFlagBuildAdUpsellModule then var9 else p4.scrollingFrameRef,
			onAbsoluteCanvasSizeChanged = p4.onChatViewportChanged,
			onAbsoluteWindowSizeChanged = p4.onChatViewportChanged,
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
					Padding = UDim.new(0, var6.Size.Size_800)
				},
				tag = {
					["composition-content-body"] = true,
					["size-full"] = p4.isChatEmpty,
					["size-full-0 auto-y padding-y-large"] = not p4.isChatEmpty
				}
			}, selectedChipGroupName)
		}),
		Actions = if fFlagBuildDesktopReadinessModule then reactModule.createElement(view, {
			LayoutOrder = 3,
			testId = "BuildChatPage.ActionLayout",
			tag = {
				["composition-layout-detail"] = true,
				["size-full-0 auto-y"] = true
			}
		}, { ActionBody = var12 }) else var12,
		TodoBottomSheet = if taskState then reactModule.createElement(subagentStatusModule.TodoBottomSheet, {
			title = if var8 ~= nil then "" else var8.name,
			items = toTodoItems(var8),
			isOpen = var8 ~= nil,
			onClose = p4.onChipBottomSheetClose
		}) else nil,
		AdCampaignSheet = if fFlagBuildAdUpsellModule and p4.isAdCampaignSheetOpen and p4.isAdUpsellVisible then reactModule.createElement(var2, {
			isOpen = true,
			waitForCreateResult = true,
			useLocalRunDates = true,
			onClose = p4.onAdCampaignSheetClose,
			onCreate = p4.onAdCampaignSheetCreate,
			isCreatePending = p4.isAdUpsellCreatePending,
			hasCreateError = p4.hasAdCampaignCreateError,
			campaignDurationDays = p4.adCampaignDurationDays,
			estimatedPriceRobux = p4.adCampaignEstimatedPriceRobux,
			runStartTimeMs = p4.adCampaignRunStartTimeMs,
			runEndTimeMs = p4.adCampaignRunEndTimeMs
		}) else nil,
		AdCampaignCreatedToast = if fFlagBuildAdUpsellModule and p4.isAdCampaignCreatedToastVisible and p4.isAdUpsellVisible then reactModule.createElement(var3, {
			testId = "AdCampaignCreatedToast",
			actionText = if p4.onOpenGetUsersPage ~= nil then nil elseif fFlagBuildLocalization then var5.adCampaignCreatedView else localizationStringsModule.AD_CAMPAIGN_CARD_VIEW,
			onActionActivated = p4.onOpenGetUsersPage,
			onClose = p4.onAdCampaignCreatedToastDismiss,
			title = if fFlagBuildLocalization then var5.adCampaignCreated else localizationStringsModule.ADS_STATS_CREATE_SUCCESS
		}) else nil
	})
end