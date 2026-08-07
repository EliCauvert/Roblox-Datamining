local parent = script.Parent
local reactModule = require(parent.Parent.React)
local helpPageContainerModule = require(parent.Components.HelpPageContainer)
local keybindContextProviderModule = require(parent.Context.KeybindContextProvider)

return function() --[[ line: 10 | named "_createPageView" ]]
	-- upvalues: reactModule (ref), keybindContextProviderModule (ref), helpPageContainerModule (ref)
	return reactModule.createElement(keybindContextProviderModule, nil, {
		HelpPageContainer = reactModule.createElement(helpPageContainerModule)
	})
end