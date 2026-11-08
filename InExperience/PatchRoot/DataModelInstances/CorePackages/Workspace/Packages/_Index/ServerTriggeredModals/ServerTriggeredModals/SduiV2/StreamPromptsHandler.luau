local Parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local ReactModule = require(Parent.React)
local PromptsHandler = require(script.Parent.PromptsHandler).PromptsHandler
local PromptsEntryPointModule = require(script.Parent.PromptsEntryPoint)
local PromptStyleModule = require(script.Parent.PromptStyle)
local FFlagPromptsEdpOpenReplaceOnFetch = require(Parent.SharedFlags).FFlagPromptsEdpOpenReplaceOnFetch

return function(p1)
	-- upvalues: ReactModule (copy), PromptsHandler (copy), PromptsEntryPointModule (copy), PromptStyleModule (copy), FFlagPromptsEdpOpenReplaceOnFetch (copy)
	return if p1.clientAttributes == nil then nil else ReactModule.createElement(PromptsHandler, {
		entryPoint = PromptsEntryPointModule.NotificationStreamOpen,
		promptStyle = PromptStyleModule.InlineBanner,
		clientAttributes = p1.clientAttributes,
		bottomPadding = p1.bottomPadding,
		replaceOnFetch = if FFlagPromptsEdpOpenReplaceOnFetch then true else nil
	})
end