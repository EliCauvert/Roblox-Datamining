local _script = script
local parent = _script.Parent
local llamaModule = require(parent.llama)
local roduxNetworkingModule = require(parent.RoduxNetworking)
local aliasNetworkingModule = require(parent.AliasNetworking)
local aliasesReducerModule = require(_script.Reducers.AliasesReducer)
local actionsModule = require(_script.Actions)
local selectorsModule = require(_script.Selectors)
local _ = require(_script.RoduxAliasesTypes)

return {
	config = function(p1)
		-- upvalues: llamaModule (ref), aliasNetworkingModule (ref), roduxNetworkingModule (ref), aliasesReducerModule (ref), actionsModule (ref), selectorsModule (ref)
		p1 = llamaModule.Dictionary.join(p1, {
			aliasNetworking = aliasNetworkingModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function()
				-- upvalues: aliasesReducerModule (copy), p1 (write)
				return aliasesReducerModule(p1)
			end,
			Actions = actionsModule,
			Selectors = selectorsModule(p1)
		}
	end
}