local Parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local ReactModule = require(Parent.React)
local PromptsHandler = require(script.Parent.PromptsHandler).PromptsHandler
local PromptsEntryPointModule = require(script.Parent.PromptsEntryPoint)
local FFlagPromptsEdpOpenReplaceOnFetch = require(Parent.SharedFlags).FFlagPromptsEdpOpenReplaceOnFetch

return function(p1) --[[ Line: 16 | Named "EdpOpenPromptsHandler" ]]
	-- upvalues: ReactModule (copy), PromptsHandler (copy), PromptsEntryPointModule (copy), FFlagPromptsEdpOpenReplaceOnFetch (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 17 ]]
		-- upvalues: p1 (copy)
		return if p1.universeId == nil then nil else { universeId = p1.universeId }
	end, { p1.universeId })
	
	return if UseMemoResult == nil then nil else ReactModule.createElement(PromptsHandler, {
		entryPoint = PromptsEntryPointModule.ExperienceDetailsPageOpen,
		clientAttributes = UseMemoResult,
		replaceOnFetch = if FFlagPromptsEdpOpenReplaceOnFetch then true else nil
	})
end