local Parent = script:FindFirstAncestor("InteractionFeedback").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseTriggerFeedbackModule = require(script.Parent.useTriggerFeedback)

return function(p1)
	-- upvalues: UseTriggerFeedbackModule (copy), CryoModule (copy), ReactModule (copy)
	return function(p2)
		-- upvalues: UseTriggerFeedbackModule (upval), CryoModule (upval), ReactModule (upval), p1 (copy)
		return ReactModule.createElement(p1, (CryoModule.Dictionary.join(p2, { triggerFeedback = UseTriggerFeedbackModule() })))
	end
end