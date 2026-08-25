local parent = script.Parent
local dashModule = require(parent.Dash)
local roduxNetworking = require(parent.LuaSocialLibrariesDeps).RoduxNetworking
local networkingContacts = require(parent.LuaSocialLibrariesDeps).NetworkingContacts
local contactsReducerModule = require(script.Reducers.ContactsReducer)
local selectorsModule = require(script.Selectors)

return {
	["jest.config"] = script["jest.config"],
	config = function(p0)
		-- upvalues: dashModule (ref), networkingContacts (ref), roduxNetworking (ref), contactsReducerModule (ref), selectorsModule (ref)
		p0 = dashModule.join(p0, {
			networkingContacts = networkingContacts.config({ roduxNetworking = roduxNetworking.mock() })
		})
		
		return {
			installReducer = function()
				-- upvalues: contactsReducerModule (copy), p0 (write)
				return contactsReducerModule(p0)
			end,
			Selectors = selectorsModule(p0),
			Models = require(script.Models),
			Actions = require(script.Actions)
		}
	end
}