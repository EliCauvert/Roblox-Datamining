local WhatsNew = script:FindFirstAncestor("WhatsNew")
local Registry = WhatsNew.registry
local _ = require(WhatsNew.Types)
local CreateMockScopeActionsModule = require(script.Parent.createMockScopeActions)
local CreatePilotScopeActionsModule = require(Registry.testHelpers.createPilotScopeActions)
local CreatePreStorageDepsModule = require(Registry.testHelpers.CreatePreStorageDeps)
local GetWhatsNewStoreModule = require(WhatsNew.store.GetWhatsNewStore)
local LoadWhatsNewRegistryModule = require(Registry.LoadWhatsNewRegistry)
local MakeRegistryModule = require(Registry.testHelpers.MakeRegistry)
local _ = require(Registry.ScopeActions)

return function(p1)
	-- upvalues: CreatePreStorageDepsModule (copy), MakeRegistryModule (copy), CreateMockScopeActionsModule (copy), CreatePilotScopeActionsModule (copy), LoadWhatsNewRegistryModule (copy), GetWhatsNewStoreModule (copy)
	local P0 = p1 or {}
	local RegistryOrOptions = P0.registryOrOptions
	local PreStorageDeps = CreatePreStorageDepsModule.createPreStorageDeps()
	local InExperienceNestedResult = if RegistryOrOptions == nil then MakeRegistryModule.inExperienceNested() elseif RegistryOrOptions.constants == nil then MakeRegistryModule.makeRegistry(RegistryOrOptions) else RegistryOrOptions
	local Spies = nil
	local ScopeActions = nil
	
	if P0.useMockScopeActions then
		local MockScopeActionsModule = CreateMockScopeActionsModule()
		ScopeActions = MockScopeActionsModule.scopeActions
		Spies = MockScopeActionsModule.spies
	else
		ScopeActions = CreatePilotScopeActionsModule()
	end
	local WhatsNewRegistry = LoadWhatsNewRegistryModule.loadWhatsNewRegistry(InExperienceNestedResult, PreStorageDeps, { scopeActions = ScopeActions })
	local WhatsNewStoreModule = GetWhatsNewStoreModule()
	WhatsNewStoreModule.resetForTests()
	WhatsNewStoreModule.initialize({
		rootTourMap = WhatsNewRegistry,
		scopeActions = ScopeActions
	})
	
	return {
		store = WhatsNewStoreModule,
		rootTourMap = WhatsNewRegistry,
		scopeActions = ScopeActions,
		spies = Spies
	}
end