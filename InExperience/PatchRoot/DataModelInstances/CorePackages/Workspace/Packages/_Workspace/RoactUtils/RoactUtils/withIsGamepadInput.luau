local Parent = script:FindFirstAncestor("RoactUtils").Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local UseIsGamepadModule = require(script.Parent.Hooks.useIsGamepad)

return function(p1) --[[ Line: 12 | Named "withIsGamepadInput" ]]
	-- upvalues: UseIsGamepadModule (copy), ReactModule (copy), DashModule (copy)
	return function(p2) --[[ Line: 13 ]]
		-- upvalues: UseIsGamepadModule (upval), ReactModule (upval), p1 (copy), DashModule (upval)
		return ReactModule.createElement(p1, DashModule.join(p2, { isGamepadInput = UseIsGamepadModule() }))
	end
end