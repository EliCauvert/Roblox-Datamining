local parent = script:FindFirstAncestor("RoactUtils").Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local useIsGamepadModule = require(script.Parent.Hooks.useIsGamepad)

return function(p1)
	-- upvalues: useIsGamepadModule (ref), reactModule (ref), dashModule (ref)
	return function(p2)
		-- upvalues: useIsGamepadModule (copy), reactModule (copy), p1 (ref), dashModule (copy)
		return reactModule.createElement(p1, dashModule.join(p2, { isGamepadInput = useIsGamepadModule() }))
	end
end