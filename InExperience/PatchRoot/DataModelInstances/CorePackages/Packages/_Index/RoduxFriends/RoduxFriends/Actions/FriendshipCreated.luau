local parent = script.Parent.Parent
local _ = require(parent.roduxFriendsTypes)

return require(parent.Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { payload = { userId1 = p1, userId2 = p2 } }
end)