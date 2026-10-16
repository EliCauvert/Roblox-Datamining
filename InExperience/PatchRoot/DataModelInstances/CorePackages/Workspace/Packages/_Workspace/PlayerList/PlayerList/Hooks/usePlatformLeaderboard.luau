local Parent = script.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local PlatformLeaderboardStoreContextModule = require(Parent.Common.PlatformLeaderboardStoreContext)

return function() --[[ Line: 8 | Named "usePlatformLeaderboard" ]]
	-- upvalues: ReactModule (copy), PlatformLeaderboardStoreContextModule (copy)
	return (ReactModule.useContext(PlatformLeaderboardStoreContextModule))
end