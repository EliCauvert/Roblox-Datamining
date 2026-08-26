local trimStartModule = require(script.Parent.trimStart)
local trimEndModule = require(script.Parent.trimEnd)

return function(p1)
	-- upvalues: trimStartModule (ref), trimEndModule (ref)
	return trimStartModule(trimEndModule(p1))
end