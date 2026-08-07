local reactModule = require(script:FindFirstAncestor("EconomyCommonCoreScriptHooks").Parent.React)
local networkContextModule = require(script.Parent.NetworkContext)

return function() --[[ line: 7 | named "useNetwork" ]]
	-- upvalues: reactModule (ref), networkContextModule (ref)
	return reactModule.useContext(networkContextModule)
end