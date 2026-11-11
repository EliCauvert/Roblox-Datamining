local Parent = script.Parent.Parent
local _ = require(Parent.roduxFriendsTypes)

return require(Parent.Parent.Rodux).makeActionCreator(script.Name, function(Payload)
	return { payload = Payload }
end)