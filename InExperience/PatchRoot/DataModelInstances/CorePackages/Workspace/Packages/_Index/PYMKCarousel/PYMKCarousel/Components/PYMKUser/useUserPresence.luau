local Parent = script.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local Parent1 = Parent.Parent
local React = DependenciesModule.React
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue
local EntityType = require(Parent1.UserList).Enums.EntityType
local FFlagPymkCarouselPresenceStoreMigrationModule = require(Parent.Flags.FFlagPymkCarouselPresenceStoreMigration)
local UseGetPresenceByUserId = if FFlagPymkCarouselPresenceStoreMigrationModule then require(Parent1.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local DataHydrationModule = require(Parent1.DataHydration)
local PresenceType = if FFlagPymkCarouselPresenceStoreMigrationModule then DataHydrationModule.Presence.PresenceEnums.PresenceType else nil
local GetResult = if FFlagPymkCarouselPresenceStoreMigrationModule then DataHydrationModule.Presence.PresenceStore.get() else nil
local config = { skipFetch = true }

return function(p1) --[[ Line: 36 | Named "useUserPresence" ]]
	-- upvalues: FFlagPymkCarouselPresenceStoreMigrationModule (copy), React (copy), EntityType (copy), GetResult (copy), UseGetPresenceByUserId (copy), config (copy), PresenceType (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy)
	if FFlagPymkCarouselPresenceStoreMigrationModule then
		React.useEffect(function() --[[ Line: 38 ]]
			-- upvalues: p1 (copy), EntityType (upval), GetResult (upval)
			if p1.forceFetchUserPresence > 0 and p1.entityType ~= EntityType.Contact then
				GetResult.RefreshPresenceByUserId((tostring(p1.userId)))
			end
		end, { p1.forceFetchUserPresence, p1.userId, p1.entityType })
		local UseGetPresenceByUserIdResult = UseGetPresenceByUserId(tostring(p1.userId), config)
		
		return UseGetPresenceByUserIdResult and UseGetPresenceByUserIdResult.userPresenceType or PresenceType.Offline
	else
		local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 47 ]]
			-- upvalues: GetDeepValueFunction (upval), p1 (copy)
			return GetDeepValueFunction(p2, string.format("PYMKCarousel.Presence.byUserId.%s", p1.userId)) or {}
		end)
		
		return (React.useMemo(function(): string --[[ Line: 50 ]]
			-- upvalues: UseSelectorResult (copy)
			return if UseSelectorResult and UseSelectorResult.userPresenceType then string.gsub(tostring(UseSelectorResult.userPresenceType), "PresenceType%.", "") else "Offline"
		end, { UseSelectorResult }))
	end
end