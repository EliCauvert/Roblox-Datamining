local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(foundation.Components.Types)
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)

return function(p0, p1) --[[ line: 10 | named "useDefaultTags" ]]
	-- upvalues: reactModule (ref), dashModule (ref)
	return reactModule.useMemo(function() --[[ line: 11 ]]
		-- upvalues: p0 (ref), p1 (ref), dashModule (copy)
		return if p0 == nil then p1 elseif type(p0) == "string" then `{p1} {p0}` else dashModule.join(p0, { [p1] = true })
	end, { p0, p1 })
end