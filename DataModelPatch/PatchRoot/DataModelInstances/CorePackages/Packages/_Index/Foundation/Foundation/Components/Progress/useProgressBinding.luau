local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local _ = require(Foundation.Components.Types)

return function(p1: number)
	-- upvalues: ReactIsModule (copy)
	if ReactIsModule.isBinding(p1) then
		return p1:map(function(p2: number): number
			return (math.clamp(p2 / 100, 0, 1))
		end), p1 == nil
	else
		return if p1 == nil then nil else math.clamp(p1 / 100, 0, 1), p1 == nil
	end
end