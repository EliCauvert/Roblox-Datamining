local Parent = script.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local ContactsListContainerModule = require(script.ContactsListContainer)
local OffPlatformFriendRequestsIXPModule = require(Parent.Flags.OffPlatformFriendRequestsIXP)
local Dash = DependenciesModule.Dash
local Roact = DependenciesModule.Roact
local UseNavigationFunction = DependenciesModule.useNavigation
local FFlagContactImporterIXPCleanup = require(Parent.Parent.SharedFlags).FFlagContactImporterIXPCleanup

function ContactsList(p1) --[[ Line: 15 ]]
	-- upvalues: UseNavigationFunction (copy), FFlagContactImporterIXPCleanup (copy), OffPlatformFriendRequestsIXPModule (copy), Roact (copy), ContactsListContainerModule (copy), Dash (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseOffPlatformFriendRequestsVariantResult = if FFlagContactImporterIXPCleanup then nil else OffPlatformFriendRequestsIXPModule.useOffPlatformFriendRequestsVariant()
	
	return if FFlagContactImporterIXPCleanup then Roact.createElement(ContactsListContainerModule, Dash.join({ navigation = UseNavigationResult }, p1 or {})) elseif UseOffPlatformFriendRequestsVariantResult == OffPlatformFriendRequestsIXPModule.IXPVariants.BLENDED or UseOffPlatformFriendRequestsVariantResult == OffPlatformFriendRequestsIXPModule.IXPVariants.INVITES_ONLY then Roact.createElement(ContactsListContainerModule, Dash.join({
		isPVRequired = false,
		variant = UseOffPlatformFriendRequestsVariantResult,
		navigation = UseNavigationResult
	}, p1 or {})) else nil
end

return ContactsList