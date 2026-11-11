local Parent = script.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local PlatformLeaderboardStoreContextModule = require(Parent.Common.PlatformLeaderboardStoreContext)

return function()
	-- upvalues: ReactModule (copy), PlatformLeaderboardStoreContextModule (copy)
	return (ReactModule.useContext(PlatformLeaderboardStoreContextModule))
end