local parent = script.Parent.Parent
local _ = require(parent.Types)

return require(parent.Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { capture = p1, sessionId = p2 }
end)