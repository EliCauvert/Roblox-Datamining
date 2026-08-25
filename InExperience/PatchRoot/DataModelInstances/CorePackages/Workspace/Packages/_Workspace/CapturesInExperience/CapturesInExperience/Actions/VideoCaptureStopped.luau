local parent = script.Parent.Parent
local _ = require(parent.Enums.CaptureTriggerType)

return require(parent.Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return { triggerType = p0 }
end)