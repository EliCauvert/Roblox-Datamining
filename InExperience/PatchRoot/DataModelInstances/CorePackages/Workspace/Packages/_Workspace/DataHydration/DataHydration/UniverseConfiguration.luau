local universeConfigurationStoreTypesModule = require(script.UniverseConfigurationStoreTypes)

return {
	PrivacyType = universeConfigurationStoreTypesModule.PrivacyType,
	getPrivacyTypeForAudiences = require(script.getPrivacyTypeForAudiences),
	createUniverseConfigurationStore = require(script.createUniverseConfigurationStore),
	getUniverseConfigurationStore = require(script.getUniverseConfigurationStore),
	UniverseConfigurationStoreTypes = universeConfigurationStoreTypesModule
}