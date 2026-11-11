local Parent = script:FindFirstAncestor("UserList").Parent
local ReactModule = require(Parent.React)
local UseEffectFunction = ReactModule.useEffect
local UserProfileStore = require(Parent.UserProfiles).Stores.UserProfileStore
local UserPresence = require(Parent.Foundation).Enums.UserPresence
local UseGetPresenceByUserIdFunction = require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId
local PresenceType = require(Parent.DataHydration).Presence.PresenceEnums.PresenceType
local UserRowModule = require(script.Parent.UserRow)

return function(p1)
	-- upvalues: ReactModule (copy), UseEffectFunction (copy), UserProfileStore (copy), UseGetPresenceByUserIdFunction (copy), PresenceType (copy), UserPresence (copy), UserRowModule (copy)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.onActivated(p1.userId)
	end, { p1.onActivated, p1.userId })
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	UseEffectFunction(function()
		-- upvalues: UserProfileStore (upval), p1 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy)
		UserProfileStore.get().fetchNamesByUserIds({ (tostring(p1.userId)) }, function(p2)
			-- upvalues: UseStateResult2 (upval), UseStateResult2_1 (upval)
			local Data = p2.data
			
			if p2.status == "success" and #Data > 0 and Data[1] and Data[1].names then
				local Username = Data[1].names.getUsername(false)
				UseStateResult2((Data[1].names.getCombinedName(false)))
				UseStateResult2_1(Username)
			end
		end)
	end, { p1.userId })
	local UseGetPresenceByUserIdResult = UseGetPresenceByUserIdFunction(p1.userId)
	
	return ReactModule.createElement(UserRowModule, {
		userId = p1.userId,
		userPresence = ReactModule.useMemo(function()
			-- upvalues: UseGetPresenceByUserIdResult (copy), PresenceType (upval), UserPresence (upval)
			local UserPresenceType = UseGetPresenceByUserIdResult and UseGetPresenceByUserIdResult.userPresenceType
			local IsUserPresenceTypeMatch: boolean = UserPresenceType == PresenceType.Online or (UserPresenceType == PresenceType.InStudio or UserPresenceType == PresenceType.InGame)
			
			return if IsUserPresenceTypeMatch then UserPresence.Active else UserPresence.None
		end, { UseGetPresenceByUserIdResult }),
		displayName = UseStateResult,
		username = UseStateResult1,
		onActivated = UseResult
	})
end