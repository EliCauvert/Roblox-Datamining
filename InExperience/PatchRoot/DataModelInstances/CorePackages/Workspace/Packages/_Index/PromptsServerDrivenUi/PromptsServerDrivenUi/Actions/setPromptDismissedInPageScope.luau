local getSduiClientPageScope = require(script:FindFirstAncestor("PromptsServerDrivenUi").Parent.SduiCoreSystem).getSduiClientPageScope

return function(value, p1)
	-- upvalues: getSduiClientPageScope (ref)
	local var1 = getSduiClientPageScope(value)
	local dismissedPromptTypes = var1.get("dismissedPromptTypes")
	local var2 = if typeof(dismissedPromptTypes) == "table" then table.clone(dismissedPromptTypes) else {}
	var2[p1] = true
	var1.set("dismissedPromptTypes", var2)
end