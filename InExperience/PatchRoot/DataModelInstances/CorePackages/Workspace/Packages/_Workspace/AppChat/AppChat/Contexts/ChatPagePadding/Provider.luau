local Parent = script:FindFirstAncestor("AppChat").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local ContextModule = require(script.Parent.Context)

return function(p1) --[[ Line: 19 | Named "ChatPagePaddingProvider" ]]
	-- upvalues: ReactModule (copy), ContextModule (copy), CryoModule (copy)
	return ReactModule.createElement(ContextModule.Provider, {
		value = CryoModule.Dictionary.join({ top = 0, right = 12, bottom = 0, left = 12 }, p1.value)
	}, p1.children)
end