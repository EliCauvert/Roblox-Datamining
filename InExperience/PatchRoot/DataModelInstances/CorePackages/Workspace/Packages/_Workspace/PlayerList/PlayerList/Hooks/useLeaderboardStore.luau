local Parent = script.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local LeaderboardStoreContextModule = require(Parent.Common.LeaderboardStoreContext)

return function() --[[ Line: 8 | Named "useLeaderboardStore" ]]
	-- upvalues: ReactModule (copy), LeaderboardStoreContextModule (copy)
	return (ReactModule.useContext(LeaderboardStoreContextModule))
end