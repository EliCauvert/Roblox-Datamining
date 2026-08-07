local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local leaderboardStoreContextModule = require(parent.Common.LeaderboardStoreContext)

return function() --[[ line: 8 | named "useLeaderboardStore" ]]
	-- upvalues: reactModule (ref), leaderboardStoreContextModule (ref)
	return reactModule.useContext(leaderboardStoreContextModule)
end