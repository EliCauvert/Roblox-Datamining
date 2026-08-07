local t = {}
local findAvatarHeadshotById = require(script.Parent.Parent.connectors.PlayerConnector).findAvatarHeadshotById
local _ = require(script.Parent.Parent.generatedTypes)
t.default = {
	Player = {
		avatarHeadshot = function(p0, _, p1, _) --[[ line: 9 ]]
			-- upvalues: findAvatarHeadshotById (ref)
			return findAvatarHeadshotById(p0.id, p1.fetchImpl)
		end
	}
}

return t