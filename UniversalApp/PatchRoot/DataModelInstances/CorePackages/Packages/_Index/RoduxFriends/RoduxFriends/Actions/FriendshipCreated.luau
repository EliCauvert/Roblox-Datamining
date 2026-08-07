local parent = script.Parent.Parent
local _ = require(parent.roduxFriendsTypes)

return require(parent.Parent.Rodux).makeActionCreator(script.Name, function(p0, p1) --[[ line: 7 ]]
	return { payload = { userId1 = p0, userId2 = p1 } }
end)