local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local platformLeaderboardsClientModule = require(parent_1.PlatformLeaderboardsClient)
local platformLeaderboardStoreContextModule = require(parent.Common.PlatformLeaderboardStoreContext)
local fFlagPlatformLeaderboardPersistStoreOnRemount = require(parent_1.SharedFlags).FFlagPlatformLeaderboardPersistStoreOnRemount
local platformLeaderboardClientStore = platformLeaderboardsClientModule.PlatformLeaderboardClientStore

return reactModule.memo(function(p1)
	-- upvalues: fFlagPlatformLeaderboardPersistStoreOnRemount (ref), platformLeaderboardsClientModule (ref), reactModule (ref), platformLeaderboardClientStore (ref), platformLeaderboardStoreContextModule (ref)
	local var1 = if fFlagPlatformLeaderboardPersistStoreOnRemount and p1.store == nil then platformLeaderboardsClientModule.getPlatformLeaderboardClientStore() else nil
	local var2 = reactModule.useMemo(function()
		-- upvalues: fFlagPlatformLeaderboardPersistStoreOnRemount (copy), p1 (ref), platformLeaderboardClientStore (copy)
		return if fFlagPlatformLeaderboardPersistStoreOnRemount or p1.store ~= nil or not platformLeaderboardClientStore then nil else platformLeaderboardClientStore.new()
	end, {})
	reactModule.useEffect(function()
		-- upvalues: fFlagPlatformLeaderboardPersistStoreOnRemount (copy), var2 (ref)
		return function()
			-- upvalues: fFlagPlatformLeaderboardPersistStoreOnRemount (copy), var2 (copy)
			if not fFlagPlatformLeaderboardPersistStoreOnRemount and var2 then
				var2:destroy()
			end
		end
	end, { var2 })
	local store = p1.store or (var1 or var2)
	
	return if store == nil then p1.children else reactModule.createElement(platformLeaderboardStoreContextModule.Provider, { value = store }, p1.children)
end)