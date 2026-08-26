local t = {}
local findAvatarHeadshotById = require(script.Parent.Parent.connectors.PlayerConnector).findAvatarHeadshotById
local _ = require(script.Parent.Parent.generatedTypes)
t.default = {
	Player = {
		avatarHeadshot = function(p1, _, p2, _)
			-- upvalues: findAvatarHeadshotById (ref)
			return findAvatarHeadshotById(p1.id, p2.fetchImpl)
		end
	}
}

return t