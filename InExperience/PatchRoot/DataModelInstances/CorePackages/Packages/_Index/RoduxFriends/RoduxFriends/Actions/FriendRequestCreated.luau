local Parent = script.Parent.Parent
local _ = require(Parent.roduxFriendsTypes)

return require(Parent.Parent.Rodux).makeActionCreator(script.Name, function(p1) --[[ Line: 9 ]]
	return p1
end)