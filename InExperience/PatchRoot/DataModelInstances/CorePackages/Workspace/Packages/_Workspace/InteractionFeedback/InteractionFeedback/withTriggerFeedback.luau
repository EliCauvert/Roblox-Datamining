local parent = script:FindFirstAncestor("InteractionFeedback").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useTriggerFeedbackModule = require(script.Parent.useTriggerFeedback)

return function(p0) --[[ line: 8 | named "withTriggerFeedback" ]]
	-- upvalues: useTriggerFeedbackModule (ref), cryoModule (ref), reactModule (ref)
	return function(p1) --[[ line: 9 ]]
		-- upvalues: useTriggerFeedbackModule (copy), cryoModule (copy), reactModule (copy), p0 (ref)
		return reactModule.createElement(p0, cryoModule.Dictionary.join(p1, { triggerFeedback = useTriggerFeedbackModule() }))
	end
end