local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local GetFFlagUnreduxLastInputTypeChangedModule = require(ExpChat.Flags.getFFlagUnreduxLastInputTypeChanged)

return require(Parent.Rodux).combineReducers({
	ChatIntervention = require(script.ChatInterventionReducer),
	Messages = require(script.Messages),
	MutedUsers = ExpChatSharedModule.Reducers.MutedUsers,
	VerifiedUsers = if require(Parent.SharedFlags).FFlagEnableVerifiedBadgeStore then nil else require(script.VerifiedUsers),
	Players = ExpChatSharedModule.Reducers.Players,
	LocalCharacter = ExpChatSharedModule.Reducers.LocalCharacter,
	TextChannels = ExpChatSharedModule.Reducers.TextChannels,
	ChatVisibility = require(script.ChatVisibility),
	CanLocalUserChat = require(script.CanLocalUserChat),
	LocalTeam = ExpChatSharedModule.Reducers.LocalTeam,
	isUsingTouch = if GetFFlagUnreduxLastInputTypeChangedModule() then nil else require(script.isUsingTouch),
	isUsingGamepad = if GetFFlagUnreduxLastInputTypeChangedModule() then nil else require(script.isUsingGamepad),
	shouldFocusChatInputBar = require(script.shouldFocusChatInputBar),
	Voice = require(script.Voice),
	BubbleChatSettings = require(script.BubbleChat),
	LegacyBubbleChatSettings = require(script.BubbleChat.LegacyChatReducer),
	ChatLayout = require(script.ChatLayout),
	AutoCastCommands = ExpChatSharedModule.Reducers.AutoCastCommands,
	Adornees = require(script.Adornees),
	ClientSettings = require(script.ClientSettings),
	AutocompleteDropdown = require(ExpChat.Flags.getEnableChatInputBarConfigurationAutocompleteEnabled)() and require(script.AutocompleteDropdown) or nil,
	ChannelTabs = require(ExpChat.Flags.getFFlagExpChatEnableChannelTabsUI)() and require(script.ChannelTabs) or nil,
	ReverseNudgeToxicUsers = require(script.ReverseNudgeToxicUsers)
})