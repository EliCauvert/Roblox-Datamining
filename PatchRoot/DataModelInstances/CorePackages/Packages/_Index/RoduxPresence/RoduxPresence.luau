-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:09 2026 Pacific Standard Time.

local parent = script.Parent
local cryoModule = require(parent.Cryo)
local roduxNetworkingModule = require(parent.RoduxNetworking)
local networkingPresenceModule = require(parent.NetworkingPresence)
local reducerModule = require(script.Reducer)
local actionsModule = require(script.Actions)
local selectorsModule = require(script.Selectors)
local modelsModule = require(script.Models)
local enumsModule = require(script.Enums)

return {
	config = function(p0) --[[ line: 13 ]]
		-- upvalues: cryoModule (ref), networkingPresenceModule (ref), roduxNetworkingModule (ref), reducerModule (ref), actionsModule (ref), selectorsModule (ref), modelsModule (ref), enumsModule (ref)
		p0 = cryoModule.Dictionary.join(p0, {
			presenceNetworking = networkingPresenceModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function() --[[ line: 21 ]]
				-- upvalues: reducerModule (copy), p0 (write)
				return reducerModule(p0)
			end,
			Actions = actionsModule(p0),
			Selectors = selectorsModule(p0),
			Models = modelsModule,
			Enums = enumsModule
		}
	end
}