local IXPService = game:GetService("IXPService")
local reactModule = require(script:FindFirstAncestor("RoactAppExperiment").Parent.React)
local experimentContextModule = require(script.Parent.ExperimentContext)

return function()
	-- upvalues: reactModule (ref), experimentContextModule (ref), IXPService (ref)
	local var1 = reactModule.useContext(experimentContextModule)
	
	return var1 or IXPService
end