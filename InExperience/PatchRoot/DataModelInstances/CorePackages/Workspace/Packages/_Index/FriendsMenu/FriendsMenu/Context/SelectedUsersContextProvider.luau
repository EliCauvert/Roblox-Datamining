local parent = script.Parent
local parent_1 = parent.Parent.Parent
local selectedUsersContextModule = require(parent.SelectedUsersContext)
local reactModule = require(parent_1.React)
local cryoModule = require(parent_1.Cryo)
local userProfilesModule = require(parent_1.UserProfiles)

return function(p1)
	-- upvalues: userProfilesModule (ref), reactModule (ref), cryoModule (ref), selectedUsersContextModule (ref)
	local var1 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = p1.preselectedUsers or {},
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	local var2 = reactModule.useRef(if p1.preselectedUsers then #p1.preselectedUsers else 0)
	local var3, var4 = reactModule.useState(if p1.preselectedUsers then reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), userProfilesModule (copy), p1 (ref)
		local t = {}
		local var5 = ""
		
		for i, v in pairs(p2) do
			if var1.data then
				var5 = userProfilesModule.Selectors.getCombinedNameFromId(var1.data, v)
			end
			t[v] = {
				displayName = var5,
				layoutOrder = #t + 1,
				unremovable = p1.preselectedUsersUnremovable
			}
		end
		return t
	end, nil)(p1.preselectedUsers) else {})
	local var6, var7 = reactModule.useState(if p1.preselectedUsers then #p1.preselectedUsers else 0)
	local var8 = reactModule.useCallback(function(p3, p4)
		-- upvalues: p1 (ref), var6 (ref), var4 (ref), cryoModule (copy), var3 (ref), var2 (ref), var7 (ref)
		if p1.selectionLimit == nil or var6 < p1.selectionLimit then
			var4(cryoModule.Dictionary.join(var3, { [p3] = { displayName = p4, layoutOrder = var2.current } }))
			var2.current += 1
			var7(var6 + 1)
		end
	end, { var3 })
	local var9 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var4 (ref), cryoModule (copy), var3 (ref), var7 (ref), var6 (ref), p1 (ref)
		var4(cryoModule.Dictionary.join(var3, { [p3] = cryoModule.None }))
		var7(var6 - 1)
		
		if p1.onRemoveCallback then
			p1.onRemoveCallback(p3, p4)
		end
	end, { var3 })
	local var10 = reactModule.useCallback(function(p3)
		-- upvalues: var3 (ref)
		return var3[p3] ~= nil
	end, { var3 })
	
	return reactModule.createElement(selectedUsersContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var6 (ref), var3 (ref), var8 (ref), var9 (ref), var10 (ref), p1 (ref)
			return {
				selectedFriendsSize = var6,
				selectedFriends = var3,
				addFriend = var8,
				removeFriend = var9,
				isFriendSelected = var10,
				preselectedUsers = p1.preselectedUsers
			}
		end, { var3, var8, var9, var10 })
	}, p1.children)
end