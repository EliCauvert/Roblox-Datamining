local Parent = script.Parent.Parent
local _ = require(Parent.Enums.CaptureTriggerType)

return require(Parent.Parent.Rodux).makeActionCreator(script.Name, function(TriggerType)
	return { triggerType = TriggerType }
end)