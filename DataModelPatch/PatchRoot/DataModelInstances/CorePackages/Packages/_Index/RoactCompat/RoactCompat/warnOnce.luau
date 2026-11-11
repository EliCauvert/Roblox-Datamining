local Console = require(script.Parent.Parent.Shared).console
local t = {}

return function(Key, p1)
	-- upvalues: t (copy), Console (copy)
	if not t[Key] then
		Console.warn("The legacy Roact API '%s' is deprecated, and will be removed in a future release.\n\n%s", Key, p1)
	end
	t[Key] = true
end