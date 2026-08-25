local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local leaderboardStoreContextModule = require(parent.Common.LeaderboardStoreContext)

return function()
	-- upvalues: reactModule (ref), leaderboardStoreContextModule (ref)
	return reactModule.useContext(leaderboardStoreContextModule)
end