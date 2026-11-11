local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local SelectedUsersContextModule = require(Parent.SelectedUsersContext)
local ReactModule = require(Parent1.React)
local CryoModule = require(Parent1.Cryo)
local UserProfilesModule = require(Parent1.UserProfiles)

return function(p1)
	-- upvalues: UserProfilesModule (copy), ReactModule (copy), CryoModule (copy), SelectedUsersContextModule (copy)
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = p1.preselectedUsers or {},
		query = UserProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	local UseResult = ReactModule.useCallback(function(List)
		-- upvalues: UseUserProfilesFetchResult (copy), UserProfilesModule (upval), p1 (copy)
		local t = {}
		local CombinedNameFromId = ""
		
		for _, value in pairs(List) do
			if UseUserProfilesFetchResult.data then
				CombinedNameFromId = UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, value)
			end
			t[value] = {
				displayName = CombinedNameFromId,
				layoutOrder = #t + 1,
				unremovable = p1.preselectedUsersUnremovable
			}
		end
		return t
	end, nil)
	local UseRefResult = ReactModule.useRef(if p1.preselectedUsers then #p1.preselectedUsers else 0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(if p1.preselectedUsers then UseResult(p1.preselectedUsers) else {})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(if p1.preselectedUsers then #p1.preselectedUsers else 0)
	local UseResult1 = ReactModule.useCallback(function(p2, DisplayName)
		-- upvalues: p1 (copy), UseStateResult1 (copy), UseStateResult2 (copy), CryoModule (upval), UseStateResult (copy), UseRefResult (copy), UseStateResult2_1 (copy)
		if p1.selectionLimit == nil or UseStateResult1 < p1.selectionLimit then
			UseStateResult2(CryoModule.Dictionary.join(UseStateResult, {
				[p2] = {
					displayName = DisplayName,
					layoutOrder = UseRefResult.current
				}
			}))
			UseRefResult.current += 1
			UseStateResult2_1(UseStateResult1 + 1)
		end
	end, { UseStateResult })
	local UseResult11 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseStateResult2 (copy), CryoModule (upval), UseStateResult (copy), UseStateResult2_1 (copy), UseStateResult1 (copy), p1 (copy)
		UseStateResult2(CryoModule.Dictionary.join(UseStateResult, { [p2] = CryoModule.None }))
		UseStateResult2_1(UseStateResult1 - 1)
		
		if p1.onRemoveCallback then
			p1.onRemoveCallback(p2, p3)
		end
	end, { UseStateResult })
	local UseResult2 = ReactModule.useCallback(function(p2): boolean
		-- upvalues: UseStateResult (copy)
		return UseStateResult[p2] ~= nil
	end, { UseStateResult })
	
	return ReactModule.createElement(SelectedUsersContextModule.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: UseStateResult1 (copy), UseStateResult (copy), UseResult1 (copy), UseResult11 (copy), UseResult2 (copy), p1 (copy)
			return {
				selectedFriendsSize = UseStateResult1,
				selectedFriends = UseStateResult,
				addFriend = UseResult1,
				removeFriend = UseResult11,
				isFriendSelected = UseResult2,
				preselectedUsers = p1.preselectedUsers
			}
		end, { UseStateResult, UseResult1, UseResult11, UseResult2 })
	}, p1.children)
end