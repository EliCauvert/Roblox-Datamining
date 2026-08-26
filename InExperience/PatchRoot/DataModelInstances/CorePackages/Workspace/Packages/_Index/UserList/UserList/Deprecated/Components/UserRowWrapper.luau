local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local userProfilesModule = require(parent.UserProfiles)
local useEffect = reactModule.useEffect
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local userProfileStore = userProfilesModule.Stores.UserProfileStore
local presenceType = require(userList.Rodux.RoduxPresence).Enums.PresenceType
local RODUX_KEY = require(userList.Common.Constants).RODUX_KEY
local getDeepValue = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local userPresence = require(parent.Foundation).Enums.UserPresence
local fFlagUserListPresenceStoreMigrationModule = require(userList.Flags.FFlagUserListPresenceStoreMigration)
local var1 = if fFlagUserListPresenceStoreMigrationModule then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local var2 = if fFlagUserListPresenceStoreMigrationModule then require(parent.DataHydration).Presence.PresenceEnums.PresenceType else nil
local userProfileStoreDataFetchFix = game:DefineFastFlag("UserProfileStoreDataFetchFix", false)
local userRowModule = require(script.Parent.UserRow)

return function(p1)
	-- upvalues: reactModule (ref), useEffect (ref), userProfileStore (ref), userProfileStoreDataFetchFix (ref), fFlagUserListPresenceStoreMigrationModule (ref), var1 (ref), useSelector (ref), getDeepValue (ref), RODUX_KEY (ref), presenceType (ref), var2 (ref), userPresence (ref), userRowModule (ref)
	local var3 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.onActivated(p1.userId)
	end, { p1.onActivated, p1.userId })
	local var4, var5 = reactModule.useState("")
	local var6, var7 = reactModule.useState("")
	useEffect(function()
		-- upvalues: userProfileStore (copy), p1 (ref), userProfileStoreDataFetchFix (copy), var5 (ref), var7 (ref)
		userProfileStore.get().fetchNamesByUserIds({ tostring(p1.userId) }, function(p2)
			-- upvalues: userProfileStoreDataFetchFix (copy), var5 (copy), var7 (copy)
			local data
			if userProfileStoreDataFetchFix then
				data = p2.data
				
				if p2.status == "success" and #data > 0 and (data[1] and data[1].names) then
					local username = data[1].names.getUsername(false)
					var5(data[1].names.getCombinedName(false))
					var7(username)
					
					return
				end
			else
				data = p2.data
				
				if p2.status == "success" then
					local username = data[1].names.getUsername(false)
					var5(data[1].names.getCombinedName(false))
					var7(username)
				end
			end
		end)
	end, { p1.userId })
	local var8 = if fFlagUserListPresenceStoreMigrationModule then var1(p1.userId) else useSelector(function(p2)
		-- upvalues: getDeepValue (copy), RODUX_KEY (copy), p1 (ref)
		return getDeepValue(p2, string.format("%s.Presence.byUserId.%s", RODUX_KEY, p1.userId)) or {}
	end)
	
	return reactModule.createElement(userRowModule, {
		userId = p1.userId,
		userPresence = if fFlagUserListPresenceStoreMigrationModule then reactModule.useMemo(function()
			-- upvalues: var8 (ref), var2 (copy), userPresence (copy)
			local userPresenceType = var8 and var8.userPresenceType
			
			return if if userPresenceType ~= var2.Online then if userPresenceType ~= var2.InStudio then userPresenceType == var2.InGame else true else true then userPresence.Active else userPresence.None
		end, { var8 }) elseif if fFlagUserListPresenceStoreMigrationModule then nil elseif var8.userPresenceType ~= presenceType.Online then if var8.userPresenceType ~= presenceType.InStudio then var8.userPresenceType == presenceType.InGame else true else true then userPresence.Active else userPresence.None,
		displayName = var4,
		username = var6,
		onActivated = var3
	})
end