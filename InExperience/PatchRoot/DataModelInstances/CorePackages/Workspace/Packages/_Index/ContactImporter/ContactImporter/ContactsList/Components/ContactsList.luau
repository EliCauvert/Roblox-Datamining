local DependenciesModule = require(script.Parent.Parent.Parent.dependencies)
local ContactsListContainerModule = require(script.ContactsListContainer)
local Dash = DependenciesModule.Dash
local Roact = DependenciesModule.Roact
local UseNavigationFunction = DependenciesModule.useNavigation

function ContactsList(p1) --[[ Line: 11 ]]
	-- upvalues: UseNavigationFunction (copy), Roact (copy), ContactsListContainerModule (copy), Dash (copy)
	return Roact.createElement(ContactsListContainerModule, Dash.join({ navigation = UseNavigationFunction() }, p1 or {}))
end

return ContactsList