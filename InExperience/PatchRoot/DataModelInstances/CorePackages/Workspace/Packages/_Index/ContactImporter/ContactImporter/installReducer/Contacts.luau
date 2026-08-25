local dependenciesModule = require(script.Parent.Parent.dependencies)
local llama = dependenciesModule.llama
local var1 = dependenciesModule.RoduxContacts.installReducer()

return function(p0, p1)
	-- upvalues: llama (ref), var1 (ref)
	return llama.List.reduce({ p1 }, var1, p0)
end