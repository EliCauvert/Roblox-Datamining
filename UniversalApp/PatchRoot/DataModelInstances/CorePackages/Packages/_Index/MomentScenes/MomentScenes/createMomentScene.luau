local _ = require(script.Parent.Types)
local BuildersModule = require(script.Parent.builders)

return function(p1, p2)
	-- upvalues: BuildersModule (copy)
	local Callback = (p2 or BuildersModule)[p1.type]
	
	if Callback == nil then
		error(`createMomentScene: unknown scene type '{p0.type}'`)
	end
	return Callback(p1.args)
end