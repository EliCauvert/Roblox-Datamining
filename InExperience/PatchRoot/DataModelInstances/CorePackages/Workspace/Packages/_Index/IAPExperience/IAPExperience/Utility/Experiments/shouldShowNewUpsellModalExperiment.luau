local fFlagNewUpsellModalExperimentModule = require(script.Parent.Parent.Parent.Flags.FFlagNewUpsellModalExperiment)
local newUpsellModalExperimentForPlatform = game:DefineFastFlag("NewUpsellModalExperimentForPlatform", false)

return function()
	-- upvalues: fFlagNewUpsellModalExperimentModule (ref), newUpsellModalExperimentForPlatform (ref)
	return fFlagNewUpsellModalExperimentModule or newUpsellModalExperimentForPlatform
end