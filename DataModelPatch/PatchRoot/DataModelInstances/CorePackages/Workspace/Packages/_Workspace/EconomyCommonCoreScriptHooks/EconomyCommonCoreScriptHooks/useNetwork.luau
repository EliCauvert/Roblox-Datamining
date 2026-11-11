local ReactModule = require(script:FindFirstAncestor("EconomyCommonCoreScriptHooks").Parent.React)
local NetworkContextModule = require(script.Parent.NetworkContext)

return function()
	-- upvalues: ReactModule (copy), NetworkContextModule (copy)
	return ReactModule.useContext(NetworkContextModule)
end