local FindAvatarHeadshotByIdFunction = require(script.Parent.Parent.connectors.PlayerConnector).findAvatarHeadshotById
local _ = require(script.Parent.Parent.generatedTypes)

return {
	default = {
		Player = {
			avatarHeadshot = function(p1, _, p2, _) --[[ Line: 9 ]]
				-- upvalues: FindAvatarHeadshotByIdFunction (copy)
				return FindAvatarHeadshotByIdFunction(p1.id, p2.fetchImpl)
			end
		}
	}
}