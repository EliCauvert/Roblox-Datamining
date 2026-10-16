local UniverseActivationStoreTypesModule = require(script.UniverseActivationStoreTypes)

return {
	Audience = UniverseActivationStoreTypesModule.Audience,
	createUniverseActivationStore = require(script.createUniverseActivationStore),
	getUniverseActivationStore = require(script.getUniverseActivationStore),
	UniverseActivationStoreTypes = UniverseActivationStoreTypesModule
}