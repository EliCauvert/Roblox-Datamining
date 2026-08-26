local parent = script:FindFirstAncestor("InteractionFeedback").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useTriggerFeedbackModule = require(script.Parent.useTriggerFeedback)

return function(p1)
	-- upvalues: useTriggerFeedbackModule (ref), cryoModule (ref), reactModule (ref)
	return function(p2)
		-- upvalues: useTriggerFeedbackModule (copy), cryoModule (copy), reactModule (copy), p1 (ref)
		return reactModule.createElement(p1, cryoModule.Dictionary.join(p2, { triggerFeedback = useTriggerFeedbackModule() }))
	end
end