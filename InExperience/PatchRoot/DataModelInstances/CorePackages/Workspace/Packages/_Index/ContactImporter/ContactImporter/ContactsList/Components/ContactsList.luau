local parent = script.Parent.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local parent_1 = parent.Parent
local contactsListContainerModule = require(script.ContactsListContainer)
local offPlatformFriendRequestsIXPModule = require(parent.Flags.OffPlatformFriendRequestsIXP)
local dash = dependenciesModule.Dash
local roact = dependenciesModule.Roact
local useNavigation = dependenciesModule.useNavigation
local fFlagContactImporterIXPCleanup = require(parent_1.SharedFlags).FFlagContactImporterIXPCleanup

function ContactsList(p1)
	-- upvalues: useNavigation (ref), fFlagContactImporterIXPCleanup (ref), offPlatformFriendRequestsIXPModule (ref), roact (ref), contactsListContainerModule (ref), dash (ref)
	local var1 = useNavigation()
	local var2 = if fFlagContactImporterIXPCleanup then nil else offPlatformFriendRequestsIXPModule.useOffPlatformFriendRequestsVariant()
	
	return if fFlagContactImporterIXPCleanup then roact.createElement(contactsListContainerModule, dash.join({ navigation = var1 }, p1 or {})) elseif var2 == offPlatformFriendRequestsIXPModule.IXPVariants.BLENDED or var2 == offPlatformFriendRequestsIXPModule.IXPVariants.INVITES_ONLY then roact.createElement(contactsListContainerModule, dash.join({ isPVRequired = false, variant = var2, navigation = var1 }, p1 or {})) else nil
end

return ContactsList