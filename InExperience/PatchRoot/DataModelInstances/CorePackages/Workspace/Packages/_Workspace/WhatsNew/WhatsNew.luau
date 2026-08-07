local loadWhatsNewRegistryModule = require(script.registry.LoadWhatsNewRegistry)

return {
	["jest.config"] = script["jest.config"],
	Constants = require(script.Constants),
	Enums = require(script.Enums),
	scopeActions = require(script.registry.ScopeActions),
	Loader = {
		validateRegistry = require(script.registry.validateRegistry),
		loadWhatsNewRegistry = loadWhatsNewRegistryModule.loadWhatsNewRegistry,
		loadBundledRegistry = loadWhatsNewRegistryModule.loadBundledRegistry
	},
	GetWhatsNewStore = require(script.store.GetWhatsNewStore),
	useWhatsNewRuntimeState = require(script.hooks.useWhatsNewRuntimeState),
	WhatsNewAnchor = require(script.components.WhatsNewAnchor),
	WhatsNewScreenHost = require(script.components.WhatsNewScreenHost),
	WhatsNewTourtip = require(script.components.WhatsNewTourtip),
	EntryStorage = require(script.storage.EntryStorage),
	createInGameWhatsNewHost = require(script.createInGameWhatsNewHost).createInGameWhatsNewHost
}