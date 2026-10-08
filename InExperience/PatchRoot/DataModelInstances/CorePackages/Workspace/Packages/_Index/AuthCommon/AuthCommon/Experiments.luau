local useAuthEntryVariantModule = require(script.useAuthEntryVariant)

return {
	enrolledInLuafiedRecoveryExperiment = require(script.enrolledInLuafiedRecoveryExperiment),
	AuthEntryVariant = useAuthEntryVariantModule.AuthEntryVariant,
	resolveAuthEntryVariant = useAuthEntryVariantModule.resolveAuthEntryVariant,
	useAuthEntryVariant = useAuthEntryVariantModule.useAuthEntryVariant
}