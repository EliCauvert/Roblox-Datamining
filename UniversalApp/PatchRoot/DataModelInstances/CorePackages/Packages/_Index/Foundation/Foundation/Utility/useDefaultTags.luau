local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(foundation.Components.Types)
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)

return function(p1, p2)
	-- upvalues: reactModule (ref), dashModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref), p2 (ref), dashModule (copy)
		return if p1 == nil then p2 elseif type(p1) == "string" then `{p2} {p1}` else dashModule.join(p1, { [p2] = true })
	end, { p1, p2 })
end