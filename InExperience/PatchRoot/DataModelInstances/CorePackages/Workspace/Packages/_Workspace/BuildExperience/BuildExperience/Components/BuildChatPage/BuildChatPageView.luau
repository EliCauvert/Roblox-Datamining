local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
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
local subagentStatusModule = require(buildExperience.Components.SubagentStatus)
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore)
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local _ = require(buildExperience.Chat.useChatSessionCore)
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local fFlagBuildExperienceAssetLibraryModule = require(buildExperience.Flags.FFlagBuildExperienceAssetLibrary)
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(buildExperience.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local fFlagEnableBuildOverflowMenuForNewGamesModule = require(buildExperience.Flags.FFlagEnableBuildOverflowMenuForNewGames)
local var20 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(buildExperience.Telemetry.useScrollPerformanceTracker) else nil
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

local function _(p0, p1)
	if p0 == nil or p1 == nil then
		return nil
	end
	for i, v in p0.groups do
		if v.name == p1 then
			return v
		end
	end
	return nil
end

local _ = function(p2)
	-- upvalues: subagentTaskStatus (ref)
	return if p2.isLoading then subagentTaskStatus.InProgress elseif p2.isComplete then subagentTaskStatus.Done else subagentTaskStatus.Pending
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
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), reactModule (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var20 (ref), chatMessageListModule (ref), buildEmptyStateModule (ref), pushNotificationsUpsellCardModule (ref), fFlagBuildExperienceAssetLibraryModule (ref), subagentTaskStatus (ref), subagentStatusModule (ref), view (ref), fFlagBuildDesktopReadinessModule (ref), buyMoreRobuxCardModule (ref), chatActionsModule (ref), iconButton (ref), iconName (ref), inputSize (ref), text (ref), chatConstantsModule (ref), playButtonModule (ref), buttonVariant (ref), agentDetailMenuModule (ref), buildOverflowMenuButtonModule (ref), fFlagEnableBuildOverflowMenuForNewGamesModule (ref), scrollView (ref), foundationModule (ref), divider (ref), toTodoItems (ref)
	local var23 = if fFlagBuildLocalization then useLocalization({
		composerPlaceholder = localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER
	}) else nil
	local var24 = useTokens()
	local var25 = reactModule.useRef(nil)
	
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var20("LuaApp_Build_Chat_Scroll", var25)
	end
	local var27, v
	local var26 = reactModule.useCallback(function(p5)
		-- upvalues: var25 (ref), p4 (ref)
		var25.current = p5
		p4.scrollingFrameRef(p5)
	end, { p4.scrollingFrameRef })
	local taskState = p4.taskState
	local selectedChipGroupName = p4.selectedChipGroupName
	
	if taskState == nil or selectedChipGroupName == nil then
		var27 = nil
	else
		for i, v in taskState.groups do
			if v.name == selectedChipGroupName then
				var27 = v
			end
		end
		var27 = nil
	end
	taskState = chatMessageListModule({
		messages = p4.messages,
		clockBinding = p4.clockBinding,
		localToolActions = p4.localToolActions,
		emptyState = reactModule.createElement(buildEmptyStateModule),
		isHistoryLoading = p4.isHistoryLoading,
		onPlaytest = p4.onPlaytest,
		isPlaytestLoading = p4.isPlaytestLoading
	})
	selectedChipGroupName = false
	
	for i, v in p4.messages do
		if v.kind == "user_message" then
			selectedChipGroupName = true
			break
		end
	end
	if p4.showPushNotificationsUpsell and selectedChipGroupName and p4.isAssistantResponding then
		taskState.PushNotificationsUpsell = reactModule.createElement(pushNotificationsUpsellCardModule, {
			LayoutOrder = #p4.messages + 1,
			isRequestPending = p4.isPushNotificationsRequestPending,
			shouldOpenSettings = p4.shouldOpenPushNotificationsSettings,
			onNotifyMe = p4.onNotifyMe,
			onOpenSettings = p4.onOpenPushNotificationsSettings,
			onNotNow = p4.onNotNow
		})
	end
	local t = {}
	
	if not fFlagBuildExperienceAssetLibraryModule and p4.taskState ~= nil then
		for v, v_2 in p4.taskState.groups do
			local var29 = if v_2.isLoading then subagentTaskStatus.InProgress elseif v_2.isComplete then subagentTaskStatus.Done else subagentTaskStatus.Pending
			t[`Group{v}`] = reactModule.createElement(subagentStatusModule.Root, {
				layoutOrder = v,
				text = v_2.name,
				isChecked = v_2.isComplete,
				onActivated = function()
					-- upvalues: p4 (ref), v_2 (ref)
					p4.onChipActivated(v_2.name)
				end,
				testId = `BuildChatPage.SubagentStatus.{v_2.name}`
			}, {
				Indicator = if var29 ~= subagentTaskStatus.Pending then nil else reactModule.createElement(subagentStatusModule.LoadingIndicator, {
					status = var29,
					testId = `BuildChatPage.SubagentStatus.{v_2.name}.Indicator`
				})
			})
		end
	end
	local var30 = reactModule.createElement(view, {
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
			placeholder = if fFlagBuildLocalization then var23.composerPlaceholder else localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER,
			textBoxRef = p4.textBoxRef,
			isAssistantResponding = p4.isAssistantResponding,
			canStopAssistantResponse = p4.canStopAssistantResponse,
			canSendWhileResponding = p4.canSendWhileResponding,
			onSend = p4.onSend,
			onStop = p4.onStop
		})
	})
	v = {
		tag = "col align-x-center size-full bg-surface-0",
		onAbsolutePositionChanged = p4.onPageMetricsChanged,
		onAbsoluteSizeChanged = p4.onPageMetricsChanged,
		padding = { bottom = UDim.new(0, p4.paddingBottom) }
	}
	
	return reactModule.createElement(view, v, {
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
				AgentDetail = reactModule.createElement(agentDetailMenuModule, {
					layoutOrder = 4,
					isDisabled = p4.isAgentDetailDisabled,
					icon = p4.agentDetailIcon,
					onActivated = p4.onOpenAgentsPage
				}),
				Overflow = reactModule.createElement(buildOverflowMenuButtonModule, {
					layoutOrder = 5,
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
					onOpenCreatorCreditPage = p4.onOpenCreatorCreditPage
				})
			}),
			SubagentStatus = if fFlagBuildExperienceAssetLibraryModule or not p4.hasTaskGroups then nil else reactModule.createElement(scrollView, {
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
			}, t),
			Divider = reactModule.createElement(divider, {
				LayoutOrder = 3,
				testId = "BuildChatPage.HeaderDivider",
				Visible = p4.isChatScrollable
			})
		}),
		Messages = reactModule.createElement(scrollView, {
			LayoutOrder = 2,
			scrollingFrameRef = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then var26 else p4.scrollingFrameRef,
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
					Padding = UDim.new(0, var24.Size.Size_800)
				},
				tag = {
					["composition-content-body"] = true,
					["size-full"] = p4.isChatEmpty,
					["size-full-0 auto-y padding-y-large"] = not p4.isChatEmpty
				}
			}, taskState)
		}),
		Actions = if fFlagBuildDesktopReadinessModule then reactModule.createElement(view, {
			LayoutOrder = 3,
			testId = "BuildChatPage.ActionLayout",
			tag = {
				["composition-layout-detail"] = true,
				["size-full-0 auto-y"] = true
			}
		}, { ActionBody = var30 }) else var30,
		TodoBottomSheet = reactModule.createElement(subagentStatusModule.TodoBottomSheet, {
			title = if var27 ~= nil then "" else var27.name,
			items = toTodoItems(var27),
			isOpen = var27 ~= nil,
			onClose = p4.onChipBottomSheetClose
		})
	})
end