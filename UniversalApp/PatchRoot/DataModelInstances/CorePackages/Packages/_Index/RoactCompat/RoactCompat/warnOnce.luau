local console = require(script.Parent.Parent.Shared).console
local t = {}

return function(p1, p2)
	-- upvalues: t (ref), console (ref)
	if not t[p1] then
		console.warn("The legacy Roact API '%s' is deprecated, and will be removed in a future release.\n\n%s", p1, p2)
	end
	t[p1] = true
end