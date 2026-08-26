local parent = script.Parent.Parent
local _ = require(parent.roduxFriendsTypes)

return require(parent.Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { payload = p1 }
end)