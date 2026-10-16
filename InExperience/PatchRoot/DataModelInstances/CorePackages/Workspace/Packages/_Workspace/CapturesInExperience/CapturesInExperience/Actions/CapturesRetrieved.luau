local Parent = script.Parent.Parent
local _ = require(Parent.Types)

return require(Parent.Parent.Rodux).makeActionCreator(script.Name, function(Captures, SelectedCapture) --[[ Line: 13 ]]
	return { captures = Captures, selectedCapture = SelectedCapture }
end)