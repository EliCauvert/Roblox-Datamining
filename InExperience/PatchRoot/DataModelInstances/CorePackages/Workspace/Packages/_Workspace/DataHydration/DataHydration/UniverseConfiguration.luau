local universeConfigurationStoreTypesModule = require(script.UniverseConfigurationStoreTypes)

return {
	PrivacyType = universeConfigurationStoreTypesModule.PrivacyType,
	createUniverseConfigurationStore = require(script.createUniverseConfigurationStore),
	getUniverseConfigurationStore = require(script.getUniverseConfigurationStore),
	UniverseConfigurationStoreTypes = universeConfigurationStoreTypesModule
}