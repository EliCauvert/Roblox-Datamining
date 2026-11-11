local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ChatConstantsModule = require(BuildExperience.Chat.chatConstants)
local _ = require(BuildExperience.Chat.chatTypes)
local BuildEmptyStateModule = require(BuildExperience.Components.BuildEmptyState.BuildEmptyState)
local BuildOverflowMenuButtonModule = require(BuildExperience.Components.BuildPillMenu.BuildOverflowMenuButton)
local AgentDetailMenuModule = require(BuildExperience.Components.BuildPillMenu.AgentDetailMenu)
local PlayButtonModule = require(BuildExperience.Components.PlayButton.PlayButton)
local ChatActionsModule = require(BuildExperience.Components.Chat.ChatActions)
local ChatMessageListModule = require(BuildExperience.Components.Chat.ChatMessageList)
local SubagentStatusModule = require(BuildExperience.Components.SubagentStatus)
local _ = require(BuildExperience.Stores.GetBuildOverflowMenuStore)
local _ = require(BuildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local _ = require(BuildExperience.Chat.useChatSessionCore)
local IconButton = FoundationModule.IconButton
local ScrollView = FoundationModule.ScrollView
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local SubagentTaskStatus = require(Parent.DataHydration.CreatorAgentChat).SubagentTaskStatus

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

return function(p3)
	-- upvalues: ChatMessageListModule (copy), ReactModule (copy), BuildEmptyStateModule (copy), SubagentTaskStatus (copy), SubagentStatusModule (copy), View (copy), IconButton (copy), IconName (copy), InputSize (copy), Text (copy), ChatConstantsModule (copy), PlayButtonModule (copy), ButtonVariant (copy), AgentDetailMenuModule (copy), BuildOverflowMenuButtonModule (copy), ScrollView (copy), FoundationModule (copy), ChatActionsModule (copy), toTodoItems (copy)
	local TaskState = p3.taskState
	local SelectedChipGroupName = p3.selectedChipGroupName
	local v1 = nil
	
	if TaskState == nil or SelectedChipGroupName == nil then
		v1 = nil
	else
		v1 = nil
		
		for _, group in TaskState.groups do
			if group.name == SelectedChipGroupName then
				v1 = group
				break
			end
		end
	end
	local ChatMessageListModuleResult = ChatMessageListModule({
		messages = p3.messages,
		clockBinding = p3.clockBinding,
		localToolActions = p3.localToolActions,
		emptyState = ReactModule.createElement(BuildEmptyStateModule),
		onPlaytest = p3.onPlaytest,
		isPlaytestLoading = p3.isPlaytestLoading
	})
	local Elements = {}
	
	if p3.taskState ~= nil then
		for LayoutOrder, group1 in p3.taskState.groups do
			local InProgress = if group1.isLoading then SubagentTaskStatus.InProgress elseif group1.isComplete then SubagentTaskStatus.Done else SubagentTaskStatus.Pending
			Elements[`Group{LayoutOrder}`] = ReactModule.createElement(SubagentStatusModule.Root, {
				layoutOrder = LayoutOrder,
				text = group1.name,
				isChecked = group1.isComplete,
				onActivated = function()
					-- upvalues: p3 (copy), group1 (copy)
					p3.onChipActivated(group1.name)
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
		onAbsolutePositionChanged = p3.onPageMetricsChanged,
		onAbsoluteSizeChanged = p3.onPageMetricsChanged,
		padding = { bottom = UDim.new(0, p3.paddingBottom) }
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
				Back = ReactModule.createElement(IconButton, {
					LayoutOrder = 1,
					isCircular = true,
					testId = "BuildChatPage.BackButton",
					icon = IconName.ChevronLargeLeft,
					onActivated = p3.onClose,
					size = InputSize.Medium
				}),
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "fill text-heading-small text-align-x-left text-truncate-split content-emphasis",
					Text = if p3.isNewGameTarget then ChatConstantsModule.BUILD_CHAT_PAGE_TITLE else p3.target.experienceName
				}),
				Play = ReactModule.createElement(PlayButtonModule, {
					LayoutOrder = 3,
					isActive = true,
					activeIcon = IconName.PlaySmall,
					inActiveIcon = IconName.PlaySmall,
					isDisabled = p3.isNewGameTarget and not p3.hasPublishedTurn,
					onActivated = p3.onPlayActivated,
					variant = ButtonVariant.Utility
				}),
				AgentDetail = ReactModule.createElement(AgentDetailMenuModule, {
					layoutOrder = 4,
					isDisabled = not p3.hasTaskGroups,
					onActivated = p3.onOpenAgentsPage
				}),
				Overflow = ReactModule.createElement(BuildOverflowMenuButtonModule, {
					layoutOrder = 5,
					icon = IconName.ThreeDotsHorizontal,
					isDisabled = p3.target.universeId == nil,
					hasPublishedTurn = p3.hasPublishedTurn,
					target = {
						universeId = p3.target.universeId,
						placeId = p3.target.placeId,
						sessionId = p3.target.sessionId,
						isNewGameTarget = p3.isNewGameTarget
					},
					store = p3.buildOverflowMenuStore,
					onClose = p3.onClose,
					onAction = p3.onOverflowMenuAction
				})
			}),
			SubagentStatus = if p3.hasTaskGroups then ReactModule.createElement(ScrollView, {
				LayoutOrder = 2,
				tag = "composition-content-header size-full-0 auto-y padding-bottom-small",
				testId = "BuildChatPage.SubagentStatus",
				layout = {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, p3.statusChipGap)
				},
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.X,
					AutomaticSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromOffset(0, 0),
					ScrollingDirection = Enum.ScrollingDirection.X,
					scrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility.None
				}
			}, Elements) else nil
		}),
		Messages = ReactModule.createElement(ScrollView, {
			LayoutOrder = 2,
			tag = "fill size-full-0",
			scrollingFrameRef = p3.scrollingFrameRef,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, {
			MessageColumn = ReactModule.createElement(View, {
				testId = "BuildChatPage.MessageBody",
				Size = if p3.isChatEmpty then UDim2.fromScale(1, 1) else nil,
				tag = {
					["composition-content-body col size-full"] = p3.isChatEmpty,
					["composition-content-body col gap-medium size-full-0 auto-y padding-y-large"] = not p3.isChatEmpty
				}
			}, ChatMessageListModuleResult)
		}),
		Actions = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "composition-content-body size-full-0 auto-y",
			testId = "BuildChatPage.ActionBody"
		}, {
			Footer = ReactModule.createElement(ChatActionsModule, {
				placeholder = "Describe an idea",
				composerText = p3.composerText,
				composerErrorText = p3.composerErrorText,
				onComposerChanged = p3.onComposerChanged,
				textBoxRef = p3.textBoxRef,
				isAssistantResponding = p3.isAssistantResponding,
				canStopAssistantResponse = p3.canStopAssistantResponse,
				onSend = p3.onSend,
				onStop = p3.onStop
			})
		}),
		TodoBottomSheet = ReactModule.createElement(SubagentStatusModule.TodoBottomSheet, {
			title = if v1 == nil then "" else v1.name,
			items = toTodoItems(v1),
			isOpen = v1 ~= nil,
			onClose = p3.onChipBottomSheetClose
		})
	})
end