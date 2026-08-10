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
local var4 = if fFlagUserListPresenceStoreMigrationModule then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local var5 = if fFlagUserListPresenceStoreMigrationModule then require(parent.DataHydration).Presence.PresenceEnums.PresenceType else nil
local userProfileStoreDataFetchFix = game:DefineFastFlag("UserProfileStoreDataFetchFix", false)
local userRowModule = require(script.Parent.UserRow)

return function(p0) --[[ line: 34 | named "UserRowWrapper" ]]
	-- upvalues: reactModule (ref), useEffect (ref), userProfileStore (ref), userProfileStoreDataFetchFix (ref), fFlagUserListPresenceStoreMigrationModule (ref), var4 (ref), useSelector (ref), getDeepValue (ref), RODUX_KEY (ref), presenceType (ref), var5 (ref), userPresence (ref), userRowModule (ref)
	local var8 = reactModule.useCallback(function() --[[ line: 35 ]]
		-- upvalues: p0 (ref)
		p0.onActivated(p0.userId)
	end, { p0.onActivated, p0.userId })
	local var9, var10 = reactModule.useState("")
	local var11, var12 = reactModule.useState("")
	useEffect(function() --[[ line: 42 ]]
		-- upvalues: userProfileStore (copy), p0 (ref), userProfileStoreDataFetchFix (copy), var10 (ref), var12 (ref)
		userProfileStore.get().fetchNamesByUserIds({ tostring(p0.userId) }, function(p1) --[[ line: 43 ]]
			-- upvalues: userProfileStoreDataFetchFix (copy), var10 (copy), var12 (copy)
			local data
			if userProfileStoreDataFetchFix then
				data = p1.data
				
				if p1.status == "success" and #data > 0 and (data[1] and data[1].names) then
					local username = data[1].names.getUsername(false)
					var10(data[1].names.getCombinedName(false))
					var12(username)
					
					return
				end
			else
				data = p1.data
				
				if p1.status == "success" then
					local username = data[1].names.getUsername(false)
					var10(data[1].names.getCombinedName(false))
					var12(username)
				end
			end
		end)
	end, { p0.userId })
	local var13 = if fFlagUserListPresenceStoreMigrationModule then var4(p0.userId) else useSelector(function(p2) --[[ line: 66 ]]
		-- upvalues: getDeepValue (copy), RODUX_KEY (copy), p0 (ref)
		return getDeepValue(p2, string.format("%s.Presence.byUserId.%s", RODUX_KEY, p0.userId)) or {}
	end)
	
	return reactModule.createElement(userRowModule, {
		userId = p0.userId,
		userPresence = if fFlagUserListPresenceStoreMigrationModule then reactModule.useMemo(function() --[[ line: 79 ]]
			-- upvalues: var13 (ref), var5 (copy), userPresence (copy)
			local userPresenceType = var13 and var13.userPresenceType
			
			return if if userPresenceType ~= var5.Online then if userPresenceType ~= var5.InStudio then userPresenceType == var5.InGame else true else true then userPresence.Active else userPresence.None
		end, { var13 }) elseif if fFlagUserListPresenceStoreMigrationModule then nil elseif var13.userPresenceType ~= presenceType.Online then if var13.userPresenceType ~= presenceType.InStudio then var13.userPresenceType == presenceType.InGame else true else true then userPresence.Active else userPresence.None,
		displayName = var9,
		username = var11,
		onActivated = var8
	})
end