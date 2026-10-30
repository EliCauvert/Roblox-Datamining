local UserProfileStore = require(script:FindFirstAncestor("FriendsChat").Parent.UserProfiles).Stores.UserProfileStore
local _ = require(script.Parent.NameInfo)

local function resolveProfileNameInfo(p1, p2)
	if p1 == nil or p1.names == nil then
		return { name = nil, username = nil }
	else
		local GetCombinedNameFunction = p1.names.getCombinedName
		local GetDisplayNameFunction = p1.names.getDisplayName
		local GetUsernameFunction = p1.names.getUsername
		local Username = if GetUsernameFunction then GetUsernameFunction(p2) else nil
		local CombinedName = if GetCombinedNameFunction then GetCombinedNameFunction(p2) else nil
		local DisplayName = if GetDisplayNameFunction then GetDisplayNameFunction(p2) else nil
		
		return {
			name = if CombinedName == nil or CombinedName == "" then if DisplayName == nil or DisplayName == "" then Username else DisplayName else CombinedName,
			username = Username
		}
	end
end

return function(List, p1)
	-- upvalues: UserProfileStore (copy), resolveProfileNameInfo (copy)
	local List1 = {}
	local t = {}
	local List2 = {}
	
	for _, value in List do
		if not t[value] then
			t[value] = true
			table.insert(List1, value)
			table.insert(List2, (tostring(value)))
		end
	end
	local v1 = UserProfileStore.get().fetchNamesByUserIds(List2)(p1)
	local Data = if v1 and v1.data then v1.data else {}
	local t1 = {}
	
	for i, value1 in List1 do
		t1[value1] = resolveProfileNameInfo(Data[i], p1)
	end
	return t1
end