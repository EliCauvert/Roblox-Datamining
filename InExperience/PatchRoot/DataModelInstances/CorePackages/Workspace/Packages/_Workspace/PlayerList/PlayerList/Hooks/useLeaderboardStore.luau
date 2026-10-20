local Parent = script.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local LeaderboardStoreContextModule = require(Parent.Common.LeaderboardStoreContext)

return function()
	-- upvalues: ReactModule (copy), LeaderboardStoreContextModule (copy)
	return (ReactModule.useContext(LeaderboardStoreContextModule))
end