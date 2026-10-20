local Parent = script.Parent
local DashModule = require(Parent.Dash)
local RoduxNetworking = require(Parent.LuaSocialLibrariesDeps).RoduxNetworking
local NetworkingContacts = require(Parent.LuaSocialLibrariesDeps).NetworkingContacts
local ContactsReducerModule = require(script.Reducers.ContactsReducer)
local SelectorsModule = require(script.Selectors)

return {
	["jest.config"] = script["jest.config"],
	config = function(p1)
		-- upvalues: DashModule (copy), NetworkingContacts (copy), RoduxNetworking (copy), ContactsReducerModule (copy), SelectorsModule (copy)
		local JoinResult = DashModule.join(p1, {
			networkingContacts = NetworkingContacts.config({ roduxNetworking = RoduxNetworking.mock() })
		})
		
		return {
			installReducer = function()
				-- upvalues: ContactsReducerModule (upval), JoinResult (ref)
				return ContactsReducerModule(JoinResult)
			end,
			Selectors = SelectorsModule(JoinResult),
			Models = require(script.Models),
			Actions = require(script.Actions)
		}
	end
}