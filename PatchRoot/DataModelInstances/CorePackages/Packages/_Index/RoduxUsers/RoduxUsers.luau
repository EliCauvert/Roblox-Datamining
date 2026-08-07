-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:09 2026 Pacific Standard Time.

local reducersModule = require(script.Reducers)
local actionsModule = require(script.Actions)
local modelsModule = require(script.Models)
local parent = script.Parent
local cryoModule = require(parent.Cryo)
local roduxNetworkingModule = require(parent.RoduxNetworking)
local friendsNetworkingModule = require(parent.FriendsNetworking)
local usersNetworkingModule = require(parent.UsersNetworking)
local roduxUsersTypesModule = require(script.roduxUsersTypes)

return {
	config = function(p0) --[[ line: 13 ]]
		-- upvalues: cryoModule (ref), usersNetworkingModule (ref), roduxNetworkingModule (ref), friendsNetworkingModule (ref), reducersModule (ref), actionsModule (ref), modelsModule (ref), roduxUsersTypesModule (ref)
		p0 = cryoModule.Dictionary.join(p0, {
			usersNetworking = usersNetworkingModule.config({ roduxNetworking = roduxNetworkingModule.mock() }),
			friendsNetworking = friendsNetworkingModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function() --[[ line: 24 ]]
				-- upvalues: reducersModule (copy), p0 (write)
				return reducersModule(p0)
			end,
			Actions = actionsModule,
			Models = modelsModule,
			roduxUsersTypes = roduxUsersTypesModule
		}
	end
}