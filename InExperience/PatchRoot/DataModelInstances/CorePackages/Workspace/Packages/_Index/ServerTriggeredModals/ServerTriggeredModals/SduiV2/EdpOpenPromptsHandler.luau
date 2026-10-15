local parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local promptsHandler = require(script.Parent.PromptsHandler).PromptsHandler
local promptsEntryPointModule = require(script.Parent.PromptsEntryPoint)
local fFlagPromptsEdpOpenReplaceOnFetch = sharedFlagsModule.FFlagPromptsEdpOpenReplaceOnFetch

return function(p1)
	-- upvalues: reactModule (ref), promptsHandler (ref), promptsEntryPointModule (ref), fFlagPromptsEdpOpenReplaceOnFetch (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return if p1.universeId == nil then nil else { universeId = p1.universeId }
	end, { p1.universeId })
	
	return if var1 == nil then nil else reactModule.createElement(promptsHandler, {
		entryPoint = promptsEntryPointModule.ExperienceDetailsPageOpen,
		clientAttributes = var1,
		replaceOnFetch = if fFlagPromptsEdpOpenReplaceOnFetch then true else nil
	})
end