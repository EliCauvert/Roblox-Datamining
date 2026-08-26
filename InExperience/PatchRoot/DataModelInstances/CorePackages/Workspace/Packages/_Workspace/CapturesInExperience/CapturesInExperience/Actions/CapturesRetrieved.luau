local parent = script.Parent.Parent
local _ = require(parent.Types)

return require(parent.Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { captures = p1, selectedCapture = p2 }
end)