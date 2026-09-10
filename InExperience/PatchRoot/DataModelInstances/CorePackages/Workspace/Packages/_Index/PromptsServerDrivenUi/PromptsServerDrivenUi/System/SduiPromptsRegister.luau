local promptsServerDrivenUi = script:FindFirstAncestor("PromptsServerDrivenUi")
local parent = promptsServerDrivenUi.Parent
local reactModule = require(parent.React)
local fFlagLuaAppSduiMovePromptsActions = require(parent.SharedFlags).FFlagLuaAppSduiMovePromptsActions
local registerPromptsActionsModule = require(promptsServerDrivenUi.Actions.registerPromptsActions)
local registerPromptsImpressionsModule = require(promptsServerDrivenUi.Impressions.registerPromptsImpressions)

return reactModule.memo(function()
	-- upvalues: reactModule (ref), fFlagLuaAppSduiMovePromptsActions (ref), registerPromptsActionsModule (ref), registerPromptsImpressionsModule (ref)
	reactModule.useEffect(function()
		-- upvalues: fFlagLuaAppSduiMovePromptsActions (copy), registerPromptsActionsModule (copy), registerPromptsImpressionsModule (copy)
		if fFlagLuaAppSduiMovePromptsActions then
			registerPromptsActionsModule()
		end
		registerPromptsImpressionsModule()
	end, {})
	
	return nil
end)