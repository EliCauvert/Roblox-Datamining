local fFlagNewUpsellModalExperimentModule = require(script.Parent.Parent.Parent.Flags.FFlagNewUpsellModalExperiment)
local newUpsellModalExperimentForPlatform = game:DefineFastFlag("NewUpsellModalExperimentForPlatform", false)

return function() --[[ line: 7 ]]
	-- upvalues: fFlagNewUpsellModalExperimentModule (ref), newUpsellModalExperimentForPlatform (ref)
	return fFlagNewUpsellModalExperimentModule or newUpsellModalExperimentForPlatform
end