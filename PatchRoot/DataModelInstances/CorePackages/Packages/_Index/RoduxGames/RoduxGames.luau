-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:07 2026 Pacific Standard Time.

local parent = script.Parent
local roduxNetworkingModule = require(parent.RoduxNetworking)
local dashModule = require(parent.Dash)
local networkingGamesModule = require(parent.NetworkingGames)
local reducersModule = require(script.Reducers)
local actionsModule = require(script.Actions)
local modelsModule = require(script.Models)
local enumsModule = require(script.Enums)

return {
	config = function(p0) --[[ line: 12 ]]
		-- upvalues: dashModule (ref), networkingGamesModule (ref), roduxNetworkingModule (ref), reducersModule (ref), actionsModule (ref), modelsModule (ref), enumsModule (ref)
		p0 = dashModule.join(p0, {
			networkingGames = networkingGamesModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function() --[[ line: 20 ]]
				-- upvalues: reducersModule (copy), p0 (write)
				return reducersModule(p0)
			end,
			Actions = actionsModule,
			Models = modelsModule,
			Enums = enumsModule
		}
	end
}