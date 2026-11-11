local WhatsNew = script:FindFirstAncestor("WhatsNew")
local ScopeActionsModule = require(WhatsNew.registry.ScopeActions)
local Jest = require(WhatsNew.Parent.Dev.JestGlobals).jest

return function()
	-- upvalues: Jest (copy), ScopeActionsModule (copy)
	local Spies = {
		OpenExperienceMenu = Jest.fn(),
		CloseExperienceMenu = Jest.fn(),
		OpenSettings = Jest.fn(),
		CloseSettings = Jest.fn()
	}
	
	return {
		scopeActions = ScopeActionsModule.createScopeActions(Spies),
		spies = Spies
	}
end