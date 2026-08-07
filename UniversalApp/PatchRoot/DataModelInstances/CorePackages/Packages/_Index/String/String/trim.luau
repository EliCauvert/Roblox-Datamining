local trimStartModule = require(script.Parent.trimStart)
local trimEndModule = require(script.Parent.trimEnd)

return function(p0) --[[ line: 20 ]]
	-- upvalues: trimStartModule (ref), trimEndModule (ref)
	return trimStartModule(trimEndModule(p0))
end