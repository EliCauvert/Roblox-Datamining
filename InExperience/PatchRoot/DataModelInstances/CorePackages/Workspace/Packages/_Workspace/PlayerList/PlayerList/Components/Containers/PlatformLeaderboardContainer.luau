local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local PlatformLeaderboardsClientModule = require(Parent1.PlatformLeaderboardsClient)
local PlatformLeaderboardStoreContextModule = require(Parent.Common.PlatformLeaderboardStoreContext)
local FFlagPlatformLeaderboardPersistStoreOnRemount = require(Parent1.SharedFlags).FFlagPlatformLeaderboardPersistStoreOnRemount
local PlatformLeaderboardClientStore = PlatformLeaderboardsClientModule.PlatformLeaderboardClientStore

return ReactModule.memo(function(p1)
	-- upvalues: FFlagPlatformLeaderboardPersistStoreOnRemount (copy), PlatformLeaderboardsClientModule (copy), ReactModule (copy), PlatformLeaderboardClientStore (copy), PlatformLeaderboardStoreContextModule (copy)
	local PlatformLeaderboardClientStore1 = if FFlagPlatformLeaderboardPersistStoreOnRemount and p1.store == nil then PlatformLeaderboardsClientModule.getPlatformLeaderboardClientStore() else nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagPlatformLeaderboardPersistStoreOnRemount (upval), p1 (copy), PlatformLeaderboardClientStore (upval)
		return if FFlagPlatformLeaderboardPersistStoreOnRemount or p1.store ~= nil or not PlatformLeaderboardClientStore then nil else PlatformLeaderboardClientStore.new()
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: FFlagPlatformLeaderboardPersistStoreOnRemount (upval), UseMemoResult (copy)
		return function()
			-- upvalues: FFlagPlatformLeaderboardPersistStoreOnRemount (upval), UseMemoResult (upval)
			if not FFlagPlatformLeaderboardPersistStoreOnRemount and UseMemoResult then
				UseMemoResult:destroy()
			end
		end
	end, { UseMemoResult })
	local Store = p1.store or (PlatformLeaderboardClientStore1 or UseMemoResult)
	
	return if Store == nil then p1.children else ReactModule.createElement(PlatformLeaderboardStoreContextModule.Provider, { value = Store }, p1.children)
end)