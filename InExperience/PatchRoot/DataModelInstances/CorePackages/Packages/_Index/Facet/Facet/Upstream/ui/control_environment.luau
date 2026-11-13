local _ = require("../vendor/compose/core")
local _ = require("./control_types")
local Contexts = {}
setmetatable(Contexts, { __mode = "k" })

return function(Key)
	-- upvalues: Contexts (copy)
	local Context = Contexts[Key]
	
	if Context == nil then
		Context = Key.createContext({})
		Contexts[Key] = Context
	end
	return Context
end