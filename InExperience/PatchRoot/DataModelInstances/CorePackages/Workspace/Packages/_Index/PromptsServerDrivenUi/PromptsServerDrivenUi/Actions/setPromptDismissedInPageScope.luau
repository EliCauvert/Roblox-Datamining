local GetSduiClientPageScopeFunction = require(script:FindFirstAncestor("PromptsServerDrivenUi").Parent.SduiCoreSystem).getSduiClientPageScope

return function(p1, Key)
	-- upvalues: GetSduiClientPageScopeFunction (copy)
	local SduiClientPageScope = GetSduiClientPageScopeFunction(p1)
	local DismissedPromptTypes = SduiClientPageScope.get("dismissedPromptTypes")
	local Copy = if typeof(DismissedPromptTypes) == "table" then table.clone(DismissedPromptTypes) else {}
	Copy[Key] = true
	SduiClientPageScope.set("dismissedPromptTypes", Copy)
end