local parent = script.Parent.Parent
local _ = require(parent.Types)

return require(parent.Parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 13 ]]
	return { capture = p0 }
end)