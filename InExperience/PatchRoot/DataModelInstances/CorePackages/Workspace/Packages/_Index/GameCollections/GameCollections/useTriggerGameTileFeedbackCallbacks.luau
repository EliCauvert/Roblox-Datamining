local Parent = script:FindFirstAncestor("GameCollections").Parent
local ReactModule = require(Parent.React)
local UseTriggerFeedbackFunction = require(Parent.InteractionFeedback).useTriggerFeedback

return function() --[[ Line: 8 | Named "useTriggerGameTileFeedbackCallbacks" ]]
	-- upvalues: UseTriggerFeedbackFunction (copy), ReactModule (copy)
	local UseTriggerFeedbackResult = UseTriggerFeedbackFunction()
	local UseRefResult = ReactModule.useRef(nil)
	
	return ReactModule.useCallback(function(p1) --[[ Line: 11 ]]
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
	end, { UseTriggerFeedbackResult, UseRefResult }), (ReactModule.useCallback(function() --[[ Line: 25 ]]
		-- upvalues: UseRefResult (copy), UseTriggerFeedbackResult (copy)
		if UseRefResult.current == Enum.GuiState.Press then
			UseTriggerFeedbackResult("Default", "Release")
		end
		UseRefResult.current = Enum.GuiState.Idle
	end, { UseTriggerFeedbackResult, UseRefResult }))
end