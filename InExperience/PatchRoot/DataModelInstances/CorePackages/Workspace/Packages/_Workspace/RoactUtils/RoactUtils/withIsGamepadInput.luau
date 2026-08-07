local parent = script:FindFirstAncestor("RoactUtils").Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local useIsGamepadModule = require(script.Parent.Hooks.useIsGamepad)

return function(p0) --[[ line: 12 | named "withIsGamepadInput" ]]
	-- upvalues: useIsGamepadModule (ref), reactModule (ref), dashModule (ref)
	return function(p1) --[[ line: 13 ]]
		-- upvalues: useIsGamepadModule (copy), reactModule (copy), p0 (ref), dashModule (copy)
		return reactModule.createElement(p0, dashModule.join(p1, { isGamepadInput = useIsGamepadModule() }))
	end
end