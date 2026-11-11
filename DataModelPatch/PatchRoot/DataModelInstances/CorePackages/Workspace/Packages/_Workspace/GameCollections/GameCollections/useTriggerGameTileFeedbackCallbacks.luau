local Parent = script:FindFirstAncestor("GameCollections").Parent
local ReactModule = require(Parent.React)
local UseTriggerFeedbackFunction = require(Parent.InteractionFeedback).useTriggerFeedback

return function()
	-- upvalues: UseTriggerFeedbackFunction (copy), ReactModule (copy)
	local UseTriggerFeedbackResult = UseTriggerFeedbackFunction()
	local UseRefResult = ReactModule.useRef(nil)
	
	return ReactModule.useCallback(function(p1)
		-- upvalues: UseRefResult (copy), UseTriggerFeedbackResult (copy)
		local GuiState = p1.GuiState
		
		if UseRefResult.current == Enum.GuiState.Press then
			UseTriggerFeedbackResult("Default", "Release")
		end
		if GuiState == Enum.GuiState.Hover then
			UseTriggerFeedbackResult("Default", "Hover")
		end
		if GuiState == Enum.GuiState.Press then
			UseTriggerFeedbackResult("Default", "Press")
		end
		UseRefResult.current = GuiState
	end, { UseTriggerFeedbackResult, UseRefResult }), (ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseTriggerFeedbackResult (copy)
		if UseRefResult.current == Enum.GuiState.Press then
			UseTriggerFeedbackResult("Default", "Release")
		end
		UseRefResult.current = Enum.GuiState.Idle
	end, { UseTriggerFeedbackResult, UseRefResult }))
end