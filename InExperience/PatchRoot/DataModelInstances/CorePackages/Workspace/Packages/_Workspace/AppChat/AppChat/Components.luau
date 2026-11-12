return {
	ChatConversation = require(script.ChatConversation),
	EventReceivers = require(script.EventReceivers),
	ExternalNavigationHandlerContainer = if require(script.Parent.Flags.getFFlagEnableModularExternalNavigationHandler)() then require(script.ExternalNavigationHandler.Container) else nil,
	Cells = require(script.Cells),
	ChatLanding = require(script.ChatLanding)
}