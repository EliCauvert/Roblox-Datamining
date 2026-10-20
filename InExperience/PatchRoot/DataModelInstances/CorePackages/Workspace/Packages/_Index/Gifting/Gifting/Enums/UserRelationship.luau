local UserRelationshipModule = {
	Unknown = "Unknown",
	Friend = "Friend",
	NonFriend = "NonFriend"
}
local t = {}

for _, value in pairs(UserRelationshipModule) do
	t[value] = true
end
function UserRelationshipModule.fromValue(p1)
	-- upvalues: t (copy)
	return if p1 == nil or not t[p1] then nil else p1
end

return UserRelationshipModule