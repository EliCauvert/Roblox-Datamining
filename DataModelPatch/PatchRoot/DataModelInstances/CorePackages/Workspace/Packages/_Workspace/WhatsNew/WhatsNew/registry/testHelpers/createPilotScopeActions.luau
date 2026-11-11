local ScopeActionsModule = require(script:FindFirstAncestor("WhatsNew").registry.ScopeActions)

return function()
	-- upvalues: ScopeActionsModule (copy)
	local ScopeActions = ScopeActionsModule.createScopeActions()
	ScopeActions:register("OpenExperienceMenu", function() end)
	ScopeActions:register("CloseExperienceMenu", function() end)
	
	return ScopeActions
end