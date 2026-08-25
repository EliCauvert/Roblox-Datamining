local parent = script.Parent.Parent
local _ = require(parent.Types)

return require(parent.Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { capture = p0, sessionId = p1 }
end)