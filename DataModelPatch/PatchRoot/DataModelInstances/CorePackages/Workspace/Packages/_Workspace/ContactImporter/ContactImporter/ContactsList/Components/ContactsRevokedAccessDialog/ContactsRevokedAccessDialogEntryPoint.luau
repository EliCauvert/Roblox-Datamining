local Parent = script.Parent.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local ContactsRevokedAccessDialogModule = require(script.Parent.ContactsRevokedAccessDialog)

return function(p1)
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), ContactsRevokedAccessDialogModule (copy), DashModule (copy)
	return ReactModule.createElement(ContactsRevokedAccessDialogModule, DashModule.join(p1, { navigation = UseNavigationFunction() }))
end