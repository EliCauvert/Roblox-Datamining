local Parent = script.Parent
local ReactModule = require(Parent.Parent.React)
local HelpPageContainerModule = require(Parent.Components.HelpPageContainer)
local KeybindContextProviderModule = require(Parent.Context.KeybindContextProvider)

return function() --[[ Line: 10 | Named "_createPageView" ]]
	-- upvalues: ReactModule (copy), KeybindContextProviderModule (copy), HelpPageContainerModule (copy)
	return ReactModule.createElement(KeybindContextProviderModule, nil, {
		HelpPageContainer = ReactModule.createElement(HelpPageContainerModule)
	})
end