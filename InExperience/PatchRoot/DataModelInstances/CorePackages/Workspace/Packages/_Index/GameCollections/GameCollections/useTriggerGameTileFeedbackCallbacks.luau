local parent = script:FindFirstAncestor("GameCollections").Parent
local reactModule = require(parent.React)
local useTriggerFeedback = require(parent.InteractionFeedback).useTriggerFeedback

return function() --[[ line: 8 | named "useTriggerGameTileFeedbackCallbacks" ]]
	-- upvalues: useTriggerFeedback (ref), reactModule (ref)
	local var1 = useTriggerFeedback()
	local var2 = reactModule.useRef(nil)
	
	return reactModule.useCallback(function(p0) --[[ line: 11 ]]
		-- upvalues: var2 (ref), var1 (ref)
		local guiState = p0.GuiState
		
		if var2.current == Enum.GuiState.Press then
			var1("Default", "Release")
		end
		if guiState == Enum.GuiState.Hover then
			var1("Default", "Hover")
		end
		if guiState == Enum.GuiState.Press then
			var1("Default", "Press")
		end
		var2.current = guiState
	end, { var1, var2 }), reactModule.useCallback(function() --[[ line: 25 ]]
		-- upvalues: var2 (ref), var1 (ref)
		if var2.current == Enum.GuiState.Press then
			var1("Default", "Release")
		end
		var2.current = Enum.GuiState.Idle
	end, { var1, var2 })
end