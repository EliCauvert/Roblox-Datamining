local parent = script.Parent.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local useNavigation = require(parent.Navigation).useNavigation
local contactsRevokedAccessDialogModule = require(script.Parent.ContactsRevokedAccessDialog)

return function(p1)
	-- upvalues: useNavigation (ref), reactModule (ref), contactsRevokedAccessDialogModule (ref), dashModule (ref)
	return reactModule.createElement(contactsRevokedAccessDialogModule, dashModule.join(p1, { navigation = useNavigation() }))
end