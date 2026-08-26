local parent = script:FindFirstAncestor("AppChat").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local contextModule = require(script.Parent.Context)

return function(p1)
	-- upvalues: reactModule (ref), contextModule (ref), cryoModule (ref)
	return reactModule.createElement(contextModule.Provider, {
		value = cryoModule.Dictionary.join({ top = 0, right = 12, bottom = 0, left = 12 }, p1.value)
	}, p1.children)
end