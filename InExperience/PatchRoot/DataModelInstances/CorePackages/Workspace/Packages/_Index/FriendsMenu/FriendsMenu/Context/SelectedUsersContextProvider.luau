local parent = script.Parent
local parent_1 = parent.Parent.Parent
local selectedUsersContextModule = require(parent.SelectedUsersContext)
local reactModule = require(parent_1.React)
local cryoModule = require(parent_1.Cryo)
local userProfilesModule = require(parent_1.UserProfiles)

return function(p0)
	-- upvalues: userProfilesModule (ref), reactModule (ref), cryoModule (ref), selectedUsersContextModule (ref)
	local var4 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = p0.preselectedUsers or {},
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	local var5 = reactModule.useRef(if p0.preselectedUsers then #p0.preselectedUsers else 0)
	local var6, var7 = reactModule.useState(if p0.preselectedUsers then reactModule.useCallback(function(p1)
		-- upvalues: var4 (ref), userProfilesModule (copy), p0 (ref)
		local t = {}
		local var14 = ""
		
		for i, v in pairs(p1) do
			if var4.data then
				var14 = userProfilesModule.Selectors.getCombinedNameFromId(var4.data, v)
			end
			t[v] = {
				displayName = var14,
				layoutOrder = #t + 1,
				unremovable = p0.preselectedUsersUnremovable
			}
		end
		return t
	end, nil)(p0.preselectedUsers) else {})
	local var8, var9 = reactModule.useState(if p0.preselectedUsers then #p0.preselectedUsers else 0)
	local var10 = reactModule.useCallback(function(p2, p3)
		-- upvalues: p0 (ref), var8 (ref), var7 (ref), cryoModule (copy), var6 (ref), var5 (ref), var9 (ref)
		if p0.selectionLimit == nil or var8 < p0.selectionLimit then
			var7(cryoModule.Dictionary.join(var6, { [p2] = { displayName = p3, layoutOrder = var5.current } }))
			var5.current += 1
			var9(var8 + 1)
		end
	end, { var6 })
	local var11 = reactModule.useCallback(function(p4, p5)
		-- upvalues: var7 (ref), cryoModule (copy), var6 (ref), var9 (ref), var8 (ref), p0 (ref)
		var7(cryoModule.Dictionary.join(var6, { [p4] = cryoModule.None }))
		var9(var8 - 1)
		
		if p0.onRemoveCallback then
			p0.onRemoveCallback(p4, p5)
		end
	end, { var6 })
	local var12 = reactModule.useCallback(function(p6)
		-- upvalues: var6 (ref)
		return var6[p6] ~= nil
	end, { var6 })
	
	return reactModule.createElement(selectedUsersContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var8 (ref), var6 (ref), var10 (ref), var11 (ref), var12 (ref), p0 (ref)
			return {
				selectedFriendsSize = var8,
				selectedFriends = var6,
				addFriend = var10,
				removeFriend = var11,
				isFriendSelected = var12,
				preselectedUsers = p0.preselectedUsers
			}
		end, { var6, var10, var11, var12 })
	}, p0.children)
end