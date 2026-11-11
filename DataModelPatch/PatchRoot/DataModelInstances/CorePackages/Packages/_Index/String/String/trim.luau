local TrimStartModule = require(script.Parent.trimStart)
local TrimEndModule = require(script.Parent.trimEnd)

return function(p1)
	-- upvalues: TrimStartModule (copy), TrimEndModule (copy)
	return TrimStartModule(TrimEndModule(p1))
end