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
local userProfileStoreDataFetchFix = game:DefineFastFlag("UserProfileStoreDataFetchFix", false)
local userRowModule = require(script.Parent.UserRow)

return function(p0) --[[ line: 27 | named "UserRowWrapper" ]]
	-- upvalues: reactModule (ref), useEffect (ref), userProfileStore (ref), userProfileStoreDataFetchFix (ref), useSelector (ref), getDeepValue (ref), RODUX_KEY (ref), presenceType (ref), userPresence (ref), userRowModule (ref)
	local var5 = reactModule.useCallback(function() --[[ line: 28 ]]
		-- upvalues: p0 (ref)
		p0.onActivated(p0.userId)
	end, { p0.onActivated, p0.userId })
	local var6, var7 = reactModule.useState("")
	local var8, var9 = reactModule.useState("")
	useEffect(function() --[[ line: 35 ]]
		-- upvalues: userProfileStore (copy), p0 (ref), userProfileStoreDataFetchFix (copy), var7 (ref), var9 (ref)
		userProfileStore.get().fetchNamesByUserIds({ tostring(p0.userId) }, function(p1) --[[ line: 36 ]]
			-- upvalues: userProfileStoreDataFetchFix (copy), var7 (copy), var9 (copy)
			local data
			if userProfileStoreDataFetchFix then
				data = p1.data
				
				if p1.status == "success" and #data > 0 and (data[1] and data[1].names) then
					local username = data[1].names.getUsername(false)
					var7(data[1].names.getCombinedName(false))
					var9(username)
					
					return
				end
			else
				data = p1.data
				
				if p1.status == "success" then
					local username = data[1].names.getUsername(false)
					var7(data[1].names.getCombinedName(false))
					var9(username)
				end
			end
		end)
	end, { p0.userId })
	local var10 = useSelector(function(p2) --[[ line: 57 ]]
		-- upvalues: getDeepValue (copy), RODUX_KEY (copy), p0 (ref)
		return getDeepValue(p2, string.format("%s.Presence.byUserId.%s", RODUX_KEY, p0.userId)) or {}
	end)
	
	return reactModule.createElement(userRowModule, {
		userId = p0.userId,
		userPresence = if if var10.userPresenceType ~= presenceType.Online then if var10.userPresenceType ~= presenceType.InStudio then var10.userPresenceType == presenceType.InGame else true else true then userPresence.Active else userPresence.None,
		displayName = var6,
		username = var8,
		onActivated = var5
	})
end