local UniverseConfigurationStoreTypesModule = require(script.UniverseConfigurationStoreTypes)

return {
	PrivacyType = UniverseConfigurationStoreTypesModule.PrivacyType,
	getPrivacyTypeForAudiences = require(script.getPrivacyTypeForAudiences),
	createUniverseConfigurationStore = require(script.createUniverseConfigurationStore),
	getUniverseConfigurationStore = require(script.getUniverseConfigurationStore),
	UniverseConfigurationStoreTypes = UniverseConfigurationStoreTypesModule
}