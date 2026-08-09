local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local chatConstantsModule = require(buildExperience.Chat.chatConstants)
local _ = require(buildExperience.Chat.chatTypes)
local buildEmptyStateModule = require(buildExperience.Components.BuildEmptyState.BuildEmptyState)
local buildOverflowMenuButtonModule = require(buildExperience.Components.BuildPillMenu.BuildOverflowMenuButton)
local agentDetailMenuModule = require(buildExperience.Components.BuildPillMenu.AgentDetailMenu)
local playButtonModule = require(buildExperience.Components.PlayButton.PlayButton)
local chatActionsModule = require(buildExperience.Components.Chat.ChatActions)
local chatMessageListModule = require(buildExperience.Components.Chat.ChatMessageList)
local subagentStatusModule = require(buildExperience.Components.SubagentStatus)
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore)
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local _ = require(buildExperience.Chat.useChatSessionCore)
local iconButton = foundationModule.IconButton
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local subagentTaskStatus = creatorAgentChatModule.SubagentTaskStatus

local function _(p0, p1) --[[ line: 78 | named "findGroup" ]]
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

local _ = function(p2) --[[ line: 90 | named "getGroupStatus" ]]
	-- upvalues: subagentTaskStatus (ref)
	return if p2.isLoading then subagentTaskStatus.InProgress elseif p2.isComplete then subagentTaskStatus.Done else subagentTaskStatus.Pending
end

local function toTodoItems(p3) --[[ line: 100 ]]
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

return function(p4) --[[ line: 116 | named "BuildChatPageView" ]]
	-- upvalues: chatMessageListModule (ref), reactModule (ref), buildEmptyStateModule (ref), subagentTaskStatus (ref), subagentStatusModule (ref), view (ref), iconButton (ref), iconName (ref), inputSize (ref), text (ref), chatConstantsModule (ref), playButtonModule (ref), buttonVariant (ref), agentDetailMenuModule (ref), buildOverflowMenuButtonModule (ref), scrollView (ref), chatActionsModule (ref), toTodoItems (ref)
	local var14
	local taskState = p4.taskState
	local selectedChipGroupName = p4.selectedChipGroupName
	
	if taskState == nil or selectedChipGroupName == nil then
		var14 = nil
	else
		for i, v in taskState.groups do
			if v.name == selectedChipGroupName then
				var14 = v
			end
		end
		var14 = nil
	end
	taskState = chatMessageListModule({
		messages = p4.messages,
		clockBinding = p4.clockBinding,
		emptyState = reactModule.createElement(buildEmptyStateModule),
		onPlaytest = p4.onPlaytest,
		isPlaytestLoading = p4.isPlaytestLoading
	})
	selectedChipGroupName = {}
	
	if p4.taskState ~= nil then
		for i, v in p4.taskState.groups do
			local var15 = if v.isLoading then subagentTaskStatus.InProgress elseif v.isComplete then subagentTaskStatus.Done else subagentTaskStatus.Pending
			selectedChipGroupName[`Group{i}`] = reactModule.createElement(subagentStatusModule.Root, {
				layoutOrder = i,
				text = v.name,
				isChecked = v.isComplete,
				onActivated = function() --[[ line: 134 ]]
					-- upvalues: p4 (ref), v (ref)
					p4.onChipActivated(v.name)
				end,
				testId = `BuildChatPage.SubagentStatus.{v.name}`
			}, {
				Indicator = if var15 ~= subagentTaskStatus.Pending then nil else reactModule.createElement(subagentStatusModule.LoadingIndicator, {
					status = var15,
					testId = `BuildChatPage.SubagentStatus.{v.name}.Indicator`
				})
			})
		end
	end
	return reactModule.createElement(view, {
		tag = "col size-full bg-surface-0",
		onAbsolutePositionChanged = p4.onPageMetricsChanged,
		onAbsoluteSizeChanged = p4.onPageMetricsChanged
	}, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col size-full-0 auto-y bg-surface-0"
		}, {
			HeaderBar = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "row align-y-center gap-small size-full-0 auto-y padding-x-medium padding-y-medium"
			}, {
				Back = reactModule.createElement(iconButton, {
					LayoutOrder = 1,
					isCircular = true,
					testId = "BuildChatPage.BackButton",
					icon = iconName.ChevronLargeLeft,
					onActivated = p4.onClose,
					size = inputSize.Medium
				}),
				Title = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "fill text-heading-small text-align-x-left text-truncate-end content-emphasis",
					Text = chatConstantsModule.BUILD_CHAT_PAGE_TITLE
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
					isDisabled = not p4.hasTaskGroups,
					onActivated = p4.onOpenAgentsPage
				}),
				Overflow = reactModule.createElement(buildOverflowMenuButtonModule, {
					layoutOrder = 5,
					icon = iconName.ThreeDotsHorizontal,
					target = {
						universeId = p4.target.universeId,
						placeId = p4.target.placeId,
						sessionId = p4.target.sessionId,
						isNewGameTarget = p4.isNewGameTarget
					},
					store = p4.buildOverflowMenuStore,
					onClose = p4.onClose,
					onAction = p4.onOverflowMenuAction
				})
			}),
			SubagentStatus = if p4.hasTaskGroups then reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "row wrap align-y-center gap-small size-full-0 auto-y padding-x-medium padding-bottom-small",
				testId = "BuildChatPage.SubagentStatus"
			}, selectedChipGroupName) else nil
		}),
		Messages = reactModule.createElement(scrollView, {
			LayoutOrder = 2,
			tag = "fill size-full-0",
			scrollingFrameRef = p4.scrollingFrameRef,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, {
			MessageColumn = reactModule.createElement(view, {
				Size = if p4.isChatEmpty then UDim2.fromScale(1, 1) else nil,
				tag = {
					["col size-full"] = p4.isChatEmpty,
					["col gap-medium size-full-0 auto-y padding-x-medium padding-y-large"] = not p4.isChatEmpty
				}
			}, taskState)
		}),
		Actions = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "size-full-0 auto-y",
			padding = {
				left = UDim.new(0, p4.paddingLeft),
				right = UDim.new(0, p4.paddingRight),
				bottom = UDim.new(0, p4.paddingBottom)
			}
		}, {
			Footer = reactModule.createElement(chatActionsModule, {
				placeholder = "Describe an idea",
				composerText = p4.composerText,
				composerErrorText = p4.composerErrorText,
				onComposerChanged = p4.onComposerChanged,
				textBoxRef = p4.textBoxRef,
				isAssistantResponding = p4.isAssistantResponding,
				onSend = p4.onSend,
				onStop = p4.onStop
			})
		}),
		TodoBottomSheet = reactModule.createElement(subagentStatusModule.TodoBottomSheet, {
			title = if var14 ~= nil then "" else var14.name,
			items = toTodoItems(var14),
			isOpen = var14 ~= nil,
			onClose = p4.onChipBottomSheetClose
		})
	})
end