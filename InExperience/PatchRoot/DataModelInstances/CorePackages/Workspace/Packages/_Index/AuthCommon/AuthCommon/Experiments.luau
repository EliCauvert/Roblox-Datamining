local UseAuthEntryVariantModule = require(script.useAuthEntryVariant)

return {
	enrolledInLuafiedRecoveryExperiment = require(script.enrolledInLuafiedRecoveryExperiment),
	AuthEntryVariant = UseAuthEntryVariantModule.AuthEntryVariant,
	resolveAuthEntryVariant = UseAuthEntryVariantModule.resolveAuthEntryVariant,
	useAuthEntryVariant = UseAuthEntryVariantModule.useAuthEntryVariant
}