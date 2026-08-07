local parent = script.Parent.Parent
local _ = require(parent.roduxFriendsTypes)

return require(parent.Parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 9 ]]
	return { payload = p0 }
end)