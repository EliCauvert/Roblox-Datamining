local Parent = script.Parent.Parent
local _ = require(Parent.Types)

return require(Parent.Parent.Rodux).makeActionCreator(script.Name, function(SelectedCaptures) --[[ Line: 12 ]]
	return { selectedCaptures = SelectedCaptures }
end)