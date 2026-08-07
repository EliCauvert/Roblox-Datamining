local IXPService = game:GetService("IXPService")
local reactModule = require(script:FindFirstAncestor("RoactAppExperiment").Parent.React)
local experimentContextModule = require(script.Parent.ExperimentContext)

return function() --[[ line: 8 | named "useIXPService" ]]
	-- upvalues: reactModule (ref), experimentContextModule (ref), IXPService (ref)
	local var3 = reactModule.useContext(experimentContextModule)
	
	return var3 or IXPService
end