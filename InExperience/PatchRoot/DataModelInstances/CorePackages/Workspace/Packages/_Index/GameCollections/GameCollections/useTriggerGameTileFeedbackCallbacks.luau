local Parent = script:FindFirstAncestor("GameCollections").Parent
local ReactModule = require(Parent.React)
local UseTriggerFeedbackFunction = require(Parent.InteractionFeedback).useTriggerFeedback
local _ = require(Parent.InteractionFeedback)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local FFlagLuaAppSduiGameTileInteractionFeedback = require(Parent.SharedFlags).FFlagLuaAppSduiGameTileInteractionFeedback

return function(p1)
	-- upvalues: FFlagLuaAppSduiGameTileInteractionFeedback (copy), UseTriggerFeedbackFunction (copy), ReactModule (copy), DiscoveryEventErrorLogger (copy)
	local UseTriggerFeedbackResult = if FFlagLuaAppSduiGameTileInteractionFeedback then p1 else UseTriggerFeedbackFunction()
	local UseRefResult = ReactModule.useRef(nil)
	
	return ReactModule.useCallback(function(p2)
		-- upvalues: FFlagLuaAppSduiGameTileInteractionFeedback (upval), UseTriggerFeedbackResult (copy), DiscoveryEventErrorLogger (upval), UseRefResult (copy)
		local GuiState = p2.GuiState
		
		if FFlagLuaAppSduiGameTileInteractionFeedback and not UseTriggerFeedbackResult then
			DiscoveryEventErrorLogger.reportError("GameTileMissingTriggerFeedback", "useTriggerGameTileFeedbackCallbacks called without triggerFeedbackFn; interaction feedback is disabled")
			
			return
		end
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
		-- upvalues: FFlagLuaAppSduiGameTileInteractionFeedback (upval), UseTriggerFeedbackResult (copy), DiscoveryEventErrorLogger (upval), UseRefResult (copy)
		if FFlagLuaAppSduiGameTileInteractionFeedback and not UseTriggerFeedbackResult then
			DiscoveryEventErrorLogger.reportError("GameTileMissingTriggerFeedback", "useTriggerGameTileFeedbackCallbacks called without triggerFeedbackFn; interaction feedback is disabled")
			
			return
		end
		if UseRefResult.current == Enum.GuiState.Press then
			UseTriggerFeedbackResult("Default", "Release")
		end
		UseRefResult.current = Enum.GuiState.Idle
	end, { UseTriggerFeedbackResult, UseRefResult }))
end