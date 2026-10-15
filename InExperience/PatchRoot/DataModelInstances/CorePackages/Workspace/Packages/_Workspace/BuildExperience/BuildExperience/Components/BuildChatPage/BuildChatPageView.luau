local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildAdUpsellModule = require(buildExperience.Flags.FFlagBuildAdUpsell)
local fFlagBuildAdUpsellPinnedModule = require(buildExperience.Flags.FFlagBuildAdUpsellPinned)
local fFlagBuildAdsManagerUniverseUrlModule = require(buildExperience.Flags.FFlagBuildAdsManagerUniverseUrl)
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
local fFlagBuildExperienceAnswerFormModule = require(buildExperience.Flags.FFlagBuildExperienceAnswerForm)
local var3 = if fFlagBuildExperienceAnswerFormModule then require(buildExperience.Components.AnswerForm.AnswerFormContainer) else nil
local pushNotificationsUpsellCardModule = require(buildExperience.Components.Chat.PushNotificationsUpsellCard)
local var4 = if fFlagBuildAdUpsellModule then require(buildExperience.Components.Ads.AdUpsellMilestone.AdUpsellMilestoneContainer) else nil
local var5 = if fFlagBuildAdUpsellModule then require(buildExperience.Components.Ads.CreateAdCampaignSheet.CreateAdCampaignSheetContainer) else nil
local var6 = if fFlagBuildAdUpsellModule then require(buildExperience.Components.Ads.AdCampaignCreatedToast) else nil
local subagentStatusModule = require(buildExperience.Components.SubagentStatus)
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore)
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local fFlagBuildExperienceLibrary = require(parent.SharedFlags).FFlagBuildExperienceLibrary
local _ = require(buildExperience.Chat.useChatSessionCore)
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
		if v.anchorIndex ~= nil then
			local anchorIndex = t[v.anchorIndex] or {}
			table.insert(anchorIndex, v)
			t[v.anchorIndex] = anchorIndex
		end
	end
	return t
end

local function renderAdUpsells(p5, p6, p7, p8)
	-- upvalues: fFlagBuildAdUpsellModule (ref), fFlagBuildAdUpsellPinnedModule (ref), reactModule (ref), text (ref), chatConstantsModule (ref), groupAdUpsellCardsByAnchorIndex (ref), var4 (ref), fFlagBuildAgentAdCampaignCardModule (ref), fFlagBuildExperienceChatCardEmphasisModule (ref), chatCardEmphasisPositionProviderModule (ref), view (ref)
	local cloned = table.clone(p6)
	
	if fFlagBuildAdUpsellModule and fFlagBuildAdUpsellPinnedModule and p5.adUpsellCongratsAnchorIndex ~= nil then
		cloned.AdUpsellCongrats = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
			testId = "AdUpsellCongrats",
			LayoutOrder = p5.adUpsellCongratsAnchorIndex * chatConstantsModule.MESSAGE_LAYOUT_ORDER_STRIDE + 1,
			Text = p8
		})
	end
	if fFlagBuildAdUpsellModule and not fFlagBuildAdUpsellPinnedModule then
		for i, v in groupAdUpsellCardsByAnchorIndex(p5.adUpsellCards) do
			local t = {}
			local t_1 = {}
			
			for i_1, v_1 in v do
				table.insert(t_1, v_1.id)
				t[v_1.id] = reactModule.createElement(var4, {
					anchorId = v_1.id,
					order = v_1.order,
					isImpressed = v_1.isImpressed,
					congratsText = p8,
					freePromotionsRemaining = if fFlagBuildAgentAdCampaignCardModule then p5.adUpsellFreePromotionsRemaining else nil,
					isCreatePending = p5.isAdUpsellCreatePending,
					isPageVisible = p5.isAdUpsellVisible,
					onCreate = p5.onAdUpsellCreate,
					onDismiss = p5.onAdUpsellDismiss,
					onImpression = p5.onAdUpsellImpression,
					scrollingFrameRef = p7
				})
				
				if fFlagBuildExperienceChatCardEmphasisModule then
					t[v_1.id] = reactModule.createElement(chatCardEmphasisPositionProviderModule, {
						messageOrder = i * chatConstantsModule.MESSAGE_LAYOUT_ORDER_STRIDE + 1,
						segmentOrder = v_1.order
					}, t[v_1.id])
				end
			end
			cloned[`AdUpsellGroup:{table.concat(t_1, "|")}`] = reactModule.createElement(view, {
				tag = "col gap-medium size-full-0 auto-y",
				LayoutOrder = i * chatConstantsModule.MESSAGE_LAYOUT_ORDER_STRIDE + 1,
				testId = `AdUpsellGroup.{i}`
			}, t)
		end
	end
	local t = {}
	
	if fFlagBuildAdUpsellModule and fFlagBuildAdUpsellPinnedModule then
		for i, v in p5.adUpsellCards do
			t[v.id] = reactModule.createElement(var4, {
				anchorId = v.id,
				order = v.order,
				isImpressed = v.isImpressed,
				freePromotionsRemaining = if fFlagBuildAgentAdCampaignCardModule then p5.adUpsellFreePromotionsRemaining else nil,
				isCreatePending = p5.isAdUpsellCreatePending,
				isPageVisible = p5.isAdUpsellVisible,
				onCreate = p5.onAdUpsellCreate,
				onDismiss = p5.onAdUpsellDismiss,
				onImpression = p5.onAdUpsellImpression
			})
		end
	end
	return cloned, t
