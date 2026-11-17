local UseAuthEntryVariantModule = require(script.useAuthEntryVariant)

return {
	AuthEntryIxpGate = require(script.AuthEntryIxpGate),
	enrolledInLuafiedRecoveryExperiment = require(script.enrolledInLuafiedRecoveryExperiment),
	AuthEntryVariant = UseAuthEntryVariantModule.AuthEntryVariant,
	resolveAuthEntryVariant = UseAuthEntryVariantModule.resolveAuthEntryVariant,
	useAuthEntryVariant = UseAuthEntryVariantModule.useAuthEntryVariant
}