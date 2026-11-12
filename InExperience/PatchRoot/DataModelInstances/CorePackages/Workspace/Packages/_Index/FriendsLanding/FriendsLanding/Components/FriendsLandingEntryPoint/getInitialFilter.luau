local FilterStatesModule = require(script:FindFirstAncestor("FriendsLanding").Friends.filterStates)
local config = {
	all = FilterStatesModule.All,
	online = FilterStatesModule.Online,
	trusted = FilterStatesModule.Trusted
}

return function(Text: string)
	-- upvalues: FilterStatesModule (copy), config (copy)
	return if Text == nil then FilterStatesModule.All else config[string.lower(Text)] or FilterStatesModule.All
end