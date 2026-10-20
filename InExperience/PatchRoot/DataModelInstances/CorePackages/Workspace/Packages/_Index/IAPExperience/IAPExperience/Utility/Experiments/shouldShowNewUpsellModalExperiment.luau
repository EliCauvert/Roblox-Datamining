local FFlagNewUpsellModalExperimentModule = require(script.Parent.Parent.Parent.Flags.FFlagNewUpsellModalExperiment)
local NewUpsellModalExperimentForPlatform = game:DefineFastFlag("NewUpsellModalExperimentForPlatform", false)

return function()
	-- upvalues: FFlagNewUpsellModalExperimentModule (copy), NewUpsellModalExperimentForPlatform (copy)
	return FFlagNewUpsellModalExperimentModule or NewUpsellModalExperimentForPlatform
end