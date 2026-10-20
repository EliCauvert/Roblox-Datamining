local _ = require(script.Parent.Parent.Types)

return function(p1, UserId): boolean
	return p1 ~= nil and UserId ~= nil and p1.userId == UserId
end