local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local platformLeaderboardStoreContextModule = require(parent.Common.PlatformLeaderboardStoreContext)

return function() --[[ line: 8 | named "usePlatformLeaderboard" ]]
	-- upvalues: reactModule (ref), platformLeaderboardStoreContextModule (ref)
	return reactModule.useContext(platformLeaderboardStoreContextModule)
end