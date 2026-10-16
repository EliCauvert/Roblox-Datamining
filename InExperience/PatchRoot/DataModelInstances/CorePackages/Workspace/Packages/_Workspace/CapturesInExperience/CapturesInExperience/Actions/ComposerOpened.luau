local Parent = script.Parent.Parent
local _ = require(Parent.Types)

return require(Parent.Parent.Rodux).makeActionCreator(script.Name, function(Capture) --[[ Line: 12 ]]
	return { capture = Capture }
end)