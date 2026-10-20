local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local BuildEmptyStateModule = require(BuildExperience.Components.BuildEmptyState.BuildEmptyState)
local BuildPillMenuPortalModule = require(BuildExperience.Components.BuildPillMenu.BuildPillMenuPortal)
local ChatActionsModule = require(BuildExperience.Components.Chat.ChatActions)
local ChatMessageListModule = require(BuildExperience.Components.Chat.ChatMessageList)
local SheetModule = require(BuildExperience.FoundationFork.Sheet)
local _ = require(BuildExperience.Chat.chatTypes)
local _ = require(BuildExperience.Chat.useChatSessionCore)

return function(p1)
	-- upvalues: ChatMessageListModule (copy), ReactModule (copy), BuildEmptyStateModule (copy), SheetModule (copy), ChatActionsModule (copy), BuildPillMenuPortalModule (copy)
	return ReactModule.createElement(SheetModule.Root, {
		isOpen = p1.isOpen,
		snapPoints = p1.snapPoints,
		defaultSnapPointIndex = p1.defaultSnapPointIndex,
		onClose = p1.onClose
	}, {
		Content = ReactModule.createElement(SheetModule.Content, { scrollingFrameRef = p1.scrollingFrameRef }, (ChatMessageListModule({
			messages = p1.messages,
			clockBinding = p1.clockBinding,
			localToolActions = p1.localToolActions,
			emptyState = ReactModule.createElement(BuildEmptyStateModule),
			onPlaytest = p1.onPlaytest,
			isPlaytestLoading = p1.isPlaytestLoading
		}))),
		Actions = ReactModule.createElement(SheetModule.Actions, nil, {
			Footer = ReactModule.createElement(ChatActionsModule, {
				placeholder = "Describe an idea",
				composerText = p1.composerText,
				composerErrorText = p1.composerErrorText,
				onComposerChanged = p1.onComposerChanged,
				textBoxRef = p1.textBoxRef,
				isAssistantResponding = p1.isAssistantResponding,
				canStopAssistantResponse = p1.canStopAssistantResponse,
				onSend = p1.onSend,
				onStop = p1.onStop
			})
		}),
		TopBarPillMenu = if p1.topBarPillMenuTarget == nil then nil else ReactModule.createElement(BuildPillMenuPortalModule, {
			testId = "build-pill-menu",
			target = p1.topBarPillMenuTarget
		})
	})
end