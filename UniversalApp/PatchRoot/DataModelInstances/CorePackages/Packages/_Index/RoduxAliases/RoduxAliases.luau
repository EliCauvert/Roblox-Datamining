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
	config = function(p0) --[[ line: 16 ]]
		-- upvalues: llamaModule (ref), aliasNetworkingModule (ref), roduxNetworkingModule (ref), aliasesReducerModule (ref), actionsModule (ref), selectorsModule (ref)
		p0 = llamaModule.Dictionary.join(p0, {
			aliasNetworking = aliasNetworkingModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function() --[[ line: 24 ]]
				-- upvalues: aliasesReducerModule (copy), p0 (write)
				return aliasesReducerModule(p0)
			end,
			Actions = actionsModule,
			Selectors = selectorsModule(p0)
		}
	end
}