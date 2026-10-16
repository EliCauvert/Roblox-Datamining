local IXPService = game:GetService("IXPService")
local ReactModule = require(script:FindFirstAncestor("RoactAppExperiment").Parent.React)
local ExperimentContextModule = require(script.Parent.ExperimentContext)

return function() --[[ Line: 8 | Named "useIXPService" ]]
	-- upvalues: ReactModule (copy), ExperimentContextModule (copy), IXPService (copy)
	local UseContextResult = ReactModule.useContext(ExperimentContextModule)
	
	return if UseContextResult then UseContextResult else IXPService
end