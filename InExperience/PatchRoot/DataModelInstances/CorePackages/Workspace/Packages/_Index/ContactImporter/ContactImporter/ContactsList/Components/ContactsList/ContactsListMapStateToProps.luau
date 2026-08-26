local contactImporter = script:FindFirstAncestor("ContactImporter")
local dependenciesModule = require(contactImporter.dependencies)
local RODUX_KEY = require(contactImporter.Common.Constants).RODUX_KEY
local networkStatus = dependenciesModule.RoduxNetworking.Enum.NetworkStatus
local networkingFriends = dependenciesModule.NetworkingFriends
local networkingContacts = dependenciesModule.NetworkingContacts
local selectors = dependenciesModule.RoduxContacts.Selectors
local memoize = dependenciesModule.memoize
local getDeepValue = dependenciesModule.SocialLibraries.Dictionary.getDeepValue
local getDeviceContactsModule = require(script.Parent.getDeviceContacts)
local decorateMatchedContactModule = require(script.Parent.decorateMatchedContact)

return function(p1)
	-- upvalues: getDeepValue (ref), RODUX_KEY (ref), memoize (ref), getDeviceContactsModule (ref), decorateMatchedContactModule (ref), selectors (ref), networkingFriends (ref), networkStatus (ref), networkingContacts (ref)
	local localUserId = p1.LocalUserId
	local var1 = getDeepValue(p1, RODUX_KEY .. ".Contacts")
	
	return {
		localUserId = p1.LocalUserId,
		matchedContacts = decorateMatchedContactModule(selectors.sortContacts(p1), var1),
		deviceContacts = memoize(getDeviceContactsModule)(var1),
		screenSize = p1.ScreenSize,
		isFetching = if networkingFriends.RequestFriendshipFromContactId.getStatus(p1, localUserId) ~= networkStatus.Fetching then if networkingContacts.FindContactFriends.getStatus(p1, localUserId) ~= networkStatus.Fetching then if networkingContacts.GetContactEntitiesByContactId.getStatus(p1, localUserId) ~= networkStatus.Fetching then networkingContacts.UploadContactsByUser.getStatus(p1, localUserId) == networkStatus.Fetching else true else true else true
	}
end