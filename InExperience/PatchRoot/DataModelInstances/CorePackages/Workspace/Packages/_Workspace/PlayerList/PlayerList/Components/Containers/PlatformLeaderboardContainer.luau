local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local platformLeaderboardsClientModule = require(parent_1.PlatformLeaderboardsClient)
local platformLeaderboardStoreContextModule = require(parent.Common.PlatformLeaderboardStoreContext)
local fFlagPlatformLeaderboardPersistStoreOnRemount = require(parent_1.SharedFlags).FFlagPlatformLeaderboardPersistStoreOnRemount
local platformLeaderboardClientStore = platformLeaderboardsClientModule.PlatformLeaderboardClientStore

return reactModule.memo(function(p0) --[[ line: 19 ]]
	-- upvalues: fFlagPlatformLeaderboardPersistStoreOnRemount (ref), platformLeaderboardsClientModule (ref), reactModule (ref), platformLeaderboardClientStore (ref), platformLeaderboardStoreContextModule (ref)
	local var3 = if fFlagPlatformLeaderboardPersistStoreOnRemount and p0.store == nil then platformLeaderboardsClientModule.getPlatformLeaderboardClientStore() else nil
	local var4 = reactModule.useMemo(function() --[[ line: 26 ]]
		-- upvalues: fFlagPlatformLeaderboardPersistStoreOnRemount (copy), p0 (ref), platformLeaderboardClientStore (copy)
		return if fFlagPlatformLeaderboardPersistStoreOnRemount or p0.store ~= nil or not platformLeaderboardClientStore then nil else platformLeaderboardClientStore.new()
	end, {})
	reactModule.useEffect(function() --[[ line: 34 ]]
		-- upvalues: fFlagPlatformLeaderboardPersistStoreOnRemount (copy), var4 (ref)
		return function() --[[ line: 35 ]]
			-- upvalues: fFlagPlatformLeaderboardPersistStoreOnRemount (copy), var4 (copy)
			if not fFlagPlatformLeaderboardPersistStoreOnRemount and var4 then
				var4:destroy()
			end
		end
	end, { var4 })
	local store = p0.store or (var3 or var4)
	
	return if store == nil then p0.children else reactModule.createElement(platformLeaderboardStoreContextModule.Provider, { value = store }, p0.children)
end)