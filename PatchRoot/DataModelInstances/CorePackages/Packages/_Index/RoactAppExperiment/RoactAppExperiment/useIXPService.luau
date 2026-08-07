-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:59 2026 Pacific Standard Time.

local IXPService = game:GetService("IXPService")
local reactModule = require(script:FindFirstAncestor("RoactAppExperiment").Parent.React)
local experimentContextModule = require(script.Parent.ExperimentContext)

return function() --[[ line: 8 | named "useIXPService" ]]
	-- upvalues: reactModule (ref), experimentContextModule (ref), IXPService (ref)
	local var3 = reactModule.useContext(experimentContextModule)
	
	return var3 or IXPService
end