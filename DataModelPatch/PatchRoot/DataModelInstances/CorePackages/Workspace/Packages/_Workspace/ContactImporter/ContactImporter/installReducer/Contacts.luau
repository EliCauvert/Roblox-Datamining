local DependenciesModule = require(script.Parent.Parent.dependencies)
local Llama = DependenciesModule.llama
local InstallReducerResult = DependenciesModule.RoduxContacts.installReducer()

return function(p1, p2)
	-- upvalues: Llama (copy), InstallReducerResult (copy)
	return Llama.List.reduce({ p2 }, InstallReducerResult, p1)
end