local parent = script:FindFirstAncestor("RoactUtils").Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local useIsGamepadModule = require(script.Parent.Hooks.useIsGamepad)

return function(p0)
	-- upvalues: useIsGamepadModule (ref), reactModule (ref), dashModule (ref)
	return function(p1)
		-- upvalues: useIsGamepadModule (copy), reactModule (copy), p0 (ref), dashModule (copy)
		return reactModule.createElement(p0, dashModule.join(p1, { isGamepadInput = useIsGamepadModule() }))
	end
end