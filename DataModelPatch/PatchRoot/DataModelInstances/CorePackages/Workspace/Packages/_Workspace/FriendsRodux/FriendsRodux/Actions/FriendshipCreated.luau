local Parent = script.Parent.Parent
local _ = require(Parent.roduxFriendsTypes)

return require(Parent.Parent.Rodux).makeActionCreator(script.Name, function(UserId1, UserId2)
	return { payload = { userId1 = UserId1, userId2 = UserId2 } }
end)