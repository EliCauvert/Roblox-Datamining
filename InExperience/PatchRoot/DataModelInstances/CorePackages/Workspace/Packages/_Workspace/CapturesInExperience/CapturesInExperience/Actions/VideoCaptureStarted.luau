local parent = script.Parent.Parent
local _ = require(parent.Enums.CaptureTriggerType)

return require(parent.Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { triggerType = p1 }
end)