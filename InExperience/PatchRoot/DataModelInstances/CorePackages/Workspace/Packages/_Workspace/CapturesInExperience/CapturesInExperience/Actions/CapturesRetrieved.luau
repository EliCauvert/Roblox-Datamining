local parent = script.Parent.Parent
local _ = require(parent.Types)

return require(parent.Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { captures = p0, selectedCapture = p1 }
end)