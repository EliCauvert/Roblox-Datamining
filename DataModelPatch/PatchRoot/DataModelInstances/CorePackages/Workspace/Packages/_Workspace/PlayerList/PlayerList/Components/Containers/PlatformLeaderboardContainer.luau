local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local PlatformLeaderboardStoreContextModule = require(Parent.Common.PlatformLeaderboardStoreContext)
local PlatformLeaderboardClientStore = require(Parent1.PlatformLeaderboardsClient).PlatformLeaderboardClientStore

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), PlatformLeaderboardClientStore (copy), PlatformLeaderboardStoreContextModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), PlatformLeaderboardClientStore (upval)
		return if p1.store == nil and PlatformLeaderboardClientStore then PlatformLeaderboardClientStore.new() else nil
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval)
			if UseMemoResult then
				UseMemoResult:destroy()
			end
		end
	end, { UseMemoResult })
	local Store = p1.store or UseMemoResult
	
	return if Store == nil then p1.children else ReactModule.createElement(PlatformLeaderboardStoreContextModule.Provider, { value = Store }, p1.children)
end)