local SearchTypes = require(script:FindFirstAncestor("DiscoveryUtils").Parent.RobloxAppEnums).SearchTypes

return function(Auto): boolean
	-- upvalues: SearchTypes (copy)
	return Auto == SearchTypes.Games or Auto == SearchTypes.Players or Auto == SearchTypes.Auto or Auto == SearchTypes.TopResults
end