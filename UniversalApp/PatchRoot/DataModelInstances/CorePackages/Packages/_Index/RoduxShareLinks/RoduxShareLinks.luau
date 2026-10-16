local ReducersModule = require(script.Reducers)
local ActionsModule = require(script.Actions)
local ModelsModule = require(script.Models)
local EnumsModule = require(script.Enums)
local Parent = script.Parent
local CryoModule = require(Parent.Cryo)
local RoduxNetworkingModule = require(Parent.RoduxNetworking)
local ShareLinksNetworkingModule = require(Parent.ShareLinksNetworking)

return {
	config = function(p1) --[[ Line: 13 ]]
		-- upvalues: CryoModule (copy), ShareLinksNetworkingModule (copy), RoduxNetworkingModule (copy), ReducersModule (copy), ActionsModule (copy), ModelsModule (copy), EnumsModule (copy)
		local JoinResult = CryoModule.Dictionary.join(p1, {
			shareLinksNetworking = ShareLinksNetworkingModule.config({ roduxNetworking = RoduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function() --[[ Line: 21 ]]
				-- upvalues: ReducersModule (upval), JoinResult (ref)
				return ReducersModule(JoinResult)
			end,
			Actions = ActionsModule,
			Models = ModelsModule,
			Enums = EnumsModule
		}
	end
}