end

return function(p9)
	-- upvalues: fFlagBuildExperienceAnswerFormModule (ref), var1 (ref), reactModule (ref), useLocalization (ref), localizationStringsModule (ref), fFlagBuildAdUpsellModule (ref), useTokens (ref), useScrollPerformanceTrackerModule (ref), fFlagBuildExperienceRemoveAgentTaskUiModule (ref), chatMessageListModule (ref), buildEmptyStateModule (ref), fFlagBuildAgentAdCampaignCardModule (ref), chatConstantsModule (ref), pushNotificationsUpsellCardModule (ref), renderAdUpsells (ref), var3 (ref), fFlagBuildExperienceChatAccordionScrollAnchorModule (ref), chatScrollAnchorContextModule (ref), subagentTaskStatus (ref), subagentStatusModule (ref), view (ref), fFlagBuildAdUpsellPinnedModule (ref), buyMoreRobuxCardModule (ref), chatActionsModule (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), fFlagBuildExperienceChatResourceAttachments (ref), fFlagBuildExperienceLibrary (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), text (ref), playButtonModule (ref), agentDetailMenuModule (ref), iconVariant (ref), buildOverflowMenuButtonModule (ref), fFlagEnableBuildOverflowMenuForNewGamesModule (ref), fFlagEnableBuildAdPromotionModule (ref), scrollView (ref), foundationModule (ref), divider (ref), var2 (ref), toTodoItems (ref), var5 (ref), fFlagBuildAdsManagerUniverseUrlModule (ref), var6 (ref)
	local var7 = fFlagBuildExperienceAnswerFormModule and p9.answerForm ~= nil
	local var8 = false
	local var9 = nil
	
	if var1 then
		local var10, var11 = reactModule.useState(false)
		var8 = var10
		var9 = var11
	end
	local var12, v
	local var13 = useLocalization({
		composerPlaceholder = localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER,
		adUpsellCongrats = if fFlagBuildAdUpsellModule then if p9.adUpsellFreePromotionsRemaining == 1 then localizationStringsModule.AD_UPSELL_CONGRATS_SINGULAR else {
			localizationStringsModule.AD_UPSELL_CONGRATS,
			promotionCount = p9.adUpsellFreePromotionsRemaining
		} else nil,
		adCampaignCreated = if fFlagBuildAdUpsellModule then localizationStringsModule.ADS_STATS_CREATE_SUCCESS else nil,
		adCampaignCreatedView = if fFlagBuildAdUpsellModule then localizationStringsModule.AD_CAMPAIGN_CARD_VIEW else nil
	})
	local var14 = useTokens()
	local var15 = reactModule.useRef(nil)
	useScrollPerformanceTrackerModule("LuaApp_Build_Chat_Scroll", var15)
	local var16 = reactModule.useCallback(function(p10)
		-- upvalues: var15 (ref), p9 (ref)
		var15.current = p10
		p9.scrollingFrameRef(p10)
	end, { p9.scrollingFrameRef })
	local taskState = p9.taskState
	local selectedChipGroupName = p9.selectedChipGroupName
	
	if taskState == nil or selectedChipGroupName == nil then
		var12 = nil
	else
		for i, v in taskState.groups do
			if v.name == selectedChipGroupName then
				var12 = v
			end
		end
		var12 = nil
	end
	local v_1
	taskState = not fFlagBuildExperienceRemoveAgentTaskUiModule
	selectedChipGroupName = chatMessageListModule({
		isPageVisible = p9.isAdUpsellVisible,
		scrollingFrameRef = var15,
		isAgentAdCampaignCreateDisabled = p9.isAgentAdCampaignCreateDisabled,
		messages = p9.messages,
		clockBinding = p9.clockBinding,
		localToolActions = p9.localToolActions,
		emptyState = if not var7 then reactModule.createElement(buildEmptyStateModule) else nil,
		isHistoryLoading = p9.isHistoryLoading,
		onPlaytest = p9.onPlaytest,
		onPublish = p9.onPublish,
		isPlaytestLoading = p9.isPlaytestLoading,
		onAgentAdCampaignOfferSelected = if fFlagBuildAgentAdCampaignCardModule then p9.onAgentAdCampaignOfferSelected else nil,
		getAgentAdCampaignCardState = if fFlagBuildAgentAdCampaignCardModule then p9.getAgentAdCampaignCardState else nil,
		onAgentAdCampaignActive = if fFlagBuildAgentAdCampaignCardModule then p9.onAgentAdCampaignActive else nil
	})
	local var17 = false
	
	for v, v_1 in p9.messages do
		if v_1.kind == "user_message" then
			var17 = true
			break
		end
	end
	local MESSAGE_LAYOUT_ORDER_STRIDE = chatConstantsModule.MESSAGE_LAYOUT_ORDER_STRIDE
	
	if p9.showPushNotificationsUpsell and var17 and p9.isAssistantResponding then
		selectedChipGroupName.PushNotificationsUpsell = reactModule.createElement(pushNotificationsUpsellCardModule, {
			LayoutOrder = (#p9.messages + 1) * MESSAGE_LAYOUT_ORDER_STRIDE,
			isRequestPending = p9.isPushNotificationsRequestPending,
			shouldOpenSettings = p9.shouldOpenPushNotificationsSettings,
			onNotifyMe = p9.onNotifyMe,
			onOpenSettings = p9.onOpenPushNotificationsSettings,
			onNotNow = p9.onNotNow
		})
	end
	local var18, var19 = renderAdUpsells(p9, selectedChipGroupName, var15, var13.adUpsellCongrats)
	selectedChipGroupName = var18
	
	if var7 then
		selectedChipGroupName.AnswerForm = reactModule.createElement(var3, {
			LayoutOrder = (#p9.messages + 2) * chatConstantsModule.MESSAGE_LAYOUT_ORDER_STRIDE,
			state = p9.answerForm,
			actions = p9.localToolActions,
			onSubmitText = p9.onSubmitAnswerText,
			onStop = p9.onStop,
			errorText = p9.composerErrorText
		})
	end
	if fFlagBuildExperienceChatAccordionScrollAnchorModule then
		selectedChipGroupName = {
			ScrollAnchor = reactModule.createElement(chatScrollAnchorContextModule.Provider, { value = p9.anchorScrollToInstance }, selectedChipGroupName)
		}
	end
	v = {}
	
	if taskState and p9.taskState ~= nil then
		for i_1, v_2 in p9.taskState.groups do
			local var20 = if v_2.isLoading then subagentTaskStatus.InProgress elseif v_2.isComplete then subagentTaskStatus.Done else subagentTaskStatus.Pending
			v[`Group{i_1}`] = reactModule.createElement(subagentStatusModule.Root, {
				layoutOrder = i_1,
				text = v_2.name,
				isChecked = v_2.isComplete,
				onActivated = function()
					-- upvalues: p9 (ref), v_2 (ref)
					p9.onChipActivated(v_2.name)
				end,
				testId = `BuildChatPage.SubagentStatus.{v_2.name}`
			}, {
				Indicator = if var20 ~= subagentTaskStatus.Pending then nil else reactModule.createElement(subagentStatusModule.LoadingIndicator, {
					status = var20,
					testId = `BuildChatPage.SubagentStatus.{v_2.name}.Indicator`
				})
			})
		end
	end
	local createElement
	v_1 = reactModule.createElement
	local t = {
		testId = "BuildChatPage.ActionBody",
		tag = {
			["composition-content-body size-full-0 auto-y"] = true,
			["col gap-medium"] = p9.showBuyMoreRobuxCard or fFlagBuildAdUpsellPinnedModule and #p9.adUpsellCards > 0
		}
	}
	local t_1 = {
		BuyMoreRobux = if p9.showBuyMoreRobuxCard then reactModule.createElement(buyMoreRobuxCardModule, {
			LayoutOrder = 1,
			title = p9.buyMoreRobuxCardTitle,
			description = p9.buyMoreRobuxCardDescription,
			primaryActionText = p9.buyMoreRobuxCardPrimaryActionText,
			onPrimaryAction = p9.onBuyMoreRobuxCardPrimaryAction,
			secondaryActionText = p9.buyMoreRobuxCardSecondaryActionText,
			onSecondaryAction = p9.onBuyMoreRobuxCardSecondaryAction
		}) else nil,
		AdUpsells = if fFlagBuildAdUpsellModule and fFlagBuildAdUpsellPinnedModule and #p9.adUpsellCards > 0 then reactModule.createElement(view, {
			tag = "col gap-medium size-full-0 auto-y",
			testId = "BuildChatPage.AdUpsells",
			LayoutOrder = if p9.showBuyMoreRobuxCard then 2 else 1
		}, var19) else nil
	}
	
	if var7 then
		createElement = nil
	else
		createElement = reactModule.createElement
		createElement = createElement(chatActionsModule, {
			LayoutOrder = if p9.showBuyMoreRobuxCard then if fFlagBuildAdUpsellPinnedModule and #p9.adUpsellCards > 0 then 3 else 2 elseif fFlagBuildAdUpsellPinnedModule and #p9.adUpsellCards > 0 then 2 else nil,
			composerText = p9.composerText,
			composerErrorText = p9.composerErrorText,
			onComposerChanged = p9.onComposerChanged,
			images = if fFlagBuildExperienceChatImageAttachmentsModule then p9.composerImages else nil,
			onImagesChanged = if fFlagBuildExperienceChatImageAttachmentsModule then p9.onComposerImagesChanged else nil,
			onRetryImage = if fFlagBuildExperienceChatImageAttachmentsModule then p9.onRetryComposerImage else nil,
			isSendBlocked = p9.isComposerSendBlocked,
			resourceAttachments = if fFlagBuildExperienceChatResourceAttachments then p9.composerResourceAttachments else nil,
			onRemoveResourceAttachment = if fFlagBuildExperienceChatResourceAttachments then p9.onRemoveComposerResourceAttachment else nil,
			placeholder = var13.composerPlaceholder,
			textBoxRef = p9.textBoxRef,
			isAssistantResponding = p9.isAssistantResponding,
			canStopAssistantResponse = p9.canStopAssistantResponse,
			canSendWhileResponding = p9.canSendWhileResponding,
			onSend = p9.onSend,
			onStop = p9.onStop
		})
	end
	t_1.Footer = createElement
	v_1 = v_1(view, t, t_1)
	
	return reactModule.createElement(view, {
		tag = "col align-x-center size-full bg-surface-0",
		onAbsolutePositionChanged = p9.onPageMetricsChanged,
		onAbsoluteSizeChanged = p9.onPageMetricsChanged,
		padding = { bottom = UDim.new(0, p9.paddingBottom) }
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
					isDisabled = p9.isLibraryDisabled,
					onActivated = p9.onOpenLibrary,
					size = inputSize.Large,
					variant = buttonVariant.Utility
				}) else nil,
				Back = reactModule.createElement(iconButton, {
					LayoutOrder = 1,
					isCircular = true,
					testId = "BuildChatPage.BackButton",
					icon = iconName.ChevronLargeLeft,
					onActivated = p9.onClose,
					size = inputSize.Large
				}),
				Title = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "fill text-heading-small text-align-x-left text-truncate-split content-emphasis",
					Text = if p9.isNewGameTarget then chatConstantsModule.BUILD_CHAT_PAGE_TITLE else p9.target.experienceName
				}),
				Play = reactModule.createElement(playButtonModule, {
					LayoutOrder = 3,
					isActive = true,
					activeIcon = iconName.PlaySmall,
					inActiveIcon = iconName.PlaySmall,
					isDisabled = p9.isNewGameTarget and not p9.hasPublishedTurn,
					onActivated = p9.onPlayActivated,
					variant = buttonVariant.Utility
				}),
				AgentDetail = if taskState then reactModule.createElement(agentDetailMenuModule, { layoutOrder = 4, onActivated = p9.onOpenAgentsPage }) else nil,
				AgentSpec = if var1 then reactModule.createElement(iconButton, {
					LayoutOrder = 5,
					isCircular = true,
					testId = "BuildChatPage.AgentSpecButton",
					icon = {
						name = iconName.LabBeaker,
						variant = if p9.agentSpecVersion ~= nil then iconVariant.Regular else iconVariant.Filled
					},
					onActivated = function()
						-- upvalues: var9 (write)
						var9(true)
					end,
					size = inputSize.Large,
					variant = buttonVariant.Utility
				}) else nil,
				Overflow = reactModule.createElement(buildOverflowMenuButtonModule, {
					layoutOrder = 6,
					icon = iconName.ThreeDotsHorizontal,
					isDisabled = not fFlagEnableBuildOverflowMenuForNewGamesModule and p9.target.universeId == nil,
					hasPublishedTurn = p9.hasPublishedTurn,
					hasPublishedVersion = p9.hasPublishedVersion,
					target = {
						universeId = p9.target.universeId,
						placeId = p9.target.placeId,
						sessionId = p9.target.sessionId,
						isNewGameTarget = p9.isNewGameTarget
					},
					store = p9.buildOverflowMenuStore,
					onAction = p9.onOverflowMenuAction,
					onOpenCreatorCreditPage = p9.onOpenCreatorCreditPage,
					onOpenGetUsersPage = p9.onOpenGetUsersPage,
					isUniversePublic = if fFlagEnableBuildAdPromotionModule then p9.isUniversePublic else nil
				})
			}),
			SubagentStatus = if taskState and p9.hasTaskGroups then reactModule.createElement(scrollView, {
				LayoutOrder = 2,
				tag = "composition-content-header size-full-0 auto-y padding-bottom-small",
				testId = "BuildChatPage.SubagentStatus",
				layout = {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, p9.statusChipGap)
				},
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.X,
					AutomaticSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromOffset(0, 0),
					ScrollingDirection = Enum.ScrollingDirection.X,
					scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility.None
				}
			}, v) else nil,
			Divider = reactModule.createElement(divider, {
				LayoutOrder = 3,
				testId = "BuildChatPage.HeaderDivider",
				Visible = p9.isChatScrollable
			})
		}),
		Messages = reactModule.createElement(scrollView, {
			LayoutOrder = 2,
			scrollingFrameRef = var16,
			onAbsoluteCanvasSizeChanged = p9.onChatViewportChanged,
			onAbsoluteWindowSizeChanged = p9.onChatViewportChanged,
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
			MessageColumn = reactModule.createElement(view, {
				testId = "BuildChatPage.MessageBody",
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, var14.Size.Size_800)
				},
				tag = {
					["composition-content-body"] = true,
					["size-full"] = p9.isChatEmpty and not var7,
					["size-full-0 auto-y padding-y-large"] = not p9.isChatEmpty or var7
				}
			}, selectedChipGroupName)
		}),
		AgentSpecSheet = if var1 and var8 then reactModule.createElement(var2, {
			specVersion = p9.agentSpecVersion,
			onSave = p9.setAgentSpecVersion,
			onClose = function()
				-- upvalues: var9 (write)
				var9(false)
			end
		}) else nil,
		Actions = reactModule.createElement(view, {
			LayoutOrder = 3,
			testId = "BuildChatPage.ActionLayout",
			tag = {
				["composition-layout-detail"] = true,
				["size-full-0 auto-y"] = true
			}
		}, { ActionBody = v_1 }),
		TodoBottomSheet = if taskState then reactModule.createElement(subagentStatusModule.TodoBottomSheet, {
			title = if var12 ~= nil then "" else var12.name,
			items = toTodoItems(var12),
			isOpen = var12 ~= nil,
			onClose = p9.onChipBottomSheetClose
		}) else nil,
		AdCampaignSheet = if fFlagBuildAdUpsellModule and p9.isAdUpsellVisible then reactModule.createElement(var5, {
			waitForCreateResult = true,
			useLocalRunDates = true,
			universeId = if fFlagBuildAdsManagerUniverseUrlModule then p9.target.universeId else nil,
			isOpen = p9.isAdCampaignSheetOpen,
			onClose = p9.onAdCampaignSheetClose,
			onCreate = p9.onAdCampaignSheetCreate,
			isCreatePending = p9.isAdUpsellCreatePending,
			hasCreateError = p9.hasAdCampaignCreateError,
			createErrorKind = p9.adCampaignCreateErrorKind,
			campaignDurationDays = p9.adCampaignDurationDays,
			estimatedPriceRobux = p9.adCampaignEstimatedPriceRobux,
			campaignOffers = p9.adCampaignOffers,
			runStartTimeMs = p9.adCampaignRunStartTimeMs,
			runEndTimeMs = p9.adCampaignRunEndTimeMs
		}) else nil,
		AgentAdCampaignSheet = if fFlagBuildAgentAdCampaignCardModule then reactModule.createElement(var5, {
			waitForCreateResult = true,
			useLocalRunDates = true,
			universeId = if fFlagBuildAdsManagerUniverseUrlModule then p9.target.universeId else nil,
			isOpen = p9.isAgentAdCampaignSheetOpen,
			onClose = p9.onAgentAdCampaignSheetClose,
			onCreate = p9.onAgentAdCampaignSheetCreate,
			isCreatePending = p9.isAgentAdCampaignCreatePending,
			hasCreateError = p9.hasAgentAdCampaignCreateError,
			createErrorKind = p9.agentAdCampaignCreateErrorKind,
			campaignOffers = p9.agentAdCampaignOffers,
			attemptedOption = p9.agentAdCampaignAttemptedOption,
			runStartTimeMs = p9.agentAdCampaignRunStartTimeMs
		}) else nil,
		AdCampaignCreatedToast = if fFlagBuildAdUpsellModule and p9.isAdCampaignCreatedToastVisible and p9.isAdUpsellVisible then reactModule.createElement(var6, {
			testId = "AdCampaignCreatedToast",
			actionText = if p9.onOpenGetUsersPage ~= nil then nil else var13.adCampaignCreatedView,
			onActionActivated = p9.onOpenGetUsersPage,
			onClose = p9.onAdCampaignCreatedToastDismiss,
			title = var13.adCampaignCreated
		}) else nil
	})
end