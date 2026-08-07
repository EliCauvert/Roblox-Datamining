local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local expChatSharedModule = require(parent.ExpChatShared)
local getFFlagUnreduxLastInputTypeChangedModule = require(expChat.Flags.getFFlagUnreduxLastInputTypeChanged)

return roduxModule.combineReducers({
	ChatIntervention = require(script.ChatInterventionReducer),
	Messages = require(script.Messages),
	MutedUsers = expChatSharedModule.Reducers.MutedUsers,
	VerifiedUsers = if require(parent.SharedFlags).FFlagEnableVerifiedBadgeStore then nil else require(script.VerifiedUsers),
	Players = expChatSharedModule.Reducers.Players,
	LocalCharacter = expChatSharedModule.Reducers.LocalCharacter,
	TextChannels = expChatSharedModule.Reducers.TextChannels,
	ChatVisibility = require(script.ChatVisibility),
	CanLocalUserChat = require(script.CanLocalUserChat),
	LocalTeam = expChatSharedModule.Reducers.LocalTeam,
	isUsingTouch = if not getFFlagUnreduxLastInputTypeChangedModule() then require(script.isUsingTouch) else nil,
	isUsingGamepad = if not getFFlagUnreduxLastInputTypeChangedModule() then require(script.isUsingGamepad) else nil,
	shouldFocusChatInputBar = require(script.shouldFocusChatInputBar),
	Voice = require(script.Voice),
	BubbleChatSettings = require(script.BubbleChat),
	LegacyBubbleChatSettings = require(script.BubbleChat.LegacyChatReducer),
	ChatLayout = require(script.ChatLayout),
	AutoCastCommands = expChatSharedModule.Reducers.AutoCastCommands,
	Adornees = require(script.Adornees),
	ClientSettings = require(script.ClientSettings),
	AutocompleteDropdown = require(expChat.Flags.getEnableChatInputBarConfigurationAutocompleteEnabled)() and require(script.AutocompleteDropdown) or nil,
	ChannelTabs = require(expChat.Flags.getFFlagExpChatEnableChannelTabsUI)() and require(script.ChannelTabs) or nil,
	ReverseNudgeToxicUsers = require(script.ReverseNudgeToxicUsers)
})