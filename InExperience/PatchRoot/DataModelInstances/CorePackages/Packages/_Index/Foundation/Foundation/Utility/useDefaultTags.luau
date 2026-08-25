local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(foundation.Components.Types)
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)

return function(p0, p1)
	-- upvalues: reactModule (ref), dashModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: p0 (ref), p1 (ref), dashModule (copy)
		return if p0 == nil then p1 elseif type(p0) == "string" then `{p1} {p0}` else dashModule.join(p0, { [p1] = true })
	end, { p0, p1 })
end