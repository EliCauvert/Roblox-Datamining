local dependenciesModule = require(script.Parent.Parent.dependencies)
local llama = dependenciesModule.llama
local var1 = dependenciesModule.RoduxContacts.installReducer()

return function(p1, p2)
	-- upvalues: llama (ref), var1 (ref)
	return llama.List.reduce({ p2 }, var1, p1)
end