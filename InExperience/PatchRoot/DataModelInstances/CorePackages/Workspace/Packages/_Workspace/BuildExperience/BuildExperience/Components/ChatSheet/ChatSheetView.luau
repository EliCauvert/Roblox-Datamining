local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local buildEmptyStateModule = require(buildExperience.Components.BuildEmptyState.BuildEmptyState)
local chatActionsModule = require(buildExperience.Components.Chat.ChatActions)
local chatMessageListModule = require(buildExperience.Components.Chat.ChatMessageList)
local sheetModule = require(buildExperience.FoundationFork.Sheet)
local _ = require(buildExperience.Chat.chatTypes)
local _ = require(buildExperience.Chat.useChatSessionCore)

return function(p0) --[[ line: 37 | named "ChatSheetView" ]]
	-- upvalues: chatMessageListModule (ref), reactModule (ref), buildEmptyStateModule (ref), sheetModule (ref), chatActionsModule (ref)
	return reactModule.createElement(sheetModule.Root, {
		isOpen = p0.isOpen,
		snapPoints = p0.snapPoints,
		defaultSnapPointIndex = p0.defaultSnapPointIndex,
		onClose = p0.onClose
	}, {
		Content = reactModule.createElement(sheetModule.Content, { scrollingFrameRef = p0.scrollingFrameRef }, chatMessageListModule({
			messages = p0.messages,
			clockBinding = p0.clockBinding,
			emptyState = reactModule.createElement(buildEmptyStateModule),
			onPlaytest = p0.onPlaytest,
			isPlaytestLoading = p0.isPlaytestLoading
		})),
		Actions = reactModule.createElement(sheetModule.Actions, nil, {
			Footer = reactModule.createElement(chatActionsModule, {
				placeholder = "Describe an idea",
				composerText = p0.composerText,
				composerErrorText = p0.composerErrorText,
				onComposerChanged = p0.onComposerChanged,
				textBoxRef = p0.textBoxRef,
				isAssistantResponding = p0.isAssistantResponding,
				onSend = p0.onSend,
				onStop = p0.onStop
			})
		})
	})
end