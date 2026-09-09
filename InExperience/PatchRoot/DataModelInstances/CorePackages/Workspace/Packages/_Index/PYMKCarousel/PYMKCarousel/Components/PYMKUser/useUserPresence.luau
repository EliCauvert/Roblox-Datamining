local parent = script.Parent.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local parent_1 = parent.Parent
local react = dependenciesModule.React
local userListModule = require(parent_1.UserList)
local useSelector = dependenciesModule.Hooks.useSelector
local getDeepValue = dependenciesModule.SocialLibraries.Dictionary.getDeepValue
local entityType = userListModule.Enums.EntityType
local fFlagPymkCarouselPresenceStoreMigrationModule = require(parent.Flags.FFlagPymkCarouselPresenceStoreMigration)
local var1 = if fFlagPymkCarouselPresenceStoreMigrationModule then require(parent_1.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local dataHydrationModule = require(parent_1.DataHydration)
local var2 = if fFlagPymkCarouselPresenceStoreMigrationModule then dataHydrationModule.Presence.PresenceEnums.PresenceType else nil
local var3 = if fFlagPymkCarouselPresenceStoreMigrationModule then dataHydrationModule.Presence.PresenceStore.get() else nil
local t = { skipFetch = true }

return function(p1)
	-- upvalues: fFlagPymkCarouselPresenceStoreMigrationModule (ref), react (ref), entityType (ref), var3 (ref), var1 (ref), t (ref), var2 (ref), useSelector (ref), getDeepValue (ref)
	if fFlagPymkCarouselPresenceStoreMigrationModule then
		react.useEffect(function()
			-- upvalues: p1 (ref), entityType (copy), var3 (copy)
			if p1.forceFetchUserPresence > 0 and p1.entityType ~= entityType.Contact then
				var3.RefreshPresenceByUserId(tostring(p1.userId))
			end
		end, { p1.forceFetchUserPresence, p1.userId, p1.entityType })
		local var4 = var1(tostring(p1.userId), t)
		
		return if var4 then var4.userPresenceType else var2.Offline
	end
	local var5 = useSelector(function(p2)
		-- upvalues: getDeepValue (copy), p1 (ref)
		return getDeepValue(p2, string.format("PYMKCarousel.Presence.byUserId.%s", p1.userId)) or {}
	end)
	
	return react.useMemo(function()
		-- upvalues: var5 (ref)
		return if var5 and var5.userPresenceType then string.gsub(tostring(var5.userPresenceType), "PresenceType%.", "") else "Offline"
	end, { var5 })
end