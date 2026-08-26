local parent = script.Parent.Parent
local _ = require(parent.Types)

return require(parent.Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { capture = p1 }
end)