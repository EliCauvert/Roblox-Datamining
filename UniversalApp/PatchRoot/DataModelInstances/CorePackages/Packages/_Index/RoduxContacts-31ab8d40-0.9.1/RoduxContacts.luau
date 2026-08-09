local parent = script.Parent
local dashModule = require(parent.Dash)
local roduxNetworkingModule = require(parent.RoduxNetworking)
local networkingContactsModule = require(parent.NetworkingContacts)
local contactsReducerModule = require(script.Reducers.ContactsReducer)
local selectorsModule = require(script.Selectors)

return {
	config = function(p0) --[[ line: 10 ]]
		-- upvalues: dashModule (ref), networkingContactsModule (ref), roduxNetworkingModule (ref), contactsReducerModule (ref), selectorsModule (ref)
		p0 = dashModule.join(p0, {
			networkingContacts = networkingContactsModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function() --[[ line: 18 ]]
				-- upvalues: contactsReducerModule (copy), p0 (write)
				return contactsReducerModule(p0)
			end,
			Selectors = selectorsModule(p0),
			Models = require(script.Models),
			Actions = require(script.Actions)
		}
	end
}