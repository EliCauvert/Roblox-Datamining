local console = require(script.Parent.Parent.Shared).console
local t = {}

return function(p0, p1) --[[ line: 22 | named "warnOnce" ]]
	-- upvalues: t (ref), console (ref)
	if not t[p0] then
		console.warn("The legacy Roact API '%s' is deprecated, and will be removed in a future release.\n\n%s", p0, p1)
	end
	t[p0] = true
end