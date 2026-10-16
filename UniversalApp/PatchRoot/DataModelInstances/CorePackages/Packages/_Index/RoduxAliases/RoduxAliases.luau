local v1 = script
local Parent = v1.Parent
local LlamaModule = require(Parent.llama)
local RoduxNetworkingModule = require(Parent.RoduxNetworking)
local AliasNetworkingModule = require(Parent.AliasNetworking)
local AliasesReducerModule = require(v1.Reducers.AliasesReducer)
local ActionsModule = require(v1.Actions)
local SelectorsModule = require(v1.Selectors)
local _ = require(v1.RoduxAliasesTypes)

return {
	config = function(p1) --[[ Line: 16 ]]
		-- upvalues: LlamaModule (copy), AliasNetworkingModule (copy), RoduxNetworkingModule (copy), AliasesReducerModule (copy), ActionsModule (copy), SelectorsModule (copy)
		local JoinResult = LlamaModule.Dictionary.join(p1, {
			aliasNetworking = AliasNetworkingModule.config({ roduxNetworking = RoduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function() --[[ Line: 24 ]]
				-- upvalues: AliasesReducerModule (upval), JoinResult (ref)
				return AliasesReducerModule(JoinResult)
			end,
			Actions = ActionsModule,
			Selectors = SelectorsModule(JoinResult)
		}
	end
}